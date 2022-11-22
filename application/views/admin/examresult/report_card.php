<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <i class="fa fa-map-o"></i> <?php echo $this->lang->line('examinations'); ?> <small><?php echo $this->lang->line('student_fee1'); ?></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>
                    <div class="box-body">

                        <form role="form" action="<?php echo site_url('admin/reportCardController') ?>" method="post" class="row">

                            <?php echo $this->customlib->getCSRF(); ?>
                            <div class="col-sm-6 col-lg-3 col-md-3">
                                <div class='form-group'>
                                    <label for='exampleInputEmail1'><?php echo $this->lang->line('branch'); ?></label><small class='req'> *</small>
                                    <select id='branch_id' name='branch_id' placeholder='' type='text' class='form-control'>
                                        <option selected disabled>Select</option>
                                        <?php foreach ($branch as $key => $value) {  ?>
                                            <option value='<?php echo $value['id'] ?>' <?php
                                                                                        if (set_value('branch_id') == $value['id']) {
                                                                                            echo "selected=selected";
                                                                                        }
                                                                                        ?>><?php echo $value['branch_name'] ?></option>
                                        <?php } ?>
                                    </select>
                                    <span class='text-danger'><?php echo form_error('branch'); ?></span>
                                </div>
                            </div>

                            <!--./col-md-3-->
                            <div class="col-sm-6 col-lg-3 col-md-3">

                                <div class="form-group">
                                    <label><?php echo $this->lang->line('session'); ?></label><small class="req"> *</small>
                                    <select id="session_id" name="session_id" class="form-control">
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        <?php
                                        foreach ($sessionlist as $session) {
                                        ?>
                                            <option value="<?php echo $session['id'] ?>" <?php
                                                                                            if (set_value('session_id') == $session['id']) {
                                                                                                echo "selected=selected";
                                                                                            }
                                                                                            ?>><?php echo $session['session'] ?></option>
                                        <?php
                                        }
                                        ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('session_id'); ?></span>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3 col-md-3">

                                <div class="form-group">
                                    <label><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
                                    <select id="class_id" name="class_id" class="form-control">
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        <?php
                                        foreach ($classlist as $class) {
                                        ?>
                                            <option value="<?php echo $class['id'] ?>" <?php
                                                                                        if (set_value('class_id') == $class['id']) {
                                                                                            echo "selected=selected";
                                                                                        }
                                                                                        ?>><?php echo $class['class'] ?></option>
                                        <?php
                                        }
                                        ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                </div>
                            </div>

                            <div class="col-sm-6 col-lg-3 col-md-3">

                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('section'); ?></label><small class="req"> *</small>
                                    <select id="section_id" name="section_id" class="form-control">
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        <?php foreach ($sectionlist as $section) { ?>
                                            <option value="<?php echo $section['id'] ?>" <?php if (set_value('section_id') == $section['id']) {
                                                                                                echo "selected=selected";
                                                                                            } ?>><?php echo $section['section'] ?></option>
                                        <?php $count++;
                                        } ?>

                                    </select>
                                    <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <button type="submit" name="search" value="search_filter" class="btn btn-primary pull-right btn-sm checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                </div>
                            </div>
                        </form>

                    </div>

                    <?php
                    if (isset($studentList)) {
                    ?>
                        <div class="box-header ptbnull"></div>
                        <!-- <div class="box-header ptbnull">
                            <h3 class="box-title titlefix"><i class="fa fa-users"></i> <?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('list'); ?></h3>
                            <button class="btn btn-info btn-sm printSelected pull-right" type="submit" name="generate" title="generate multiple certificate"><?php echo $this->lang->line('generate'); ?></button>
                        </div> -->
                        <div class="box-body">
                            <input type="hidden" name="session_id" value="<?php echo $session_id; ?>">
                            <!-- <input type="hidden" name="post_exam_group_id" value="<?php // echo $exam_group_id; 
                                                                                        ?>"> -->
                            <div class="tab-pane active table-responsive no-padding" id="tab_1">
                                <table class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th><?php echo $this->lang->line('admission_no'); ?></th>
                                            <th><?php echo $this->lang->line('student_name'); ?></th>
                                            <th><?php echo $this->lang->line('father_name'); ?></th>
                                            <th><?php echo $this->lang->line('date_of_birth'); ?></th>
                                            <th><?php echo $this->lang->line('gender'); ?></th>
                                            <th><?php echo $this->lang->line('category'); ?></th>
                                            <th class=""><?php echo $this->lang->line('mobile_no'); ?></th>
                                            <th><?php echo $this->lang->line('download'); ?></th>
                                            <!-- <th><?php echo $this->lang->line('download'); ?></th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        if (empty($studentList)) {
                                        ?>

                                            <?php
                                        } else {
                                            $count = 1;
                                            foreach ($studentList as $student_key => $student_value) {
                                                $student_value = (object) $student_value;
                                                // echo "<pre>";
                                                // print_r($student_value);
                                                // exit;
                                            ?>
                                                <tr>

                                                    <td><?php echo $student_value->admission_no; ?></td>
                                                    <td>
                                                        <a href="<?php echo base_url(); ?>student/view/<?php echo $student_value->id; ?>"><?php echo $student_value->firstname . ' ' . $student_value->middlename; ?>
                                                        </a>
                                                    </td>

                                                    <td><?php echo $student_value->father_name;;
                                                        ?></td>
                                                    <td><?php
                                                        if (!empty($student_value->dob) && $student_value->dob != '0000-00-00') {
                                                            echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($student_value->dob));
                                                        } ?></td>
                                                    <td><?php echo $student_value->gender; ?></td>
                                                    <td><?php echo $student_value->category; ?></td>
                                                    <td><?php echo $student_value->mobileno; ?></td>
                                                    <td><a tabindex="-1" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#studentDetailsModal" href="#" id="student_details_form" data-class_id="<?= $student_value->class_id ?>" data-section_id="<?= $student_value->section_id ?>" data-branch_id="<?= $student_value->student_branch_id ?>" data-student_id="<?= $student_value->id ?>" data-session_id="<?= $session_id ?>">Generate</a></td>
                                                    <!-- <td> <a href='<?php echo base_url() ?>/admin/reportCardController/download/<?php echo $student_value->class_id; ?>/<?php echo $student_value->section_id; ?>/<?php echo $student_value->student_branch_id; ?>/<?php echo $student_value->id; ?>/<?= $session_id ?>' id="download" target="blank" class="btn btn-info">Download</a></td> -->
                                                </tr>
                                        <?php
                                                $count++;
                                            }
                                        }
                                        ?>
                                    </tbody>

                                </table>
                            </div>
                        </div>

                </div>
            <?php
                    }
            ?>
            </div>
        </div>
    </section>
