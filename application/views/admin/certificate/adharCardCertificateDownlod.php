<?php
$student_data = $student_data[0];
if (!empty($student_aadhar_data)) {
    $student_aadhar_data = $student_aadhar_data[0];
    $date = date('d', strtotime($student_aadhar_data->enterdate));
    $month = date('m', strtotime($student_aadhar_data->enterdate));
    $Year = date('Y', strtotime($student_aadhar_data->enterdate));
    $fdate = substr($date, 0, 1);
    $ldate = substr($date, 1, 2);
    $fmonth = substr($month, 0, 1);
    $lmonth = substr($month, 1, 2);
    $fyear = substr($Year, 0, 1);
    $syear = substr($Year, 1, 1);
    $tyear = substr($Year, 2, 1);
    $fryear = substr($Year, 3, 1);
}
if (!empty($student_aadhar_data->thumb_image)) {
    $studentAdharCardThumbImgpath =   'https://thewingshield.com/school_src/uploads/aadhar_card/student_sign/' . ($student_aadhar_data->thumb_image);
    $type = pathinfo($studentAdharCardThumbImgpath, PATHINFO_EXTENSION);
    $data = file_get_contents($studentAdharCardThumbImgpath);
    $studentAdharCardThumbImg = 'data:image/' . $type . ';base64,' . base64_encode($data);

}
if (!empty($student_aadhar_data->stamp_img)) {
    $AdharCardStampImgPath ='https://thewingshield.com/school_src/uploads/aadhar_card/certifier_sign/' . ($student_aadhar_data->stamp_img);
    $type = pathinfo($AdharCardStampImgPath, PATHINFO_EXTENSION);
    $data = file_get_contents($AdharCardStampImgPath);
    $AdharCardStampImg = 'data:image/' . $type . ';base64,' . base64_encode($data);
}
if (!empty($student_aadhar_data->student_img)) {
    $AdharCardStudImgPath ='https://thewingshield.com/school_src/uploads/aadhar_card/student_img/' . ($student_aadhar_data->student_img);
    $type = pathinfo($AdharCardStudImgPath, PATHINFO_EXTENSION);
    $data = file_get_contents($AdharCardStudImgPath);
    $AdharCardStudImg = 'data:image/' . $type . ';base64,' . base64_encode($data);
}
$dobdate = date('d', strtotime($student_data->dob));
$dobmonth = date('m', strtotime($student_data->dob));
$dobYear = date('Y', strtotime($student_data->dob));
$fdobdate = substr($dobdate, 0, 1);
$ldobdate = substr($dobdate, 1, 2);
$fdobmonth = substr($dobmonth, 0, 1);
$ldobmonth = substr($dobmonth, 1, 2);
$fdobyear = substr($dobYear, 0, 1);
$sdobyear = substr($dobYear, 1, 1);
$tdobyear = substr($dobYear, 2, 1);
$frtdobyear = substr($dobYear, 3, 1);
$array = [];
if (!empty($student_data->adhar_no)) {
    $array  = array_map('intval', str_split($student_data->adhar_no));
}
?>

<head>
    <style type="text/css">
        body,
        div,
        table,
        thead,
        tbody,
        tfoot,
        tr,
        th,
        td,
        p {
            font-family: "Calibri";
            font-size: x-small
        }

        a.comment-indicator:hover+comment {
            background: #ffd;
            position: absolute;
            display: block;
            border: 1px solid black;
            padding: 0.5em;
        }

        a.comment-indicator {
            background: red;
            display: inline-block;
            border: 1px solid black;
            width: 0.5em;
            height: 0.5em;
        }

        comment {
            display: none;
        }
    </style>
</head>

