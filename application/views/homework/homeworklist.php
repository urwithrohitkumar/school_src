<?php
$language = $this->customlib->getLanguage();
$language_name = $language["short_code"];
?>
<link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script src="<?php echo base_url(); ?>backend/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-flask"></i> <?php echo $this->lang->line('homework'); ?>
        </h1>
    </section>
    <section class="content">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>

            </div>
            <form class="assign_teacher_form" action="<?php echo base_url(); ?>homework/searchvalidation" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12">
                            <?php if ($this->session->flashdata('msg')) { ?>
                                <?php echo $this->session->flashdata('msg') ?>
                            <?php } ?>
                            <?php echo $this->customlib->getCSRF(); ?>
                        </div>
                        <div class="col-md-2 col-lg-2 col-sm-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('branch'); ?></label>

                                <select id="branch" name="branch" placeholder="" type="text" class="form-control branchOption">
                                    <option value="" disabled selected>Select</option>
                                    <?php foreach ($branch as $key => $value) {
                                    ?>
                                        <option value="<?php echo $value["id"] ?>"><?php echo $value["branch_name"] ?></option>
                                    <?php }
                                    ?>
                                </select>
                                <span class="text-danger"><?php echo form_error('branch'); ?></span>
                            </div>
                        </div>
                        <div class="col-md-2 col-lg-2 col-sm-6">
                            <div class="form-group">
                                <label><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
                                <select autofocus="" id="searchclassid" name="class_id" onchange="getSectionByClass(this.value, 0, 'secid')" class="form-control classOption">
                                    <option value="" disabled selected>Select</option>

                                </select>
                                <span class="text-danger" id="error_class_id"></span>
                            </div>
                        </div>
                        <div class="col-md-2 col-lg-2 col-sm-6">
                            <div class="form-group">
                                <label><?php echo $this->lang->line('section'); ?></label>
                                <select id="secid" name="section_id" class="form-control sectionOption">
                                    <option value="" disabled selected>Select</option>
                                </select>
                                <span class="section_id_error text-danger"></span>
                            </div>
                        </div>

                        <div class="col-md-2 col-lg-2 col-sm-6">
                            <div class="form-group">
                                <label><?php echo $this->lang->line('subject') . " " . $this->lang->line('group') ?></label>
                                <select id="subject_group_id" name="subject_group_id" class="form-control subjectgroupOption">
                                    <option value="" disabled selected>Select</option>
                                </select>
                                <span class="section_id_error text-danger"></span>
                            </div>
                        </div>
                        <div class="col-md-2 col-lg-2 col-sm-6">
                            <div class="form-group">
                                <label><?php echo $this->lang->line('subject'); ?></label>
                                <select id="subid" name="subject_id" class="form-control subjectOption">
                                    <option value="" disabled selected>Select</option>
                                </select>
                                <span class="section_id_error text-danger"></span>
                            </div>
                        </div>
                    </div>
                    <button type="submit" id="search_filter" name="search" value="search_filter" class="btn btn-primary btn-sm checkbox-toggle pull-right"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                </div>
            </form>

            <div class="row">
                <div class="col-md-12">
                    <div class="">
                        <div class="box-header ptbnull"></div>
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-users"></i> <?php echo $this->lang->line('homework_list'); ?></h3>
                            <?php if ($this->rbac->hasPrivilege('homework', 'can_add')) { ?>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-sm btn-primary modal_form" data-method_call="add"><i class="fa fa-plus"></i> <?php echo $this->lang->line('add'); ?></button>
                                </div>
                            <?php } ?>
                        </div>

                        <div class="box-body table-responsive">
                            <div class="download_label"> <?php echo $this->lang->line('homework_list'); ?></div>
                            <div>
                                <table class="table table-striped table-bordered table-hover homework-list" data-export-title="<?php echo $this->lang->line('homework_list'); ?>">
                                    <thead>
                                        <tr>
                                            <th><?php echo $this->lang->line('class') ?></th>
                                            <th><?php echo $this->lang->line('section') ?></th>
                                            <th><?php echo $this->lang->line('subject') . " " . $this->lang->line('group'); ?></th>
                                            <th><?php echo $this->lang->line('subject') ?></th>
                                            <th><?php echo $this->lang->line('homework_date'); ?></th>
                                            <th><?php echo $this->lang->line('submission_date'); ?></th>
                                            <th><?php echo $this->lang->line('evaluation_date'); ?></th>
                                            <th><?php echo $this->lang->line('created_by'); ?></th>
                                            <th class="text-right noExport "><?php echo $this->lang->line('action') ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"></h4>
            </div>

            <form id="formadd" method="post" class="ptt10" enctype="multipart/form-data">
                <div class="modal-body pt0 pb0">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="row">
                                <input type="hidden" id="modal_record_id" value="0" name="record_id">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('branch'); ?></label><small class="req"> *</small>
                                        <select id="branch_id" name="branch_id" placeholder="" type="text" class="form-control modelbranchOption">
                                            <option value="" disabled selected>Select</option>
                                            <?php foreach ($branch as $key => $value) {
                                            ?>
                                                <option value="<?php echo $value["id"] ?>"><?php echo $value["branch_name"] ?></option>
                                            <?php }
                                            ?>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('branch'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="pwd"><?php echo $this->lang->line('class') ?></label><small class="req"> *</small>
                                        <select class="form-control modal_class_id modelclassOption" name="modal_class_id" id="modal_class_id">
                                            <option value="" disabled selected>Select</option>
                                            <?php foreach ($classlist as $key => $value) {
                                            ?>
                                                <option value="<?php echo $value["id"] ?>"><?php echo $value["class"] ?></option>

                                            <?php } ?>

                                        </select>
                                        <span id="name_add_error" class="text-danger"></span>
                                    </div>

                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="pwd"><?php echo $this->lang->line('section') ?></label><small class="req"> *</small>
                                        <select class="form-control modal_section_id modelsectionOption" name="modal_section_id" id="modal_section_id">
                                            <option value="" disabled selected>Select</option>

                                        </select>
                                        <span id="name_add_error" class="text-danger"></span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('subject') . " " . $this->lang->line('group') ?></label><small class="req"> *</small>
                                        <select id="modal_subject_group_id" name="modal_subject_group_id" class="form-control modelsubjectgroupOption">
                                            <option value="" disabled selected>Select</option>
                                        </select>
                                        <span class="text-danger"></span>
                                    </div>
                                </div>



                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="pwd"><?php echo $this->lang->line('subject') ?></label><small class="req"> *</small>
                                        <select class="form-control modelsubjectOption" name="modal_subject_id" id="modal_subject_id">
                                            <option value="" disabled selected>Select</option>


                                        </select>
                                        <span id="name_add_error" class="text-danger"><?php echo form_error('modal_subject_id'); ?></span>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="pwd"><?php echo $this->lang->line('homework_date'); ?></label><small class="req"> *</small>
                                        <input type="text" name="homework_date" class="form-control" id="homework_date" value="<?php echo set_value('date', date($this->customlib->getSchoolDateFormat())); ?>" readonly="">
                                        <span id="date_add_error" class="text-danger"></span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="pwd"><?php echo $this->lang->line('submission_date'); ?></label><small class="req"> *</small>
                                        <input type="text" id="submit_date" name="submit_date" class="form-control" value="<?php echo set_value('follow_up_date', date($this->customlib->getSchoolDateFormat())); ?>" readonly="">
                                    </div>
                                </div>
                                <div class="col-sm-12">



                                    <div class=" form-group wrapper">
                                    </div>

                                    <!-- <p><button class="add_fields">Add More Fields</button></p> -->


                                    <!--<div class="form-group">-->
                                    <!--    <label for="pwd"><?php echo $this->lang->line('attach_document'); ?></label>-->
                                    <!--    <input type="file" id="file" name="userfile" class="form-control filestyle">-->
                                    <!--</div>-->
                                </div>

                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="email"><?php echo $this->lang->line('description'); ?></label><small class="req"> *</small>
                                        <textarea name="description" id="compose-textarea" class="form-control"><?php echo set_value('address'); ?>

                                        </textarea>
                                    </div>
                                </div>






                            </div>
                            <!--./row-->

                        </div>
                        <!--./col-md-12-->

                    </div>
                    <!--./row-->

                </div>
                <div class="box-footer">

                    <div class="pull-right paddA10">
                        <button type="submit" class="btn btn-info pull-right" id="submit" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Please wait"><?php echo $this->lang->line('save') ?></button>

                    </div>

                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal fade" id="evaluation" tabindex="-1" role="dialog" aria-labelledby="evaluation" style="padding-left: 0 !important">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"><?php echo $this->lang->line('evaluate_homework'); ?></h4>
            </div>
            <div class="modal-body pt0 pb0" id="evaluation_details">
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="homework_docs" tabindex="-1" role="dialog" aria-labelledby="evaluation" style="padding-left: 0 !important">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"><?php echo $this->lang->line('homework') . " " . $this->lang->line('assignments'); ?></h4>
            </div>
            <div class="modal-body pt0 pb0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="">
                            <div class="box-body table-responsive">
                                <div>
                                    <table class="table table-hover table-striped table-bordered all-list">
                                        <thead>
                                            <tr>
                                                <th><?php echo $this->lang->line('name') ?></th>
                                                <th><?php echo $this->lang->line('message') ?></th>

                                                <th class="text-right"><?php echo $this->lang->line('action') ?></th>
                                            </tr>

                                        </thead>
                                        <tbody id="homework_docs_result">
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- -->
<script type="text/javascript">
    var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'mmm' => 'M', 'Y' => 'yyyy']) ?>';

    $(document).ready(function() {
        $("#homework_date").datepicker({
            format: date_format,
            autoclose: true,
            weekStart: start_week,
            language: '<?php echo $language_name ?>',
        }).on('changeDate', function(selected) {
            var minDate = new Date(selected.date.valueOf());
            $('#submit_date').datepicker('setStartDate', minDate);
        });

        $("#submit_date").datepicker({
            format: date_format,
            autoclose: true,
            weekStart: start_week,
            language: '<?php echo $language_name ?>',
        }).on('changeDate', function(selected) {
            var minDate = new Date(selected.date.valueOf());
            $('#homework_date').datepicker('setEndDate', minDate);
        });
    });


    $(document).ready(function() {

        $('#homeworkdate,#submitdate').datepicker({
            format: date_format,
            autoclose: true,
            language: '<?php echo $language_name ?>'
        });


        $("#btnreset").click(function() {
            $("#form1")[0].reset();
        });

    });

    function homework_docs(id) {

        $('#homework_docs').modal('show');
        (function($) {
            'use strict';
            $(document).ready(function() {
                initDatatable('all-list', 'homework/homework_docs/' + id, [], 100);
            });
        }(jQuery))

    }
