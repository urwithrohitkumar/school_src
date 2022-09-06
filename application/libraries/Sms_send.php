<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Sms_send {
  
    public function __construct() {
        $this->CI = &get_instance();
        $this->CI->config->load("mailsms");
        $this->CI->load->library('smsgateway');
        $this->CI->load->library('mailgateway');
        $this->CI->load->model('examresult_model');
        $this->CI->load->model('student_model');
        $this->config_mailsms = $this->CI->config->item('mailsms');
        $this->sch_setting = $this->CI->setting_model->getSetting();
    }
 
    public function mailsms($send_for, $sender_details, $date = null, $exam_schedule_array = null) {
      
       
        $send_for = $this->config_mailsms[$send_for];

        $chk_mail_sms = $this->CI->customlib->sendMailSMS($send_for);
        $sms_detail = $this->CI->smsconfig_model->getActiveSMS();
       
       
        if (!empty($chk_mail_sms)) {
            if ($send_for == "student_admission") {
                if ($chk_mail_sms['mail'] && $chk_mail_sms['template'] != "") {
                    $this->CI->mailgateway->sentRegisterMail($sender_details['student_id'], $sender_details['email'], $chk_mail_sms['template'], $chk_mail_sms['subject']);
                }
                if ($chk_mail_sms['sms'] =="1") {
                  
                      sendAdmissionSms($sender_details);
                }
            } elseif ($send_for == "exam_result") {

                $this->sendResult($chk_mail_sms, $sender_details, $chk_mail_sms['template'], $chk_mail_sms['subject'],$chk_mail_sms['template_id']);
            } elseif ($send_for == "login_credential") {

                if ($chk_mail_sms['mail'] && $chk_mail_sms['template'] != "") {

                    $this->CI->mailgateway->sendLoginCredential($chk_mail_sms, $sender_details, $chk_mail_sms['template'] , $chk_mail_sms['subject']);
                }
                 if ($chk_mail_sms['sms'] =='1') {
                
                    sendLoginDetails($sender_details);

                
                }
            } elseif ($send_for == "fee_submission") {

                if ($chk_mail_sms['mail'] && $chk_mail_sms['template'] != "") {
                    $this->CI->mailgateway->sentAddFeeMail($sender_details, $chk_mail_sms['template'], $chk_mail_sms['subject']);
                }

                if ($chk_mail_sms['sms'] && $chk_mail_sms['template'] != "" && !empty($sms_detail)) {

                    $this->CI->smsgateway->sentAddFeeSMS($sender_details, $chk_mail_sms['template'],$chk_mail_sms['template_id']);
                }

                if ($chk_mail_sms['notification'] && $chk_mail_sms['template'] != "") {
                    $this->CI->smsgateway->sentAddFeeNotification($sender_details, $chk_mail_sms['template'], $chk_mail_sms['subject']);
                }
            } elseif ($send_for == "absent_attendence") {

                $this->sendAbsentAttendance($chk_mail_sms, $sender_details, $date, $chk_mail_sms['template'], $exam_schedule_array, $chk_mail_sms['subject'],$chk_mail_sms['template_id']);
            } elseif ($send_for == "fees_reminder") {

                if ($chk_mail_sms['mail'] && $chk_mail_sms['template'] != "") {
                    $this->CI->mailgateway->sentMail($sender_details, $chk_mail_sms['template'], $chk_mail_sms['subject']);
                }

                if ($chk_mail_sms['sms'] && $chk_mail_sms['template'] != "" && !empty($sms_detail)) {
                   
                    $this->CI->smsgateway->sendSMS($sender_details->guardian_phone, $sender_details,$chk_mail_sms['template_id'], $chk_mail_sms['template']);
                }

                if ($chk_mail_sms['notification'] && $chk_mail_sms['template'] != "") {
                    $this->CI->smsgateway->sentNotification($sender_details->parent_app_key, $chk_mail_sms['template'], $sender_details, $chk_mail_sms['subject'], $chk_mail_sms['template']);
                }
            } elseif ($send_for == "homework") {

                $this->sendHomework($chk_mail_sms, $sender_details, $chk_mail_sms['template'], $chk_mail_sms['subject'], $chk_mail_sms['template_id']);
            } elseif ($send_for == "online_examination_publish_exam") {

                $this->sendOnlineexam($chk_mail_sms, $sender_details, $chk_mail_sms['template'], $chk_mail_sms['subject'],$chk_mail_sms['template_id']);
            } elseif ($send_for == "online_examination_publish_result") {

                $this->sendOnlineexam($chk_mail_sms, $sender_details, $chk_mail_sms['template'], $chk_mail_sms['subject'], $chk_mail_sms['template_id']);
            }  elseif ($send_for == "forgot_password") {
                $school_name = $this->CI->setting_model->getCurrentSchoolName();
                $sender_details['school_name'] = $school_name;

                $msg = ($this->getForgotPasswordContent($sender_details, $chk_mail_sms['template']));


                if ($chk_mail_sms['mail'] && $chk_mail_sms['template'] != "") {
                    if (!empty($sender_details['email'])) {
                        $subject = $chk_mail_sms['subject'];
                        $this->CI->mailer->send_mail($sender_details['email'], $subject, $msg);
                    }
                }
            }  elseif ($send_for == "online_admission_form_submission") {

                $this->sendOnlineadmission($chk_mail_sms, $sender_details, $chk_mail_sms['template'], $chk_mail_sms['subject'], $chk_mail_sms['template_id']);
            }  elseif ($send_for == "online_admission_fees_submission") {

                $this->sendOnlineadmissionFees($chk_mail_sms, $sender_details, $chk_mail_sms['template'], $chk_mail_sms['subject'],$chk_mail_sms['template_id']);
            }else {
                
            }
        }
    } 
    
          public function sendHomework($chk_mail_sms, $student_details, $template, $subject, $template_id) {
 
 

        $student_sms_list = array();
        $student_email_list = array();
        $student_notification_list = array();
        if ($chk_mail_sms['mail'] or $chk_mail_sms['sms'] or $chk_mail_sms['notification']) {
            $class_id = ($student_details['class_id']);
            $section_id = ($student_details['section_id']);
            $homework_date = $student_details['homework_date'];
            $submit_date = $student_details['submit_date'];
            $subject = $student_details['subject'];
            $student_list = $this->CI->student_model->getStudentByClassSectionID($class_id, $section_id);
            $sms_detail = $this->CI->smsconfig_model->getActiveSMS();
            if (!empty($student_list)) {

                foreach ($student_list as $student_key => $student_value) {

                    if ($student_value['app_key'] != "") {
                        $student_notification_list[] = array(
                            'app_key' => $student_value['app_key'],
                            'class' => $student_value['class'],
                            'section' => $student_value['section'],
                            'homework_date' => $homework_date,
                            'submit_date' => $submit_date,
                            'subject' => $subject,
                            'admission_no' => $student_value['admission_no'],
                            'student_name' => $this->CI->customlib->getFullName($student_value['firstname'],$student_value['middlename'],$student_value['lastname'],$this->sch_setting->middlename,$this->sch_setting->lastname),
                        );
                    }
                    if ($student_value['parent_app_key'] != "") {
                        $student_notification_list[] = array(
                            'app_key' => $student_value['parent_app_key'],
                            'class' => $student_value['class'],
                            'section' => $student_value['section'],
                            'homework_date' => $homework_date,
                            'submit_date' => $submit_date,
                            'subject' => $subject,
                            'admission_no' => $student_value['admission_no'],
                            'student_name' => $this->CI->customlib->getFullName($student_value['firstname'],$student_value['middlename'],$student_value['lastname'],$this->sch_setting->middlename,$this->sch_setting->lastname),
                        );
                    }

                    if ($student_value['email'] != "") {
                        $student_email_list[$student_value['email']] = array(
                            'class' => $student_value['class'],
                            'section' => $student_value['section'],
                            'homework_date' => $homework_date,
                            'submit_date' => $submit_date,
                            'subject' => $subject,
                            'admission_no' => $student_value['admission_no'],
                            'student_name' => $this->CI->customlib->getFullName($student_value['firstname'],$student_value['middlename'],$student_value['lastname'],$this->sch_setting->middlename,$this->sch_setting->lastname),
                        );
                    }
                    if ($student_value['guardian_email'] != "") {
                        $student_email_list[$student_value['guardian_email']] = array(
                            'class' => $student_value['class'],
                            'section' => $student_value['section'],
                            'homework_date' => $homework_date,
                            'submit_date' => $submit_date,
                            'subject' => $subject,
                            'admission_no' => $student_value['admission_no'],
                            'student_name' =>$this->CI->customlib->getFullName($student_value['firstname'],$student_value['middlename'],$student_value['lastname'],$this->sch_setting->middlename,$this->sch_setting->lastname),
                        );
                    }
                    if ($student_value['mobileno'] != "") {
                        $student_sms_list[$student_value['mobileno']] = array(
                            'class' => $student_value['class'],
                            'section' => $student_value['section'],
                            'homework_date' => $homework_date,
                            'submit_date' => $submit_date,
                            'subject' => $subject,
                            'admission_no' => $student_value['admission_no'],
                            'student_name' => $this->CI->customlib->getFullName($student_value['firstname'],$student_value['middlename'],$student_value['lastname'],$this->sch_setting->middlename,$this->sch_setting->lastname),
                        );
                    }
                    if ($student_value['guardian_phone'] != "") {
                        $student_sms_list[$student_value['guardian_phone']] = array(
                            'class' => $student_value['class'],
                            'section' => $student_value['section'],
                            'homework_date' => $homework_date,
                            'submit_date' => $submit_date,
                            'subject' => $subject,
                            'admission_no' => $student_value['admission_no'],
                            'student_name' => $this->CI->customlib->getFullName($student_value['firstname'],$student_value['middlename'],$student_value['lastname'],$this->sch_setting->middlename,$this->sch_setting->lastname),
                        );
                    }
                }
           
             
                if ($chk_mail_sms['mail']) {

                    if ($student_email_list) {
                        $this->CI->mailgateway->sentHomeworkStudentMail($student_email_list, $template, $subject);
                    }
                }

                if ($chk_mail_sms['sms'] && !empty($sms_detail)) {
                  
                    if ($student_sms_list) {
                        $this->CI->smsgateway->sentHomeworkStudentSMS($student_sms_list, $template, $template_id);
                    }
                }

                if ($chk_mail_sms['notification']) {

                    if (!empty($student_notification_list)) {
                        $this->CI->smsgateway->sentHomeworkStudentNotification($student_notification_list, $template, $subject);
                    }
                }
            }
        }
    }


   
}
