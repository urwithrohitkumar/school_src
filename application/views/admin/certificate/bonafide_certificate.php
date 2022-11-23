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
                <div class="col-md-6">  
                    <form id="fee_certificate_form" action="<?php echo base_url('Studentfee/bonafide_certificate_download')?>" method="POST">                 
                    <div class="box box-primary">   
                        <div class="box-header with-border">                       
                            <h3 class="box-title"><?php echo $this->lang->line('download'); ?> <?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('bonafide_certificate'); ?></h3>
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
                        <div class="box-footer">
                            <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                        </div>
                    </div>
                    </form> 
                </div>

                <div class="col-md-6">
                    
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
        // $('#adharCardForm')[0].reset();
        var student_id = $(this).val();      
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
              
            }
        });
    });
</script>


<script>
    $(document).ready(function() {
        $('#adharCardForm').validate({
            submitHandler: function(form) {
                var base_url = '<?php echo base_url() ?>';
               // let formData = new FormData(document.getElementById('adharCardForm'));
                $.ajax({
                    type: "POST",
                    url: base_url + "admin/Studentfee/stufee_certificate_download",
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