</script>
<script>
    $(function() {

        $("#compose-textarea,#desc-textarea").wysihtml5();
    });
</script>
<script type="text/javascript">
    $(document).ready(function(e) {
        getSectionByClass("<?php echo $class_id ?>", "<?php echo $section_id ?>", 'secid');
        // getSubjectGroup("<?php echo $class_id ?>", "<?php echo $section_id ?>", "<?php echo $subject_group_id ?>", 'subject_group_id')
        // getsubjectBySubjectGroup("<?php echo $class_id ?>", "<?php echo $section_id ?>", "<?php echo $subject_group_id ?>", "<?php echo $subject_id ?>", 'subid');

    });

    $(document).ready(function(e) {
        $("#formedit").on('submit', (function(e) {
            e.preventDefault();
            $.ajax({
                url: "<?php echo site_url("homework/edit") ?>",
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function(res) {

                    if (res.status == "fail") {

                        var message = "";
                        $.each(res.error, function(index, value) {

                            message += value;
                        });
                        errorMsg(message);

                    } else {

                        successMsg(res.message);

                        window.location.reload(true);
                    }
                }
            });
        }));

    });


    function evaluation(id) {
        $('#evaluation').modal('show');
        $('#evaluation_details').html("");
        $.ajax({
            url: '<?php echo base_url(); ?>homework/evaluation/' + id,
            success: function(data) {
                $('#evaluation_details').html(data);

            },
            error: function() {
                alert("Fail")
            }
        });
    }

    function addhomework() {
        $('iframe').contents().find('.wysihtml5-editor').html("");
    }
