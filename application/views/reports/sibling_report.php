<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper">
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

                    <form role="form" action="<?php echo site_url('report/sibling_report') ?>" method="post" class="" id="class_search_form">
                        <div class="box-body row">
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
                                    <select id="section_id" name="section_id" class="form-control">
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
                            <h3 class="box-title titlefix"><i class="fa fa-money"> </i> <?php echo $this->lang->line('sibling') . " " . $this->lang->line('report'); ?></h3>
                        </div>
                        <div class="box-body table-responsive">

                            <div class="download_label"><?php echo $this->lang->line('sibling') . " " . $this->lang->line('report');
                                                        $this->customlib->get_postmessage();
                                                        ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>
                                        <?php if ($sch_setting->father_name) { ?>
                                            <th><?php echo $this->lang->line('father_name'); ?></th>
                                        <?php }
                                        if ($sch_setting->mother_name) { ?>
                                            <th><?php echo $this->lang->line('mother_name'); ?></th>
                                        <?php }
                                        if ($sch_setting->guardian_name) { ?>
                                            <th><?php echo $this->lang->line('guardian') . " " . $this->lang->line('name') ?></th>
                                        <?php }
                                        if ($sch_setting->guardian_phone) { ?>
                                            <th><?php echo $this->lang->line('guardian') . " " . $this->lang->line('phone') ?></th>
                                        <?php } ?>
                                        <th><?php echo $this->lang->line('student_name') . " (" . $this->lang->line('sibling') . ")"; ?></th>
                                        <th><?php echo $this->lang->line('class'); ?></th>
                                        <?php if ($sch_setting->admission_date) { ?>
                                            <th><?php echo $this->lang->line('admission') . " " . $this->lang->line('date'); ?></th>
                                        <?php } ?>
                                        <th><?php echo $this->lang->line('gender'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (empty($resultlist)) {    ?>
                                        <?php
                                    } else {
                                        $count = 1;
                                        foreach ($resultlist as $student) {
                                            if (count($student) > 1) {
                                        ?>
                                                <tr>
                                                    <?php if ($sch_setting->father_name) { ?>
                                                        <td><?php echo $student[0]['father_name']; ?></td>
                                                    <?php }
                                                    if ($sch_setting->mother_name) { ?>
                                                        <td><?php echo $student[0]['mother_name']; ?></td>
                                                    <?php }
                                                    if ($sch_setting->guardian_name) { ?>
                                                        <td><?php echo $student[0]['guardian_name']; ?></td>
                                                    <?php }
                                                    if ($sch_setting->guardian_phone) { ?>
                                                        <td><?php echo $student[0]['guardian_phone']; ?></td>
                                                    <?php } ?>
                                                    <td>
                                                        <table>
                                                            <?php foreach ($student as $value) { ?>
                                                                <tr>
                                                                    <td>
                                                                        <a href="<?php echo base_url(); ?>student/view/<?php echo $value['id']; ?>"><?php echo $this->customlib->getFullName($value['firstname'], $value['middlename'], $value['lastname'], $sch_setting->middlename, $sch_setting->lastname); ?></a>
                                                                </tr>
                                                    </td>
                                                <?php } ?>
                            </table>
                            </td>
                            <td>
                                <table>
                                    <?php foreach ($student as $value) {
                                    ?>
                                        <tr>
                                            <td>
                                                <?php echo $value['class'] . " (" . $value['section'] . ")"; ?>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                </table>
                            </td>
                            <?php if ($sch_setting->admission_date) { ?>


                                <td>
                                    <table>
                                        <?php foreach ($student as $value) {
                                        ?> <tr>
                                                <td><?php
                                                        if (!empty($value['admission_date'])) {
                                                            echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($value['admission_date']));
                                                        }
                                                    ?> </td>
                                            </tr>
                                        <?php } ?>
                                    </table>
                                    <?php ?>
                                </td>
                            <?php } ?>
                            <td class="pull-right">
                                <table width="100%">
                                    <?php foreach ($student as $value) { ?>
                                        <tr>
                                            <td>
                                                <?php
                                                    if (!empty($value['gender'])) {
                                                        echo $value['gender'];
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                </table>
                            </td>
                            </tr>
                <?php
                                                $count++;
                                            }
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
</div>
</section>
</div>
