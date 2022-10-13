<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Expense_model extends MY_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }

    /**
     * This funtion takes id as a parameter and will fetch the record.
     * If id is not provided, then it will fetch all the records form the table.
     * @param int $id
     * @return mixed
     */
    public function search($text = null, $start_date = null, $end_date = null, $branch_id = null)

    {

        if (!empty($text)) {

            $this->datatables->select('expenses.id,expenses.branch_id,expenses.date,expenses.invoice_no,expenses.name,expenses.amount,expenses.documents,expenses.note,expense_head.exp_category,expenses.exp_head_id');
            $this->datatables->searchable('expenses.name,expenses.invoice_no,exp_category,date,expenses.amount');
            $this->datatables->orderable('expenses.name,expenses.invoice_no,exp_category,date,expenses.amount');
            $this->datatables->join('expense_head', 'expenses.exp_head_id = expense_head.id', 'left');
            $this->datatables->like('expenses.name', $text);
            $this->datatables->from('expenses');
        } else {
            $this->datatables->select('expenses.id,expenses.branch_id,expenses.date,expenses.invoice_no,expenses.name,expenses.amount,expenses.documents,expenses.note,expense_head.exp_category,expenses.exp_head_id');
            $this->datatables->searchable('expenses.name,expenses.invoice_no,exp_category,date,expenses.amount');
            $this->datatables->orderable('expenses.name,expenses.invoice_no,exp_category,date,expenses.amount');
            $this->datatables->join('expense_head', 'expenses.exp_head_id = expense_head.id', 'left');
            $this->datatables->where('expenses.date <=', $end_date);
            $this->datatables->where('expenses.date >=', $start_date);
            $this->datatables->from('expenses');
        }
        if ($branch_id != null) {
            $this->datatables->where('expenses.branch_id', $branch_id);
        } else {
            if ($this->session->userdata['admin']['branch_id'] != 0) {
                $this->db->where('expenses.branch_id', $this->session->userdata['admin']['branch_id']);
            }
        }
        return $this->datatables->generate('json');
    }

    public function get($id = null)
    {
        $branch_id = $this->session->admin['branch_id'];
        $this->db->select('expenses.id,expenses.date,expenses.name,expenses.branch_id,expenses.invoice_no,expenses.amount,expenses.documents,expenses.note,expense_head.exp_category,expenses.exp_head_id')->from('expenses');
        $this->db->join('expense_head', 'expenses.exp_head_id = expense_head.id', 'left');
        if ($branch_id > 0) {
            $this->db->where('expenses.branch_id', $branch_id);
        }
        if ($id != null) {
            $this->db->where('expenses.id', $id);
        } else {
            $this->db->order_by('expenses.id', 'DESC');
        }

        $query = $this->db->get();
        if ($id != null) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }

    public function getexpenselist($id = null)
    {
        $branch_id = $this->session->admin['branch_id'];
        $arr = [];
        if ($branch_id > 0) {
            $arr['expenses.branch_id'] = $branch_id;
        }
        $this->datatables
            ->select('tb_branch.branch_name,expenses.id,expenses.date,expenses.name,expenses.invoice_no,expenses.amount,expenses.documents,expenses.note,expense_head.exp_category,expenses.exp_head_id')
            ->searchable('expenses.id,expenses.date,expenses.name,expenses.invoice_no,expenses.amount,expenses.documents,expenses.note,expense_head.exp_category,expenses.exp_head_id')
            ->orderable('expenses.name,expenses.note,expenses.invoice_no,expenses.date,expense_head.exp_category,expenses.amount')
            ->join("expense_head", "expenses.exp_head_id = expense_head.id", 'left')
            ->join("tb_branch", "expenses.branch_id = tb_branch.id", 'left')
            ->where($arr)
            ->sort('expenses.id', 'desc')
            ->from('expenses');
        return $this->datatables->generate('json');
    }

    /**
     * This function will delete the record based on the id
     * @param $id
     */
    public function remove($id)
    {

        $this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well
        //=======================Code Start===========================
        $this->db->where('id', $id);
        $this->db->delete('expenses');

        $message   = DELETE_RECORD_CONSTANT . " On  expenses   id " . $id;
        $action    = "Delete";
        $record_id = $id;
        $this->log($message, $record_id, $action);

        //======================Code End==============================

        $this->db->trans_complete(); # Completing transaction
        /* Optional */

        if ($this->db->trans_status() === false) {
            # Something went wrong.
            $this->db->trans_rollback();
            return false;
        } else {

            return $return_value;
        }
    }

    /**
     * This function will take the post data passed from the controller
     * If id is present, then it will do an update
     * else an insert. One function doing both add and edit.
     * @param $data
     */
    public function add($data)
    {

        $this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well
        //=======================Code Start===========================

        if (isset($data['id']) && $data['id'] != '') {

            $this->db->where('id', $data['id']);
            $this->db->update('expenses', $data);

            $message   = UPDATE_RECORD_CONSTANT . " On  expenses   id " . $data['id'];
            $action    = "Update";
            $record_id = $data['id'];
        } else {
            $this->db->insert('expenses', $data);

            $record_id = $this->db->insert_id();
            $message   = INSERT_RECORD_CONSTANT . " On  expenses   id " . $record_id;
            $action    = "Insert";
        }

        $this->log($message, $record_id, $action);

        //======================Code End==============================

        $this->db->trans_complete(); # Completing transaction
        /* Optional */

        if ($this->db->trans_status() === false) {
            # Something went wrong.
            $this->db->trans_rollback();
            return false;
        } else {

            return $record_id;
        }
    }

    public function check_Exits_group($data)
    {
        $this->db->select('*');
        $this->db->from('expenses');
        $this->db->where('session_id', $this->current_session);
        $this->db->where('feetype_id', $data['feetype_id']);
        $this->db->where('class_id', $data['class_id']);
        $this->db->limit(1);
        $query = $this->db->get();
        if ($query->num_rows() == 1) {
            return false;
        } else {
            return true;
        }
    }

    public function getTypeByFeecategory($type, $class_id)
    {
        $this->db->select('expenses.id,expenses.session_id,expenses.invoice_no,expenses.amount,expenses.documents,expenses.note,expense_head.class,feetype.type')->from('expenses');
        $this->db->join('expense_head', 'expenses.class_id = expense_head.id');
        $this->db->join('feetype', 'expenses.feetype_id = feetype.id');
        $this->db->where('expenses.class_id', $class_id);
        $this->db->where('expenses.feetype_id', $type);
        $this->db->where('expenses.session_id', $this->current_session);
        $this->db->order_by('expenses.id');
        $query = $this->db->get();
        return $query->row_array();
    }

    public function getTotalExpenseBydate($date)
    {
        $query = 'SELECT sum(amount) as `amount` FROM `expenses` where date=' . $this->db->escape($date);
        $query = $this->db->query($query);
        return $query->row();
    }

    public function getTotalExpenseBwdate($date_from, $date_to)
    {

        $branch_id = $this->session->admin['branch_id'];
        $where = '';
        if ($branch_id > 0) {
            $where = 'And branch_id=' . $branch_id;
        }
        $query = 'SELECT sum(amount) as `amount` FROM `expenses` where date between ' . $this->db->escape($date_from) . ' and ' . $this->db->escape($date_to) . $where;

        $query = $this->db->query($query);
        return $query->row();
    }

    public function getExpenseHeadData($start_date, $end_date)
    {
        $branch_id = $this->session->admin['branch_id'];
        $where = '';
        if ($branch_id > 0) {
            $where = 'expense_head.branch_id=' . $branch_id . ' And ';
        }
        $condition = $where . "date_format(date,'%Y-%m-%d') between '" . $start_date . "' and '" . $end_date . "'";
        $recorddata = $this->db->select('sum(amount) as total,exp_category')->from('expenses');
        $this->db->join('expense_head', 'expenses.exp_head_id = expense_head.id');
        $this->db->where($condition)->group_by('expense_head.id');
        $r = $this->db->get()->result_array();
        return $r;
    }
}
