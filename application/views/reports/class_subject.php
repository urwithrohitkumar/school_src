<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<style type="text/css">
    /*REQUIRED*/
    .carousel-row {
        margin-bottom: 10px;
    }

    .slide-row {
        padding: 0;
        background-color: #ffffff;
        min-height: 150px;
        border: 1px solid #e7e7e7;
        overflow: hidden;
        height: auto;
        position: relative;
    }

    .slide-carousel {
        width: 20%;
        float: left;
        display: inline-block;
    }

    .slide-carousel .carousel-indicators {
        margin-bottom: 0;
        bottom: 0;
        background: rgba(0, 0, 0, .5);
    }

    .slide-carousel .carousel-indicators li {
        border-radius: 0;
        width: 20px;
        height: 6px;
    }

    .slide-carousel .carousel-indicators .active {
        margin: 1px;
    }

    .slide-content {
        position: absolute;
        top: 0;
        left: 20%;
        display: block;
        float: left;
        width: 80%;
        max-height: 76%;
        padding: 1.5% 2% 2% 2%;
        overflow-y: auto;
    }

    .slide-content h4 {
        margin-bottom: 3px;
        margin-top: 0;
    }

    .slide-footer {
        position: absolute;
        bottom: 0;
        left: 20%;
        width: 78%;
        height: 20%;
        margin: 1%;
    }

    /* Scrollbars */
    .slide-content::-webkit-scrollbar {
        width: 5px;
    }

    .slide-content::-webkit-scrollbar-thumb:vertical {
        margin: 5px;
        background-color: #999;
        -webkit-border-radius: 5px;
    }

    .slide-content::-webkit-scrollbar-button:start:decrement,
    .slide-content::-webkit-scrollbar-button:end:increment {
        height: 5px;
        display: block;
    }
</style>

<div class="content-wrapper" style="min-height: 946px;">

    <section class="content-header">
        <h1>
            <i class="fa fa-bus"></i> <?php echo $this->lang->line('transport'); ?>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <?php $this->load->view('reports/_studentinformation') ?>
        <div class="row">
            <div class="col-md-12">
                <div class="box removeboxmius">
                    <div class="box-header ptbnull"></div>
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>

                    <form role="form" action="<?php echo site_url('report/class_subject') ?>" method="post" class="" id="reportform">
                        <div class="box-body row">

                            <?php echo $this->customlib->getCSRF(); ?>
                            <div class="col-sm-4 col-md-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('branch'); ?></label><small class="req"> *</small>
                                    <select id="branch_id" name="branch_id" placeholder="" type="text" class="form-control">
                                        <option disabled selected><?php echo $this->lang->line('select'); ?></option>
                                        <?php foreach ($branch as $key => $value) {  ?>
                                            <option value="<?php echo $value["id"] ?>"><?php echo $value["branch_name"] ?></option>
                                        <?php } ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('branch'); ?></span>
                                </div>
                            </div>


                            <div class="col-sm-4 col-md-3">
                                <div class="form-group">
                                    <label><?php echo $this->lang->line('class'); ?><small class="req"> *</small></label>
                                    <select autofocus="" id="class_id" name="class_id" class="form-control">
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>
                                       
                                    </select>
                                    <span class="text-danger" id="error_class_id"></span>
                                </div>
                            </div>

                            <div class="col-sm-4 col-md-3">
                                <div class="form-group">
                                    <label><?php echo $this->lang->line('section'); ?><small class="req"> *</small></label>
                                    <select id="section_id" onchange="getSubjects()" name="section_id" class="form-control">
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        
                                    </select>
                                    <span class="text-danger" id="error_section_id"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-12">
                                    <button type="submit" name="search" value="search_filter" class="btn btn-primary btn-sm checkbox-toggle pull-right"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                </div>
                            </div>
                        </div>
                    </form>


                    <div class="">
                        <div class="box-header ptbnull"></div>
                        <div class="box-header ptbnull">
                            <h3 class="box-title titlefix"><i class="fa fa-money"></i> <?php echo form_error('student'); ?> <?php echo $this->lang->line('class') . "-" . $this->lang->line('subject') . " " . $this->lang->line('report'); ?></h3>
                        </div>
                        <div class="box-body table-responsive">
                            <div class="download_label"><?php
                                                        echo $this->lang->line('class') . "-" . $this->lang->line('subject') . " " . $this->lang->line('report');

                                                        $this->customlib->get_postmessage();
                                                        ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead class="header">
                                    <tr>
                                        <th><?php echo $this->lang->line('class'); ?></th>
                                        <th><?php echo $this->lang->line('section'); ?></th>
                                        <th><?php echo $this->lang->line('subject'); ?></th>
                                        <th><?php echo $this->lang->line('teacher'); ?></th>
                                        <th><?php echo $this->lang->line('time'); ?></th>
                                        <th><?php echo $this->lang->line('room_no'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    foreach ($subjects as $value) {
                                    ?>
                                        <tr>
                                            <td><?php echo $value[0]->class_name; ?></td>
                                            <td><?php echo $value[0]->section_name; ?></td>
                                            <td><?php echo $value[0]->subject_name; ?></td>
                                            <td><?php
                                                foreach ($value as $teacher) {
                                                    $class_teacher = '';
                                                    if ($teacher->class_teacher == $teacher->staff_id) {
                                                        $class_teacher = ' <span class="label label-success">' . $this->lang->line('class') . ' ' . $this->lang->line('teacher') . '</span>';
                                                    }
                                                    echo $teacher->name . " " . $teacher->surname . " (" . $teacher->employee_id . ")" . $class_teacher . " <br>";
                                                }
                                                ?></td>
                                            <td><?php
                                                foreach ($value as $teacher) {

                                                    echo $teacher->day . " " . $teacher->time_from . " To " . $teacher->time_to . "</br>";
                                                }
                                                ?></td>

                                            <td><?php
                                                foreach ($value as $teacher) {

                                                    echo $teacher->room_no . "</br>";
                                                }
                                                ?></td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</section>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('submit', '#reportform', function(e) {
            // e.preventDefault(); // avoid to execute the actual submit of the form.
            var $this = $(this).find("button[type=submit]:focus");
            var form = $(this);
            var url = form.attr('action');
            var form_data = form.serializeArray();
            // form_data.push({name: 'search_type', value: $this.attr('value')});

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

                        initDatatable('record-list', 'report/dtclasssubjectreport', response.params);
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