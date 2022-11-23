<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Leaving Certificate</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
    <style>
 

page {
    background: white;
    display: block;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: center;  
    margin-right: 1%; 
}

page>.border {
    border-style: dashed;
    border-spacing: 2px;
    border-width: 1px;
    /* height: 100%; */
    width: 90%;
    border-color: black;
}

p {
    margin: 0;
}

page[size="A4"] {  
    width: 21cm;
    /* height: 29.7cm; */
}

table {
    width: 100%;
}

.issue-date {
    text-align: right;
}

.school-details {
    text-align: center;
}

h4 {
    margin: 0;
}

h2 {
    margin: 0;
}

a {
    text-decoration: none;
    color: black;
}

.student-image {
   text-align: right;
}

.form-title {   
    padding-top: 40px;
    padding-bottom: 40px;
    width: 100%;
    text-align: center;
    text-decoration: underline;
    font-weight: bold;
}

.admission-no {
    /* text-decoration: underline; */
    border-bottom: 1px solid;
    margin-right:10px;
}

.udise-number{
    margin-left:20px;
    text-align: right;
}

.udise-id {
    /* text-decoration: underline; */
    border-bottom: 1px solid;
    margin-right:100px;
}

.student-name {
    /* text-decoration: underline; */
    font-weight: bold;
    border-bottom: 1px solid;
    text-align: left;
}

.student-result {
    font-weight: bold;
    border-bottom: 1px solid;
    text-align: left;
    margin-right:20px;
}

.promoted_to {
    text-align: right;
    margin-left:100px;
}

.promoted_result{
    font-weight: bold;
    border-bottom: 1px solid;
    text-align: left;
    margin-right:80px;
}

.name-header {
    margin: 0;
    padding: 0;
    text-align: left;
}

.signature {
    margin-top: 40px;
}

.btm-brdr { 
    border-top: 2px solid;
    border-top-color: rgba(0, 0, 0, 0.158);
    border-top-style: dashed;
    margin-top: 4px;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 4px;
}

.notes {
    padding-top: 15px;
    text-align: center;
}

