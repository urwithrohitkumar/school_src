<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Aadhar_card_model extends MY_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
        $this->current_date    = $this->setting_model->getDateYmd();
    }

    public function update_student_aadhar_card_details($aadharCardData, $student_id)
    {
        $data = $this->db->select('student_id')
            ->where('student_id', $student_id)
            ->get('aadhar_card');
        $data = $data->result();
        if (!empty($data)) {
            $this->db->where('student_id', $student_id);
            $this->db->update('aadhar_card', $aadharCardData);
        } else {
            $this->db->insert('aadhar_card', $aadharCardData);
        }
        return true;
    }

    public function getStudentsAdharById($student_id){
        $data = $this->db->select('*')
        ->where('student_id', $student_id)
        ->get('aadhar_card');
        
        $data = $data->result();
        return $data;
    }
}
