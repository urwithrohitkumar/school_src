<style type="text/css">
    .loading-overlay {
        display: none;
        position: absolute;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        z-index: 2;
        background: rgba(255, 255, 255, 0.7);
    }

    .overlay-content {
        position: absolute;
        transform: translateY(-50%);
        -webkit-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        top: 50%;
        left: 0;
        right: 0;
        text-align: center;
        color: #555;
    }

    .div_load {
        position: relative;
    }

    .ans_checkbox {
        display: none;
    }

    .option_list {
        display: none;
    }

    .ans {
        display: none;
    }

    .ans_true_false {
        display: none;
    }
</style>
<script src="<?php echo base_url(); ?>backend/plugins/ckeditor/ckeditor.js"></script>
<script src="<?php echo base_url(); ?>backend/js/ckeditor_config.js"></script>

<div class="content-wrapper">
    <section class="content-header">
        <h1><i class="fa fa-bus"></i> <?php echo $this->lang->line('question'); ?></h1>
    </section>
    <section class="content">
        <div class="row">

            <div class="col-md-12">
                <div class="box box-primary" id="route">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix pt5"><?php echo $this->lang->line('question') . " " . $this->lang->line('bank'); ?></h3>

                        <div class="pull-right">
                            <button class="btn btn-primary btn-sm deleteSelected" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Please wait..."><i class="fa fa-trash"></i> <?php echo $this->lang->line('bulk_delete'); ?></button>
                            <?php
                            if ($this->rbac->hasPrivilege('import_question', 'can_view')) {
                            ?>
                                <button class="btn btn-primary btn-sm import-question" data-toggle="modal" data-target="#myQuesImportModal"><i class="fa fa-plus"></i> <?php echo $this->lang->line('import'); ?></button>

                            <?php }
                            if ($this->rbac->hasPrivilege('question_bank', 'can_add')) {
                            ?>
                                <button class="btn btn-primary btn-sm question-btn" data-recordid="0" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Please wait..."><i class="fa fa-plus"></i> <?php echo $this->lang->line('add') . " " . $this->lang->line('question'); ?></button>
                            <?php } ?>
                        </div>


                    </div>
                    <div class="box-body">
                        <div class="mailbox-controls">
                            <div class="pull-right">
                            </div>
                        </div>
                        <div class="mailbox-messages table-responsive">


                            <!-- <textarea class="form-control question" id="question" name="question"></textarea> -->
                            <table class="table table-striped table-bordered table-hover all-list" data-export-title="<?php echo $this->lang->line('question') . " " . $this->lang->line('bank'); ?>">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="masterCheck" value="checkUncheckAll"></th>
                                        <th><?php echo $this->lang->line('q_id'); ?></th>
                                        <th><?php echo $this->lang->line('branch'); ?></th>
                                        <th><?php echo $this->lang->line('subject') ?></th>
                                        <th><?php echo $this->lang->line('question_type') ?></th>
                                        <th><?php echo $this->lang->line('level'); ?></th>
                                        <th><?php echo $this->lang->line('question') ?></th>
                                        <th class="pull-right no-print"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>


                            </table>

                        </div>
                    </div>
                </div>
            </div>

        </div>

    </section>
</div>


<?php
function findOption($questionOpt, $find)
{

    foreach ($questionOpt as $quet_opt_key => $quet_opt_value) {
        if ($quet_opt_key == $find) {
            return $quet_opt_value;
        }
    }
    return false;
}

?>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-xl">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo $this->lang->line('question') ?></h4>
            </div>
            <form action="<?php echo site_url('admin/question/add'); ?>" method="POST" id="formsubject">
                <div class="modal-body add_question_body">

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="load" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Saving..."><?php echo $this->lang->line('save') ?></button>
                </div>
        </div>
        </form>
    </div>
</div>


<!-- Modal -->
<div id="myimgModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-xl">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title imgModal-title"><?php echo $this->lang->line('images'); ?> </h4>
            </div>
            <div class="modal-body imgModal-body pupscroll">
                <div class="form-group">
                    <input type="text" name="search_box" id="search_box" class="form-control" placeholder="<?php echo $this->lang->line('search') ?>..." />
                </div>
                <div class="div_load">

                    <div class="loading-overlay">
                        <div class="overlay-content"> <?php echo $this->lang->line('loading'); ?> </div>
                    </div>
                    <label class="total displaynone"></label>
                    <div class="row" id="media_div">

                    </div>
                    <div class="row" id="pagination">

                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $this->lang->line('cancel'); ?> </button>
                <button type="button" class="btn btn-primary add_media"><?php echo $this->lang->line('add'); ?></button>
            </div>
        </div>

    </div>
