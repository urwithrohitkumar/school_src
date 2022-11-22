<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Report_card_remarks_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
    public function add($insert_array) {
        $this->db->insert('student_report_card_remarks', $insert_array);
    }
    public function getdetailsSingle($class_id =null, $section_id =null, $student_id =null, $session_id =null ,$branch_id =null)
    {
        $this->db->select('*')->from('student_report_card_remarks');
        $this->db->where('student_report_card_remarks.class_id', $class_id);
        $this->db->where('student_report_card_remarks.section_id', $section_id);
        $this->db->where('student_report_card_remarks.student_id', $student_id);
        $this->db->where('student_report_card_remarks.session_id', $session_id);
        $this->db->where('student_report_card_remarks.branch_id', $branch_id);
        $query = $this->db->get();
        return $query->row_array();
    }

    
    public function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('student_report_card_remarks');
    }


}
