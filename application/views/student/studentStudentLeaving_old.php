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
                            <h3 class="box-title"><?php echo $this->lang->line('add'); ?> <?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('certificate'); ?></h3>
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
                                <?php echo $this->lang->line('certificateforaadhaaraadhaarupdate'); ?>
                            </h3>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div class="table-responsive mailbox-messages">
                                <div class="download_label"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('certificate'); ?> <?php echo $this->lang->line('list'); ?></div>
                                <form id="adharCardForm">

                                    <div class="bozero">
                                        <h6 class="pagetitleh-whitebg fs-6">Resident's Details</h6>
                                        <div class="around10">
                                            <div class="row">
                                                <input type="hidden" name="store_student_id" id="store_student_id">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="name">First Name</label> <input id="fname" name="fname" placeholder="" type="text" class="form-control">
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
                                                        <label for="gaurdianName">C/o</label> <input id="gaurdianName" name="gaurdianName" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="hno">Date of withdrawl</label> <input id="withdrawl" name="withdrawl" placeholder="" type="text" class="form-control date">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="street">Result</label> 
                                                        <select name="result" id="result" class="form-control">
                                                            <option value="1">Pass</option>
                                                            <option value="2">Fail</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="landmark">Promoted To</label> <input id="landmark" name="landmark" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="Village">Conduct</label> <input id="city" name="city" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="area">Reason for leaving the school</label> <input id="area" name="area" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                               
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="postOffice">Remark</label> <input id="postOffice" name="postOffice" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <img src="" id="signatureOfStudent" style="height: 200px; width: 200px; display: none;">
                                                        <label for="exampleInputFile">Signature of the Resident/Thumb/Finger Impression</label>
                                                        <div><input class="filestyle form-control" type='file' name='file' id="file" size='20' />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <img src="" id="studentImg" style="height: 200px; width: 200px; display: none;">
                                                        <label for="exampleInputFile"><?php echo $this->lang->line('student') . " " . $this->lang->line('photo'); ?></label>
                                                        <div><input class="filestyle form-control" type='file' name='student_img' id="student_img" size='20' />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <img src="" id="signatureOfStudent" style="height: 200px; width: 200px; display: none;">
                                                        <label for="exampleInputFile">Signature of the Resident/Thumb/Finger Impression</label>
                                                        <div><input class="filestyle form-control" type='file' name='file' id="file" size='20' />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <img src="" id="studentImg" style="height: 200px; width: 200px; display: none;">
                                                        <label for="exampleInputFile"><?php echo $this->lang->line('student') . " " . $this->lang->line('photo'); ?></label>
                                                        <div><input class="filestyle form-control" type='file' name='student_img' id="student_img" size='20' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <a href="#" id="downlod" class="btn btn-info pull-left" style="display:none ;">Downlod</a>
                                        <!-- <button type="button" id="downlod" class="btn btn-info pull-left">Downlod</button> -->
                                        <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
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
        $("#downlod").attr("href", "<?php echo base_url() ?>/admin/student_aadhar_card/downlod/" + student_id);
        $("#downlod").attr("target", "blank")
        $("#downlod").attr("style", "display: block;")
        var base_url = '<?php echo base_url() ?>';
        $("#houseNo").val('');
        $.ajax({
            type: "GET",
            url: base_url + "student/getStudent",
            data: {
                'student_id': student_id,
            },
            dataType: "json",
            success: function(result) {
                let student_data = result.student_data[0];
                let student_aadhar_data = result.student_aadhar_data[0];
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
                if (student_aadhar_data) {
                    if (student_aadhar_data.house_no) {
                        $("#houseNo").val(student_aadhar_data.house_no);
                    }

                    if (student_aadhar_data.street) {
                        $("#street").val(student_aadhar_data.street);
                    }
                    if (student_aadhar_data.landmark) {
                        $("#landmark").val(student_aadhar_data.landmark);
                    }
                    if (student_aadhar_data.area) {
                        $("#area").val(student_aadhar_data.area);
                    }
                    if (student_aadhar_data.post_office) {
                        $("#postOffice").val(student_aadhar_data.post_office);
                    }
                    if (student_aadhar_data.district) {
                        $("#district").val(student_aadhar_data.district);
                    }
                    if (student_aadhar_data.certifier_name) {
                        $("#certifierName").val(student_aadhar_data.certifier_name);
                    }
                    if (student_aadhar_data.certifier_designation) {
                        $("#designation").val(student_aadhar_data.certifier_designation);
                    }
                    if (student_aadhar_data.certifier_office_add) {
                        $("#ofcAdd").val(student_aadhar_data.certifier_office_add);
                    }
                    if (student_aadhar_data.cerifier_contact) {
                        $("#contactNo").val(student_aadhar_data.cerifier_contact);
                    }
                    if (student_aadhar_data.gajet_officer_group_A == 'on') {
                        $("#gajet_officer_group_A").attr('checked', true);
                    }
                    if (student_aadhar_data.village_panchayat == 'on') {
                        $("#village_panchayat").attr('checked', true);
                    }
                    if (student_aadhar_data.gajet_officer_group_B == 'on') {
                        $("#gajet_officer_group_B").attr('checked', true);
                    }
                    if (student_aadhar_data.councilor == 'on') {
                        $("#councilor").attr('checked', true);
                    }
                    if (student_aadhar_data.tehsildar == 'on') {
                        $("#tehsildar").attr('checked', true);
                    }
                    if (student_aadhar_data.hrei == 'on') {
                        $("#hrei").attr('checked', true);
                    }
                    if (student_aadhar_data.swmho == 'on') {
                        $("#swmho").attr('checked', true);
                    }
                    if (student_aadhar_data.epfo == 'on') {
                        $("#epfo").attr('checked', true);
                    }
                    if (student_aadhar_data.overwriting == 'on') {
                        $("#overwriting").attr('checked', true);
                    }
                    if (student_aadhar_data.issue_date == 'on') {
                        $("#issue_date").attr('checked', true);
                    }
                    if (student_aadhar_data.resident_sign == 'on') {
                        $("#resident_sign").attr('checked', true);
                    }
                    if (student_aadhar_data.certifier_details == 'on') {
                        $("#certifier_details").attr('checked', true);
                    }
                    if (student_aadhar_data.cross_stamp == 'on') {
                        $("#cross_stamp").attr('checked', true);
                    }
                    if (student_aadhar_data.resident == 'on') {
                        $("#resident").attr('checked', true);
                    }
                    if (student_aadhar_data.nri == 'on') {
                        $("#nri").attr('checked', true);
                    }
                    if (student_aadhar_data.newenrolmment == 'on') {
                        $("#newenrolmment").attr('checked', true);
                    }
                    if (student_aadhar_data.updaterequest == 'on') {
                        $("#updaterequest").attr('checked', true);
                    }

                    if (student_aadhar_data.enterdate) {
                        $("#enterdate").val(student_aadhar_data.enterdate);
                    }







                    if (student_aadhar_data.thumb_image) {
                        $("#signatureOfStudent").attr("style", "height: 200px; width: 200px; display: block;")

                        $("#signatureOfStudent").attr('src', '<?php echo base_url(); ?>/uploads/aadhar_card/student_sign/' + student_aadhar_data.thumb_image)
                    }
                    if (student_aadhar_data.stamp_img) {
                        $("#studcerifierSign").attr("style", "height: 200px; width: 200px; display: block;")
                        $("#studcerifierSign").attr('src', '<?php echo base_url(); ?>/uploads/aadhar_card/certifier_sign/' + student_aadhar_data.stamp_img)
                    }
                    if (student_aadhar_data.student_img) {
                        $("#studentImg").attr("style", "height: 200px; width: 200px; display: block;")
                        $("#studentImg").attr('src', '<?php echo base_url(); ?>/uploads/aadhar_card/student_img/' + student_aadhar_data.student_img)
                    }

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
    $(document).ready(function() {
        $('#adharCardForm').validate({
            submitHandler: function(form) {
                var base_url = '<?php echo base_url() ?>';
                let formData = new FormData(document.getElementById('adharCardForm'));
                $.ajax({
                    type: "POST",
                    url: base_url + "admin/student_aadhar_card/create",
                    data: formData,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function(data) {
                        $("#successmsg").attr("style", "display: block;");
                        $("html, body").animate({
                            scrollTop: 0
                        }, "slow");
                        return false;

                    }
                });
            }
        })
    })
</script>