</div>
<div id="myQuesImportModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <a class="btn btn-primary pull-right btn-xs mt5" href="<?php echo site_url('admin/question/exportformat'); ?>" target="_blank"><i class="fa fa-download"></i> </a>
                <h4 class="modal-title"> <?php echo $this->lang->line('import_question'); ?></h4>
            </div>
            <form action="<?php echo site_url('admin/question/uploadfile'); ?>" method="POST" id="formimportquestion">
                <div class="modal-body add_question_import_body">
                    <div class="form-group">
                        <label><?php echo $this->lang->line('subject'); ?></label><small class="req"> *</small>
                        <select autofocus="" id="subject_id" name="subject_id" class="form-control">
                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                            <?php foreach ($subjectlist as $subject) {
                                $sub_code = ($subject['code'] != "") ? " (" . $subject['code'] . ")" : ""; ?>
                                <option value="<?php echo $subject['id'] ?>" <?php
                                                                                if (set_value('subject_id') == $subject['id']) {
                                                                                    echo "selected=selected";
                                                                                } ?>><?php echo $subject['name'] . $sub_code; ?></option>
                            <?php } ?>
                        </select>
                        <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                    </div>
                    <div class="form-group">
                        <label><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
                        <select autofocus="" id="class_id" name="class_id" class="form-control">
                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                        </select>
                        <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1"><?php echo $this->lang->line('section'); ?></label><small class="req"> *</small>
                        <select id="section_id" name="section_id" class="form-control">
                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                        </select>
                        <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1"> <?php echo $this->lang->line('attach_file'); ?></label>
                        <input id="my-file-selector" name="file" placeholder="" type="file" class="filestyle form-control" value="<?php echo set_value('file'); ?>" />
                        <span class="text-danger"><?php echo form_error('file'); ?></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="load" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Saving..."><?php echo $this->lang->line('upload') ?></button>
                </div>
        </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    (function($) {
        'use strict';
        $(document).ready(function() {
            initDatatable('all-list', 'admin/question/getDatatable', [], [], 20, [{
                "bSortable": false,
                "aTargets": [0]
            }, {
                "bSortable": false,
                "aTargets": [-1],
                'sClass': 'dt-body-right'
            }]);
        });
    }(jQuery))
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $('#myModal,#myQuesImportModal').modal({
            backdrop: 'static',
            keyboard: false,
            show: false
        })


        $(document).on('click', '.question-btn', function() {
            var $this = $(this);
            var recordid = $(this).data('recordid');
            $('input[name=recordid]').val(recordid);
            $.ajax({
                type: 'POST',
                url: baseurl + "admin/question/addform",
                data: {
                    'recordid': recordid
                },
                dataType: 'JSON',
                beforeSend: function() {
                    $this.button('loading');
                },
                success: function(data) {

                    var ck = $('#myModal .add_question_body').html(data.page);
                    var elem = $('#myModal .add_question_body').find('.ckeditor');
                    $(elem).each(function(_, ckeditor) {

                        CKEDITOR.replace(ckeditor, {
                            toolbar: 'Ques',
                            allowedContent: true,
                            extraPlugins: 'ckeditor_wiris',
                            enterMode: CKEDITOR.ENTER_BR,
                            shiftEnterMode: CKEDITOR.ENTER_P,
                            customConfig: baseurl + '/backend/js/ckeditor_config.js'
                        });
                    });
                    $('#myModal').modal('show');
                    $this.button('reset');
                },
                error: function(xhr) { // if error occured
                    alert("Error occured.please try again");
                    $this.button('reset');
                },
                complete: function() {
                    $this.button('reset');
                }
            });


        });

        $(document).on('click', '.question-btn-edit', function() {
            var $this = $(this);
            var recordid = $this.data('recordid');
            $('input[name=recordid]').val(recordid);
            $.ajax({
                type: 'POST',
                url: baseurl + "admin/question/editform",
                data: {
                    'recordid': recordid
                },
                dataType: 'JSON',
                beforeSend: function() {
                    $this.button('loading');
                },
                success: function(data) {
                    console.log(data);
                    if (data.status) {
                        var ck = $('#myModal .add_question_body').html(data.page);
                        var elem = $('#myModal .add_question_body').find('.ckeditor');
                        $(elem).each(function(_, ckeditor) {

                            CKEDITOR.replace(ckeditor, {
                                toolbar: 'Ques',
                                allowedContent: true,
                                extraPlugins: 'ckeditor_wiris',
                                enterMode: CKEDITOR.ENTER_BR,
                                shiftEnterMode: CKEDITOR.ENTER_P,
                                customConfig: baseurl + '/backend/js/ckeditor_config.js'
                            });
                        });
                        $('#myModal').modal('show');
                    }
                    $this.button('reset');
                },
                error: function(xhr) { // if error occured
                    alert("Error occured.please try again");
                    $this.button('reset');
                },
                complete: function() {
                    $this.button('reset');
                }
            });

        });



    });

    $("form#formimportquestion").submit(function(e) {
        //stop submit the form, we will post it manually.
        event.preventDefault();
        var form = $(this);
        var url = form.attr('action');
        var submit_button = form.find(':submit');
        var form_record = $('#formimportquestion')[0];
        // var file_data = $('#my-file-selector').prop('files')[0];
        var form_data = new FormData(form_record);
        // form_data.append('file', file_data);
        $.ajax({
            url: form.attr('action'),
            type: 'POST',
            dataType: 'JSON',
            data: form_data,
            contentType: false,
            cache: false,
            processData: false,
            beforeSend: function() {


            },
            success: function(data) {

                if (data.status == "0") {
                    var message = "";
                    $.each(data.error, function(index, value) {
                        message += value;
                    });
                    errorMsg(message);
                } else {
                    $('#formimportquestion')[0].reset();
                    successMsg(data.message);
                    location.reload();
                }
            },
            error: function(xhr) { // if error occured
                alert("Error occured.please try again");

            },
            complete: function() {


            }
        });
    });

    $("form#formsubject").submit(function(e) {

        e.preventDefault(); // avoid to execute the actual submit of the form.
        // $("span[id$='_error']").html("");
        var form = $(this);
        var url = form.attr('action');
        var submit_button = form.find(':submit');
        var post_params = form.serialize();

        for (instance in CKEDITOR.instances) {
            CKEDITOR.instances[instance].updateElement();
        }
        $.ajax({
            type: "POST",
            url: url,
            data: form.serialize(), // serializes the form's elements.
            dataType: "JSON", // serializes the form's elements.
            beforeSend: function() {
                $("[class$='_error']").html("");
                submit_button.button('loading');
            },
            success: function(data) {

                if (!data.status) {
                    var message = "";
                    $.each(data.error, function(index, value) {

                        message += value;

                    });
                    errorMsg(message);
                } else {
                    location.reload();
                }
            },
            error: function(xhr) { // if error occured
                submit_button.button('reset');
                alert("Error occured.please try again");

            },
            complete: function() {
                submit_button.button('reset');
            }
        });


    });
