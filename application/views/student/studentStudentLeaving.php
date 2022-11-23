<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper">
    <section class="content-header">
        <h1><i class="fa fa-newspaper-o"></i> <?php echo $this->lang->line('certificate'); ?></h1>
    </section>
    <section class="content">
        <div id="successmsg" class="alert alert-success" style="display: none;">Record Saved Successfully</div>
        <div class="row">
            <?php
            if ($this->rbac->hasPrivilege('aadhar_card', 'can_add')) {
            ?>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('add'); ?> <?php echo $this->lang->line('school_leaving'); ?> <?php echo $this->lang->line('certificate'); ?></h3>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <?php if ($this->session->flashdata('msg')) { ?>
                                <?php echo $this->session->flashdata('msg') ?>
                            <?php } ?>
                            <?php
                            if (isset($error_message)) {
                                echo "<div class='alert alert-danger'>" . $error_message . "</div>";
                            }
                            ?>

                            <div class='form-group'>
                                <label for='exampleInputEmail1'><?php echo $this->lang->line('branch'); ?></label><small class='req'> *</small>
                                <select id='branch_id' name='branch_id' placeholder='' type='text' class='form-control'>
                                    <option disabled selected><?php echo $this->lang->line('select'); ?></option>
                                    <?php foreach ($branch as $key => $value) {  ?>
                                        <option value='<?php echo $value['id'] ?>'><?php echo $value['branch_name'] ?></option>
                                    <?php } ?>
                                </select>
                                <span class='text-danger'><?php echo form_error('branch'); ?></span>
                            </div>

                            <div class="form-group">
                                <label><?php echo $this->lang->line('class'); ?></label> <select id="class_id" name="class_id" class="form-control">
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label><?php echo $this->lang->line('section'); ?></label> <select id="section_id" name="section_id" class="form-control">
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label><?php echo $this->lang->line('student'); ?></label> <select id="student_id" name="student_id" class="form-control">
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                </select>
                            </div>

                        </div><!-- /.box-body -->
                        <!-- <div class="box-footer">
                            <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                        </div> -->
                    </div>
                </div>

                <div class="col-md-8">
                    <!-- general form elements -->
                    <div class="box box-primary" id="hroom">
                        <div class="box-header ptbnull">
                            <h3 class="box-title titlefix">
                                <?php echo $this->lang->line('add'); ?> <?php echo $this->lang->line('school_leaving'); ?> <?php echo $this->lang->line('certificate'); ?>
                            </h3>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div class="table-responsive mailbox-messages">
                                <div class="download_label"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('certificate'); ?> <?php echo $this->lang->line('list'); ?></div>
                                <form id="adharCardForm" action="<?php echo base_url("student/create_student_leaving")?>" method="POST" enctype="multipart/form-data" target="_blank">
                                     
                                    <div class="bozero">
                                        <h6 class="pagetitleh-whitebg fs-6">Resident's Details</h6>
                                        <div class="around10">
                                            <div class="row">
                                                <input type="hidden" name="store_student_id" id="store_student_id">
                                                <input type="hidden" name="student_leaving_id" id="student_leaving_id" value="0">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="name">First Name</label>  <input id="fname" name="fname" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="name">Middle Name</label> <input id="mname" name="mname" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="name">Last Name</label> <input id="lname" name="lname" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                               
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="gaurdianName">C/o</label> 
                                                        <input id="gaurdianName" name="gaurdianName" placeholder="" type="text" class="form-control">
                                                     </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="hno">Date of withdrawl</label> <small class="req"> *</small>
                                                        <input id="withdrawl" name="withdrawl" placeholder="" type="text" class="form-control date">
                                                        <span class="text-danger"><?php echo form_error('withdrawl'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="street">Result</label> 
                                                        <select name="result" id="result" class="form-control">
                                                            <option value="1">Pass</option>
                                                            <option value="2">Fail</option>
                                                        </select>
                                                        <span class="text-danger"><?php echo form_error('result'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="landmark">Promoted To</label> <small class="req"> *</small>
                                                        <input id="promoted_to" name="promoted_to" placeholder="" type="text" class="form-control">
                                                        <span class="text-danger"><?php echo form_error('promoted_to'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="Village">Conduct</label><small class="req"> *</small>
                                                        <input id="conduct" name="conduct" placeholder="" type="text" class="form-control">
                                                        <span class="text-danger"><?php echo form_error('conduct'); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="gaurdianName">Student's UDISE ID</label> <small class="req"> *</small>
                                                        <input id="udise_no" name="udise_no" placeholder="" type="text" class="form-control">
                                                        <span class="text-danger"><?php echo form_error('udise_no'); ?></span>
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="gaurdianName">File No.</label> <small class="req"> *</small>
                                                        <input id="file_no" name="file_no" placeholder="" type="text" class="form-control">
                                                        <span class="text-danger"><?php echo form_error('file_no'); ?></span>
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="area">Reason for leaving the school</label> <small class="req"> *</small>
                                                        <input id="reason" name="reason" placeholder="" type="text" class="form-control">
                                                        <span class="text-danger"><?php echo form_error('reason'); ?></span>
                                                    </div>
                                                </div>
                                               
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="postOffice">Remark</label> <small class="req"> *</small> <input id="remark" name="remark" placeholder="" type="text" class="form-control">
                                                        <span class="text-danger"><?php echo form_error('remark'); ?></span>
                                                    </div>
                                                </div> 
                                                
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <img src="" id="signatureOfStudent" style="height: 200px; width: 200px; display: none;">
                                                        <label for="exampleInputFile"><?php echo $this->lang->line('prepared_by'); ?></label><small class="req"> *</small>
                                                        <div><input class="filestyle form-control" type='file' name='prepared_by' id="prepared_by" size='20' />
                                                        <span class="text-danger"><?php echo form_error('prepared_by'); ?></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <img src="" id="studentImg" style="height: 200px; width: 200px; display: none;">
                                                        <label for="exampleInputFile"><?php echo $this->lang->line('checked_by'); ?></label><small class="req"> *</small>
                                                        <div><input class="filestyle form-control" type='file' name='checked_by' id="checked_by" size='20' />
                                                        <span class="text-danger"><?php echo form_error('checked_by'); ?></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <img src="" id="signatureOfStudent" style="height: 200px; width: 200px; display: none;">
                                                        <label for="exampleInputFile"><?php echo $this->lang->line('counter_sign'); ?></label><small class="req"> *</small>
                                                        <div><input class="filestyle form-control" type='file' name='counter_sign' id="counter_sign" size='20' />
                                                        <span class="text-danger"><?php echo form_error('counter_sign'); ?></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <img src="" id="studentImg" style="height: 200px; width: 200px; display: none;">
                                                        <label for="exampleInputFile"><?php echo $this->lang->line('principal'); ?></label><small class="req"> *</small>
                                                        <div><input class="filestyle form-control" type='file' name='principal' id="principal" size='20' />
                                                        <span class="text-danger"><?php echo form_error('principal'); ?></span>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>                                           
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save')." And Downlod"; ?></button>
                                    </div>
                                </form>
                            </div><!-- /.mail-box-messages -->
                        </div><!-- /.box-body -->
                    </div>
                </div>
            <?php } ?>
            <!--/.col (left) -->
            <!-- right column -->
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<!-- Section Data According to class -->

<!-- Student Data According to Section And Class -->
<script>
    $(document).on('change', '#section_id', function(e) {
        $('#student_id').html("");
        var section_id = $(this).val();
        var class_id = $("#class_id").val();
        var branch_id = $('#branch_id').find(":selected").val();
        var base_url = '<?php echo base_url() ?>';
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "student/getBySectionClass",
            data: {
                'class_id': class_id,
                'section_id': section_id,
                'branch_id': branch_id,
            },
            dataType: "json",
            success: function(data) {
                $.each(data, function(i, obj) {
                    div_data += "<option value=" + obj.id + ">" + obj.firstname + "" + obj.lastname + "</option>";
                });
                $('#student_id').append(div_data);
            }
        });
    });
</script>
<!-- Student Data According to student ID -->
<script>
    $(document).on('change', '#student_id', function(e) {
        $('#adharCardForm')[0].reset();
        var student_id = $(this).val();
        // $("#downlod").attr("href", "<?php // echo base_url() ?>/admin/student/download_student_leaving/" + student_id);
        // $("#downlod").attr("target", "blank")
        // $("#downlod").attr("style", "display: block;")
        var base_url = '<?php echo base_url() ?>';
        $("#houseNo").val('');
        $.ajax({
            type: "GET",
            url: base_url + "student/getStudent_forLeavingSchool",
            data: {
                'student_id': student_id,
            },
            dataType: "json",
            success: function(result) {                
                let student_data = result.student_data;
                let student_leaving = result.student_leaving;
                $("#store_student_id").val(student_id);
                $("#aadhar_card").val(student_data.adhar_no);
                $("#fname").val(student_data.firstname);
                $("#mname").val(student_data.middlename);
                $("#lname").val(student_data.lastname);
                $("#gaurdianName").val(student_data.guardian_name);
                $("#city").val(student_data.city);
                $("#state").val(student_data.state);
                $("#pincode").val(student_data.pincode);
                $("#dob").val(student_data.dob);

                if (student_leaving) {
                    $("#student_leaving_id").val(student_leaving.id);
                    $("#withdrawl").val(student_leaving.withdrawl);
                    $("#result").val(student_leaving.result);
                    $("#promoted_to").val(student_leaving.promoted_to);
                    $("#conduct").val(student_leaving.conduct);
                    $("#reason").val(student_leaving.reason_for_leaving);
                    $("#remark").val(student_leaving.remark);    
                    $("#file_no").val(student_leaving.file_no);    
                    $("#udise_no").val(student_leaving.udise_no);                    
                } else {
                    $(".resetcheckbox").attr('checked', false);
                    $("#signatureOfStudent").attr("style", "display:none;")
                    $("#studcerifierSign").attr("style", "display:none;")
                    $("#studentImg").attr("style", "display:none;")
                }
            }
        });
    });
</script>


<script>
    // $(document).ready(function() {
    //     $('#adharCardForm').validate({
    //         submitHandler: function(form) {
    //             var base_url = '<?php echo base_url() ?>';
    //             let formData = new FormData(document.getElementById('adharCardForm'));
    //             $.ajax({
    //                 type: "POST",
    //                 url: base_url + "student/create_student_leaving",
    //                 data: formData,
    //                 async: false,
    //                 cache: false,
    //                 contentType: false,
    //                 processData: false,
    //                 success: function(respons) {
    //                     $("#successmsg").attr("style", "display: block;");
    //                     $("html, body").animate({
    //                         scrollTop: 0
    //                     }, "slow");
    //                     return false;
    //                 }
    //             });
    //         }
    //     })
    // })
</script>
