<?php

use function PHPSTORM_META\type;

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

    /**
     * This function is used to return student age data.
     *
     * @return void
     */
    public function getStudentAgeReports()
    {
        $query = "SELECT students.id,students.gender,students.dob,classes.class,categories.category,
            DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),students.dob)), '%Y')+0 AS Age
         FROM student_session LEFT JOIN students on students.id=student_session.student_id LEFT JOIN classes on classes.id=student_session.class_id LEFT JOIN categories on categories.id=students.category_id;";

        $query = $this->db->query($query);
        $student =  $this->prepareAgeReport($query->result());
        return $student;
    }

    /**
     * This function is used to calculate report data.
     *
     * @param array $students
     * @return array
     */
    private function prepareAgeReport($students = []): array
    {

        $className = [];
        $classData = $this->db->get('classes')->result();
         /**
         * Fetch student details from database and preparing student data classwise
         */
        foreach ($classData as $key => $class) {
            $class = strtolower(str_replace(' ','_',$class->class));
            $className[$class] = [
                'male' => 0,
                'female' => 0,
                'transgender' => 0,
            ];
            
        }
        
        $studentAgeWise = [];
        /**
         * Defining static array  for all column.
         */
        $ageGroupArr = [
            '<4' => $className,
            '4<5' => $className,
            '5<6' =>$className,
            '6<7' => $className,
            '7<8' =>$className,
            '8<9' => $className,
            '9<10' => $className,
            '10<11' =>$className,
            '11<12' => $className,
            '12<13' => $className,
            '13<14' => $className,
            '14<15' => $className,
            '15<16' =>$className,
            '16<17' => $className,
            '17<18' => $className,
            '18<19' => $className,
            '19<20' =>$className,
            '20<21' =>$className,
            '21<22' => $className,
            '<22' =>$className,
        ];
       
        /**
         * Defining static array  for total.
         */
        $total = $className;
        
       

        // Createing agewise Array for students.
        foreach ($students as $key => $student) {

            $studentAge = intval($student->Age);

            if ($studentAge < 4) {
                $studentAgeWise['<4'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 5)) {
                $studentAgeWise['4<5'][] = $student;
                unset($students[$key]);
            } else if ($studentAge < 6) {
                $studentAgeWise['5<6'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 7)) {
                $studentAgeWise['6<7'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 8)) {
                $studentAgeWise['7<8'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 9)) {
                $studentAgeWise['8<9'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 10)) {
                $studentAgeWise['9<10'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 11)) {
                $studentAgeWise['10<11'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 12)) {
                $studentAgeWise['11<12'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 13)) {
                $studentAgeWise['12<13'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 14)) {
                $studentAgeWise['13<14'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 15)) {
                $studentAgeWise['14<15'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 16)) {
                $studentAgeWise['15<16'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 17)) {
                $studentAgeWise['16<17'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 18)) {
                $studentAgeWise['17<18'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 19)) {
                $studentAgeWise['18<19'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 20)) {
                $studentAgeWise['19<20'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 21)) {
                $studentAgeWise['20<21'][] = $student;
                unset($students[$key]);
            } else if (($studentAge < 22)) {
                $studentAgeWise['21<22'][] = $student;
                unset($students[$key]);
            }
        }
       
        // Calculating table column value by gender
        foreach ($studentAgeWise as $key => $saw) {
            foreach ($saw as $class_key => $st) {
                $class =  strtolower(str_replace(' ', '_', $st->class));
                if (strtolower($st->gender) == 'male') {
                    $m = intval($ageGroupArr[$key][$class]['male']);
                    $ageGroupArr[$key][$class]['male'] = $m + 1;
                } else if (strtolower($st->gender) == 'female') {
                    $f = intval($ageGroupArr[$key][$class]['female']);
                    $ageGroupArr[$key][$class]['female'] = $f + 1;
                } else {
                    $t = intval($ageGroupArr[$key][$class]['transgender']);
                    $ageGroupArr[$key][$class]['transgender'] = $t + 1;
                }
            }
        }
      

        // Preparing data for total in footer
        foreach ($ageGroupArr as $key => $st_class) {
            foreach ($st_class as $_key => $value) {
                $total[$_key]['male'] = intval($total[$_key]['male']) + intval($st_class[$_key]['male']);
                $total[$_key]['female'] = intval($total[$_key]['female']) + intval($st_class[$_key]['female']);
                $total[$_key]['transgender'] = intval($total[$_key]['transgender']) + intval($st_class[$_key]['transgender']);

            }
        }

        $ageGroupArr['Total'] = $total;

        return $ageGroupArr;
    }

    /**
     * Get student category reports 
     *
     * @return void
     */
    public function StudentCategoryReport()
    {
        $query = "SELECT students.id,students.gender,students.dob,classes.class,categories.category,students.religion,students.bpl,aadhar_card.id as adharId 
        FROM student_session LEFT JOIN students on students.id=student_session.student_id 
        LEFT JOIN classes on classes.id=student_session.class_id 
        LEFT JOIN categories on categories.id=students.category_id
        LEFT JOIN aadhar_card on aadhar_card.student_id=student_session.student_id";
        $query = $this->db->query($query);
        $res = $this->prepareCategoryReport($query->result());
   
        return $res;
    }

    /**
     * Prepare data for students.
     *
     * @param array $students
     * @return array
     */
    private function prepareCategoryReport($students = []): array
    {
        $className = [];
        $categories = [];
        $minorities = [];
        $classData = $this->db->get('classes')->result();
        $CategData = $this->db->get('categories')->result();
        $minoritesData = $this->db->get('religion')->result();
        /**
         * Fetch student details from database and preparing student data classwise
         */
        foreach ($classData as $key => $class) {
            $class = strtolower(str_replace(' ','_',$class->class));
            $className[$class] = [
                'male' => 0,
                'female' => 0,
                'transgender' => 0,
            ];
            
        }

        /**
         * Fetch student details from database and preparing student data categorywise
         */
        foreach ($CategData as $key => $category) {
            $category = strtolower(str_replace('.','',$category->category));
            $category = strtolower(str_replace(' ','',$category));
            $categories[$category]["section1"] = $className;
        }

        //Add Total Category section in catgories array
        $categories['total'] =[ "section1" => $className];

        /**
         * Fetch student details from database and preparing student data categorywise
         */
        foreach ($minoritesData as $key => $minort) {
           
            $minort = (str_replace('.','',$minort->religion));
            $minort = (str_replace(' ','',$minort));
            $minorities[$minort]["section1"] = $className;
        }
        //Add Total minorities section in minorities array
        $minorities['total'] =[ "section1" => $className];

        // Submitted documents
        $isDocuments = [

            "having_aadhar" => [
                "section1" => $className,
            ],
            "BPL" => [
                "section1" => $className,
            ],

        ];
        $studentCategory = [];
        $minoritiesDetsils = [];
        $docDetsils = [];
         // Createing category,gender Array for students.
        foreach ($students as $key => $student) {
            $category = strtolower($student->category);
            $relegions = strtolower($student->religion);
            $bpl = strtolower($student->bpl);
            $adharId = strtolower($student->adharId);
            $class = str_replace(' ', '_', strtolower($student->class));
            $gender = strtolower($student->gender);

            switch ($category) {
                case 'General':
                    if ($gender === 'male')
                        $studentCategory[$class]['General']['male'][] = $student;
                    elseif ($gender === 'female')
                        $studentCategory[$class]['General']['female'][] = $student;
                    else
                        $studentCategory[$class]['General']['transgender'][] = $student;
                    break;

                case 'sc':
                    if ($gender === 'male')
                        $studentCategory[$class]['Sc']['male'][] = $student;
                    elseif ($gender === 'female')
                        $studentCategory[$class]['Sc']['female'][] = $student;
                    else
                        $studentCategory[$class]['Sc']['transgender'][] = $student;
                    break;

                case 'st':
                    if ($gender === 'male')
                        $studentCategory[$class]['St']['male'][] = $student;
                    elseif ($gender === 'female')
                        $studentCategory[$class]['St']['female'][] = $student;
                    else
                        $studentCategory[$class]['St']['transgender'][] = $student;
                    break;

                case 'obc':
                    if ($gender === 'male')
                        $studentCategory[$class]['Obc']['male'][] = $student;
                    elseif ($gender === 'female')
                        $studentCategory[$class]['Obc']['female'][] = $student;
                    else
                        $studentCategory[$class]['Obc']['transgender'][] = $student;
                    break;

                default:
                    // if ($gender === 'male')
                    //     $studentCategory[$class]['na']['male'][] = $student;
                    // elseif ($gender === 'female')
                    //     $studentCategory[$class]['na']['female'][] = $student;
                    // else
                    //     $studentCategory[$class]['na']['transgender'][] = $student;
                    // break;
            }
            switch ($relegions) {
                case 'parsi':
                    if ($gender === 'male')
                        $minoritiesDetsils[$class]['Parsi']['male'][] = $student;
                    elseif ($gender === 'female')
                        $minoritiesDetsils[$class]['Parsi']['female'][] = $student;
                    else
                        $minoritiesDetsils[$class]['Parsi']['transgender'][] = $student;
                    break;

                case 'muslim':
                    if ($gender === 'male')
                        $minoritiesDetsils[$class]['Muslim']['male'][] = $student;
                    elseif ($gender === 'female')
                        $minoritiesDetsils[$class]['Muslim']['female'][] = $student;
                    else
                        $minoritiesDetsils[$class]['Muslim']['transgender'][] = $student;
                    break;

                case 'sikh':
                    if ($gender === 'male')
                        $minoritiesDetsils[$class]['Sikh']['male'][] = $student;
                    elseif ($gender === 'female')
                        $minoritiesDetsils[$class]['Sikh']['female'][] = $student;
                    else
                        $minoritiesDetsils[$class]['Sikh']['transgender'][] = $student;
                    break;

                case 'buddhists':
                    if ($gender === 'male')
                        $minoritiesDetsils[$class]['Buddhists']['male'][] = $student;
                    elseif ($gender === 'female')
                        $minoritiesDetsils[$class]['Buddhists']['female'][] = $student;
                    else
                        $minoritiesDetsils[$class]['Buddhists']['transgender'][] = $student;
                    break;

                case 'jain':
                    if ($gender === 'male')
                        $minoritiesDetsils[$class]['Jain']['male'][] = $student;
                    elseif ($gender === 'female')
                        $minoritiesDetsils[$class]['Jain']['female'][] = $student;
                    else
                        $minoritiesDetsils[$class]['Jain']['transgender'][] = $student;
                    break;
                default:
                    if ($gender === 'male')
                        $minoritiesDetsils[$class]['Jain']['male'][] = $student;
                    elseif ($gender === 'female')
                        $minoritiesDetsils[$class]['Jain']['female'][] = $student;
                    else
                        $minoritiesDetsils[$class]['Jain']['transgender'][] = $student;
                    break;
            }

            if (!empty($bpl)) {
                if ($gender === 'male')
                    $docDetsils[$class]['BPL']['male'][] = $student;
                elseif ($gender === 'female')
                    $docDetsils[$class]['BPL']['female'][] = $student;
                else
                    $docDetsils[$class]['BPL']['transgender'][] = $student;
            }
            if (!empty($adharId)) {
                if ($gender === 'male')
                    $docDetsils[$class]['having_aadhar']['male'][] = $student;
                elseif ($gender === 'female')
                    $docDetsils[$class]['having_aadhar']['female'][] = $student;
                else
                    $docDetsils[$class]['having_aadhar']['transgender'][] = $student;
            }
        }
        foreach ($studentCategory as $st_key => $st) {
            foreach ($st as $cat_key => $cate) {
                foreach ($cate as $_gender_key => $gender) {
                    foreach ($gender as $_st_g_key => $value) {
                        $_gender = strtolower($value->gender);
                        $_class = str_replace(' ', '_', strtolower($value->class));
                        if ($_gender === 'male') {
                            $male = $categories[$cat_key]['section1'][$_class]['male'];
                            $categories[$cat_key]['section1'][$_class]['male'] = intval($male) + 1;
                        }
                        if ($_gender === 'female') {
                            $fmale = $categories[$cat_key]['section1'][$_class]['female'];
                            $categories[$cat_key]['section1'][$_class]['female'] = (intval($fmale) + 1);
                        }
                        if ($_gender === 'transgender') {
                            $tmale = $categories[$cat_key]['section1'][$_class]['transgender'];
                            $categories[$cat_key]['section1'][$_class]['transgender'] = intval($tmale) + 1;
                        }
                    }
                }
                $categories['total']['section1'][$_class]['male'] += ($categories[$cat_key]['section1'][$_class]['male']);
                $categories['total']['section1'][$_class]['female'] += ($categories[$cat_key]['section1'][$_class]['female']);
                $categories['total']['section1'][$_class]['transgender'] += ($categories[$cat_key]['section1'][$_class]['transgender']);
            }
        }
        foreach ($minoritiesDetsils as $st_key => $st) {
            foreach ($st as $cat_key => $cate) {
                foreach ($cate as $_gender_key => $gender) {
                    foreach ($gender as $_st_g_key => $value) {
                        $_gender = strtolower($value->gender);
                        $_class = str_replace(' ', '_', strtolower($value->class));

                        if ($_gender === 'male') {
                            $male = $minorities[$cat_key]['section1'][$_class]['male'];
                            $minorities[$cat_key]['section1'][$_class]['male'] = intval($male) + 1;
                        }
                        if ($_gender === 'female') {
                            $fmale = $minorities[$cat_key]['section1'][$_class]['female'];
                            $minorities[$cat_key]['section1'][$_class]['female'] = (intval($fmale) + 1);
                        }
                        if ($_gender === 'transgender') {
                            $tmale = $minorities[$cat_key]['section1'][$_class]['transgender'];
                            $minorities[$cat_key]['section1'][$_class]['transgender'] = intval($tmale) + 1;
                        }
                    }
                }
                $minorities['total']['section1'][$_class]['male'] += ($minorities[$cat_key]['section1'][$_class]['male']);
                $minorities['total']['section1'][$_class]['female'] += ($minorities[$cat_key]['section1'][$_class]['female']);
                $minorities['total']['section1'][$_class]['transgender'] += ($minorities[$cat_key]['section1'][$_class]['transgender']);
            }
        }
        foreach ($docDetsils as $st_key => $st) {
            foreach ($st as $cat_key => $cate) {
                foreach ($cate as $_gender_key => $gender) {
                    foreach ($gender as $_st_g_key => $value) {
                        $_gender = strtolower($value->gender);
                        $_class = str_replace(' ', '_', strtolower($value->class));

                        if ($_gender === 'male') {
                            $male = $isDocuments[$cat_key]['section1'][$_class]['male'];
                            $isDocuments[$cat_key]['section1'][$_class]['male'] = intval($male) + 1;
                        }
                        if ($_gender === 'female') {
                            $fmale = $isDocuments[$cat_key]['section1'][$_class]['female'];
                            $isDocuments[$cat_key]['section1'][$_class]['female'] = (intval($fmale) + 1);
                        }
                        if ($_gender === 'transgender') {
                            $tmale = $isDocuments[$cat_key]['section1'][$_class]['transgender'];
                            $isDocuments[$cat_key]['section1'][$_class]['transgender'] = intval($tmale) + 1;
                        }
                    }
                }
            }
        }
    

        return ['category' => $categories, 'minorities' => $minorities, 'documents' => $isDocuments];
    }
}