</div>
<div id="studentDetailsModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel"> <?php echo $this->lang->line('student') . " " . $this->lang->line('details'); ?></h4>
            </div>
            <div class="modal-body studentDetailsModalBody">
                <table cellpadding="6" width="100%" style="
      text-align: center;
      border-collapse: collapse;
      margin-top: 5px;
      border: 1px solid black;
      " id="result-preview">
      <thead>
          <tr>
              <th style="
  border: 1px solid black;
  border-top: 2px solid black;
  border-left: 2px solid black;
  " rowspan="3">
                  SUBJECT
              </th>
              <th style="border: 1px solid black; border-top: 2px solid black" colspan="3">
                  TERM-I
              </th>
              <th style="border: 1px solid black; border-top: 2px solid black" colspan="3">
                  TERM-II
              </th>
              <th style="
  border: 1px solid black;
  border-top: 2px solid black;
  border-right: 2px solid black;
  " rowspan="2">
                  TOTAL
              </th>
          </tr>
          <tr>
              <th style="border: 1px solid black; ">UT-I</th>
              <th style="border: 1px solid black;">HALF YEARLY</th>
              <th style="border: 1px solid black; ">TERM TOTAL</th>
              <th style="border: 1px solid black; ">UT-II</th>
              <th style="border: 1px solid black; ">FINAL TERM</th>
              <th style="border: 1px solid black; ">TERM TOTAL</th>
          </tr>
          <tr>
              <th style="border: 1px solid black">(10)</th>
              <th style="border: 1px solid black">(40)</th>
              <th style="border: 1px solid black">(50)</th>
              <th style="border: 1px solid black">(10)</th>
              <th style="border: 1px solid black">(40)</th>
              <th style="border: 1px solid black">(50)</th>
              <th style="border: 1px solid black; border-right: 2px solid black">
                  (100)
              </th>
          </tr>
      </thead>
      <tbody></tbody>
                  
                </table>













                <form id="adharCardForm" action="<?php echo base_url() ?>/admin/reportCardController/download" method="post" target="_blank">
                    <div class="bozero">
                        <div class="around10">
                            <div class="row">
                                <input type="hidden" name="class_id" id="class_id_input">
                                <input type="hidden" name="section_id" id="section_id_input">
                                <input type="hidden" name="student_id" id="student_id_input">
                                <input type="hidden" name="session_id" id="session_id_input">
                                <input type="hidden" name="branch_id" id="branch_id_input">
                                <div class="col-md-3">
                                    <label for="exampleInputEmail1">Remarks</label>
                                </div>
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <input autofocus="" id="remarks" name="remarks" placeholder="" type="text" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-info pull-right">Downlod</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<script>
    $(document).on('click', '#student_details_form', function() {
        var class_id = $(this).data('class_id');
        var section_id = $(this).data('section_id');
        var student_id = $(this).data('student_id');
        var session_id = $(this).data('session_id');
        var branch_id = $(this).data('branch_id');
        $.ajax({
            type: "POST",
            url: base_url + "admin/reportCardController/remarks",
            data: {
                'class_id': class_id,
                'section_id': section_id,
                'student_id': student_id,
                'session_id': session_id,
                'branch_id': branch_id,
            },
            dataType: "JSON",
            success: function(data) {
                
                $('#result-preview tbody').empty();
                const apendData = []

                Object.keys(data.final_report).forEach(function(key) {
                    // console.log(data.final_report[key]);
                    apendData.push({
                        subName : key,
                        marks: data.final_report[key].map(item=> !item ? "-" : +item.marks_get)
                    })
                });

                apendData.map(item=>{
                    const markTd = item.marks.map(mark=> {
                        return (`<td style="border: 1px solid black">${mark}</td>`)
                    })
                    $('#result-preview tbody').append(`
                        <tr>
                            <td style="border: 1px solid black;text-align: start;border-left: 2px solid black;">${item.subName}</td>
                            ${markTd}
                            </tr>
                            `)
                        })
                $("#class_id_input").val(class_id)
                $("#section_id_input").val(section_id)
                $("#student_id_input").val(student_id)
                $("#session_id_input").val(session_id)
                $("#branch_id_input").val(branch_id)
                $("#remarks").val(data.report_card_remarks_details)



            }
        });


    })
