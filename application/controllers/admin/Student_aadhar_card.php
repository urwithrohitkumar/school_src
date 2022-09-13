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
        $aadharCardData = [];
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
            $student_img = $_FILES['student_img']['name'];
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
            'dob' =>  date("Y-m-d", strtotime($this->input->post('dob'))),
        ];

        $aadharCardData['student_id'] = $student_id;
        $aadharCardData['certifier_name'] = $this->input->post('certifierName');
        $aadharCardData['certifier_designation'] = $this->input->post('designation');
        $aadharCardData['certifier_office_add'] = $this->input->post('ofcAdd');
        $aadharCardData['cerifier_contact'] = $this->input->post('contactNo');
        $aadharCardData['house_no'] = $this->input->post('houseNo');
        $aadharCardData['street'] = $this->input->post('street');
        $aadharCardData['landmark'] = $this->input->post('landmark');
        $aadharCardData['area'] = $this->input->post('area');
        $aadharCardData['post_office'] = $this->input->post('post_office');
        $aadharCardData['district'] = $this->input->post('district');
        $aadharCardData['gajet_officer_group_A'] = $this->input->post('gajet_officer_group_A');
        $aadharCardData['village_panchayat'] = $this->input->post('village_panchayat');
        $aadharCardData['gajet_officer_group_B'] = $this->input->post('gajet_officer_group_B');
        $aadharCardData['councilor'] = $this->input->post('councilor');
        $aadharCardData['tehsildar'] = $this->input->post('tehsildar');
        $aadharCardData['hrei'] = $this->input->post('hrei');
        $aadharCardData['swmho'] = $this->input->post('swmho');
        $aadharCardData['epfo'] = $this->input->post('epfo');
        $aadharCardData['overwriting'] = $this->input->post('overwriting');
        $aadharCardData['issue_date'] = $this->input->post('issue_date');
        $aadharCardData['resident_sign'] = $this->input->post('resident_sign');
        $aadharCardData['certifier_details'] = $this->input->post('certifier_details');
        $aadharCardData['cross_stamp'] = $this->input->post('cross_stamp');
        $aadharCardData['resident'] = $this->input->post('resident');
        $aadharCardData['nri'] = $this->input->post('nri');
        $aadharCardData['newenrolmment'] = $this->input->post('newenrolmment');
        $aadharCardData['updaterequest'] = $this->input->post('updaterequest');
        $enterdate =  $this->input->post('enterdate');
        $enterdate = date("Y-m-d", strtotime($enterdate));
        $aadharCardData['enterdate'] = $enterdate;
        $studentData = $this->student_model->update_student_data($studentData, $student_id);
        $aadharCardData = $this->Aadhar_card_model->update_student_aadhar_card_details($aadharCardData, $student_id);
        return true;
    }
    public function downlod($student_id)
    {
        $student_data     = $this->student_model->getStudentsById($student_id);

        $student_aadhar_data     = $this->Aadhar_card_model->getStudentsAdharById($student_id);
        $result = array(
            'student_data' => $student_data,
            'student_aadhar_data' => $student_aadhar_data,
        );
        $this->load->library('pdf');
        $html = $this->load->view('admin/certificate/adharCardCertificateDownlod',$result, true);
        $this->pdf->createPDF($html, 'mypdf', false);
    }



}
