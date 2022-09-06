<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Add_home_content extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->load->config('ci-blog');
        $this->banner_content = $this->config->item('ci_front_banner_content');
        $this->load->model('frontcms_setting_model');

    }

    function index() {
        if (!$this->rbac->hasPrivilege('add_home_content', 'can_view')) {
            access_denied();
        }
        $data = array();
        $this->session->set_userdata('top_menu', 'Front CMS');
        $this->session->set_userdata('sub_menu', 'admin/front/banner');
        $result = $this->cms_program_model->getByCategory($this->banner_content);
        if (!empty($result)) {
            $data['banner_images'] = $this->cms_program_model->front_cms_program_photos($result[0]['id']);
        }
        $data['homepage_data']  =  $this->frontcms_setting_model->getHomePageData();

        $this->load->view('layout/header');
        $this->load->view('admin/front/home_content/index', $data);
        $this->load->view('layout/footer');
    }

    function add() {
        // if (!$this->rbac->hasPrivilege('banner_images', 'can_add')) {
        //     access_denied();
        // }
        // $this->session->set_userdata('top_menu', 'Front CMS');
        // $this->session->set_userdata('sub_menu', 'admin/front/banner');
        // $banner_content = $this->config->item('ci_front_banner_content');
        $file = $this->input->post('upload_icon');

        $this->form_validation->set_rules('title', $this->lang->line('title'), 'trim|required|xss_clean');
        //$this->form_validation->set_rules('add_subtitle', $this->lang->line('add_subtitle'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('upload_icon', $this->lang->line('upload_icon'), 'callback_file_selected_test');
       $this->form_validation->set_rules('direction', $this->lang->line('direction'), 'trim|required|xss_clean');
        // $this->form_validation->set_rules('position', $this->lang->line('position'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('description', $this->lang->line('description'), 'trim|required|xss_clean');
        

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header');
            $this->load->view('admin/front/home_content/index', $data);
            $this->load->view('layout/footer');
        } else {


           
            $config['upload_path'] ='uploads/page_content';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2000;
            $config['max_width'] = 1500;
            $config['max_height'] = 1500;
    
            $this->load->library('upload', $config,"upload_icon");
    
            if (!$this->upload_icon->do_upload('upload_icon')) {
                $error = array('error' => $this->upload_icon->display_errors());
    
            } else {
                $data =  $this->upload_icon->data();
                  $imageIcon = base_url('uploads/page_content/') .$data['file_name'];
                   
            }
            
            $data = array(
                'title' => $this->input->post('title'),
                'add_subtitle' => $this->input->post('add_subtitle'),
                'direction' => $this->input->post('direction'),
                'description' => $this->input->post('description'),
                'file'=>$imageIcon
                
            );

          
          
            $this->frontcms_setting_model->add_pagecontent($data);
           $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('success_message') . '</div>');
           redirect('admin/front/add_home_content');

        }
    }

    function update_status(){
        $content_id = $_POST['content_id'];
$status = $_POST['status'];
if($status == 0){
$res = $this->db->query("UPDATE   tb_pagecontain  SET statu='0'  where id  = '$content_id'");
echo 0;

}else{
$res = $this->db->query("UPDATE   tb_pagecontain  SET statu='1'  where id  = '$content_id'");
echo 1;
}
    }

    public function remove($id) {
        if($id){
			
			$delete = $this->frontcms_setting_model->delPagecontent($id);
        	}

		 redirect('admin/front/add_home_content');
	 
    }

    function file_selected_test(){
        
        $this->form_validation->set_message('file_selected_test', 'Please Upload Image or icon .');
        if (empty($_FILES['upload_icon']['name'])) {
                return false;
            }else{
                return true;
            }
    }
    function edit($id){
        $data['editPagedata'] =  $this->frontcms_setting_model->getPageContentByid($id);
        $data['pagecontent_id'] = $id;
        $this->load->view('layout/header');
            $this->load->view('admin/front/home_content/edit',$data);
            $this->load->view('layout/footer');
    }

    public function update_pagecontent(){

        $id = $this->input->post('pagecontent_id');
        $data = array(
            'title' => $this->input->post('title'),
            'add_subtitle' => $this->input->post('add_subtitle'),
            'direction' => $this->input->post('direction'),
            'description' => $this->input->post('description')            
        );
       $this->frontcms_setting_model->updatePagecontent($id,$data);
       $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . 'Record updated successfully' . '</div>');
       redirect('admin/front/add_home_content/edit/'.$id);

    }
    public function update_img(){
        $file = $this->input->post('upload_icon');
        $id = $this->input->post('pagecontent_id');

        $config['upload_path'] ='uploads/page_content';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['max_size'] = 2000;
        $config['max_width'] = 1500;
        $config['max_height'] = 1500;

        $this->load->library('upload', $config,"upload_icon");

        if (!$this->upload_icon->do_upload('upload_icon')) {
            $error = array('error' => $this->upload_icon->display_errors());

        } else {
            $data =  $this->upload_icon->data();
              $imageIcon = base_url('uploads/page_content/') .$data['file_name'];
               
        }
        
        $data = array(
            'file'=>$imageIcon
            
        );

        
      
        $this->frontcms_setting_model->updatePageContentimg($data,$id);
       $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('success_message') . '</div>');
       redirect('admin/front/add_home_content/edit/'.$id);

    }


}

?>