<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Generateidcard_model extends CI_model
{

    function __construct()
    {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }

    public function getstudentidcard()
    {
        $this->db->select('*');
        $this->db->from('id_card');
        if ($this->session->userdata['admin']['branch_id'] != 0) {
            $this->db->where('branch_id', $this->session->userdata['admin']['branch_id']);
        }
        $query = $this->db->get();
        return $query->result();
    }

    public function getidcardbyid($idcard)
    {
        $this->db->select('*');
        $this->db->from('id_card');
        $this->db->where('id', $idcard);
        $query = $this->db->get();
        return $query->result();
    }
}
