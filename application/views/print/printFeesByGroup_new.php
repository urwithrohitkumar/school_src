<!DOCTYPE html>
<html>
<style>
    body {
        font-family: sans-serif;
        width: 95%;
        margin: auto;
    }

    .border-none td {
        border: 0;
    }

    .table1 {
        font-weight: 600;
    }
</style>

<body>

<?php     
    
    $feeList = $feearray[0];
    $final_data = [];
    $session_month='';
    if(!empty($feearray)){ $num=1; $Advance_Adjust =0; $Paid_Amt =0;
        foreach($feearray as $fee){
            $row_data['fees_charges']= $fee->name;
            $row_data['current_dues']= $fee->amount;
            $row_data['concession']= 0;
            $row_data['payable_amt']= $fee->amount;
            $row_data['paid_amt']= 0;
          
            $amount_detail = json_decode($fee->amount_detail); 
            $concession=0;
            $payable_amt=0;
            $paid_amt=0;
            if($amount_detail) {              
                foreach($amount_detail as $amount){ 
                    if(!empty($fee->session_month)){
                        $session_month.= $fee->session_month.",";
                    }                   
                    $concession += $amount->amount_discount;
                    $paid_amt += $amount->amount;
                } 
                $session_month = substr_replace($session_month ,"", -1);
            } 
            $row_data['concession']= amountFormat($concession);
            $row_data['paid_amt']= amountFormat($paid_amt);
            array_push($final_data,$row_data);
        }
    } 
?>

    <div style="text-align: center;">
        <h3 style="margin-bottom: 10px;">Gyan Sagar Convent School &nbsp;<span style="color: red;">Session :
                2022-23</span></h3>
        <h4 style="margin: 0;">516, Rajokri, Opp. Peer Baba, New Delhi 110038</h4>
        <h4 style="margin: 0;">Telephone : 9811991570</h4>
        <h3 style="margin-top: 10px;">FEE RECEIPT</h3>
    </div>

    <table style="width:100%; text-align: justify; margin-bottom: 10px;">
        <tr>
            <td>Sr. No.</td>
            <th>1</th>
            <td>Date</td>
            <th>25/02/2022</th>
        </tr>
        <tr>
            <td>Name</td>
            <th><?php echo $feeList->firstname." ".$feeList->lastname; ?></th>
            <td>Admission No.</td>
            <th><?php echo $feeList->admission_no; ?></th>
        </tr>
        <tr>
            <td>Father Name</td>
            <th><?php echo $feeList->father_name; ?></th>
            <td>For the Month of</td>
            <th><?= $session_month; ?></th>
        </tr>
        <tr>
            <td>Class & Sec</td>
            <th><?php echo $feeList->class." ". $feeList->section; ?></th>
            <td>Mode</td>
            <th>CASH</th>
        </tr>
    </table>

    <table style="width:100%; border-spacing: 0px;" class="table1" border>
        <tr>
            <th>S.No</th>
            <th>Fees & Charges</th>
            <th>Current Dues</th>
            <th>Concession</th>
            <th>Payable Amt</th>
            <th>Paid Amt</th>
        </tr>
        <?php $Advance_Adjust =0; $Paid_Amt =0; $num=1; $current_dues= 0;  if(!empty($final_data)){ 
            foreach($final_data as $fee){  ?>               
                <tr>
                    <td><?= $num; ?></td>
                    <td><?= $fee['fees_charges']; ?></td>
                    <td><?php echo $fee['current_dues']; $current_dues += $fee['current_dues']; ?></td>
                    <td><?= $fee['concession']; ?></td>
                    <td><?= $fee['payable_amt']; ?></td>
                    <td><?php echo $fee['paid_amt']; $Paid_Amt +=$fee['paid_amt']; ?></td>
                </tr>
                
           <?php $num++; }  } ?>
        <tr>
            <td></td>
            <td></td>
            <td>Advance Adjust</td>
            <td><?= $Advance_Adjust; ?></td>
            <td>Paid Amt</td>
            <td><?= $Paid_Amt; ?></td>
        </tr>
        <tr class="border-none">
            <td></td>
            <td></td>
            <td>Balance</td>
            <td></td>
            <td></td>
            <td><?php  echo $current_dues-$Paid_Amt; ?></td>
        </tr>
    </table>

    <table style="width:100%; text-align: justify; border: 0; color: darkorange;">
        <tr>
            <th>Amt. in word : <?php echo convert_number($Paid_Amt); ?></th>
            <th>Cashier</th>
        </tr>
    </table>

</body>

</html>