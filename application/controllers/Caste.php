<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Caste extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        if (!$this->rbac->hasPrivilege('student_caste', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Student Information');
        $this->session->set_userdata('sub_menu', 'caste/index');
        $data['title']        = 'Caste List';
        $caste_result      = $this->caste_model->get();
        $data['castelist'] = $caste_result;
        $this->load->view('layout/header', $data);
        $this->load->view('caste/casteList', $data);
        $this->load->view('layout/footer', $data);
    }

    public function view($id)
    {
        if (!$this->rbac->hasPrivilege('student_caste', 'can_view')) {
            access_denied();
        }
        $data['title']    = 'Caste List';
        $caste         = $this->caste_model->get($id);
        $data['caste'] = $caste;
        $this->load->view('layout/header', $data);
        $this->load->view('caste/casteShow', $data);
        $this->load->view('layout/footer', $data);
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('student_caste', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'caste List';
        $this->caste_model->remove($id);
        $this->session->set_flashdata('msgdelete', '<div class="alert alert-success text-left">' . $this->lang->line('delete_message') . '</div>');
        redirect('caste/index');
    }

    public function create()
    {
        if (!$this->rbac->hasPrivilege('student_caste', 'can_add')) {
            access_denied();
        }
        $data['title']        = 'Add caste';
        $caste_result      = $this->caste_model->get();
        $data['castelist'] = $caste_result;
        $this->form_validation->set_rules('caste', $this->lang->line('caste'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('caste/casteList', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'caste' => $this->input->post('caste'),
            );
            $this->caste_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('success_message') . '</div>');
            redirect('caste/index');
        }
    }

    public function edit($id)
    {
        if (!$this->rbac->hasPrivilege('student_caste', 'can_edit')) {
            access_denied();
        }
        $data['title']        = 'Edit caste';
        $caste_result      = $this->caste_model->get();
        $data['castelist'] = $caste_result;
        $data['id']           = $id;
        $caste             = $this->caste_model->get($id);
        $data['caste']     = $caste;
        $this->form_validation->set_rules('caste', $this->lang->line('caste'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('caste/casteEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'id'       => $id,
                'caste' => $this->input->post('caste'),
            );
            $this->caste_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('update_message') . '</div>');
            redirect('caste/index');
        }
    }

}