<body>
    <table cellspacing="0" border="0">
        <colgroup span="26" width="31"></colgroup>
        <tr>
            <td colspan=26 height="25" align="center" valign=middle bgcolor="#808080"><b>
                    <font size=4 color="#FFFFFF">CERTIFICATE FOR AADHAAR ENROLMENT / UPDATE</font>
                </b></td>
        </tr>
        <tr>
            <td colspan=12 height="20" align="left" valign=middle>
                <font color="#000000">Instructions : All details to be filled in BLOCK LETTERS</font>
            </td>
            <td colspan=14 align="right" valign=middle>
                <font color="#000000">(To be valid for 3 months from date of issue)</font>
            </td>
        </tr>
        <tr>
            <td colspan=5 height="20" align="left" valign=middle>
                <font size=1 color="#000000">To be printed on plain A4 paper size ;</font>
            </td>
            <td colspan=6 align="left" valign=middle>
                <font size=1 color="#000000">Not required to print on letter head;</font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px solid #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($fdate) ? $fdate : '0'; ?></font>
            </td>
            <td style="border-right: 1px solid #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($ldate) ? $ldate : '0'; ?></font>
            </td>
            <td align="center" valign=middle>
                <font color="#000000"><br></font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px solid #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($fmonth) ? $fmonth : '0'; ?></font>
            </td>
            <td style="border-right: 1px solid #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($lmonth) ? $lmonth : '0'; ?></font>
            </td>
            <td align="center" valign=middle>
                <font color="#000000"><br></font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px solid #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($fyear) ? $fyear : '0'; ?></font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($syear) ? $syear : '0'; ?></font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($tyear) ? $tyear : '0'; ?></font>
            </td>
            <td style="border-right: 1px solid #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($fryear) ? $fryear : '0'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=26>
            </td>
        </tr>
        <tr>
            <td colspan=26 height="21" align="center" valign=middle bgcolor="#808080"><b>
                    <font size=3 color="#FFFFFF">Resident\'s Details</font>
                </b></td>
        </tr>
        <tr>
            <td height="11" colspan=26>
            </td>
        </tr>
        <tr>
            <td colspan=2>
            </td>
            <td align="center" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->resident) ? 'checked' : ''; ?>>
            </td>
            <td colspan=3 align="left" valign=middle>
                <font size=1 color="#000000">Resident </font>
            </td>
            <td align="center" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->nri) ? 'checked' : ''; ?>>
            </td>
            <td colspan=5 align="left" valign=middle>
                <font size=1 color="#000000">Non-Resident Indian (NRI)</font>
            </td>
            <td align="center" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->newenrolmment) ? 'checked' : ''; ?>>
            </td>
            <td colspan=4 align="left" valign=middle>
                <font size=1 color="#000000">New Enrolment</font>
            </td>
            <td align="center" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->updaterequest) ? 'checked' : ''; ?>>
            </td>
            <td colspan=6 align="left" valign=middle>
                <font size=1 color="#000000">Update Request</font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Aadhaar Number:</font>
            </td>
            <?php foreach ($array as $adaharcardvalue) {
                echo '<td width="20" style="border: 1px dotted;" align="center" valign=middle>' . $adaharcardvalue . '</td>';
            } ?>
        </tr>
        <tr>
            <td height="16" colspan=26 align="left" valign=middle>
                <font size=1 color="#000000">(For update only)</font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Full Name:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= $student_data->firstname ?> <?= $student_data->middlename ?> <?= $student_data->lastname ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">C/o:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= $student_data->guardian_name ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">H.No./Bldg./Apt.:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->house_no) ? $student_aadhar_data->house_no : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Street/Road/Lane: </font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->street) ? $student_aadhar_data->street : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Landmark:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->landmark) ? $student_aadhar_data->landmark : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Area/Locality/Sector:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->area) ? $student_aadhar_data->area : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Village/Town/City:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_data->city) ? $student_data->city : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Post Office:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=15 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->post_office) ? $student_aadhar_data->post_office : '-'; ?></font>
            </td>
            <td colspan=9 rowspan=9 align="left" valign=bottom <?php if(empty($AdharCardStudImg))  { ?> style="border:1px solid #000000;" <?php } ?>  >
                <?php if (!empty($AdharCardStudImg)) { ?>
                    <img src="<?= $AdharCardStudImg ?>" alt=""   border=2 width=100 height=150>
                <?php } ?>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">District:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=10 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->district) ? $student_aadhar_data->district : '-'; ?></font>
            </td>
            <td colspan=5 rowspan=7 align="center" valign=bottom  <?php if(empty($studentAdharCardThumbImg))  { ?> style="border:1px solid #000000;" <?php } ?>  >
                <?php if (!empty($studentAdharCardThumbImg)) { ?>
                    <img src="<?= $studentAdharCardThumbImg ?>" border=2 alt="" width=100 height=150>
                <?php } else { ?>
                    <font size=1 color="#000000">Signature of the Resident/Thumb/Finger Impression</font>
                <?php } ?>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
                <font color="#000000"><br></font>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">State:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=10 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_data->state) ? $student_data->state : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Pin Code:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=10 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_data->pincode) ? $student_data->pincode : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Date of Birth:</font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px solid #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($fdobdate) ? $fdobdate : '0'; ?></font>
            </td>
            <td style="border-right: 1px solid #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($ldobdate) ? $ldobdate : '0'; ?></font>
            </td>
            <td align="center" valign=middle>
                <font color="#000000"><br></font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px solid #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($fdobmonth) ? $fdobmonth : '0'; ?></font>
            </td>
            <td style="border-right: 1px solid #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($ldobmonth) ? $ldobmonth : '0'; ?></font>
            </td>
            <td align="center" valign=middle>
                <font color="#000000"><br></font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px solid #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($fdobyear) ? $fdobyear : '0'; ?></font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($sdobyear) ? $sdobyear : '0'; ?></font>
            </td>
            <td style="border-right: 1px dotted #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($tdobyear) ? $tdobyear : '0'; ?></font>
            </td>
            <td style="border-right: 1px solid #000000; border-left: 1px dotted #000000; border-top: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <font color="#000000"><?= !empty($frtdobyear) ? $frtdobyear : '0'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td colspan=26 height="21" align="center" valign=middle bgcolor="#808080"><b>
                    <font size=3 color="#FFFFFF">Certifier\'s Details (To be filled by the certifier only)</font>
                </b></td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Name of the Certifier:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->certifier_name) ? $student_aadhar_data->certifier_name : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Designation</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->certifier_designation) ? $student_aadhar_data->certifier_designation : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Office Address:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->certifier_office_add) ? $student_aadhar_data->certifier_office_add : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=2 align="left" valign=middle>
                <font color="#000000">Contact Number:</font>
            </td>
            <td style="border: 1px dotted #000000;" colspan=24 align="left" valign=middle>
                <font color="#000000"><?= !empty($student_aadhar_data->cerifier_contact) ? $student_aadhar_data->cerifier_contact : '-'; ?></font>
            </td>
        </tr>
        <tr>
            <td height="11" colspan=26 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td height="20" colspan=9 align="left" valign=middle>
                <font color="#000000">I hereby certify above mentioned details of the resident and I am a&hellip;. (Tick
                    appropriate box below)</font>
            </td>
            <td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=17 align="center" valign=middle><b>
                    <font color="#000000">Checklist for Certifier</font>
                </b></td>
        </tr>

        <tr>
            <td colspan=9 align="center" valign=middle>
            </td>
            <td style="border-left: 1px solid #000000;" align="center" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->overwriting) ? 'checked' : ''; ?>>
            </td>
            <td colspan=3 align="left" valign=middle>
                <font size=1 color="#000000">No overwriting</font>
            </td>
            <td align="center" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->issue_date) ? 'checked' : ''; ?>>
            </td>
            <td colspan=3 align="left" valign=middle>
                <font size=1 color="#000000">Issue date is filled</font>
            </td>
            <td align="center" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->resident_sign) ? 'checked' : ''; ?>>
            </td>
            <td colspan=8 style="border-right: 1px solid #000000" align="left" valign=middle>
                <font size=1 color="#000000">Resident\'s Signature</font>
            </td>
        </tr>
        <tr>
            <td align="left" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->gajet_officer_group_A) ? 'checked' : ''; ?>>
            </td>
            <td colspan=8 align="left" valign=middle>
                <font color="#000000">Gazetted Officer - Group -A</font>
            </td>
            <td style="border-left: 1px solid #000000;" align="center" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->certifier_details) ? 'checked' : ''; ?>>
            </td>
            <td colspan=16 style="border-right: 1px solid #000000;" align="left" valign=middle>
                <font size=1 color="#000000">Certifier\'s details</font>
            </td>
        </tr>
        <tr>
            <td width=20 height="20" align="left" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->village_panchayat) ? 'checked' : ''; ?>>
            </td>
            <td colspan=8 align="left" valign=middle>
                <font color="#000000">Village Panchayat Head or Mukhiya</font>
            </td>
            <td style="border-left: 1px solid #000000;border-bottom: 1px solid #000000;" align="center" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->cross_stamp) ? 'checked' : ''; ?>>
            </td>
            <td colspan=16 style="border-right: 1px solid #000000;" align="left" valign=middle>
                <font size=1 color="#000000">Resident\'s Photo is cross signed and cross stamped</font>
            </td>
        </tr>
        <tr>
            <td height="20" align="left" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->gajet_officer_group_B) ? 'checked' : ''; ?>>
            </td>
            <td colspan=9 align="left" valign=middle>
                <font color="#000000">Gazetted Officer - Group B</font>
            </td>
            <td style="border-top: 1px solid #000000;" colspan=16 align="left" valign=middle>
            </td>
        </tr>
        <tr>
            <td colspan=9 align="center" valign=bottom>
            </td>
            <td colspan=17 rowspan=6 align="center" valign=bottom <?php if(empty($AdharCardStampImg)) { ?> style="border:1px solid #0000;" <?php } ?>>
                <?php if (!empty($AdharCardStampImg)) { ?>
                    <img src="<?= $AdharCardStampImg ?>" alt="" border=2 width="200" height="200">
                <?php } else { ?>
                    <font size=1 color="#000000">Signature &amp; Stamp of the Certifier</font>
                <?php } ?>
            </td>
        </tr>
        <tr>
            <td height="20" align="left" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->councilor) ? 'checked' : ''; ?>>
            </td>
            <td align="left" valign=middle>
                <font color="#000000">MP/MLA/MLC/Municipal Councilor</font>
            </td>
        </tr>
        <tr>
            <td height="20" align="left" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->tehsildar) ? 'checked' : ''; ?>>
            </td>
            <td align="left" valign=middle>
                <font color="#000000">Tehsildar</font>
            </td>
        </tr>
        <tr>
            <td height="20" align="left" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->hrei) ? 'checked' : ''; ?>>
            </td>
            <td align="left" colspan=8 valign=middle>
                <font color="#000000">Head of Recognised Educational Institution</font>
            </td>
        </tr>
        <tr>
            <td height="20" align="left" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->swmho) ? 'checked' : ''; ?>>
            </td>
            <td align="left" colspan=8 valign=middle>
                <font color="#000000">Superintendent/Warden/Matron/Head of Institution of Recognised shelter homes/Orphanges</font>
            </td>
        </tr>
        <tr>
            <td height="20" align="left" valign=middle>
                <input type="checkbox" <?= !empty($student_aadhar_data->epfo) ? 'checked' : ''; ?>>
            </td>
            <td align="left" valign=middle>
                <font color="#000000">EPFO Officer</font>
            </td>
        </tr>
        <tr>
            <td colspan=26 align="left" valign=middle>
                <font color="#000000"><br></font>
            </td>
        </tr>




        <tr>
            <td colspan="26" height="20" align="left" valign=middle>
                <font size=1 color="#000000"><b>NOTE</b>: This format is applicable for POI documents at Sl. Nos. 17,
                    20, 21,
                    22, 31 &amp; 32; POA documents at Sl. Nos. 23, 24, 37, 38, 44 &amp; 45; POR documents at Sl. Nos. 13
                    &amp; 14 DOB documents at Sl. Nos. 4, 5, 14 &amp; 15 of Schedule II of the
                    Aadhaar (Enrolment and Update) Regulations, 2016, as amended from time to time.
                </font>
            </td>
        </tr>
    </table>
</body>