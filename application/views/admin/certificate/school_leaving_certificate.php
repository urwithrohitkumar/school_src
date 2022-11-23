<style>
    .btn-group2{
        display: none;
    }
</style>
<div class="content-wrapper" style="min-height: 946px;">

    <section class="content-header">
        <h1>
            <i class="fa fa-user-plus"></i> <?php echo $this->lang->line('student_information'); ?> <small><?php echo $this->lang->line('student1'); ?></small>
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
                        <div class="row">
                            <?php if ($this->session->flashdata('msg')) { ?> <div class="alert alert-success"> <?php echo $this->session->flashdata('msg') ?> </div> <?php } ?>
                            <form role="form" action="<?php echo site_url('admin/school_leaving_certificate') ?>" method="post" class="">
                                <?php echo $this->customlib->getCSRF(); ?>
                                <div class='col-sm-4'>
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
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('class'); ?></label>
                                        <select autofocus="" id="class_id" name="class_id" class="form-control">
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                            <?php foreach ($classlist as $class) { ?>
                                                <option value="<?php echo $class['id'] ?>" <?php if (set_value('class_id') == $class['id']) { echo "selected=selected"; } ?>><?php echo $class['class'] ?></option>
                                            <?php $count++; } ?>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('section'); ?></label>
                                        <select id="section_id" name="section_id" class="form-control">
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                            <?php
                                            foreach ($sectionlist as $section) {
                                                ?>
                                                <option value="<?php echo $section['id'] ?>" <?php
                                                if (set_value('section_id') == $section['id']) {
                                                    echo "selected=selected";
                                                }
                                                ?>><?php echo $section['section'] ?></option>
                                                        <?php
                                                        $count++;
                                                    }
                                                    ?>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <button type="submit" name="search" value="search_filter" class="btn btn-primary btn-sm pull-right checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="box-body bordertop">
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <form action="<?php echo site_url('student/ajax_delete') ?>" method="POST" id="deletebulk">


                                    <?php
                                    if (isset($resultlist)) {
                                    ?>
                                        <div class="table-responsive">
                                            <div class="download_label"><?php echo $this->lang->line('school_leaving_certificate') ?></div>
                                            <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th><?php echo $this->lang->line('admission_no'); ?></th>
                                                        <th><?php echo $this->lang->line('branch'); ?></th>

                                                        <th><?php echo $this->lang->line('student_name'); ?></th>
                                                        <th><?php echo $this->lang->line('class'); ?></th>

                                                        <th><?php echo $this->lang->line('date_of_birth'); ?></th>
                                                        <th><?php echo $this->lang->line('gender'); ?></th>
                                                        <?php if ($sch_setting->category) { ?>
                                                            <th><?php echo $this->lang->line('category'); ?></th>
                                                            <?php }
                                                        if ($sch_setting->mobile_no) { ?>
                                                            <th><?php echo $this->lang->line('mobile_no'); ?></th>
                                                            <?php
                                                        }
                                                        if (!empty($fields)) {
                                                            
                                                            foreach ($fields as $fields_key => $fields_value) {
                                                                ?>
                                                                <th><?php echo $fields_value->name; ?></th>
                                                                <?php
                                                            }
                                                        }
                                                        ?>
                                                        <th><?php echo $this->lang->line('download'); ?></th>


                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    if (empty($resultlist)) {
                                                    ?>

                                                        <?php
                                                    } else {
                                                        $count = 1;
                                                        foreach ($resultlist as $student) {
                                                        ?>
                                                            <tr>
                                                                <td><?php echo $student['admission_no']; ?></td>
                                                                <td><?php echo $student['branch_name']; ?></td>
                                                                <td>
                                                                    <a href="<?php echo base_url(); ?>student/view/<?php echo $student['id']; ?>"><?php echo $this->customlib->getFullName($student['firstname'], $student['middlename'], $student['lastname'], $sch_setting->middlename, $sch_setting->lastname); ?>
                                                                    </a>
                                                                </td>
                                                                <td><?php echo $student['class'] . "(" . $student['section'] . ")" ?></td>

                                                                <td><?php
                                                                    if ($student["dob"] != null && $student["dob"] != '0000-00-00') {
                                                                        echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($student['dob']));
                                                                    }
                                                                    ?></td>
                                                                <td><?php echo $student['gender']; ?></td>
                                                                <?php if ($sch_setting->category) { ?>
                                                                    <td><?php echo $student['category']; ?></td>
                                                                <?php }
                                                                if ($sch_setting->mobile_no) { ?>
                                                                    <td><?php echo $student['mobileno']; ?></td>
                                                                    <?php
                                                                }
                                                                if (!empty($fields)) {

                                                                    foreach ($fields as $fields_key => $fields_value) {
                                                                        $display_field = $student[$fields_value->name];
                                                                        if ($fields_value->type == "link") {
                                                                            $display_field = "<a href=" . $student[$fields_value->name] . " target='_blank'>" . $student[$fields_value->name] . "</a>";
                                                                        }
                                                                    ?>
                                                                        <td>
                                                                            <?php echo $display_field; ?>

                                                                        </td>
                                                                <?php
                                                                    }
                                                                }
                                                                ?>
                                                                <td> <a href='<?php echo base_url() ?>/admin/school_leaving_certificate/downlod/<?php echo $student['id']; ?>' id="downlod"  target="blank" class="btn btn-info">Downlod</a></td>


                                                            </tr>
                                                    <?php
                                                            $count++;
                                                        }
                                                    }
                                                    ?>
                                                </tbody>
                                            </table>
                                        <?php
                                    }
                                        ?>
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>