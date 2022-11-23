<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fee Certificate</title>
</head>
<style>   

    page {
        background: white;
        display: block;
        margin: 0 auto;
        /* margin-bottom: 0.5cm; */
        /* box-shadow: 0 0 0.5cm rgba(0,0,0,0.5); */
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
    padding: 10px;
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

    .cert-title {
        padding: 100px 0;
        text-align: center;
        font-size: xx-large;
        font-weight: bold;
        text-decoration: underline;
    }

    .cert-content {
        text-align: justify;
        font-size: large;
        line-height: 30px;
    }

    .cert-signature {
        text-align: right;
        padding-top: 200px;
    }
</style>
<body>      
    
    <?php    
        $student_image='';
        if($student_data->image!=''){
            $path = $student_data->image;
            $type = pathinfo($path, PATHINFO_EXTENSION);
            $data = file_get_contents($path);
            $student_image = 'data:image/' . $type . ';base64,' . base64_encode($data);
        }
        
        $school_logo="";
        if($resultlist['school_logo']!=''){
            $path2 = $resultlist['school_logo'];
            $type2 = pathinfo($path2, PATHINFO_EXTENSION);
            $data2 = file_get_contents($path2);
            $school_logo = 'data:image/' . $type2 . ';base64,' . base64_encode($data2);
        }     
    ?>
    <page size="A4">
        <div class="border">
            <table>
                <tr>
                    <td class="logo">
                        <img src="<?php echo $school_logo; ?>" style="height:100Px; width:100px;" alt="School Logo">
                    </td>
                    <td class="school-details">
                        <h2>GYAN SAGAR CONVENT SCHOOL</h2>
                        <h4>(RECOGNISED)</h4>
                        <p>516, Rajkori, Opp. Peer Baba, New Delhi 110038</p>
                        <p>Ph - <a href="tel: +919811991570">+91 98119 91570</a></p>
                        <p>Email: <a href="mailto: gyansagarconventschool@gmail.com">gyansagarconventschool@gmail.com</a></p>
                        <p>Website: <a href="www.gyansagarconventschool.com">www.gyansagarconventschool.com</a></p>
                    </td>
                    <td class="student-image">
                        <img src="<?php echo $student_image ?>" style="height:80Px; width:80px;" alt="student-img">
                    </td>   
                </tr>
            </table>
            <table>
                <tr>
                    <td>School Code.: 1720184</td>
                    <td class="cert-date">Date: <?php echo date('d-M-Y'); ?></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="cert-title">FEE CERTIFICATE</td>
                </tr>   
                <tr>
                    <td class="cert-content">
                        <p>This is to certify that <u><?php echo $student_data->firstname." ".$student_data->middlename." ".$student_data->lastname; ?></u> S/O / D/O <u><?php echo $student_data->father_name; ?></u> and <u><?php echo $student_data->mother_name; ?></u> R/O
                        <u><?php echo $student_data->current_address; ?>H. NO. 108, VPO RAJOKRI, GALI NO. 4, NEAR GYAN SAGAR CONVENT SCHOOL, N. DELHI-38</u>
                        is a bonafide student of Class: <u><?php echo $student_data->class; ?></u>, section <u><?php $student_data->section ?></u> bearing (Admission No.: <?php echo $student_data->admission_no; ?>) of this school. He/she has paid
                        Tuition Fees from <u><?php echo $resultlist['session_start_month']; ?></u> to <u><?php echo $resultlist['session_end_month']; ?></u>@ Rs. <u><?php echo $resultlist['per_month']; ?></u> p.m. He/She has paid Total Tuition Fee of Rs. <u><?php echo $resultlist['Paid_Amt']; ?></u>
                        for the Academic Session <u><?php $current_session ?><?php echo $resultlist['current_session']; ?></u>.</p>
                    </td>
                </tr>
                <tr>
                    <td class="cert-signature">
                        <strong>Principal/Manager</strong>
                    </td>
                </tr>
            </table>
        </div>
    </page>
</body>
</html>