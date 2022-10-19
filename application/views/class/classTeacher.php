<?php $currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-mortar-board"></i> <?php echo $this->lang->line('academics'); ?>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <?php
            if ($this->rbac->hasPrivilege('assign_class_teacher', 'can_add')) {
            ?>
                <div class="col-md-4">
                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('assign_class_teacher'); ?></h3>
                        </div><!-- /.box-header -->
                        <form id="form1" action="<?php echo base_url() ?>admin/teacher/assign_class_teacher" method="post" accept-charset="utf-8">
                            <div class="box-body">
                                <?php if ($this->session->flashdata('msg')) { ?>
                                    <?php echo $this->session->flashdata('msg') ?>
                                <?php } ?>
                                <?php
                                if (isset($error_message)) {
                                    echo "<div class='alert alert-danger'>" . $error_message . "</div>";
                                }
                                ?>
                                <?php echo $this->customlib->getCSRF(); ?>
                                <div class='form-group'>
                                    <label for='exampleInputEmail1'><?php echo $this->lang->line('branch'); ?></label><small class='req'> *</small>
                                    <select id='branch_id' name='branch_id' placeholder='' type='text' class='form-control'>
                                        <option disabled selected><?php echo $this->lang->line('select') ?></option>
                                        <?php foreach ($branch as $key => $value) {  ?>
                                            <option value='<?php echo $value['id'] ?>'><?php echo $value['branch_name'] ?></option>
                                        <?php } ?>
                                    </select>
                                    <span class='text-danger'><?php echo form_error('branch'); ?></span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
                                    <select class="form-control" name="class" id="class_id">
                                        <option value=''><?php echo $this->lang->line('select') ?></option>
                                       
                                    </select>

                                    <span class="text-danger"><?php echo form_error('class'); ?></span>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('section'); ?></label><small class="req"> *</small>


                                    <select class="form-control" id="section_id" name="section">
                                        <option value=""><?php echo $this->lang->line('select') ?></option>
                                    </select>

                                    <span class="text-danger"><?php echo form_error('section'); ?></span>
                                </div>

                                <div class="form-group" id="staffCheckbox">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('class_teacher'); ?></label><small class="req"> *</small>
                                    <?php
                                    foreach ($teacherlist as $tvalue) {
                                    ?>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="teachers[]" value="<?php echo $tvalue['id'] ?>" <?php echo set_checkbox('teachers[]', $tvalue['id']); ?>><?php echo $tvalue['name'] . " " . $tvalue['surname'] . " (" . $tvalue['employee_id'] . ")(" . $tvalue['branch_name'] . ")"; ?>
                                            </label>
                                        </div>
                                    <?php
                                    }
                                    ?>
                                    <span class="text-danger"><?php echo form_error('teachers[]'); ?></span>
                                </div>

                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                            </div>
                        </form>
                    </div>

                </div>
                <!--/.col (right) -->
                <!-- left column -->
            <?php } ?>
            <div class="col-md-<?php
                                if ($this->rbac->hasPrivilege('assign_class_teacher', 'can_add')) {
                                    echo "8";
                                } else {
                                    echo "12";
                                }
                                ?>">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('class_teacher_list'); ?></h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php echo $this->lang->line('class_teacher_list'); ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>

                                        <th><?php echo $this->lang->line('class'); ?>
                                        </th>
                                        <th><?php echo $this->lang->line('section'); ?>
                                        </th>
                                        <th><?php echo $this->lang->line('class_teacher'); ?>
                                        </th>
                                        <th><?php echo $this->lang->line('branch'); ?>
                                        </th>

                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 0;

                                    foreach ($assignteacherlist as $teacher) {
                                    ?>
                                        <tr>
                                            <td class="mailbox-name">
                                                <?php echo $teacher["class"]; ?>

                                            </td>
                                          


                                            <td>

                                                <?php echo $teacher["section"]; ?>

                                            </td>
                                            <td>
                                                <?php foreach ($tlist[$i] as $key => $tsvalue) {
                                                ?>

                                                    <?php echo $tsvalue['name'] . " " . $tsvalue['surname'] . " (" . $tsvalue['employee_id'] . ")" . "<br/>"; ?>
                                                    <input type="hidden" name="teacherid[]" value="<?php echo $tsvalue["id"] ?>">
                                                <?php } ?>
                                            </td>
                                            <td class="mailbox-name">
                                                <?php echo $teacher["branch_name"]; ?>

                                            </td>
                                            <td class="mailbox-date pull-right">
                                                <?php
                                                if ($this->rbac->hasPrivilege('assign_class_teacher', 'can_edit')) {
                                                ?>
                                                    <a href="<?php echo base_url(); ?>admin/teacher/update_class_teacher/<?php echo $teacher["class_id"]; ?>/<?php echo $teacher["section_id"]; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                <?php
                                                }
                                                if ($this->rbac->hasPrivilege('assign_class_teacher', 'can_delete')) {
                                                ?>
                                                    <a href="<?php echo base_url(); ?>admin/teacher/classteacherdelete/<?php echo $teacher["class_id"]; ?>/<?php echo $teacher["section_id"]; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                        <i class="fa fa-remove"></i>
                                                    </a>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                    <?php
                                        $i++;
                                    }
                                    ?>

                                </tbody>
                            </table><!-- /.table -->



                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->
                </div>
            </div>
            <!--/.col (left) -->
            <!-- right column -->

        </div>
        <div class="row">
            <!-- left column -->

            <!-- right column -->
            <div class="col-md-12">

            </div>
            <!--/.col (right) -->
        </div> <!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<script type="text/javascript">
  
    $(document).ready(function() {
    
        var class_id = $('#class_id').val();
        var section_id = '<?php echo set_value('section') ?>';

        $(document).on('change', '#feecategory_id', function(e) {
            $('#feetype_id').html("");
            var feecategory_id = $(this).val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "feemaster/getByFeecategory",
                data: {
                    'feecategory_id': feecategory_id
                },
                dataType: "json",
                success: function(data) {
                    $.each(data, function(i, obj) {
                        div_data += "<option value=" + obj.id + ">" + obj.type + "</option>";
                    });

                    $('#feetype_id').append(div_data);
                }
            });
        });
    });
</script>


<script>
    $("#branch_id").on('change', function() {
        let branch_id = $(this).val();
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "POST",
            url: base_url + "admin/teacher/classTeacherAccordingBranch",
            data: {
                'branch_id': branch_id
            },
            dataType: "json",
            success: function(result) {
                $('#staffCheckbox').empty();
                /**
                 * Item Details Option data according to branch id
                 */
                if (result) {
                    var html = ' <label for="exampleInputEmail1"><?php echo $this->lang->line('class_teacher'); ?></label><small class="req"> *</small>';
                    for (var count = 0; count < result.length; count++) {
                        html += '<div class="checkbox"><label><input type="checkbox" name="teachers[]" value="' + result[count].id + '">' + result[count].name + ' ' + result[count].surname + ' ( ' + result[count].employee_id + ' )</label></div>';
                    }
                    $('#staffCheckbox').append(html);
                }
            }
        });
    })
</script>