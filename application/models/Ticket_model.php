<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Ticket_model extends MY_Model {

    public function __construct() {
        parent::__construct();

    }

    function add($data, $issue) {
        $db2 = $this->load->database('database2', TRUE);  
       
        $db2->insert('tb_ticket', $data);
        $insert_id = $db2->insert_id();
        $replyData = array(
            'ticket_id'=> $insert_id,
            'message'=>$issue
            );
        
       return  $db2->insert('tb_ticket_comment', $replyData);

        
        
    }
    function getTicket(){
        $db2 = $this->load->database('database2', TRUE);  

        $school_data = $this->session->userdata('admin');
        //  print_r($school_data);
    
        $db2->select('*');
	    $db2->from('tb_ticket');
		$db2->where('email',$school_data['email']);
        $db2->order_by("id","DESC");
		$query = $db2->get();
		 $rowcount = $query->num_rows();
		if($rowcount > 0){
			return  $query->result_array();
		}else{
		
			return 0;
		}
    }
}
?>