
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Leaving Certificate</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
    <style>

    </style>
</head>
<body style="background-color: rgb(204,204,204);">
    <div class="page" style="background-color: white;display: block; margin-top: 0; margin-left: auto; margin-bottom: 0; margin-right: auto;">
        <div class="border" style="border-style: dashed; border-spacing: 2px; border-width: 1px; height: 98%; width: 98%; border-color: black;">
            <table style="width: 100% ;">
                <tr>
                    <td class="file-no">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;">File No.: <?php $file_number; ?>GSCS/01-04-2022/42</p>
                    </td>
                    <td></td>
                    <td style="text-align: center;">Issue Date: <?php $current_date; ?><?php echo date('d M Y'); ?></td>
                </tr>
                <tr>
                    <td class="school-code">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;">School Code: <?php $school; ?>1720184</p>
                    </td>
                </tr>
                <tr>
                    <td class="logo">
                        <img src="./assets/img/logo.PNG" alt="School Logo">
                    </td>
                    <td style="text-align: center;">
                        <h2 style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;"><?php $school; ?>GYAN SAGAR CONVENT SCHOOL</h2>
                        <h4 style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;">(RECOGNISED)</h4>
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;"><?php $school; ?>516, Rajkori, Opp. Peer Baba, New Delhi 110038</p>
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;"><?php $school; ?>Ph - <a href="tel: +919811991570" style=" text-decoration: none; color: black; ">+91 98119 91570</a></p>
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;"><?php $school; ?>Email: <a href="mailto: gyansagarconventschool@gmail.com" style=" text-decoration: none; color: black; ">gyansagarconventschool@gmail.com</a></p>
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;"><?php $school; ?>Website: <a href="www.gyansagarconventschool.com" style=" text-decoration: none; color: black; ">www.gyansagarconventschool.com</a></p>
                    </td>
                    <td style="text-align: right;">
                        <img src="./assets/img/student-img.PNG" alt="student-img">
                    </td>
                </tr>
            </table>
            <table style="width: 100% ;">
                <tr style="width: 100%;">
                    <td style="padding-top: 40px;padding-bottom: 40px;width: 100%;text-align: center;text-decoration: underline;font-weight: bold;">
                        <h2>SCHOOL LEAVING CERTIFICATE</h2>
                    </td>
                </tr>
            </table>
            <table class="tbl1" style="width: 100% ;">
                <tr>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;">1. Admission No.:</p>
                    </td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" style="border-bottom: 1px solid;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?= $student_data['admission_no']; ?></p>
                    </td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" style="text-align: center;">Student's UDISE ID</p>
                    </td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" style="border-bottom: 1px solid;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?= $student_data['username']; ?></p>
                    </td>
                </tr>
            </table>
            <table class="tbl1" style="width: 100% ;">
                <tr style="line-height: 5px;">
                    <td style="height: 8px; width: 35%; ">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0; text-align: left; padding-top: 0; padding-bottom:0;padding-left:0;padding-right:0;" class="name-header">2. Name of the Student:</p>
                    </td>
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?= $student_data['firstname']; ?> <?= $student_data['middlename']; ?> <?= $student_data['lastname']; ?></p>
                    </td>
                </tr>
                <tr style="line-height: 5px;">
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;">3. Mother's Name:</p>
                    </td>
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?= $student_data['mother_name']; ?></p>
                    </td>
                </tr>
                <tr style="line-height: 5px;">
                    <td style="height: 8px;">4. Father's Name:</td>
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?= $student_data['father_name']; ?></p>
                    </td>
                </tr>
                <tr style="line-height: 5px;">
                    <td style="height: 8px;">5. Nationality:</td>
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;">INDIAN</p>
                    </td>
                </tr>
                <tr style="line-height: 5px;">
                    <td style="height: 8px;">6. Date of Birth (in figures):</td>
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"> <?=  date_format(date_create($student_data['dob']), 'd-m-Y')  ?></p>
                    </td>
                </tr>
                <tr style="line-height: 5px;">
                    <td style="height: 8px;" style="text-align: center;">(in words):</td>
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;">THIRTEEN DECEMBER TWO THOUSAND SIXTEEN</p>
                    </td>
                </tr>
                <tr style="line-height: 5px;">
                    <td style="height: 8px;">7. Date of Admission</td>
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?=  date_format(date_create($student_data['admission_date']), 'd-m-Y')  ?> in Class <?= $student_data['class']; ?></p>
                    </td>
                </tr>
                <tr style="line-height: 5px;">
                    <td style="height: 8px;">8. Date of Withdrawal</td>
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?php $withdrawal_date; ?>10th Aug 2022</p>
                    </td>
                </tr>
                <tr style="line-height: 5px;">
                    <td style="height: 8px;">9. Class in which studying/studied</td>
                    <td style="height: 8px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?php $class; ?>Pre-Primary</p>
                    </td>
                </tr>
            </table>
            <table class="tbl1" style="width: 100% ;">
                <tr>
                    <td style="height: 5px;">10. Result: Passed</td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    </td>
                    <td style="height: 5px;" style="text-align: center;">Promoted to</td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    </td>
                </tr>
            </table>
            <table class="tbl1" style="width: 100% ;">
                <tr>
                    <td style="height: 5px; text-align: right; width: 35%;">Failed in:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;">----</p>
                    </td>
                </tr>
                <tr>
                    <td style="height: 5px;">11. Reason for leaving the school:</td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?php $withdrawal_reason; ?>Parent Request</p>
                    </td>
                </tr>
                <tr>
                    <td style="height: 5px;">12. School Dues paid up to:</td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?php $last_fees_paid_month_and_year; ?>July-2022</p>
                    </td>
                </tr>
                <tr>
                    <td style="height: 5px;">13. Total Attendance:</td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?php $attendance; ?>100 out of 138</p>
                    </td>
                </tr>
                <tr>
                    <td style="height: 5px;">14. Conduct:</td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?php $conduct; ?>Good</p>
                    </td>
                </tr>
                <tr>
                    <td style="height: 5px;">15. Remarks:</td>
                    <td style="height: 5px;">
                        <p style="margin-top: 0; margin-bottom:0;margin-left:0;margin-right:0;" class="student-name" style="font-weight: bold;border-bottom: 1px solid;text-align: left;"><?php $remarks; ?>----</p>
                    </td>
                </tr>
            </table>
            <table  style="width: 100% ; margin-top: 50px; margin-bottom:0;margin-left:0;margin-right:0;">
                <tr>
                    <td style="text-align: center;"><strong>Prepared By<?php $uploaded_sign; ?></strong></td>
                    <td style="text-align: center;"><strong>Checked By<?php $uploaded_sign; ?></strong></td>
                    <td style="text-align: center;"><strong>Counter Sign<?php $uploaded_sign; ?></strong></td>
                    <td style="text-align: center;"><strong>Principal<?php $uploaded_sign; ?></strong></td>
                </tr>
            </table>
            <table style="width: 100% ;">
                <tr>
                    <td style="border-top: 2px solid;border-top-color: rgba(0, 0, 0, 0.158);border-top-style: dashed;margin-top: 2px;margin-left: 10px;margin-right: 10px;"></td>
                </tr>
                <tr>
                    <td style="padding-top: 15px;text-align: center;"><strong>Note:</strong> 1. <strong>Certified that the above information is in accordance with the school records.</strong></td>
                </tr>
                <tr>
                    <td style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. <strong>No change in entry is to be made except by the authority issueing the certificate.</strong></td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>