<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

if (!function_exists('sendAdmissionSms')) {

    function sendAdmissionSms($sender_details) {
      $CI = get_instance();

    // print_r($sender_details);
    $firstname = $sender_details['firstname'];
    $mobileno = $sender_details['mobileno'];
    $contact_no = $sender_details['contact_no'];
    $email = $sender_details['email'];
    $class_id = $sender_details['class_id'];
    $getclass = $CI->db->query("SELECT class from classes where id='$class_id'")->row();
    $class =  $getclass->class;

    $section_id = $sender_details['section_id'];
    $getsection = $CI->db->query("SELECT section from sections where id='$section_id'")->row();
    $section = $getsection->section;

    $session_id =  $sender_details['session_id'];
    $getsessions = $CI->db->query("SELECT session from sessions where id='$session_id'")->row();
    $session =  $getsessions->session;
    
    $message = "Dear   $firstname  your admission is confirm in Class: $class Section:  $section for Session: $session for more detail  contact System Admin ";
    $fields = array(
    "sender_id" => "FSTSMS",
    "message" =>$message,
    "language" => "english",
    "route" => "p",
    "numbers" => "$contact_no,$mobileno",
    "flash" => "1"
    );

    $curl = curl_init();

    curl_setopt_array($curl, array(
    CURLOPT_URL => "https://www.fast2sms.com/dev/bulk",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "POST",
    CURLOPT_POSTFIELDS => json_encode($fields),
    CURLOPT_HTTPHEADER => array(
    "authorization: hKoycPM7lJDv56jsX1ZbEeSpGUN8LAxT3fRiO0n9aYF4Cq2gtdnKAQIk5Eqpb0hSYOmtuVfMwrGZTJ82",
    "accept: */*",
    "cache-control: no-cache",
    "content-type: application/json"
    ),
    ));

    $response = curl_exec($curl);
    $err = curl_error($curl);

    curl_close($curl);

    // if ($err) {
    // echo "cURL Error #:" . $err;
    // } else {
    // echo $response;
    // }
    }
}

if (!function_exists('sendLoginDetails')) {

  function sendLoginDetails($sender_details) {

    $CI = get_instance();
    $mobileno = $sender_details['mobileno'];
    $contact_no = $sender_details['contact_no'];
  $username = $sender_details['username'];
  $credential_for =  $sender_details['credential_for'];

  $password = $sender_details['password'];
  $baseURL = base_url();
  $message = "login details for  $credential_for  Username: $username  Password: $password  and URL $baseURL";
  $fields = array(
  "sender_id" => "FSTSMS",
  "message" =>$message,
  "language" => "english",
  "route" => "p",
  "numbers" => "$contact_no,$mobileno",
  "flash" => "1"
  );

  $curl = curl_init();

  curl_setopt_array($curl, array(
  CURLOPT_URL => "https://www.fast2sms.com/dev/bulk",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => json_encode($fields),
  CURLOPT_HTTPHEADER => array(
  "authorization: hKoycPM7lJDv56jsX1ZbEeSpGUN8LAxT3fRiO0n9aYF4Cq2gtdnKAQIk5Eqpb0hSYOmtuVfMwrGZTJ82",
  "accept: */*",
  "cache-control: no-cache",
  "content-type: application/json"
  ),
  ));

  $response = curl_exec($curl);
  $err = curl_error($curl);

  curl_close($curl);

  // if ($err) {
  // echo "cURL Error #:" . $err;
  // } else {
  // echo $response;
  // }
  }
}

if (!function_exists('sendSatfflogin')) {

  function sendSatfflogin($sender_details) {
     
    $CI = get_instance();
    $contact_no = $sender_details['contact_no'];
  $username = $sender_details['username'];
  $email =  $sender_details['email'];
  $credential_for =  $sender_details['credential_for'];

  $password = $sender_details['password'];
  $baseURL = base_url();
  $message = "login details for  $credential_for  Username: $username  , Password: $password ,  and URL $baseURL";
  $fields = array(
  "sender_id" => "FSTSMS",
  "message" =>$message,
  "language" => "english",
  "route" => "p",
  "numbers" => "$contact_no",
  "flash" => "1"
  );

  $curl = curl_init();

  curl_setopt_array($curl, array(
  CURLOPT_URL => "https://www.fast2sms.com/dev/bulk",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => json_encode($fields),
  CURLOPT_HTTPHEADER => array(
  "authorization: hKoycPM7lJDv56jsX1ZbEeSpGUN8LAxT3fRiO0n9aYF4Cq2gtdnKAQIk5Eqpb0hSYOmtuVfMwrGZTJ82",
  "accept: */*",
  "cache-control: no-cache",
  "content-type: application/json"
  ),
  ));

  $response = curl_exec($curl);
  $err = curl_error($curl);

  curl_close($curl);

  // if ($err) {
  // echo "cURL Error #:" . $err;
  // } else {
  // echo $response;
  // }
  }
}
?>