.tbl1 tr {
    line-height: 21px;
}
.sign_image{
    height:50px;
    width:50px;
}
</style>
</head>
<body>
    <?php 
        
        $student_image='';
        if($student_data->image!=''){
            $path = $student_data->image;
            $type = pathinfo($path, PATHINFO_EXTENSION);
            $data = file_get_contents($path);
            $student_image = 'data:image/' . $type . ';base64,' . base64_encode($data);
        }
        
        $school_logo1="";
        if($school_logo!=''){
            $path2 = $school_logo;
            $type2 = pathinfo($path2, PATHINFO_EXTENSION);
            $data2 = file_get_contents($path2);
            $school_logo1 = 'data:image/' . $type2 . ';base64,' . base64_encode($data2);
        } 

        $prepared_by_sign='';
        if($student_leaving->prepared_by!=''){
            $prepared_by_path = base_url()."/uploads/prepared_by_sign/".$student_leaving->prepared_by;
            $prepared_by_type = pathinfo($prepared_by_path, PATHINFO_EXTENSION);
            $prepared_by_data = file_get_contents($prepared_by_path);
            $prepared_by_sign = 'data:image/' . $prepared_by_type . ';base64,' . base64_encode($prepared_by_data);
        }
        $checked_by_sign='';
        if($student_leaving->checked_by!=''){
            $checked_by_path = base_url()."/uploads/checked_by_sign/".$student_leaving->checked_by;
            $checked_by_type = pathinfo($checked_by_path, PATHINFO_EXTENSION);
            $checked_by_data = file_get_contents($checked_by_path);
            $checked_by_sign = 'data:image/' . $checked_by_type . ';base64,' . base64_encode($checked_by_data);
        }
        $counter_sign='';
        if($student_leaving->counter_sign!=''){
            $counter_sign_path = base_url()."/uploads/counter_sign/".$student_leaving->counter_sign;
            $counter_sign_type = pathinfo($counter_sign_path, PATHINFO_EXTENSION);
            $counter_sign_data = file_get_contents($counter_sign_path);
            $counter_sign = 'data:image/' . $counter_sign_type . ';base64,' . base64_encode($counter_sign_data);
        }
        $principal_sign='';
        if($student_leaving->principal!=''){
            $principal_path = base_url()."/uploads/principal_sign/".$student_leaving->principal;
            $principal_type = pathinfo($principal_path, PATHINFO_EXTENSION);
            $principal_data = file_get_contents($principal_path);
            $principal_sign = 'data:image/' . $principal_type . ';base64,' . base64_encode($principal_data);
        }

        $dob = date('d-m-Y',strtotime($student_data->dob));
        $dob_array = explode('-',$dob);
        $day = convert_number($dob_array[0]);
        $month = date_format(date_create($student_data->dob),"M");
        $Year = convert_number($dob_array[2]);
        $dob_in_word = $day." ".$month." ".$Year;
       
    ?>
    <page size="A4">
        <div class="border">
            <table>
                <tr>
                    <td class="file-no">
                        <p>File No.: <?php echo $student_leaving->file_no; ?></p>
                    </td>
                    <td></td>
                    <td class="issue-date">Issue Date: <?php echo date('d-M-Y'); ?></td>
                </tr>
                <tr>
                    <td class="school-code">
                        <p>School Code: <?php echo $school->dise_code; ?></p>
                    </td>
                </tr>
                <tr>
                    <td class="logo">
                        <img src="<?php echo $school_logo1; ?>" style="height:80Px; width:80px;" alt="School Logo">
                    </td>
                    <td class="school-details">
                        <h2><?php echo  $school->name; ?></h2>
                        <h4>(RECOGNISED)</h4>
                        <p><?php echo $school->address; ?></p>
                        <p>Ph - <a href="tel: +<?php echo $school->phone; ?>">+91 <?php echo $school->phone; ?></a></p>
                        <p>Email: <a href="mailto: <?php echo $school->email; ?>"><?php echo $school->email; ?></a></p>
                        <p>Website: <a href="www.gyansagarconventschool.com">www.gyansagarconventschool.com</a></p>
                    </td>
                    <td class="student-image">
                        <img src="<?php echo $student_image; ?>" style="height:80Px; width:80px;" alt="student-img">
                    </td>
                </tr>
            </table>
            <table>
                <tr style="width: 100%;">
                    <td class="form-title">
                        <h2>SCHOOL LEAVING CERTIFICATE</h2>
                    </td>
                </tr>
            </table>
            <table class="tbl1">
                <tr>
                    <td>
                        <p>1. Admission No.:</p>
                    </td>
                    <td>
                        <p class="admission-no"><?php echo $student_data->admission_no; ?></p>
                    </td>
                    <td>
                        <p class="udise-number">Student's UDISE ID:</p>
                    </td>
                    <td>
                        <p class="udise-id"><?php echo $student_leaving->udise_no; ?></p>
                    </td>
                </tr>
            </table>
            <table class="tbl1">
                <tr>
                    <td style="width: 24%">
                        <p class="name-header">2. Name of the Student:</p>
                    </td>
                    <td>
                        <p class="student-name"><?php echo $student_data->firstname." ".$student_data->middlename."".$student_data->lastname; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>3. Mother's Name:</p>
                    </td>
                    <td>
                        <p class="student-name"><?php echo $student_data->mother_name; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>4. Father's Name:</td>
                    <td>
                        <p class="student-name"><?php echo  $student_data->father_name; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>5. Nationality:</td>
                    <td>
                        <p class="student-name"><?php echo $student_data->nationality; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>6. Date of Birth (in figures):</td>
                    <td>
                        <p class="student-name"><?php echo $dob; ?></p>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">(in words):</td>
                    <td>
                        <p class="student-name"><?php echo $dob_in_word; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>7. Date of Admission</td>
                    <td>
                        <p class="student-name"><?php echo $student_data->admission_date; ?> in <?php echo $student_data->class; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>8. Date of Withdrawal</td>
                    <td>
                        <p class="student-name"><?php echo  date('d-m-Y',strtotime($student_leaving->withdrawl)); ?></p>
                    </td>
                </tr>
                <tr>
                    <td>9. Class in which studying/studied</td>
                    <td>
                        <p class="student-name"><?php echo $student_data->class; ?></p>
                    </td>
                </tr>
            </table>
            <table class="tbl1">
                <tr>    
                    <td>10. Result:</td>
                    <td>
                        <p class="student-result"><?php echo ($student_leaving->result=='1')?"Pass":"Fail"; ?></p>
                    </td>
                    <td class="promoted_to">Promoted to:</td>
                    <td>
                        <p class ="promoted_result"><?php echo $student_leaving->promoted_to;?></p>
                    </td>
                </tr>
            </table>
            <table style="width: 100%;" class="tbl1">
                <tr>
                    <td style="text-align: right; width: 24%;">Failed in:</td>
                    <td style="width: 76%">
                        <p class="student-name">----</p>
                    </td>
                </tr>
                <tr>
                    <td>11. Reason for leaving the &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; school:</td>
                    <td>
                        <p class="student-name"><?php echo $student_leaving->reason_for_leaving; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>12. School Dues paid up to:</td>
                    <td>
                        <p class="student-name"><?php echo $school_due; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>13. Total Attendance:</td>
                    <td>
                        <p class="student-name"><?php echo $attendence; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>14. Conduct:</td>
                    <td>
                        <p class="student-name"><?php echo $student_leaving->conduct; ?></p>
                    </td>
                </tr>
                <tr>
                    <td>15. Remarks:</td>
                    <td>
                        <p class="student-name"><?php echo $student_leaving->remark; ?></p>
                    </td>
                </tr>
            </table>
            <table class="signature">
                <tr>
                    <td style="text-align: center;"><img src="<?php echo $prepared_by_sign; ?>" class="sign_image"></td>
                    <td style="text-align: center;"><img src="<?php echo $checked_by_sign; ?>" class="sign_image"></td>
                    <td style="text-align: center;"><img src="<?php echo $counter_sign; ?>" class="sign_image"></td>
                    <td style="text-align: center;"><img src="<?php echo $principal_sign; ?>" class="sign_image"></td>
                </tr>
                <tr>
                    <td style="text-align: center;"><strong> Prepared By</strong></td>
                    <td style="text-align: center;"><strong>Checked By</strong></td>
                    <td style="text-align: center;"><strong>Counter Sign</strong></td>
                    <td style="text-align: center;"><strong>Principal</strong></td>
                </tr>
            </table>
            <table style="margin-bottom:10px;">
                <tr>
                    <td class="btm-brdr"></td>
                </tr>
                <tr>
                    <td class="notes"><strong>Note:</strong> 1. <strong>Certified that the above information is in accordance with the school records.</strong></td>
                </tr>
                <tr>
                    <td style="text-align: center;">2. <strong>No change in entry is to be made except by the authority issueing the certificate.</strong></td>
                </tr>
            </table>
        </div>
    </page>
</body>
</html>