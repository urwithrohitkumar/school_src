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
            <i class="fa fa-line-chart"></i> <?php echo $this->lang->line('reports'); ?>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <?php $this->load->view('reports/_studentinformation'); ?>
        <div class="row">
            <div class="col-md-12">
                <div class="box removeboxmius">
                    <div class="box-header ptbnull"></div>
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>
                    <div class="box-body">
                        <form role="form" action="<?php echo site_url('admin/users/searchloginvalidation') ?>" method="post" class="" id="reportform">
                            <div class="row">

                                <?php echo $this->customlib->getCSRF(); ?>

                                <div class="col-sm-4 col-md-4">
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

                                <div class="col-sm-4 col-md-4">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('class'); ?><small class="req"> *</small></label>
                                        <select autofocus="" id="class_id" name="class_id" class="form-control">
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                           
                                        </select>
                                        <span class="text-danger" id="error_class_id"></span>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-md-4">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('section'); ?><small class="req"> *</small></label>
                                        <select autofocus="" id="section_id" name="section_id" class="form-control">
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
                            <!--./row-->
                        </form>
                    </div>
                    <!--./box-body-->
                    <div class="box-header ptbnull"></div>

                    <div class="">
                        <div class="box-header ptbnull">
                            <h3 class="box-title titlefix"><i class="fa fa-users"></i> <?php echo $this->lang->line('login_credential'); ?> <?php echo $this->lang->line('report'); ?></h3>
                        </div>
                        <div class="box-body table-responsive">
                            <div class="download_label"><?php echo $this->lang->line('login_credential'); ?> <?php echo $this->lang->line('report') . "<br>";
                                                                                                                $this->customlib->get_postmessage();
                                                                                                                ?></div>
                            <table class="table table-striped table-bordered table-hover student-list" data-export-title="<?php echo $this->lang->line('login_credential'); ?>">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('admission_no'); ?></th>
                                        <th><?php echo $this->lang->line('student_name'); ?></th>
                                        <th><?php echo $this->lang->line('username'); ?></th>
                                        <th><?php echo $this->lang->line('password'); ?></th>
                                        <th><?php echo $this->lang->line('parent'); ?> <?php echo $this->lang->line('username'); ?></th>
                                        <th><?php echo $this->lang->line('parent'); ?> <?php echo $this->lang->line('password'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!--./box box-primary-->
            </div>
            <!--./col-md-12-->
        </div>
</div>
</section>
</div>

<script>
    $(document).ready(function() {
        emptyDatatable('student-list', 'data');
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('submit', '#reportform', function(e) {
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
                },
                success: function(response) { // your success handler

                    if (!response.status) {
                        $.each(response.error, function(key, value) {
                            $('#error_' + key).html(value);
                        });
                    } else {

                        initDatatable('student-list', 'admin/users/dtcredentialreportlist', response.params);
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
</script>