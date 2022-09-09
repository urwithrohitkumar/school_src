<?php

use phpseclib\Crypt\RC2;

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Student_aadhar_card extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        if (!$this->rbac->hasPrivilege('aadhar_card', 'can_view')) {
            access_denied();
        }
        $class                   = $this->class_model->get();
        $data['classlist']       = $class;
        $this->session->set_userdata('top_menu', 'Certificate');
        $this->session->set_userdata('sub_menu', 'admin/student_aadhar_card');
        $this->load->view('layout/header');
        $this->load->view('admin/certificate/aadharcertificate', $data);
        $this->load->view('layout/footer');
    }

    function create()
    {
        $student_id = $this->input->post('store_student_id');
        if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
         
            $fileInfo = pathinfo($_FILES["file"]["name"]);
            $img_name = $_FILES['file']['name'];
            move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/aadhar_card/student_sign/" . $_FILES['file']['name']);
            $aadharCardData['thumb_image'] = $img_name;
        }
        if (isset($_FILES["stamp"]) && !empty($_FILES['stamp']['name'])) {
           
            $fileInfo = pathinfo($_FILES["stamp"]["name"]);
            $stamp_img = $_FILES['stamp']['name'];
            move_uploaded_file($_FILES["stamp"]["tmp_name"], "./uploads/aadhar_card/certifier_sign/" . $_FILES['stamp']['name']);
            $aadharCardData['stamp_img'] = $stamp_img;
        }
        if (isset($_FILES["student_img"]) && !empty($_FILES['student_img']['name'])) {
            
            $fileInfo = pathinfo($_FILES["student_img"]["name"]);
            $student_img= $_FILES['student_img']['name'];
            move_uploaded_file($_FILES["student_img"]["tmp_name"], "./uploads/aadhar_card/student_img/" . $_FILES['student_img']['name']);
            $aadharCardData['student_img'] = $student_img;
        }
        $studentData = [
            'adhar_no' => $this->input->post('aadhar_card'),
            'firstname' => $this->input->post('fname'),
            'middlename' => $this->input->post('mname'),
            'lastname' => $this->input->post('lname'),
            'guardian_name' => $this->input->post('gaurdianName'),
            'city' => $this->input->post('city'),
            'state' => $this->input->post('state'),
            'pincode' => $this->input->post('pincode'),
            'dob' => $this->input->post('dob'),
        ];
        $aadharCardData = [
            'student_id' => $student_id,
            'certifier_name' => $this->input->post('certifierName'),
            'certifier_designation' => $this->input->post('designation'),
            'certifier_office_add' => $this->input->post('ofcAdd'),
            'cerifier_contact' => $this->input->post('contactNo'),
            'house_no' => $this->input->post('houseNo'),
            'street' => $this->input->post('street'),
            'landmark' => $this->input->post('landmark'),
            'area' => $this->input->post('area'),
            'post_office' => $this->input->post('post_office'),
            'district' => $this->input->post('district'),
            'gajet_officer_group_A' => $this->input->post('gajet_officer_group_A'),
            'village_panchayat' => $this->input->post('village_panchayat'),
            'gajet_officer_group_B' => $this->input->post('gajet_officer_group_B'),
            'councilor' => $this->input->post('councilor'),
            'tehsildar' => $this->input->post('tehsildar'),
            'hrei' => $this->input->post('hrei'),
            'swmho' => $this->input->post('swmho'),
            'epfo' => $this->input->post('epfo'),
            'overwriting' => $this->input->post('overwriting'),
            'issue_date' => $this->input->post('issue_date'),
            'resident_sign' => $this->input->post('resident_sign'),
            'certifier_details' => $this->input->post('certifier_details'),
            'cross_stamp' => $this->input->post('cross_stamp'),
            'resident' => $this->input->post('resident'),
            'nri' => $this->input->post('nri'),
            'newenrolmment' => $this->input->post('newenrolmment'),
            'updaterequest' => $this->input->post('updaterequest'),
            'enterdate' => $this->input->post('enterdate'),
        ];
        $studentData = $this->student_model->update_student_data($studentData, $student_id);
        $aadharCardData = $this->Aadhar_card_model->update_student_aadhar_card_details($aadharCardData, $student_id);
        return true;
    }
    public function downlod($student_id){
        $student_data     = $this->student_model->getStudentsById($student_id);
      
        $student_aadhar_data     = $this->Aadhar_card_model->getStudentsAdharById($student_id);
        $result = array(
            'student_data' => $student_data,
            'student_aadhar_data' => $student_aadhar_data,
        );
        
        $this->load->view('admin/certificate/adharCardCertificateDownlod', $result);
    }





    // function view($id) {
    //     if (!$this->rbac->hasPrivilege('exam', 'can_view')) {
    //         access_denied();
    //     }
    //     $data['title'] = 'Exam List';
    //     $exam = $this->exam_model->get($id);
    //     $data['exam'] = $exam;
    //     $this->load->view('layout/header', $data);
    //     $this->load->view('exam/examShow', $data);
    //     $this->load->view('layout/footer', $data);
    // }

    // function getByFeecategory() {
    //     $feecategory_id = $this->input->get('feecategory_id');
    //     $data = $this->feetype_model->getTypeByFeecategory($feecategory_id);
    //     echo json_encode($data);
    // }

    // function getStudentCategoryFee() {
    //     $type = $this->input->post('type');
    //     $class_id = $this->input->post('class_id');
    //     $data = $this->exam_model->getTypeByFeecategory($type, $class_id);
    //     if (empty($data)) {
    //         $status = 'fail';
    //     } else {
    //         $status = 'success';
    //     }
    //     $array = array('status' => $status, 'data' => $data);
    //     echo json_encode($array);
    // }

    // function delete($id) {
    //     if (!$this->rbac->hasPrivilege('exam', 'can_delete')) {
    //         access_denied();
    //     }
    //     $data['title'] = 'Exam List';
    //     $this->exam_model->remove($id);
    //     redirect('admin/exam/index');
    // }

    // function create() {
    //     if (!$this->rbac->hasPrivilege('exam', 'can_add')) {
    //         access_denied();
    //     }
    //     $data['title'] = 'Add Exam';
    //     $this->form_validation->set_rules('exam', $this->lang->line('exam'), 'trim|required|xss_clean');
    //     if ($this->form_validation->run() == FALSE) {
    //         $this->load->view('layout/header', $data);
    //         $this->load->view('exam/examCreate', $data);
    //         $this->load->view('layout/footer', $data);
    //     } else {
    //         $data = array(
    //             'exam' => $this->input->post('exam'),
    //             'note' => $this->input->post('note'),
    //         );
    //         $this->exam_model->add($data);
    //         $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('success_message') . '</div>');
    //         redirect('exam/index');
    //     }
    // }

    // function edit($id) {
    //     if (!$this->rbac->hasPrivilege('exam', 'can_edit')) {
    //         access_denied();
    //     }
    //     $data['title'] = 'Edit Exam';
    //     $data['id'] = $id;
    //     $exam = $this->exam_model->get($id);
    //     $data['exam'] = $exam;
    //     $data['title_list'] = 'Exam List';
    //     $exam_result = $this->exam_model->get();
    //     $data['examlist'] = $exam_result;
    //     $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required|xss_clean');
    //     if ($this->form_validation->run() == FALSE) {
    //         $this->load->view('layout/header', $data);
    //         $this->load->view('admin/exam/examEdit', $data);
    //         $this->load->view('layout/footer', $data);
    //     } else {
    //         $data = array(
    //             'id' => $id,
    //             'name' => $this->input->post('name'),
    //             'note' => $this->input->post('note'),
    //         );
    //         $this->exam_model->add($data);
    //         $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('update_message') . '</div>');
    //         redirect('admin/exam/index');
    //     }
    // }

    // function examSearch() {
    //     $data['title'] = 'Search exam';
    //     if ($this->input->server('REQUEST_METHOD') == "POST") {
    //         $search = $this->input->post('search');
    //         if ($search == "search_filter") {
    //             $data['exp_title'] = 'exam Result From ' . $this->input->post('date_from') . " To " . $this->input->post('date_to');
    //             $date_from = date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date_from')));
    //             $date_to = date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date_to')));
    //             $resultList = $this->exam_model->search("", $date_from, $date_to);
    //             $data['resultList'] = $resultList;
    //         } else {
    //             $data['exp_title'] = 'exam Result';
    //             $search_text = $this->input->post('search_text');
    //             $resultList = $this->exam_model->search($search_text, "", "");
    //             $data['resultList'] = $resultList;
    //         }
    //         $this->load->view('layout/header', $data);
    //         $this->load->view('admin/exam/examSearch', $data);
    //         $this->load->view('layout/footer', $data);
    //     } else {
    //         $this->load->view('layout/header', $data);
    //         $this->load->view('admin/exam/examSearch', $data);
    //         $this->load->view('layout/footer', $data);
    //     }
    // }

}
