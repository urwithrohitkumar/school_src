<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Branch_model extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }
    public function getBranch($id = null) {
        $this->db->select()->from('tb_branch');
        if ($id != null) {
            $this->db->where('id', $id);
        } else {
            $this->db->order_by('id');
        }
        $query = $this->db->get();
        if ($id != null) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }

    public function getBranchName($id) {
        if($id != '')
        $result =  $this->db->query('select branch_name from tb_branch where id ='."$id");
        else
        $result =  $this->db->query('select branch_name from tb_branch');
        return $result->row_array();
    }

    public function getLoggedInUserBranchId()
    {
        $result = $this->customlib->getLoggedInUserData();
        if($result != null)
        return $result['branch_id'];

    }

    public function getBranchNameById($id) {
        if($id != '')
        $result =  $this->db->query('select branch_name from tb_branch where id ='."$id");
        return $result->row_array();
    }

    public function add($data) {

        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $return_value = $this->db->update('tb_branch', $data);
            return $return_value;
        } else {
            $return_value = $this->db->insert('tb_branch', $data);
            return $return_value;

        }

    }

    public function remove($id) {
        $this->db->where('id', $id);
        $result = $this->db->delete('tb_branch');
        if($result)
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    



    
}
?>