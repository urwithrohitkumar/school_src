<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Feereminder extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
    }


    public function index()
    {
        $this->session->set_userdata('top_menu', 'Fees Collection');
        $this->session->set_userdata('sub_menu', 'feereminder/setting');
        $data['title'] = 'Email Config List';
        $branch = $this->staff_model->getBranch();
        $data['branch']= $branch;
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('days', $this->lang->line('days'), 'required');
        $feereminderlist         = $this->feereminder_model->get();
        $data['feereminderlist'] = $feereminderlist;
        if ($this->form_validation->run() == false) {
        } else {
            $data = array(
                'reminder_type'        => $this->input->post('name'),
                'day' => $this->input->post('days'),
                'branch_id' => $this->input->post('branch_id'),
                'is_active' => '1',
            );
            $this->feereminder_model->add($data);
              $this->session->set_flashdata('msg', '<div class="alert alert-success">'.$this->lang->line('success_message').'</div>');
          
            redirect('admin/feereminder/setting');
        }
        $feegroup_result     = $this->feereminder_model->get();
        $data['feetypeList'] = $feegroup_result;

        $this->load->view('layout/header', $data);
        $this->load->view('admin/feereminder/setting', $data);
        $this->load->view('layout/footer', $data);
    }




    public function edit($id = null)
    {
        $data['id']          = $id;
        $feereminder            = $this->feereminder_model->get($id);
        $data['feereminder']    = $feereminder;
        $feereminderlist         = $this->feereminder_model->get();
        $data['feereminderlist'] = $feereminderlist;
        $data['title'] = 'Email Config List';
        $branch = $this->staff_model->getBranch();
        $data['branch']= $branch;
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('days', $this->lang->line('days'), 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/feereminder/setting', $data);
            $this->load->view('layout/footer', $data);
        } else {

            $data = array(
                'id'        => $this->input->post('feereminderid'),
                'reminder_type'        => $this->input->post('name'),
                'day' => $this->input->post('days'),
                'branch_id' => $this->input->post('branch_id'),
                'is_active' => '1',
            );
            $this->feereminder_model->add($data);
             $this->session->set_flashdata('msg', '<div class="alert alert-success">'.$this->lang->line('update_message').'</div>');
            redirect('admin/feereminder/setting');
        }
    }


    
    public function delete($id = null)
    {
        $data['title'] = 'Email Config List';
        $this->feereminder_model->remove($id);
        redirect('admin/feereminder/setting');
    }





    public function setting()
    {

        if (!$this->rbac->hasPrivilege('fees_reminder', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Fees Collection');
        $this->session->set_userdata('sub_menu', 'feereminder/setting');
        $data          = array();
        $data['title'] = 'Email Config List';
        $branch = $this->staff_model->getBranch();
        $data['branch']= $branch;

        $feereminderlist         = $this->feereminder_model->get();
        $data['feereminderlist'] = $feereminderlist;

        $this->form_validation->set_rules('email_type', $this->lang->line('email_type'), 'required');
        if ($this->input->server('REQUEST_METHOD') == "POST") {

            $ids          = $this->input->post('ids');
            $update_array = array();
            foreach ($ids as $id_key => $id_value) {
                $array = array(
                    'id'        => $id_value,
                    'is_active' => 0,
                    'day'       => $this->input->post('days' . $id_value),
                );
                $is_active = $this->input->post('isactive_' . $id_value);

                if (isset($is_active)) {
                    $array['is_active'] = $is_active;
                }

                $update_array[] = $array;
            }

            $this->feereminder_model->updatebatch($update_array);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">' . $this->lang->line('update_message') . '</div>');
            redirect('admin/feereminder/setting');
        }

        $data['title'] = 'Email Config List';
        $this->load->view('layout/header', $data);
        $this->load->view('admin/feereminder/setting', $data);
        $this->load->view('layout/footer', $data);
    }


    

}
