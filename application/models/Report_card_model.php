<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Report_card_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function add($insert_array) {

        if (!empty($insert_array)) {
            foreach ($insert_array as $insert_key => $insert_value) {
                $this->db->insert('report_card', $insert_array[$insert_key]);
                $not_be_del[] = $this->db->insert_id();
            }
        }
        
    }
    public function get($class_id = null , $section_id = null , $student_id = null, $session_id = null)
    {
        $this->db->select('*')->from('report_card');
        $this->db->where('report_card.class', $class_id);
        $this->db->where('report_card.section', $section_id);
        $this->db->where('report_card.session', $session_id);
        $this->db->where('report_card.student_id', $student_id);
        $this->db->order_by('report_card.subject_id', 'Asc');
        $query = $this->db->get();
        return $query->result_array();
    }
    public function getdetails($class_id = null , $section_id = null , $student_id = null, $session_id = null, $subject_id = null,$exam_id = null)
    {
        $this->db->select('*')->from('report_card');
        $this->db->where('report_card.class', $class_id);
        $this->db->where('report_card.section', $section_id);
        $this->db->where('report_card.exam_id', $exam_id);
        $this->db->where('report_card.session', $session_id);
        $this->db->where('report_card.student_id', $student_id);
        $this->db->where('report_card.subject_id', $subject_id);
        $this->db->order_by('report_card.subject_id', 'Asc');
        $query = $this->db->get();
        return $query->result_array();
    }

    public function getdetailsSingle($class_id = null , $section_id = null , $student_id = null, $session_id = null, $subject_id = null,$exam_id = null)
    {
        $this->db->select('*')->from('report_card');
        $this->db->where('report_card.class', $class_id);
        $this->db->where('report_card.section', $section_id);
        $this->db->where('report_card.exam_id', $exam_id);
        $this->db->where('report_card.session', $session_id);
        $this->db->where('report_card.student_id', $student_id);
        $this->db->where('report_card.subject_id', $subject_id);
        $this->db->order_by('report_card.subject_id', 'Asc');
        $query = $this->db->get();
        return $query->row_array();
    }








    public function getSubjectName($class_id = null , $section_id = null , $student_id = null, $session_id = null)
    {
        $this->db->distinct('report_card.subject_id');
        $this->db->select('subjects.name,report_card.subject_id')->from('report_card');
        $this->db->where('report_card.class', $class_id);
        $this->db->where('report_card.section', $section_id);
        $this->db->where('report_card.session', $session_id);
        $this->db->where('report_card.student_id', $student_id);
        $this->db->join('subjects', 'subjects.id = report_card.subject_id');
        $this->db->order_by('report_card.subject_id', 'Asc');
        // $this->db->join('classes', 'student_session.class_id = classes.id');
        // $this->db->join('sections', 'sections.id = student_session.section_id');
        // $this->db->join('hostel_rooms', 'hostel_rooms.id = students.hostel_room_id', 'left');
        // $this->db->join('hostel', 'hostel.id = hostel_rooms.hostel_id', 'left');
        // $this->db->join('tb_branch', 'tb_branch.id = student_session.branch_id', 'left');
        // $this->db->join('room_types', 'room_types.id = hostel_rooms.room_type_id', 'left');
        // $this->db->join('vehicle_routes', 'vehicle_routes.id = students.vehroute_id', 'left');
        // $this->db->join('transport_route', 'vehicle_routes.route_id = transport_route.id', 'left');
        // $this->db->join('vehicles', 'vehicles.id = vehicle_routes.vehicle_id', 'left');
        // $this->db->join('school_houses', 'school_houses.id = students.school_house_id', 'left');
        // $this->db->join('users', 'users.user_id = students.id', 'left');

        // $this->db->where('student_session.session_id', $this->current_session);
        // $this->db->where('users.role', 'student');
        // if ($id != null) {
        // } else {
        //     $this->db->where('students.is_active', 'yes');
        // }
        $query = $this->db->get();
        return $query->result_array();
        // if ($id != null) {
        //     return $query->row_array();
        // } else {
        // }
    }


    public function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('report_card');
    }

}
