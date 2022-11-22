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
        $this->session->set_userdata('top_menu', 'Examinations');
        $this->session->set_userdata('sub_menu', 'Examinations/report_card');
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
            $session_id = $this->input->post('session_id');
            $section_id = $this->input->post('section_id');
            $branch_id = $this->input->post('branch_id');
            $data['branch_id']       = $branch_id;
            $classlist = $this->class_model->getBranchData($branch_id);
            $data['classlist']       = $classlist;
            $data['session_id']       = $session_id;
            $sectionlist                   = $this->section_model->getBranchData($branch_id, $class_id);
            $data['sectionlist']       = $sectionlist;

            $data['studentList'] = $this->student_model->getStudentsDetailsBranchClassSection($class_id, $section_id, $branch_id);
        }
        $this->load->view('layout/header', $data);
        $this->load->view('admin/examresult/report_card', $data);
        $this->load->view('layout/footer', $data);
    }


    // public function download($class_id, $section_id, $branch_id, $student_id, $session_id)
    // {

    //     $data['subject_name']  = $this->Report_card_model->getSubjectName($class_id, $section_id, $student_id, $session_id);


    //     foreach ($data['subject_name'] as $key => $sub_name) {

    //         $ut_1  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 1);

    //         $half_yearly  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 2);

    //         $ut_2  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 3);
    //         $final_term  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 4);
    //         $ut_marks = !empty($ut_1) ? $ut_1[0]['marks_get'] : 0;
    //         $half_yearly_marks = !empty($half_yearly) ? $half_yearly[0]['marks_get'] : 0;
    //         $ut_two_marks = !empty($ut_2) ? $ut_2[0]['marks_get'] : 0;
    //         $final_term_marks = !empty($final_term) ? $final_term[0]['marks_get'] : 0;
    //         if (!empty($ut_1)) {
    //             $ut_marks = $ut_1[0]['marks_get'];
    //         }

    //         $first_total = $ut_marks + $half_yearly_marks;
    //         $second_total = $ut_two_marks + $final_term_marks;
    //         $final_total = $ut_marks + $half_yearly_marks + $ut_two_marks + $final_term_marks;
    //         if (!empty($ut_1)) {
    //             $report[$sub_name['name']] = $ut_1;
    //         } else {
    //             $report[$sub_name['name']][0] = [];
    //         }
    //         $report[$sub_name['name']][1] = !empty($half_yearly[0]) ? $half_yearly[0] : [];
    //         $report[$sub_name['name']][2] = array('marks_get' => $first_total);
    //         $report[$sub_name['name']][3] = !empty($ut_2[0]) ? $ut_2[0] : [];
    //         $report[$sub_name['name']][4] = !empty($final_term[0]) ? $final_term[0] : [];
    //         $report[$sub_name['name']][5] = array('marks_get' => $second_total);
    //         $report[$sub_name['name']][6] = array('marks_get' => $final_total);
    //     }


    //     $sumvalue = array();

    //     foreach ($report as $k => $sub_array) {
    //         foreach ($sub_array[6] as $id => $value) {
    //             $sum[] = $value ;
    //         }
    //     }
    //     $data['final_report']  = $report;
    //     $data['total_sum']  = array_sum($sum);
    //     $data['report_card_details']  = $this->Report_card_model->get($class_id, $section_id, $student_id, $session_id);
    //     $data['student_details']  = $this->student_model->get($student_id);
    //     $data['session_details']  = $this->session_model->get($session_id);
    //     $this->load->library('Pdf');
    //     $html = $this->load->view('admin/examresult/report_card_pdf', $data, true);
    //     $this->pdf->createPDF($html, 'mypdf', false);
    // }


    public function remarks()
    {
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');
            $student_id = $this->input->post('student_id');
            $session_id = $this->input->post('session_id');
            $branch_id = $this->input->post('branch_id');
            

        $data['subject_name']  = $this->Report_card_model->getSubjectName($class_id, $section_id, $student_id, $session_id);
        


        foreach ($data['subject_name'] as $key => $sub_name) {

            $ut_1  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 1);

            $half_yearly  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 2);

            $ut_2  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 3);
            $final_term  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 4);
            $ut_marks = !empty($ut_1) ? $ut_1[0]['marks_get'] : 0;
            $half_yearly_marks = !empty($half_yearly) ? $half_yearly[0]['marks_get'] : 0;
            $ut_two_marks = !empty($ut_2) ? $ut_2[0]['marks_get'] : 0;
            $final_term_marks = !empty($final_term) ? $final_term[0]['marks_get'] : 0;
            if (!empty($ut_1)) {
                $ut_marks = $ut_1[0]['marks_get'];
            }

            $first_total = $ut_marks + $half_yearly_marks;
            $second_total = $ut_two_marks + $final_term_marks;
            $final_total = $ut_marks + $half_yearly_marks + $ut_two_marks + $final_term_marks;
            if (!empty($ut_1)) {
                $report[$sub_name['name']] = $ut_1;
            } else {
                $report[$sub_name['name']][0] = [];
            }
            $report[$sub_name['name']][1] = !empty($half_yearly[0]) ? $half_yearly[0] : [];
            $report[$sub_name['name']][2] = array('marks_get' => $first_total);
            $report[$sub_name['name']][3] = !empty($ut_2[0]) ? $ut_2[0] : [];
            $report[$sub_name['name']][4] = !empty($final_term[0]) ? $final_term[0] : [];
            $report[$sub_name['name']][5] = array('marks_get' => $second_total);
            $report[$sub_name['name']][6] = array('marks_get' => $final_total);
        }


        $sumvalue = array();

        foreach ($report as $k => $sub_array) {
            foreach ($sub_array[6] as $id => $value) {
                $sum[] = $value ;
            }
        }
        $data['final_report']  = $report;
        $data['total_sum']  = array_sum($sum);
        $report_card_remarks_details  = $this->Report_card_remarks_model->getdetailsSingle($class_id, $section_id, $student_id, $session_id ,$branch_id);
        $data['report_card_remarks_details']  = !empty($report_card_remarks_details) ? $report_card_remarks_details['remarks'] : '';
        $data['report_card_details']  = $this->Report_card_model->get($class_id, $section_id, $student_id, $session_id);
        $data['student_details']  = $this->student_model->get($student_id);
        $data['session_details']  = $this->session_model->get($session_id);
        echo json_encode($data);
      
    }

    public function download()
    {
        $reportarray = array(
            'class_id' => $this->input->post('class_id'),
            'section_id' => $this->input->post('section_id'),
            'student_id' => $this->input->post('student_id'),
            'session_id' => $this->input->post('session_id'),
            'branch_id' => $this->input->post('branch_id'),
            'remarks' => $this->input->post('remarks'),
            
        );



        
        
        
        
        
        $class_id = $this->input->post('class_id');
        $section_id = $this->input->post('section_id');
        $student_id = $this->input->post('student_id');
        $session_id = $this->input->post('session_id');
        $branch_id = $this->input->post('branch_id');
        
        $student_session_details  = $this->Studentsession_model->getStudentByStudentId($student_id);
        $total_attendece  = $this->Stuattendence_model->total_attendence_student($student_session_details['id'] , $branch_id);
        $data['total_attendence']  = $total_attendece[0]['total'];
        $attend_attendence  = $this->Stuattendence_model->attend_attendence_student($student_session_details['id'] , $branch_id);
        $data['attend_attendence']  = $attend_attendence[0]['total'];
        $report_card_remarks_details_id  = $this->Report_card_remarks_model->getdetailsSingle($class_id, $section_id, $student_id, $session_id ,$branch_id);
        if(!empty($report_card_remarks_details_id)){
            
            $this->Report_card_remarks_model->delete($report_card_remarks_details_id['id']);
            $this->Report_card_remarks_model->add($reportarray);
        }
        else{
            $this->Report_card_remarks_model->add($reportarray);
        }
        $data['report_card_remarks_details']  = $this->Report_card_remarks_model->getdetailsSingle($class_id, $section_id, $student_id, $session_id ,$branch_id);
        
        $data['subject_name']  = $this->Report_card_model->getSubjectName($class_id, $section_id, $student_id, $session_id);


        foreach ($data['subject_name'] as $key => $sub_name) {

            $ut_1  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 1);

            $half_yearly  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 2);

            $ut_2  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 3);
            $final_term  = $this->Report_card_model->getdetails($class_id, $section_id, $student_id, $session_id, $sub_name['subject_id'], 4);
            $ut_marks = !empty($ut_1) ? $ut_1[0]['marks_get'] : 0;
            $half_yearly_marks = !empty($half_yearly) ? $half_yearly[0]['marks_get'] : 0;
            $ut_two_marks = !empty($ut_2) ? $ut_2[0]['marks_get'] : 0;
            $final_term_marks = !empty($final_term) ? $final_term[0]['marks_get'] : 0;
            if (!empty($ut_1)) {
                $ut_marks = $ut_1[0]['marks_get'];
            }

            $first_total = $ut_marks + $half_yearly_marks;
            $second_total = $ut_two_marks + $final_term_marks;
            $final_total = $ut_marks + $half_yearly_marks + $ut_two_marks + $final_term_marks;
            if (!empty($ut_1)) {
                $report[$sub_name['name']] = $ut_1;
            } else {
                $report[$sub_name['name']][0] = [];
            }
            $report[$sub_name['name']][1] = !empty($half_yearly[0]) ? $half_yearly[0] : [];
            $report[$sub_name['name']][2] = array('marks_get' => $first_total);
            $report[$sub_name['name']][3] = !empty($ut_2[0]) ? $ut_2[0] : [];
            $report[$sub_name['name']][4] = !empty($final_term[0]) ? $final_term[0] : [];
            $report[$sub_name['name']][5] = array('marks_get' => $second_total);
            $report[$sub_name['name']][6] = array('marks_get' => $final_total);
        }


        $sumvalue = array();

        foreach ($report as $k => $sub_array) {
            foreach ($sub_array[6] as $id => $value) {
                $sum[] = $value ;
            }
        }
        $data['final_report']  = $report;
        $data['total_sum']  = array_sum($sum);
        $data['report_card_details']  = $this->Report_card_model->get($class_id, $section_id, $student_id, $session_id);
        $data['student_details']  = $this->student_model->get($student_id);
        $data['session_details']  = $this->session_model->get($session_id);
        $this->load->library('Pdf');
        $html = $this->load->view('admin/examresult/report_card_pdf', $data, true);
        $this->pdf->createPDF($html, 'mypdf', false);
    }
}
