<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Branch extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model("classteacher_model");
        $this->sch_setting_detail = $this->setting_model->getSetting();
    }

    public function index()
    {
        if (!$this->rbac->hasPrivilege('branch', 'can_add')) {
            access_denied();
        }

        $BranchList         = $this->branch_model->getBranch();
        $data['sch_setting'] = $this->setting_model->getSetting();
        $data['BranchList'] = $BranchList;
        $this->session->set_userdata('top_menu', 'System Settings');
        $this->session->set_userdata('sub_menu', 'users/index');
        $this->form_validation->set_rules('branch_title', $this->lang->line('branch_title'), 'required');
        $this->form_validation->set_rules('branch_address', $this->lang->line('branch_address'), 'required');
        if ($this->form_validation->run() == false) {
            $BranchList         = $this->branch_model->getBranch();
            $data['sch_setting'] = $this->setting_model->getSetting();
            $data['BranchList'] = $BranchList;
            $this->load->view('layout/header', $data);
            $this->load->view('admin/branch/branchAdd', $data);
            $this->load->view('layout/footer', $data);
        }
        else
        {
            $data = array(
                'branch_name'       => $this->input->post('branch_title'),
                'location'          => $this->input->post('branch_address'),
                'branch_status'     => $this->input->post('branch_status'),
            );
            $insert_id = $this->branch_model->add($data); 
            redirect('admin/branch/index');
              
        }
        
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('branch', 'can_delete')) {
            access_denied();
        }
        $this->branch_model->remove($id);
        redirect('admin/branch/index');
    }

    public function edit($id)
    {
        if (!$this->rbac->hasPrivilege('branch', 'can_edit')) {
            access_denied();
        }
        $BranchList         = $this->branch_model->getBranch();
        $data['BranchList'] = $BranchList;
        $Branchdata         = $this->branch_model->getBranch($id);
        $data['Branchdata'] = $Branchdata;
        $data['id']          = $id;
        $this->session->set_userdata('top_menu', 'System Settings');
        $this->session->set_userdata('sub_menu', 'users/index');
        $this->form_validation->set_rules('branch_title', $this->lang->line('branch_title'), 'required|xss_clean');
        $this->form_validation->set_rules('branch_address', $this->lang->line('branch_address'), 'required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/branch/branchEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'id'                => $id,
                'branch_name'       => $this->input->post('branch_title'),
                'location'          => $this->input->post('branch_address'),
                'branch_status'     => $this->input->post('branch_status'),
            );
            $insert_id = $this->branch_model->add($data);
            redirect('admin/branch/index');

        }
        
    }


}