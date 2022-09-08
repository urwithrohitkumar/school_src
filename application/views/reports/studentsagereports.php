<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-line-chart"></i> <?php echo $this->lang->line('reports'); ?> <small> <?php echo $this->lang->line('filter_by_name1'); ?></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <?php $this->load->view('reports/_studentinformation'); ?>
        <div class="row">
            <div class="col-md-12">

                <div class="box removeboxmius">

                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><i class="fa fa-users"></i> <?php echo $this->lang->line('student_age_report'); ?> </h3>
                    </div>
                    <div class="box-body table-responsive">
                        <?php
                        if (!empty($students_list)) {
                        ?>
                            <div class="download_label"><?php echo $this->lang->line('student_age_report'); ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>
                                        <th class="text text-center" colspan="43"><?php echo $this->lang->line('age_report_title'); ?></th>
                                    </tr>
                                    <tr>
                                        <th class="text text-center" ><?php echo $this->lang->line('class'); ?></th>

                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('pre_nur'); ?></th>

                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('pp_kg'); ?></th>
                                        
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_1'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_2'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_3'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_4'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_5'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_6'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_7'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_8'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_9'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_10'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_11'); ?></th>
                                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_12'); ?></th>
                                    </tr>
                                    <tr>
                                        <th><?php echo $this->lang->line('age'); ?></th>

                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                        <th><?php echo $this->lang->line('b'); ?></th>
                                        <th><?php echo $this->lang->line('g'); ?></th>
                                        <th><?php echo $this->lang->line('t'); ?></th>
                                   

                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    foreach ($students_list as $students_list_key => $students_list_value) {
                                    ?>
                                        <tr>
                                            <td class="text text-center"><?php echo $students_list_key  ?></td>
                                        </tr>
                                    <?php
                                    }

                                    ?>
                                </tbody>
                            </table>
                        <?php
                        } else {
                        ?>
                            <div class="alert alert-info">

                                <?php
                                echo '<pre>';
                                print_r($students_list['<4']);
                                ?>



                                <?php echo $this->lang->line('no_record_found'); ?>
                            </div>
                        <?php
                        }
                        ?>
                    </div>
                </div>
            </div>
            <!--./box box-primary -->
        </div><!-- ./col-md-12 -->
    </section>
</div>




<div id="studentModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-xl">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo $this->lang->line('student') . ' ' . $this->lang->line('list'); ?></h4>
            </div>

            <div class="modal-body">

            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function() {
        $('#studentModal').modal({
            backdrop: 'static',
            keyboard: false,
            show: false
        });
    });

    $(document).on('click', '.studentlist', function() {
        var $this = $(this);
        var date = $this.data('date');

        $.ajax({
            type: 'POST',
            url: baseurl + "student/getStudentByClassSection",
            data: {
                'cls_section_id': $this.data('clssectionId')
            },
            dataType: 'JSON',
            beforeSend: function() {
                $this.button('loading');
            },
            success: function(data) {
                $('#studentModal .modal-body').html(data.page);
                $('#studentModal').modal('show');
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
</script>