</script>
<script type="text/javascript">
    var save_method; //for save method string
    var update_id; //for save method string

    function getSectionByClass(class_id, section_id, select_control) {
        if (class_id != "") {
            $('#' + select_control).html("");
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "sections/getByClass",
                data: {
                    'class_id': class_id
                },
                dataType: "json",
                beforeSend: function() {
                    $('#' + select_control).addClass('dropdownloading');
                },
                success: function(data) {
                    $.each(data, function(i, obj) {
                        var sel = "";
                        if (section_id == obj.section_id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                    });
                    $('#' + select_control).append(div_data);
                },
                complete: function() {
                    $('#' + select_control).removeClass('dropdownloading');
                }
            });
        }
    }


    $(document).ready(function() {
        $('#myModal').modal({
            backdrop: 'static',
            keyboard: false,
            show: false
        });
    });

    $(document).on('click', '.modal_form', function() {
        save_method = $(this).data('method_call');
        $(':input').val('');
        if (save_method == "edit") {
            update_id = $(this).data('record_id');
            $('#myModal').modal('show');
            $('#myModal .box-title').text('<?php echo $this->lang->line('edit_homework'); ?>');
        } else if (save_method == "add") {
            $('iframe').contents().find('.wysihtml5-editor').html("");
            $('#modal_record_id').val(0);
            $('#myModal .box-title').text('<?php echo $this->lang->line('add_homework'); ?>');
            $('#myModal').modal('show');
        } else {

        }

    });
    // $(document).on('change', '#modal_section_id', function() {
    //     var class_id = $('.modal_class_id').val();
    //     var section_id = $(this).val();
    //     getSubjectGroup(class_id, section_id, 0, 'modal_subject_group_id');
    // });

    // $(document).on('change', '#secid', function() {
    //     var class_id = $('#searchclassid').val();
    //     var section_id = $(this).val();
    //     getSubjectGroup(class_id, section_id, 0, 'subject_group_id');
    // });


    // $(document).on('change', '#modal_subject_group_id', function() {
    //     var class_id = $('.modal_class_id').val();
    //     var section_id = $('.modal_section_id').val();
    //     var subject_group_id = $(this).val();

    //     getsubjectBySubjectGroup(class_id, section_id, subject_group_id, 0, 'modal_subject_id');

    // });
    // $(document).on('change', '#subject_group_id', function() {
    //     var class_id = $('#searchclassid').val();
    //     var section_id = $('#secid').val();
    //     var subject_group_id = $(this).val();

    //     getsubjectBySubjectGroup(class_id, section_id, subject_group_id, 0, 'subid');

    // });

    $("#formadd").on('submit', (function(e) {
        e.preventDefault();

        var $this = $(this).find("button[type=submit]:focus");

        $.ajax({
            url: "<?php echo site_url("homework/create") ?>",
            type: "POST",
            data: new FormData(this),
            dataType: 'json',
            contentType: false,
            cache: false,
            processData: false,
            beforeSend: function() {
                $this.button('loading');

            },
            success: function(res) {

                if (res.status == "fail") {

                    var message = "";
                    $.each(res.error, function(index, value) {

                        message += value;
                    });
                    errorMsg(message);

                } else {

                    successMsg(res.message);

                    window.location.reload(true);
                }
            },
            error: function(xhr) { // if error occured
                alert("Error occured.please try again");
                $this.button('reset');
            },
            complete: function() {
                $this.button('reset');
            }

        });
    }));




    function getSubjectGroup(class_id, section_id, subjectgroup_id, subject_group_target) {
        if (class_id != "" && section_id != "") {

            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';

            $.ajax({
                type: 'POST',
                url: base_url + 'admin/subjectgroup/getGroupByClassandSection',
                data: {
                    'class_id': class_id,
                    'section_id': section_id
                },
                dataType: 'JSON',
                beforeSend: function() {
                    // setting a timeout
                    $('#' + subject_group_target).html("").addClass('dropdownloading');
                },
                success: function(data) {

                    $.each(data, function(i, obj) {
                        var sel = "";
                        if (subjectgroup_id == obj.subject_group_id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.subject_group_id + " " + sel + ">" + obj.name + "</option>";
                    });
                    $('#' + subject_group_target).append(div_data);
                },
                error: function(xhr) { // if error occured
                    alert("Error occured.please try again");

                },
                complete: function() {
                    $('#' + subject_group_target).removeClass('dropdownloading');
                }
            });
        }

    }

    function getsubjectBySubjectGroup(class_id, section_id, subject_group_id, subject_group_subject_id, subject_target) {
        if (class_id != "" && section_id != "" && subject_group_id != "") {

            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';

            $.ajax({
                type: 'POST',
                url: base_url + 'admin/subjectgroup/getGroupsubjects',
                data: {
                    'subject_group_id': subject_group_id
                },
                dataType: 'JSON',
                beforeSend: function() {
                    // setting a timeout
                    $('#' + subject_target).html("").addClass('dropdownloading');
                },
                success: function(data) {
                    console.log(data);
                    $.each(data, function(i, obj) {
                        var sel = "";
                        if (subject_group_subject_id == obj.id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.id + " " + sel + ">" + obj.name + "</option>";
                    });
                    $('#' + subject_target).append(div_data);
                },
                error: function(xhr) { // if error occured
                    alert("Error occured.please try again");

                },
                complete: function() {
                    $('#' + subject_target).removeClass('dropdownloading');
                }
            });
        }
    }


    $('#myModal').on('shown.bs.modal', function() {


        if (save_method == "edit") {
            $.ajax({
                url: base_url + "homework/getRecord",
                type: "POST",
                data: {
                    id: update_id
                },
                dataType: 'json',

                beforeSend: function() {

                    $('#myModal').addClass('modal_loading');
                },
                success: function(res) {
                    console.log(res);
                    $('#modal_record_id').val(res.id);
                    $("#submit_date").datepicker("update", new Date(res.submit_date));
                    $("#homework_date").datepicker("update", new Date(res.homework_date));
                    $('.modal_class_id').val(res.class_id);
                    $('.wysihtml5-sandbox').contents().find('.wysihtml5-editor').html(res.description);
                    $('.modal_class_id option[value=' + res.class_id + ']').attr('selected', 'selected');
                    getSectionByClass(res.class_id, res.section_id, 'modal_section_id');
                    getSubjectGroup(res.class_id, res.section_id, res.subject_groups_id, 'modal_subject_group_id');
                    getsubjectBySubjectGroup(res.class_id, res.section_id, res.subject_groups_id, res.subject_group_subject_id, 'modal_subject_id');
                    $('#myModal').removeClass('modal_loading');


                },
                error: function(xhr) { // if error occured
                    alert("Error occured.please try again");
                    $('#myModal').removeClass('modal_loading');
                },
                complete: function() {
                    $('#myModal').removeClass('modal_loading');
                }

            });
        }
    })
</script>
<script>
    $(document).ready(function() {
        emptyDatatable('homework-list', 'fees_data');
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('submit', '.assign_teacher_form', function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
            var $this = $(this).find("button[type=submit]:focus");
            var form = $(this);
            var url = form.attr('action');
            var form_data = form.serializeArray();
            $.ajax({
                url: url,
                type: "POST",
                dataType: 'JSON',
                data: form_data, // serializes the form's elements.
                beforeSend: function() {
                    $('[id^=error]').html("");
                    $this.button('loading');
                    resetFields($this.attr('name'));
                },
                success: function(response) { // your success handler

                    if (!response.status) {
                        $.each(response.error, function(key, value) {
                            $('#error_' + key).html(value);
                        });
                    } else {

                        initDatatable('homework-list', 'homework/dthomeworklist', response.params, [], 100);
                    }
                },
                error: function() { // your error handler
                    $this.button('reset');
                },
                complete: function() {
                    $this.button('reset');
                }
            });

        });

    });

    function resetFields(search_type) {
        if (search_type == "keyword_search") {
            $('#class_id').prop('selectedIndex', 0);
            $('#section_id').find('option').not(':first').remove();
        } else if (search_type == "class_search") {

            $('#search_text').val("");
        }
    }
</script>

<script>
    //Add Input Fields
    $(document).ready(function() {
        var max_fields = 10; //Maximum allowed input fields 
        var wrapper = $(".wrapper"); //Input fields wrapper
        var add_button = $(".add_fields"); //Add button class or ID
        var x = 1; //Initial input field is set to 1

        //When user click on add input button
        $(add_button).click(function(e) {
            e.preventDefault();
            //Check maximum allowed input fields
            if (x < max_fields) {
                x++; //input field increment
                //add input field
                $(wrapper).append('<div><input class="form-control filestyle" style="opacity: 1 !important" type="file"  name="userfile[]" placeholder="Upload Document" /> <a href="javascript:void(0);" class="remove_field">Remove</a></div>');
            }
        });

        //when user click on remove button
        $(wrapper).on("click", ".remove_field", function(e) {
            e.preventDefault();
            $(this).parent('div').remove(); //remove inout field
            x--; //inout field decrement
        })
    });
</script>




<script>
    /* On Change of Branch */
    $(document).on('change', '.branchOption', function() {
        onBrranchChange()
        let branch_id = $(this).val();
        let class_id = $(document).find('.classOption').find(":selected").val();
        let section_id = $(document).find('.sectionOption').find(":selected").val();
        let subject_group_id = $(document).find('.subjectgroupOption').find(":selected").val();
        onchangefunction(branch_id, class_id, section_id, subject_group_id);

    })

    /* On Change of Class */
    $(document).on('change', '.classOption', function() {
        searchClassFunction()
        let class_id = $(this).val();
        var branch_id = $(document).find('.branchOption').find(":selected").val();
        let section_id = $(document).find('.sectionOption').find(":selected").val();
        let subject_group_id = $(document).find('.subjectgroupOption').find(":selected").val();
        onchangefunction(branch_id, class_id, section_id, subject_group_id);

    })

    /* On Change of Section */
    $(document).on('change', '.sectionOption', function() {
        let section_id = $(this).val();
        var branch_id = $('.branchOption').find(":selected").val();
        let class_id = $('.classOption').find(":selected").val();
        let subject_group_id = $('.subjectgroupOption').find(":selected").val();
        onchangefunction(branch_id, class_id, section_id, subject_group_id);

    })

    /* On Change of Subject Group */
    $(document).on('change', '.subjectgroupOption', function() {
        let subject_group_id = $(this).val();
        var branch_id = $('.branchOption').find(":selected").val();
        let class_id = $('.classOption').find(":selected").val();
        let section_id = $('.sectionOption').find(":selected").val();
        onchangefunction(branch_id, class_id, section_id, subject_group_id);

    })




    /* On Change of Model Section */
    $(document).on('change', '.modelsectionOption', function() {
        let section_id = $(this).val();
        var branch_id = $('.modelbranchOption').find(":selected").val();
        let class_id = $('.modelclassOption').find(":selected").val();
        let subject_group_id = $('.modelsubjectgroupOption').find(":selected").val();

        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "homework/allOptionValue",
            data: {
                'branch_id': branch_id,
                'class_id': class_id,
                'section_id': section_id,
                'subject_group_id': subject_group_id,
            },
            dataType: "json",
            success: function(result) {
                let subject_group_details = result.subject_group_details;
                let subject = result.subject;
                /**
                 * Item Details Option data according to branch id
                 */
                if (subject_group_details) {
                    var html = '<option value = "">Select</option>';
                    for (var count = 0; count < subject_group_details.length; count++) {
                        html += '<option value="' + subject_group_details[count].id + '">' + subject_group_details[count].name + '</option>';
                    }
                    $('.subjectgroupOption').html(html);
                    $('.modelsubjectgroupOption').html(html);
                }
              


            }
        });







    })

    /* On Change of Model Subject Group */
    $(document).on('change', '.modelsubjectgroupOption', function() {
        let subject_group_id = $(this).val();
        var branch_id = $('.modelbranchOption').find(":selected").val();
        let class_id = $('.modelclassOption').find(":selected").val();
        let section_id = $('.modelsectionOption').find(":selected").val();
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "homework/allOptionValue",
            data: {
                'branch_id': branch_id,
                'class_id': class_id,
                'section_id': section_id,
                'subject_group_id': subject_group_id,
            },
            dataType: "json",
            success: function(result) {
                let subject_group_details = result.subject_group_details;
                let subject = result.subject;
               
                /**
                 * Item Details Option data according to branch id
                 */
                if (subject) {
                    var html = '<option value = "">Select</option>';
                    for (var count = 0; count < subject.length; count++) {
                        html += '<option value="' + subject[count].id + '">' + subject[count].name + '</option>';
                    }
                    $('.subjectOption').html(html);
                    $('.modelsubjectOption').html(html);
                }


            }
        });



    })

    /* Final Result after change option */
    function onchangefunction(branch_id, class_id, section_id, subject_group_id) {
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "homework/allOptionValue",
            data: {
                'branch_id': branch_id,
                'class_id': class_id,
                'section_id': section_id,
                'subject_group_id': subject_group_id,
            },
            dataType: "json",
            success: function(result) {
                let subject_group_details = result.subject_group_details;
                let subject = result.subject;
                console.log(result);
                /**
                 * Item Details Option data according to branch id
                 */
                if (subject_group_details) {
                    var html = '<option value = "">Select</option>';
                    for (var count = 0; count < subject_group_details.length; count++) {
                        html += '<option value="' + subject_group_details[count].id + '">' + subject_group_details[count].name + '</option>';
                    }
                    $('.subjectgroupOption').html(html);
                    $('.modelsubjectgroupOption').html(html);
                }
                /**
                 * Item Details Option data according to branch id
                 */
                if (subject) {
                    var html = '<option value = "">Select</option>';
                    for (var count = 0; count < subject.length; count++) {
                        html += '<option value="' + subject[count].id + '">' + subject[count].name + '</option>';
                    }
                    $('.subjectOption').html(html);
                    $('.modelsubjectOption').html(html);
                }


            }
        });
    }




    /**
     * On Change of branch Found Classes according to branch function
     */
    function onBrranchChange() {

        $('#secid').html('<option selected disabled >Select</option>');
        let branch_id = $("#branch").val();
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "classes/branchClasss",
            data: {
                'branch_id': branch_id,
            },
            dataType: "json",
            success: function(class_details) {
                console.log(class_details);
                /**
                 * Item Details Option data according to branch id
                 */
                if (class_details.length > 0) {
                    var html = '<option selected disabled >Select</option>';
                    for (var count = 0; count < class_details.length; count++) {
                        html += '<option value="' + class_details[count].id + '">' + class_details[count].class + '</option>';
                    }
                    $('#searchclassid').html(html);
                }
            }
        });
    }


    /**
     * On Chanege of Classes Found Section according to branch And Classes function
     */
    function searchClassFunction() {

        let branch_id = $("#branch_id").val();
        let class_id = $("#searchclassid").val();
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "classes/branchClasssSection",
            data: {
                'branch_id': branch_id,
                'class_id': class_id,
            },
            dataType: "json",
            success: function(section_details) {
                /**
                 * Item Details Option data according to branch id
                 */
                if (section_details.length > 0) {
                    var html = '<option selected disabled >Select</option>';
                    for (var count = 0; count < section_details.length; count++) {
                        html += '<option value="' + section_details[count].id + '">' + section_details[count].section + '</option>';
                    }
                    $('#secid').html(html);
                }
            }
        });
    }
