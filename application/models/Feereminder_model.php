<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Feereminder_model extends MY_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get($id = null, $active = null) {
        $this->db->select('fees_reminder.*,tb_branch.branch_name')->from('fees_reminder');
        $this->db->join('tb_branch', 'tb_branch.id = fees_reminder.branch_id', 'left');
        if ($active != null) {
            $this->db->where('fees_reminder.is_active', $active);
        }
        if ($id != null) {
            $this->db->where('fees_reminder.id', $id);
        } else {
            $this->db->order_by('fees_reminder.id');
        }
        $query = $this->db->get();
        if ($id != null) {
            return $query->row();
        } else {
            return $query->result();
        }
    }

    public function add($data) {
		$this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well
        //=======================Code Start===========================
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('fees_reminder', $data);
            $message = UPDATE_RECORD_CONSTANT . " On  fees reminder id " . $data['id'];
            $action = "Update";
            $record_id = $data['id'];
            $this->log($message, $record_id, $action);
        } else {
            $this->db->insert('fees_reminder', $data);
            $id = $this->db->insert_id();
            $message = INSERT_RECORD_CONSTANT . " On fees reminder id " . $id;
            $action = "Insert";
            $record_id = $id;
            $this->log($message, $record_id, $action);
        }
        //======================Code End==============================

        $this->db->trans_complete(); # Completing transaction
        /* Optional */

        if ($this->db->trans_status() === false) {
            # Something went wrong.
            $this->db->trans_rollback();
            return false;
        } else {
            return $id;
        }
    }

    public function update($data) {
		$this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well
        //=======================Code Start===========================

        $this->db->where('id', $data['id']);
        $this->db->update('fees_reminder', $data);

		$message = UPDATE_RECORD_CONSTANT . " On  fees reminder id " . $data['id'];
        $action = "Update";
        $record_id = $id = $data['id'];
        $this->log($message, $record_id, $action);
		
        //======================Code End==============================

        $this->db->trans_complete(); # Completing transaction
        /* Optional */

        if ($this->db->trans_status() === false) {
            # Something went wrong.
            $this->db->trans_rollback();
            return false;
        } else {
            return $id;
        }
    }

    public function updatebatch($update_array) {

        $this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well

        if (isset($update_array) && !empty($update_array)) {

            $this->db->update_batch('fees_reminder', $update_array, 'id');
        }

        $this->db->trans_complete(); # Completing transaction

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            return false;
        } else {
            $this->db->trans_commit();
            return true;
        }
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
        $this->db->delete('fees_reminder');
        $message = DELETE_RECORD_CONSTANT . " On  fees reminder  id " . $id;
        $action = "Delete";
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
            //return $return_value;
        }
    }




}
