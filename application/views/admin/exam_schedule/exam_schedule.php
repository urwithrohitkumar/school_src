<?php ?>
<div class="content-wrapper" style="min-height: 946px;">

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>
                    <div class="box-body">

                        <form role="form" action="<?php echo site_url('admin/exam_schedule') ?>" method="post">

                            <?php echo $this->customlib->getCSRF(); ?>

                            <div class="row">
                            <div class="col-sm-6 col-lg-4 col-md-4 ">
                                    <div class='form-group'>
                                        <label for='exampleInputEmail1'><?php echo $this->lang->line('branch'); ?></label><small class='req'> *</small>
                                        <select id='branch_id' name='branch_id' placeholder='' type='text' class='form-control'>
                                            <option value="" selected disabled><?php echo $this->lang->line('select'); ?></option>
                                            <?php foreach ($branch as $key => $value) {  ?>
                                                <option value='<?php echo $value['id'] ?>'><?php echo $value['branch_name'] ?></option>
                                            <?php } ?>
                                        </select>
                                        <span class='text-danger'><?php echo form_error('branch'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4 col-md-4 ">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('exam') . " " . $this->lang->line('group'); ?></label><small class="req"> *</small>
                                        <select autofocus="" id="exam_group_id" name="exam_group_id" class="form-control">
                                            <option value="" selected disabled><?php echo $this->lang->line('select'); ?></option>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('exam_group_id'); ?></span>
                                    </div>
                                </div>
                                <!--./col-md-3-->
                                <div class="col-sm-6 col-lg-4 col-md-4 ">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('exam') ?></label><small class="req"> *</small>
                                        <select id="exam_id" name="exam_id" class="form-control">
                                            <option value="" selected disabled><?php echo $this->lang->line('select'); ?></option>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('exam_id'); ?></span>
                                    </div>
                                </div>
                                <!--./col-md-3-->


                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <button type="submit" name="search" value="search_filter" class="btn btn-primary pull-right btn-sm checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>

                    <div class="box-body">

                        <div class="box-header ptbnull"></div>
                        <h4 class="box-title box-title"><?php echo $this->lang->line('exam_schedule'); ?></h4>
                        <div class="box-header ptbnull">


                        </div>
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php echo $this->lang->line('exam_schedule'); ?></div>
                            <table class="table table-hover table-striped table-bordered example" id="subjects_table">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('subject') ?></th>
                                        <th><?php echo $this->lang->line('date') . " " . $this->lang->line('from') ?></th>
                                        <th><?php echo $this->lang->line('start') . " " . $this->lang->line('time'); ?></th>
                                        <th><?php echo $this->lang->line('duration') ?></th>
                                        <th><?php echo $this->lang->line('room') . " " . $this->lang->line('no') ?></th>
                                        <th><?php echo $this->lang->line('marks') . " (" . $this->lang->line('max') . ".)"; ?></th>
                                        <th><?php echo $this->lang->line('marks') . " (" . $this->lang->line('min') . ".)"; ?></th>


                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (!empty($exam_subjects)) {
                                        foreach ($exam_subjects as $exam_subject_key => $exam_subject_value) {
                                    ?>
                                            <tr>

                                                <td><?php echo $exam_subject_value->subject_name; ?></td>
                                                <td><?php echo date($this->customlib->getSchoolDateFormat(), strtotime($exam_subject_value->date_from)); ?></td>
                                                <td><?php echo $exam_subject_value->time_from; ?></td>
                                                <td><?php echo $exam_subject_value->duration; ?></td>

                                                <td><?php echo $exam_subject_value->room_no; ?></td>
                                                <td><?php echo $exam_subject_value->max_marks; ?></td>
                                                <td><?php echo $exam_subject_value->min_marks; ?></td>

                                            </tr>
                                    <?php
                                        }
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>








<script type="text/javascript">
    $(document).ready(function() {
        $('.select2').select2();

    });
    $(document).ready(function() {
        $.extend($.fn.dataTable.defaults, {
            searching: true,
            ordering: true,
            paging: false,
            retrieve: true,
            destroy: true,
            info: false
        });
    });

    var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy']) ?>';
    var class_id = '<?php echo set_value('class_id') ?>';
    var section_id = '<?php echo set_value('section_id') ?>';
    var session_id = '<?php echo set_value('session_id') ?>';
    var exam_group_id = '<?php echo set_value('exam_group_id') ?>';
    var exam_id = '<?php echo set_value('exam_id') ?>';
    getSectionByClass(class_id, section_id);


    getExamByExamgroup(exam_group_id, exam_id);
    $(document).on('change', '#exam_group_id', function(e) {
        $('#exam_id').html("");
        var exam_group_id = $(this).val();
        getExamByExamgroup(exam_group_id, 0);
    });

    $(document).on('change', '#class_id', function(e) {
        $('#section_id').html("");
        var class_id = $(this).val();
        getSectionByClass(class_id, 0);
    });

    function getSectionByClass(class_id, section_id) {

        if (class_id !== "") {
            $('#section_id').html("");
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
                    $('#section_id').addClass('dropdownloading');
                },
                success: function(data) {
                    $.each(data, function(i, obj) {
                        var sel = "";
                        if (section_id === obj.section_id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                },
                complete: function() {
                    $('#section_id').removeClass('dropdownloading');
                }
            });
        }
    }


    function getExamByExamgroup(exam_group_id, exam_id) {

        if (exam_group_id !== "") {
            $('#exam_id').html("");
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';


            $.ajax({
                type: "POST",
                url: base_url + "admin/examgroup/getExamByExamgroup",
                data: {
                    'exam_group_id': exam_group_id
                },
                dataType: "json",
                beforeSend: function() {
                    $('#exam_id').addClass('dropdownloading');
                },
                success: function(data) {
                    $.each(data, function(i, obj) {
                        var sel = "";
                        if (exam_id === obj.id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.id + " " + sel + ">" + obj.exam + "</option>";
                    });
                    $('#exam_id').append(div_data);
                },
                complete: function() {
                    $('#exam_id').removeClass('dropdownloading');
                }
            });
        }
    }



</script>
<script>
    $("#branch_id").on('change', function() {
        let branch_id = $(this).val();
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "admin/exam_schedule/branchOptiondata",
            data: {
                'branch_id': branch_id
            },
            dataType: "json",
            success: function(result) {
                console.log(result);
                /**
                 * Item Details Option data according to branch id
                 */
                if (result) {
                    var html = '<option selected disabled>Select</option>';
                    for (var count = 0; count < result.length; count++) {
                        html += '<option value="' + result[count].id + '">' + result[count].name + '</option>';
                    }
                    $('#exam_group_id').html(html);
                }
            }
        });
    })
</script>
