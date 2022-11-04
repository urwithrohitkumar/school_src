<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class ReportCardController extends Admin_Controller
{
    public $exam_type = array();
    public function __construct()
    {
        parent::__construct();
        $this->exam_type = $this->config->item('exam_type');
    }

   

    public function index()
    {
        if (!$this->rbac->hasPrivilege('report_card', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu','Examinations');
        $this->session->set_userdata('sub_menu','Examinations/report_card');
        $branch = $this->staff_model->getBranch();
        $data['branch'] = $branch;
        $data['title'] = 'Report Card';
        $data['title_list'] = 'Report Card List';
        $data['examType'] = $this->exam_type;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('session_id', $this->lang->line('student'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {
        } else {
            
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');
            $branch_id = $this->input->post('branch_id');
            $marksheet_result = $this->marksheet_model->getBranchData($branch_id);
            $data['branch_id']       = $branch_id;
            $data['marksheet_result']       = $marksheet_result;

            $classlist = $this->class_model->getBranchData($branch_id);
            $examGropup = $this->examgroup_model->getWithBranch($branch_id);




            $data['examGroup']       = $examGropup;
            $data['classlist']       = $classlist;
            $sectionlist                   = $this->section_model->getBranchData($branch_id, $class_id);
            $data['sectionlist']       = $sectionlist;




            $marksheet_template = $this->input->post('marksheet');
            $data['marksheet_template'] = $marksheet_template;

            $data['studentList'] = $this->student_model->getStudentsDetailsBranchClassSection($class_id, $section_id, $branch_id);
            // $data['studentList'] = $this->examgroupstudent_model->searchExamStudents($exam_group_id, $exam_id, $class_id, $section_id, $session_id, $branch_id);

            // $data['examList'] = $this->examgroup_model->getExamByExamGroup($exam_group_id, true);

            // $data['exam_id'] = $exam_id;
            // $data['exam_group_id'] = $exam_group_id;
        }
        $this->load->view('layout/header', $data);
        $this->load->view('admin/examresult/report_card', $data);
        $this->load->view('layout/footer', $data);
    }


    public function downlod($student_id,$post_exam_id,$post_exam_group_id)
    {
        
        $data = array();

            $exam = $this->examgroup_model->getExamByID($post_exam_id);
            $data['exam'] = $exam;

            $exam_grades = $this->grade_model->getByExamType($exam->exam_group_type);
            $data['exam_grades'] = $exam_grades;
            $data['marksheet'] = $this->examresult_model->getExamResults($post_exam_id, $post_exam_group_id, $student_id);
            $data['sch_setting'] = $this->sch_setting_detail;
            $student_exam_page = $this->load->view('admin/examresult/_printmarksheet', $data, true);
            $array = array('status' => '1', 'error' => '', 'page' => $student_exam_page);
            echo json_encode($array);
        





























        
        // $student_data     =  $this->student_model->get($student_id);


        // $student_aadhar_data     = $this->Aadhar_card_model->getStudentsAdharById($student_id);
        // $result = array(
        //     'student_data' => $student_data,
        //     'student_aadhar_data' => $student_aadhar_data,
        // );

        // $this->load->library('Pdf');
        // $html = $this->load->view('admin/certificate/school_leaving_certificate_downlod', $result, true);
        // $this->pdf->createPDF($html, 'mypdf', false);
    }


}
