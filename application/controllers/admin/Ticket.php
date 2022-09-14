<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Ticket extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('string');
        $this->load->model('Ticket_model');

    }

    public function index($chk = null) {
        $this->session->set_userdata('top_menu', 'System Settings');
        $this->session->set_userdata('sub_menu', 'ticket/index');
                 $school_data = $this->session->userdata('admin');
                //  print_r($school_data);
              
               
                

        $data['school_data'] = array(
            'school_name'=> $school_data['school_name'],
            'email'=>$school_data['email']
        );

        $data['ticket_list']  = $this->Ticket_model->getTicket();

        $this->load->view('layout/header');
        $this->load->view('admin/ticket/index',$data);
        $this->load->view('layout/footer');
    }
    public function add_ticket(){
       
        if (!$this->rbac->hasPrivilege('superadmin', 'can_view')) {
            access_denied();
        }
        
        $school_data = $this->session->userdata('admin');
        //  print_r($school_data);
       
        

    $data['school_data'] = array(
    'school_name'=> $school_data['school_name'],
    'email'=>$school_data['email']
    );
            $data['ticket_list']  = $this->Ticket_model->getTicket();
            $file = $this->input->post('file');

        $this->form_validation->set_rules('schoo_name', $this->lang->line('schoo_name'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('email', $this->lang->line('email'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('subject', $this->lang->line('subject'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('priority', $this->lang->line('priority'), 'trim|required|xss_clean');
         $this->form_validation->set_rules('file', $this->lang->line('file'), 'callback_file_selected_test');
        $this->form_validation->set_rules('issue', $this->lang->line('issue'), 'trim|required|xss_clean');
        

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header');
        $this->load->view('admin/ticket/index',$data);
        $this->load->view('layout/footer');
        } else {


           
            $config['upload_path'] ='/home/thewings/public_html/admin/ticket_SS/';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2000;
            $config['max_width'] = 1500;
            $config['max_height'] = 1500;
    
            $this->load->library('upload', $config,"screenshort");
    
            if (!$this->screenshort->do_upload('file')) {
                $error = array('error' => $this->screenshort->display_errors());
    
            } else {
                $data =  $this->screenshort->data();
                  $upload_SS = 'https://thewingshield.com/admin/ticket_SS/'.$data[file_name];
                   
            }
            
            $data = array(
                'organistion_name' => $this->input->post('schoo_name'),
                'email' => $this->input->post('email'),
                'subject' => $this->input->post('subject'),
                'priority' => $this->input->post('priority'),
                'screenshort' => $this->input->post('screenshort'),
                'screenshort'=>$upload_SS
                
            );
          
           $issue =  $this->input->post('issue');
            $this->Ticket_model->add($data, $issue);
           $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('success_message') . '</div>');
            redirect('admin/ticket/index');
        }
       
    }

    function file_selected_test(){
        
        $this->form_validation->set_message('file_selected_test', 'Please Upload screen shot of the issue.');
        if (empty($_FILES['file']['name'])) {
                return false;
            }else{
                return true;
            }
    }

   

}
