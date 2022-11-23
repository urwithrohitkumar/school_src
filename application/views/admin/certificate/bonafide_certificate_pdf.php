<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bonafide</title>
    <style>
        /* body {
            background: rgb(204,204,204);
        } */

        page {
            background: white;
            display: block;
            margin: 0 auto;
            /* margin-bottom: 0.5cm;
            box-shadow: 0 0 0.5cm rgba(0,0,0,0.5); */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        page>.border {
        border-style: dashed;
        border-spacing: 2px;
        border-width: 1px;
        height: 100%;
        width: 90%;
        border-color: black;
        }

        page[size="A4"] {  
            width: 20cm;
            height: 26.7cm;
        }

        table {
            width: 100%;
        }

        p {
            margin: 0;
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

        .cert-date {
            text-align: right;
        }

        .cert-name {
            text-decoration: underline;
            font-weight: bold;
            text-align: center;
        }

        .cert-content {
            line-height: 40px;
            text-align: justify;
            font-size: large;
            padding:10px;
        }

        .signature {
            padding-top: 200px;
            text-align: right;
            padding:20px;
        }
    </style>
</head>
<body>

<?php 
   
    $dob = date('d-m-Y',strtotime($student_data->dob));
   
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
    $dob_array = explode('-',$dob);
    $day = convert_number($dob_array[0]);
    $month = date_format(date_create($student_data->dob),"M");
    $Year = convert_number($dob_array[2]);
    $dob_in_word = $day." ".$month." ".$Year;
   
    $session_array = explode('-',$current_session);
    $current_year = $session_array[0];
    $next_year = '20'.$session_array[1];
    
?>
    <page size="A4">
        <div class="border">
            <table>
                <tr>
                    <td class="logo">
                        <img src="<?php echo $school_logo1; ?>" style="height:80Px; width:80px;" alt="School Logo">
                    </td>
                    <td class="school-details">
                        <h2><?php echo $school->name; ?></h2>
                        <h4>(RECOGNISED)</h4>
                        <p><?php echo $school->address; ?></p>
                        <p><?php echo $school->phone; ?>Ph - <a href="tel: +91<?= $school->phone; ?>">+91 98119 91570</a></p>
                        <p><?php echo $school->email; ?>Email: <a href="mailto: <?= $school->email; ?>">gyansagarconventschool@gmail.com</a></p>
                        <p><?php // $school-website; ?>Website: <a href="www.gyansagarconventschool.com">www.gyansagarconventschool.com</a></p>
                        <p>School Code: <?php echo $school->dise_code; ?></p>
                    </td>
                    <td class="student-image">
                        <img src="<?= $student_image; ?>"  style="height:80Px; width:80px;" alt="student-img">
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>Admission No.: <?php echo $student_data->admission_no; ?></td>
                    <td class="cert-date">Date: <?php echo date('d-M-Y'); ?></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="cert-name"><h1>BONAFIDE CERTIFICATE</h1></td>
                </tr>
                <tr>
                    <td class="cert-content">
                        <p>This is to certify that Master/Miss <u><?php echo $student_data->firstname ." ".$student_data->middlename ." ".$student_data->lastname; ?></u> S/O / D/O <u><?php echo $student_data->father_name; ?> and <?php echo $student_data->mother_name; ?></u> Class <u><?php $student_data->class; ?></u>  Section <u><?php $student_data->section; ?> </u> Resident of <u><?php  echo $student_data->permanent_address; ?></u> is a bonafide student of this school since <u><?php echo $student_data->admission_date; ?></u>. His/her date of birth as per the school records is  (in figures) <u><?php echo $dob; ?></u> (in words) <u><?php echo $dob_in_word; ?></u>. The academic session of the school is from  April <u><?php echo $current_year ?></u> to March <u><?php echo $next_year ?></u>.</p>
                    </td>
                </tr>
                <tr>
                    <td class="signature"><strong>Principal</strong></td>
                </tr>
            </table>
        </div>
    </page>
</body>
</html>