</script>


<script>
    /**
     * On Change of branch Found Classes according to branch function
     */
    $("#branch_id").on('change', function() {
        $('#modal_section_id').html('<option selected disabled >Select</option>');
        let branch_id = $("#branch_id").val();
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "classes/branchClasss",
            data: {
                'branch_id': branch_id,
            },
            dataType: "json",
            success: function(class_details) {
                /**
                 * Item Details Option data according to branch id
                 */
                if (class_details.length > 0) {
                    var html = '<option selected disabled >Select</option>';
                    for (var count = 0; count < class_details.length; count++) {
                        html += '<option value="' + class_details[count].id + '">' + class_details[count].class + '</option>';
                    }
                    $('#modal_class_id').html(html);
                }
            }
        });
    })
    /**
     * On Chanege of Classes Found Section according to branch And Classes function
     */
    $("#modal_class_id").on('change', function() {
        let branch_id = $("#branch_id").val();
        let class_id = $("#modal_class_id").val();
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "classes/branchClasssSection",
            data: {
                'branch_id': branch_id,
                'class_id': class_id,
            },
            dataType: "json",
            success: function(section_details) {
                /**
                 * Item Details Option data according to branch id
                 */
                if (section_details.length > 0) {
                    var html = '<option selected disabled >Select</option>';
                    for (var count = 0; count < section_details.length; count++) {
                        html += '<option value="' + section_details[count].id + '">' + section_details[count].section + '</option>';
                    }
                    $('#modal_section_id').html(html);
                }
            }
        });
    })
</script>