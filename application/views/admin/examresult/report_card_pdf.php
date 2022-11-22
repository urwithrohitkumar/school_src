<?php

$path = 'http://192.168.0.47/school_src/uploads/school_content/admin_logo/1.png';
$type = pathinfo($path, PATHINFO_EXTENSION);
$data = file_get_contents($path);
$logo = 'data:image/' . $type . ';base64,' . base64_encode($data);
?>


<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <title>Document</title>
   <style>
      * {
         font-size: 14px;
      }

      @page {
         margin: 20px;
      }
   </style>
</head>

<body>
   <table width="100%">
      <tr>
         <td>
            <div style="width: 40%">
               <img width="200px" style="border-radius: 50%;" src="<?= $logo ?>" />
            </div>
         </td>
         <td>
            <div style="text-align: center">
               <h1 style="
                    text-transform: uppercase;
                    font-weight: bolder;
                    font-size: 30px;
                    margin: 0;
                    ">
                  gyan sagar convent school
               </h1>
               <h4 style="margin: 0">
                  Run by Sada Ram Educational & Charitable Society (Regd.)
                  <br />
                  (Middle Recognised By DOE, NCT of Delhi)
               </h4>
               <p>Address : 516, Rajokri, Opposite Peer Baba, New Delhi-110038</p>
               <p style="margin: 1px">Contact No. +91-9811991570</p>
               <p style="margin: 1px">Email Id :gyansagarconventschool@gmail.com</p>
               <p style="margin: 1px">Website : www.gyansagarconventschool.com</p>
            </div>
         </td>
      </tr>
   </table>
   <table cellpadding="6" width="100%" style="
      border-collapse: separate;
      border-spacing: 0px 2px;
      margin-top: 7px;
      ">
      <tr>
         <th style="border: 2px solid black" colspan="2">
            REPORT CARD (<?= !empty($session_details['session']) ? $session_details['session'] : "-" ?>)
         </th>
      </tr>
   </table>
   <table width="100%" cellpadding="4" style="border-collapse: collapse; margin-top: 5px">
      <tr>
         <th style="
            border: 1px solid black;
            text-align: left;
            border-top: 2px solid black;
            border-left: 2px solid black;
            ">
            STUDENT'S NAME - <?= !empty($student_details['firstname']) ? $student_details['firstname'] : '-' ?>
         </th>
         <th style="
            border: 1px solid black;
            text-align: left;
            border-top: 2px solid black;
            border-right: 2px solid black;
            ">
            ADM. NO. - <?= !empty($student_details['admission_no']) ? $student_details['admission_no'] : '-' ?>
         </th>
      </tr>
      <tr>
         <th style="
            border: 1px solid black;
            text-align: left;
            border-left: 2px solid black;
            ">
            FATHER'S NAME - <?= !empty($student_details['father_name']) ? $student_details['father_name'] : '-' ?>
         </th>
         <th style="
            border: 1px solid black;
            text-align: left;
            border-right: 2px solid black;
            ">
            CLASS & SEC. - <?= !empty($student_details['class']) ? $student_details['class'] : "-" ?> <?= !empty($student_details['section']) ? $student_details['section'] : '-'  ?>
         </th>
      </tr>
      <tr>
         <th style="
            border: 1px solid black;
            text-align: left;
            border-left: 2px solid black;
            border-bottom: 2px solid black;
            ">
            MOTHER'S NAME - <?= !empty($student_details['mother_name']) ? $student_details['mother_name'] : '-' ?>
         </th>
         <th style="
            border: 1px solid black;
            text-align: left;
            border-right: 2px solid black;
            border-bottom: 2px solid black;
            ">
            D.O.B - <?= !empty($student_details['dob']) ? $student_details['dob'] : "-"  ?>
         </th>
      </tr>
   </table>

   <table cellpadding="6" width="100%" style="
      text-align: center;
      border-collapse: collapse;
      margin-top: 5px;
      border: 1px solid black;
      ">
      <tr>
         <th style="
            border: 1px solid black;
            border-top: 2px solid black;
            border-left: 2px solid black;
            " rowspan="3">
            SUBJECT
         </th>
         <th style="border: 1px solid black; border-top: 2px solid black" colspan="3">
            TERM-I
         </th>
         <th style="border: 1px solid black; border-top: 2px solid black" colspan="3">
            TERM-II
         </th>
         <th style="
            border: 1px solid black;
            border-top: 2px solid black;
            border-right: 2px solid black;
            " rowspan="2">
            TOTAL
         </th>
      </tr>
      <tr>
         <th style="border: 1px solid black; ">UT-I</th>
         <th style="border: 1px solid black;">HALF YEARLY</th>
         <th style="border: 1px solid black; ">TERM TOTAL</th>
         <th style="border: 1px solid black; ">UT-II</th>
         <th style="border: 1px solid black; ">FINAL TERM</th>
         <th style="border: 1px solid black; ">TERM TOTAL</th>
      </tr>
      <tr>
         <th style="border: 1px solid black">(10)</th>
         <th style="border: 1px solid black">(40)</th>
         <th style="border: 1px solid black">(50)</th>
         <th style="border: 1px solid black">(10)</th>
         <th style="border: 1px solid black">(40)</th>
         <th style="border: 1px solid black">(50)</th>
         <th style="border: 1px solid black; border-right: 2px solid black">
            (100)
         </th>
      </tr>
      <?php
      foreach ($final_report as $key => $final_report_data) {
         echo "<tr>";
         echo '<td style="border: 1px solid black;text-align: start;border-left: 2px solid black;">' . $key . '</td>';
         foreach ($final_report_data as $key => $value) {
            if (empty($value)) {
               echo '<td style="border: 1px solid black">N/A</td>';
            } else {
               echo '<td style="border: 1px solid black ">' . $value["marks_get"] . '</td>';
            }
         }
         echo "</tr>";
      }
      ?>
     
   </table>
  
   <!-- <table cellpadding="5" width="100%" style="
      text-align: center;
      border-collapse: collapse;
      margin-top: 5px;: 20px;
      border: 1px solid black;
      ">
      <tr>
         <th style="
            border: 1px solid black;
            border-top: 2px solid black;
            border-left: 2px solid black;
            ">
            SUBJECT
         </th>
         <th style="border: 1px solid black; border-top: 2px solid black">
            TERM-I
         </th>
         <th style="
            border: 1px solid black;
            border-top: 2px solid black;
            border-right: 2px solid black;
            ">
            TERM-II
         </th>
      </tr>
      <tr>
         <td style="border: 1px solid black; border-left: 2px solid black">
            DRAWING
         </td>
         <td style="border: 1px solid black"><?= !empty($result[7]['get_marks']) ? $result[7]['get_marks'] + $result[16]['get_marks'] : "-" ?></td>
         <td style="border: 1px solid black; border-right: 2px solid black"><?= !empty($result[25]['get_marks']) ? $result[25]['get_marks'] + $result[34]['get_marks'] : "-" ?></td>
      </tr>
      <tr>
         <td style="
            border: 1px solid black;
            border-left: 2px solid black;
            border-bottom: 2px solid black;
            ">
            G.K.
         </td>
         <td style="border: 1px solid black; border-bottom: 2px solid black"><?= !empty($result[8]['get_marks']) ? $result[8]['get_marks'] + $result[17]['get_marks'] : "-" ?></td>
         <td style="
            border: 1px solid black;
            border-right: 2px solid black;
            border-bottom: 2px solid black;
            ">
            <?= !empty($result[26]['get_marks']) ? $result[26]['get_marks'] + $result[35]['get_marks'] : "-" ?></td>
      </tr>
   </table> -->
 
   <table cellpadding="5" width="100%" style="
      text-align: center;
      border-collapse: collapse;
      margin-top: 5px;: 20px;
      border: 1px solid black;
      ">
      <tr>
         <th style="
            border: 1px solid black;
            border-top: 2px solid black;
            border-left: 2px solid black;
            ">
            TOTAL NO. OF WORKING DAYS
         </th>
         <th style="
            border: 1px solid black;
            border-top: 2px solid black;
            border-right: 2px solid black;
            ">
            ATTENDANCE OF THE STUDENT
         </th>
      </tr>
      <tr>
         <td style="
            border: 1px solid black;
            border-left: 2px solid black;
            border-bottom: 2px solid black;
            ">
            <?= $total_attendence ?>
         </td>
         <td style="
            border: 1px solid black;
            border-right: 2px solid black;
            border-bottom: 2px solid black;
            ">
            <?= $attend_attendence ?>
         </td>
      </tr>
   </table>

   <table cellpadding="5" width="100%" style="
      text-align: center;
      border-collapse: collapse;
      margin-top: 5px;: 20px;
      border: 1px solid black;
      ">
      <tr>
         <th colspan="3" style="
            border-top: 2px solid black;
            border-left: 2px solid black;
            border-right: 2px solid black;
            ">
            RESULT
         </th>
      </tr>
      <tr>
         <th style="border: 1px solid black; border-left: 2px solid black">
            M. MARKS
         </th>
         <th style="border: 1px solid black">MARKS OBTAINED</th>
         <th style="border: 1px solid black; border-right: 2px solid black">
            MARKS %
         </th>
      </tr>
      <tr>
         <td style="
            border: 1px solid black;
            border-left: 2px solid black;
            border-bottom: 2px solid black;
            ">
            <?= count($final_report) * 100 ?>
         </td>
         <td style="border: 1px solid black; border-bottom: 2px solid black">
           34
         </td>
         <td style="
            border: 1px solid black;
            border-right: 2px solid black;
            border-bottom: 2px solid black;
            ">
            <?php 
               $count_total_subj = count($final_report) * 100;
            $average =  ($total_sum / $count_total_subj)  * 100;
            echo $average; ?>
         </td>
      </tr>
   </table>

   <table cellpadding="5" width="100%" style="
      text-align: center;
      border-collapse: collapse;
      margin-top: 5px;: 20px;
      border: 1px solid black;
      ">
      <tr>
         <th style="
            border: 1px solid black;
            width: 40px;
            border: 2px solid black;
            border-right: 1px solid black;
            ">
            RMARKS
         </th>
         <th style="
            border-right: 2px solid black;
            border-top: 2px solid black;
            border-bottom: 2px solid black;
            ">
         <?= $report_card_remarks_details['remarks'] ?>   
         </th>
      </tr>
   </table>

   <table cellpadding="5" width="100%" style="text-align: center;border-collapse: collapse;margin-top:150px;">
      <tr>
         <th style="
         width:33%;
         padding-right:20px;
         ">
            <div style="
         border-top:1px solid black;
         ">
               DATE
            </div>
         </th>
         <th style="
         width:33%;
         padding-right:20px;
         ">
            <div style="
         border-top:1px solid black;
         ">
               CLASS TEACHER
            </div>
         </th>
         <th style="
         width:33%;
         padding-right:20px;
         ">
            <div style="
         border-top:1px solid black;
         ">
               PRINCIPAL
            </div>
         </th>
      </tr>
   </table>
</body>

</html>