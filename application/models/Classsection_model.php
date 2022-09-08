<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}


class Classsection_model extends MY_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
        // include ;
    }
    /**
     * This funtion takes id as a parameter and will fetch the record.
     * If id is not provided, then it will fetch all the records form the table.
     * @param int $id
     * @return mixed
     */
    public function get($classid = null)
    {
        $this->db->select('class_sections.id,class_sections.section_id,sections.section');
        $this->db->from('class_sections');
        $this->db->join('sections', 'sections.id = class_sections.section_id');
        $this->db->where('class_sections.class_id', $classid);
        $this->db->order_by('class_sections.id');
        $query = $this->db->get();
        return $query->result_array();
    }

    public function update($data)
    {

        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('classes', $data);
        }
    }

    public function add($data, $sections)
    {

        $this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well
        //=======================Code Start===========================
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('classes', $data);
            $class_id = $data['id'];
            $message = UPDATE_RECORD_CONSTANT . " On classes id " . $data['id'];
            $action = "Update";
            $record_id = $data['id'];
            $this->log($message, $record_id, $action);
            //======================Code End==============================

            $this->db->trans_complete(); # Completing transaction
            /* Optional */

            if ($this->db->trans_status() === false) {
                # Something went wrong.
                $this->db->trans_rollback();
                return false;
            } else {
                //return $return_value;
            }
        } else {
            $this->db->insert('classes', $data);
            $class_id = $this->db->insert_id();

            $message = INSERT_RECORD_CONSTANT . " On subject groups id " . $class_id;
            $action = "Insert";
            $record_id = $class_id;
            $this->log($message, $record_id, $action);
            //======================Code End==============================

            $this->db->trans_complete(); # Completing transaction
            /* Optional */

            if ($this->db->trans_status() === false) {
                # Something went wrong.
                $this->db->trans_rollback();
                return false;
            } else {
                //return $return_value;
            }
        }

        $sections_array = array();
        foreach ($sections as $vec_key => $vec_value) {

            $vehicle_array = array(
                'class_id' => $class_id,
                'section_id' => $vec_value,
            );

            $sections_array[] = $vehicle_array;
        }
        $this->db->insert_batch('class_sections', $sections_array);
        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
        } else {
            $this->db->trans_commit();
        }
    }

    public function getDetailbyClassSection($class_id, $section_id)
    {
        $this->db->select('class_sections.*,classes.class,sections.section')->from('class_sections');
        $this->db->where('class_id', $class_id);
        $this->db->where('section_id', $section_id);
        $this->db->join('classes', 'classes.id = class_sections.class_id');
        $this->db->join('sections', 'sections.id = class_sections.section_id');
        $this->db->where('class_sections.class_id', $class_id);
        $this->db->where('class_sections.section_id', $section_id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function check_data_exists($data)
    {
        $this->db->where('class_id', $data['class_id']);
        $this->db->where('section_id', $data['section_id']);
        $query = $this->db->get('class_sections');
        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function getByID($id = null)
    {
        $this->db->select('classes.*')->from('classes');

        if ($id != null) {
            $this->db->where('classes.id', $id);
        } else {
            $this->db->order_by('classes.id', 'DESC');
        }

        $query = $this->db->get();
        if ($id != null) {
            $vehicle_routes = $query->result_array();

            $array = array();
            if (!empty($vehicle_routes)) {
                foreach ($vehicle_routes as $vehicle_key => $vehicle_value) {
                    $vec_route = new stdClass();
                    $vec_route->id = $vehicle_value['id'];

                    $vec_route->route_id = $vehicle_value['class'];
                    $vec_route->vehicles = $this->getVechileByRoute($vehicle_value['id']);
                    $array[] = $vec_route;
                }
            }
            return $array;
        } else {
            $vehicle_routes = $query->result_array();
            $array = array();
            if (!empty($vehicle_routes)) {
                foreach ($vehicle_routes as $vehicle_key => $vehicle_value) {

                    $vec_route = new stdClass();
                    $vec_route->id = $vehicle_value['id'];
                    $vec_route->class = $vehicle_value['class'];

                    $vec_route->vehicles = $this->getVechileByRoute($vehicle_value['id']);
                    $array[] = $vec_route;
                }
            }
            return $array;
        }
    }

    public function getVechileByRoute($route_id)
    {
        $this->db->select('class_sections.id as class_section_id,class_sections.class_id,class_sections.section_id,sections.*')->from('class_sections');
        $this->db->join('sections', 'sections.id = class_sections.section_id');

        $this->db->where('class_sections.class_id', $route_id);
        $this->db->order_by('class_sections.id', 'asc');
        $query = $this->db->get();
        return $vehicle_routes = $query->result();
    }

    public function remove($class_id, $array)
    {

        $this->db->where('class_id', $class_id);
        $this->db->where_in('section_id', $array);
        $this->db->delete('class_sections');
    }

    public function allClassSections()
    {

        $classes = $this->class_model->get();
        if (!empty($classes)) {
            foreach ($classes as $class_key => $class_value) {
                $classes[$class_key]['sections'] = $this->get($class_value['id']);
            }
        }
        return $classes;
    }




    public function getClassSectionStudentCount()
    {
        $query = "SELECT class_sections.*,classes.class,sections.section,(SELECT COUNT(*) FROM student_session INNER JOIN students on students.id=student_session.student_id WHERE student_session.class_id=classes.id and student_session.section_id=sections.id and students.is_active='yes' and student_session.session_id=" . $this->current_session . " )  as student_count FROM `class_sections` INNER JOIN classes on classes.id=class_sections.class_id INNER JOIN sections on sections.id=class_sections.section_id ORDER by classes.class ASC, sections.section asc";

        $query = $this->db->query($query);
        return $query->result();
    }



    public function getStudentAgeReports()
    {
        $query = "SELECT students.id,students.gender,students.dob,classes.class,categories.category,
            DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),students.dob)), '%Y')+0 AS Age
         FROM student_session LEFT JOIN students on students.id=student_session.student_id LEFT JOIN classes on classes.id=student_session.class_id LEFT JOIN categories on categories.id=students.category_id;";

        $query = $this->db->query($query);
        $student =  $this->prepareReport($query->result());
        return $student;
    }

    private function prepareReport($students = [])
    {
        $studentAgeWise = [];

        $ageGroupArr = [

            '<4' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '4<5' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '5<6' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '6<7' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '7<8' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '8<9' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '9<10' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '10<11' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '11<12' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '12<13' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '13<14' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '14<15' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '15<16' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '16<17' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '17<18' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '18<19' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '19<20' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '20<21' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '21<22' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ],
            '<22' => [
                'nursery' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'lkg' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_1' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_2' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_3' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_4' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_5' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_6' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_7' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_8' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_9' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_10' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_11' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
                'class_12' => [
                    'male' => 0,
                    'female' => 0,
                    'transgender' => 0,
                ],
            ]
        ];

        foreach ($students as $key => $student) {

            $studentAge = $student->Age;

            if ($studentAge < 3) {
                $studentAgeWise['<4'][] = $student;
            } else if ($studentAge < 5) {
                $studentAgeWise['4<5'][] = $student;
            } else if ($studentAge < 6) {
                $studentAgeWise['5<6'][] = $student;
            } else if ($studentAge < 7) {
                $studentAgeWise['6<7'][] = $student;
            } else if ($studentAge < 8) {
                $studentAgeWise['7<8'][] = $student;
            } else if ($studentAge < 9) {
                $studentAgeWise['8<9'][] = $student;
            } else if ($studentAge < 10) {
                $studentAgeWise['9<10'][] = $student;
            } else if ($studentAge < 11) {
                $studentAgeWise['10<11'][] = $student;
            } else if ($studentAge < 12) {
                $studentAgeWise['11<12'][] = $student;
            } else if ($studentAge < 13) {
                $studentAgeWise['12<13'][] = $student;
            } else if ($studentAge < 14) {
                $studentAgeWise['13<14'][] = $student;
            } else if ($studentAge < 15) {
                $studentAgeWise['14<15'][] = $student;
            } else if ($studentAge < 16) {
                $studentAgeWise['15<16'][] = $student;
            } else if ($studentAge < 17) {
                $studentAgeWise['16<17'][] = $student;
            } else if ($studentAge < 18) {
                $studentAgeWise['17<18'][] = $student;
            } else if ($studentAge < 19) {
                $studentAgeWise['18<19'][] = $student;
            } else if ($studentAge < 20) {
                $studentAgeWise['19<20'][] = $student;
            } else if ($studentAge < 21) {
                $studentAgeWise['20<21'][] = $student;
            } else if ($studentAge < 22) {
                $studentAgeWise['21<22'][] = $student;
            } else {
                $studentAgeWise['<22'][] = $student;
            }
        }

        $students = [];
        foreach ($studentAgeWise as $key => $saw) {
            $male = 0;
            $female = 0;
            $transgender = 0;
            $class = 0;
            foreach ($studentAgeWise[$key] as $class_key => $st) {
                if (strtolower($st->gender) == 'male') {
                    $male++;
                } else if (strtolower($st->gender) == 'female') {
                    $female++;
                } else {
                    $transgender++;
                }
                $class =  strtolower(str_replace(' ', '_', $st->class));
            }

            $ageGroupArr[$key][$class]['male'] = $male;
            $ageGroupArr[$key][$class]['female'] = $female;
            $ageGroupArr[$key][$class]['transgender'] = $transgender;
        }

        return $ageGroupArr;
    }
}