</script>


<script>
    $(document).ready(function() {
        var target_textbox = "";
        $(document).on('click', '#question,#opt_a,#opt_b,#opt_c,#opt_d,#opt_e', function() {
            getImages(1);
        });
    });

    function getImages(page, query = "") {
        $.ajax({
            type: "POST",
            url: baseurl + 'admin/question/getimages',
            data: {
                page: page,
                query: query
            },
            dataType: "JSON", // serializes the form's elements.
            beforeSend: function() {
                $('.loading-overlay').css("display", "block");
            },
            success: function(data) {

                $('label.total').html("").html("<?php echo $this->lang->line('total_record'); ?>: " + data.count).css("display", "block");

                $('.imgModal-body #media_div').html("").html(data.page);
                $('.imgModal-body #pagination').html("").html(data.pagination);
                $('.loading-overlay').css("display", "none");
            },
            error: function(xhr) { // if error occured

                alert("Error occured.please try again");
                $('.loading-overlay').css("display", "none");
            },
            complete: function() {
                $('.loading-overlay').css("display", "none");
            }
        });
    }


    $(document).on('click', '.img_div_modal', function(event) {
        $('.img_div_modal div.fadeoverlay').removeClass('active');
        $(this).closest('.img_div_modal').find('.fadeoverlay').addClass('active');

    });

    $(document).on('click', '.add_media', function(event) {

        var content_html = $('div#media_div').find('.fadeoverlay.active').find('img').data('img');
        var is_image = $('div#media_div').find('.fadeoverlay.active').find('img').data('is_image');
        var content_name = $('div#media_div').find('.fadeoverlay.active').find('img').data('content_name');
        var content_type = $('div#media_div').find('.fadeoverlay.active').find('img').data('content_type');
        var vid_url = $('div#media_div').find('.fadeoverlay.active').find('img').data('vid_url');
        var content = "";


        if (typeof content_html !== "undefined") {
            if (is_image === 1) {
                content = '<img src="' + content_html + '">';
            }
            InsertHTML(content);
            $('#myimgModal').modal('hide');
        }

    });

    function InsertHTML(content_html) {
        var aaa = target_textbox + "_textbox";
        // Get the editor instance that we want to interact with.
        var editor = CKEDITOR.instances[aaa];
        console.log(editor);


        // Check the active editing mode.
        if (editor.mode == 'wysiwyg') {
            editor.insertHtml(content_html);
        } else
            alert('You must be in WYSIWYG mode!');
    }
    $('#myimgModal').on('shown.bs.modal', function(event) {
        button = $(event.relatedTarget);
        target_textbox = button.data('location');
        console.log(target_textbox);
    })

    $('.modal').on("hidden.bs.modal", function(e) { //fire on closing modal box

        if ($('.modal:visible').length) { // check whether parent modal is opend after child modal close
            $('body').addClass('modal-open'); // if open mean length is 1 then add a bootstrap css class to body of the page
        }
    });

    function CKupdate() {
        for (instance in CKEDITOR.instances) {
            // CKEDITOR.instances[instance].updateElement();
            CKEDITOR.instances[instance].setData('');
        }
    }

    $(document).on('keyup', '#search_box', function(event) {
        var query = $('#search_box').val();
        getImages(1, query);

    });

    $(document).on('click', '.page-link', function() {
        var page = $(this).data('page_number');
        var query = $('#search_box').val();
        getImages(page, query);
    });


    $(document).on('change', '#question_type', function() {
        if ($(this).val() == "singlechoice") {
            $('.ans').show();
            $('.ans_true_false').hide();
            $('.ans_checkbox').hide();
            $('.option_list').show();
        } else if ($(this).val() == "true_false") {
            $('.ans').hide();
            $('.ans_true_false').show();
            $('.ans_checkbox').hide();
            $('.option_list').hide();

        } else if ($(this).val() == "multichoice") {
            $('.ans_true_false').hide();
            $('.ans_checkbox').show();
            $('.option_list').show();
            $('.ans').hide();
        } else if ($(this).val() == "descriptive") {
            $('.ans_true_false').hide();
            $('.ans_checkbox').hide();
            $('.option_list').hide();
            $('.ans').hide();

        }
    });
