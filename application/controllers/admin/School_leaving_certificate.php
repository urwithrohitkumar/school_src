<?php

use phpseclib\Crypt\RC2;

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class School_leaving_certificate extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->sch_setting_detail = $this->setting_model->getSetting();
    }

    function index()
    {
        if (!$this->rbac->hasPrivilege('school_leaving_certificate', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Certificate');
        $this->session->set_userdata('sub_menu', 'school_leaving_certificate');

        $branch = $this->staff_model->getBranch();
        $data['branch'] = $branch;
        $data['adm_auto_insert'] = $this->sch_setting_detail->adm_auto_insert;
        $data['sch_setting']     = $this->sch_setting_detail;
        $data['fields']          = $this->customfield_model->get_custom_fields('students', 1);
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $branch_id = $this->input->post('branch_id');
            $class   = $this->input->post('class_id');
            $class_id   = $this->input->post('class_id');
            $section = $this->input->post('section_id');
            $search  = $this->input->post('search');

            $this->form_validation->set_rules('branch_id', $this->lang->line('branch'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
            } else {

                $data['searchby']    = "filter";
                $data['branch_id']   = $this->input->post('branch_id');
                $data['class_id']    = $this->input->post('class_id');
                $data['section_id']  = $this->input->post('section_id');
                $data['search_text'] = $this->input->post('search_text');

                $resultlist          = $this->student_model->searchByClassSection($branch_id, $class, $section);
                $data['resultlist']  = $resultlist;
                $title               = $this->classsection_model->getDetailbyClassSection($data['class_id'], $data['section_id']);
                $data['title']       = 'Student Details for ' . $title['class'] . "(" . $title['section'] . ")";
                $classlist                   = $this->class_model->getBranchData($branch_id);
                $data['classlist']       = $classlist;
                $sectionlist                   = $this->section_model->getBranchData($branch_id, $class_id);
                $data['sectionlist']       = $sectionlist;
            }
        }
        $this->load->view('layout/header', $data);
        $this->load->view('admin/certificate/school_leaving_certificate', $data);
        $this->load->view('layout/footer', $data);
    }


    public function downlod($student_id)
    {
        
        $student_data     =  $this->student_model->get($student_id);


        $student_aadhar_data     = $this->Aadhar_card_model->getStudentsAdharById($student_id);
        $result = array(
            'student_data' => $student_data,
            'student_aadhar_data' => $student_aadhar_data,
        );

        $this->load->library('Pdf');
        $html = $this->load->view('admin/certificate/school_leaving_certificate_downlod', $result, true);
        $this->pdf->createPDF($html, 'mypdf', false);
    }
}