</script>



<!-- <script>
    $(document).ready(function() {
        $('#adharCardForm').validate({
            submitHandler: function(form) {
                var base_url = '<?php echo base_url() ?>';
                let formData = new FormData(document.getElementById('adharCardForm'));
                $.ajax({
                    type: "POST",
                    url: base_url + "admin/reportCardController/download",
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
</script> -->



<script type="text/javascript">
    $(document).ready(function() {
        $('.select2').select2();

    });
    var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy']) ?>';
    var class_id = '<?php echo set_value('class_id') ?>';
    var section_id = '<?php echo set_value('section_id') ?>';
    var session_id = '<?php echo set_value('session_id') ?>';
    var exam_group_id = '<?php echo set_value('exam_group_id') ?>';
    var exam_id = '<?php echo set_value('exam_id') ?>';
    getExamByExamgroup(exam_group_id, exam_id);
    $(document).on('change', '#exam_group_id', function(e) {
        $('#exam_id').html("");
        var exam_group_id = $(this).val();
        getExamByExamgroup(exam_group_id, 0);
    });





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
                    $('#exam_id').trigger('change');
                },
                complete: function() {
                    $('#exam_id').removeClass('dropdownloading');
                }
            });
        }
    }
</script>
<script>
    $(document).on('submit', 'form#printMarksheet', function(e) {

        e.preventDefault();
        var form = $(this);
        var subsubmit_button = $(this).find(':submit');
        var formdata = form.serializeArray();

        var list_selected = $('form#printMarksheet input[name="exam_group_class_batch_exam_student_id[]"]:checked').length;
        if (list_selected > 0) {
            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: formdata, // serializes the form's elements.
                dataType: "JSON", // serializes the form's elements.
                beforeSend: function() {
                    subsubmit_button.button('loading');
                },
                success: function(response) {
                    Popup(response.page);
                },
                error: function(xhr) { // if error occured

                    alert("Error occured.please try again");
                    subsubmit_button.button('reset');
                },
                complete: function() {
                    subsubmit_button.button('reset');
                }
            });
        } else {
            confirm("<?php echo $this->lang->line('please_select_student'); ?>");
        }
    });


    $(document).on('click', '#select_all', function() {
        $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
    });
</script>
<script type="text/javascript">
    var base_url = '<?php echo base_url() ?>';

    function Popup(data) {

        var frame1 = $('<iframe />');
        frame1[0].name = "frame1";
        $("body").append(frame1);
        var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
        frameDoc.document.open();
        //Create a new HTML document.
        frameDoc.document.write('<html>');
        frameDoc.document.write('<head>');
        frameDoc.document.write('<title></title>');
        frameDoc.document.write('</head>');
        frameDoc.document.write('<body>');
        frameDoc.document.write(data);
        frameDoc.document.write('</body>');
        frameDoc.document.write('</html>');
        frameDoc.document.close();
        setTimeout(function() {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            frame1.remove();
        }, 500);
        return true;
    }
</script>
<script>
    $("#branch_id").on('change', function() {
        $('#exam_id').html("<option>Select</option>");
        let branch_id = $(this).val();
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "POST",
            url: base_url + "admin/examresult/optionDatamarksheet",
            data: {
                'branch_id': branch_id
            },
            dataType: "json",
            success: function(result) {
                var examgroup_result = result.examgroup_result;
                var marksheet_result = result.marksheet_result;
                /**
                 * Item Details Option data according to branch id
                 */
                if (examgroup_result) {
                    var html = '<option selected disabled>Select</option>';
                    for (var count = 0; count < examgroup_result.length; count++) {
                        html += '<option value="' + examgroup_result[count].id + '">' + examgroup_result[count].name + '</option>';
                    }
                    $('#exam_group_id').html(html);
                }
                if (marksheet_result) {
                    var html = '<option selected disabled>Select</option>';
                    for (var count = 0; count < marksheet_result.length; count++) {
                        html += '<option value="' + marksheet_result[count].id + '">' + marksheet_result[count].template + '</option>';
                    }
                    $('#marksheet').html(html);
                }
            }
        });
    })
</script>




<!-- [
    {
        sub:'asdfkj',
        marks: [{0:10},{1:30}, {2:20}]
    },
    {},
    {},
    {},


] -->