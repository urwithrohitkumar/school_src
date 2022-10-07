<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Finetype_model extends MY_Model
{


    protected $table;

    public function __construct()
    {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
        $this->current_date    = $this->setting_model->getDateYmd();
        $this->table = 'finetype';
    }


    /**
     * This function is used to get fine type list from database.
     * It will accept id, if id not provided, then will return list of all available in DB.
     *
     * @param integer $id
     * @param integer $limit
     * @param integer $offset
     * @return mixed
     */
    public function getFineType($id = 0, $limit = 0, $offset = 0)
    {
        try {
            if (!$id) {
                $query = $this->db->get($this->table, $limit, $offset);
                return $query->result();
            }
            $query = $this->db->get_where($this->table, ['id' => $id], $limit, $offset);
            return $query->result();
        } catch (\Exception $e) {
            log_message('errors', $e->getMessage());
            return false;
        }
    }
}
