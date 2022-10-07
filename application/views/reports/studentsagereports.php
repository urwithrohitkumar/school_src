<?php
$className = !empty($students_list['<4']) ? $students_list['<4'] : [];
$classNameCount = count($className);
<<<<<<< HEAD
?>
=======
 ?>
>>>>>>> c62053b0cb107a905128a5da01c2a2391bf04cc9
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

                    <div class="box-header ptbnull"></div>
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>

                    <form id="reportform" method="post">
                        <div class="box-body row">
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('branch'); ?></label><small class="req"> *</small>
                                    <select id="branch_id" name="branch_id" placeholder="" type="text" class="form-control">
                                        <option selected disabled>Select</option>
                                        <?php foreach ($branch as $key => $value) {

                                            $selected =  ($selected_branch ==  $value['id']) ? 'selected' : '';
                                        ?>
                                            <option value="<?php echo $value['id'] ?>" <?= $selected; ?>><?php echo $value["branch_name"] ?></option>
                                        <?php } ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('branch'); ?></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-12">
                                    <button type="submit" name="search" value="search_filter" class="btn btn-primary btn-sm  pull-right"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="box removeboxmius">

                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><i class="fa fa-users"></i> <?php echo $this->lang->line('student_age_report'); ?> </h3>
                    </div>
                    <div class="d-flex justify-content-center;" style="display: flex;justify-content: end;">
<<<<<<< HEAD
                        <a href="<?php echo base_url('student/getStudentAgereportpdf/' . $selected_branch); ?>" target="_blank" class="btn btn-sm mr-2 btn-primary">Download</a>
=======
                        <a href="<?php echo base_url(); ?>student/getStudentAgereportpdf" target="_blank" class="btn btn-sm mr-2 btn-primary">Download</a>
>>>>>>> c62053b0cb107a905128a5da01c2a2391bf04cc9

                    </div>
                    <div class="box-body table-responsive">
                        <?php
                        if (!empty($students_list)) {
                        ?>
                            <div class="download_label"><?php echo $this->lang->line('student_age_report'); ?></div>
                            <table class="table table-striped table-bordered table-hover ">
                                <caption class="text text-center h4"><?php echo $this->lang->line('age_report_title'); ?>
                                    <span class="text text-center h4" style="color: red; display:inline;"> (B= Boys, G= Girls, T= Transgender)</span>
                                </caption>
                                <thead>
                                    <tr>
                                        <th class="text text-center"><?php echo $this->lang->line('class'); ?></th>
                                        <?php
                                        foreach ($className as $key => $value) {
<<<<<<< HEAD
                                            $key = strtoupper(str_replace('_', ' ', $key)); ?>
=======
                                            $key = ucfirst(str_replace('_', ' ', $key)); ?>
>>>>>>> c62053b0cb107a905128a5da01c2a2391bf04cc9
                                            <th class="text text-center" colspan="3"><?= $key ?></th>
                                        <?php } ?>
                                    </tr>
                                    <tr>
                                        <th><?php echo $this->lang->line('age'); ?></th>
                                        <?php for ($i = 0; $i < $classNameCount; $i++) : ?>
                                            <th><?php echo $this->lang->line('b'); ?></th>
                                            <th><?php echo $this->lang->line('g'); ?></th>
                                            <th><?php echo $this->lang->line('t'); ?></th>
                                        <?php endfor; ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    foreach ($students_list as $students_list_key => $students_list_value) {
                                    ?>
                                        <tr>
                                            <td class="text text-center"><?= $students_list_key ?></td>
                                            <?php foreach ($students_list_value as $key => $value) :   ?>
                                                <td class="text text-center"><?= $value['male'] ?></td>
                                                <td class="text text-center"><?= $value['female'] ?></td>
                                                <td class="text text-center"><?= $value['transgender'] ?></td>
                                            <?php endforeach; ?>
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

    $(document).on('change', '#branch_id', function() {
        let URL = "<?= site_url('student/studentsagereport') ?>" + '/' + $(this).val();
        $('#reportform').attr('action', URL);
    });
</script>