</script>

<script type="text/javascript">
    $(document).on('click', '#masterCheck', function() {
        if ($(this).prop("checked")) {
            $("input:checkbox[name^='question_']").prop("checked", true);
        } else {
            $("input:checkbox[name^='question_']").prop("checked", false);
        }
    });

    $(document).on('click', '.deleteSelected', function() {
        var array_delete = [];
        var $this = $(this);
        $.each($("input[name^='question_']:checked"), function() {
            var question_id = $(this).data('questionId');

            array_delete.push(question_id);
        });
        if (array_delete.length === 0) {
            alert("<?php echo $this->lang->line('no_record_selected'); ?>");
        } else {
            if (confirm("<?php echo $this->lang->line('delete_confirm') ?>")) {
                $.ajax({
                    type: 'POST',
                    url: baseurl + "admin/question/bulkdelete",
                    data: {
                        'recordid': array_delete
                    },
                    dataType: 'JSON',
                    beforeSend: function() {
                        $this.button('loading');
                    },
                    success: function(data) {
                        if (data.status) {
                            successMsg(data.message);
                            table.ajax.reload(null, false);
                        }
                        $this.button('reset');
                    },
                    error: function(xhr) { // if error occured
                        alert("Error occured.please try again");
                        $this.button('reset');
                    },
                    complete: function() {
                        $this.button('reset');
                    }
                });
            }

        }
    });
</script>