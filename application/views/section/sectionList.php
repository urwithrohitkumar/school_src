<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-mortar-board"></i> <?php echo $this->lang->line('academics'); ?> <small><?php echo $this->lang->line('student_fees1'); ?></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <?php
            if ($this->rbac->hasPrivilege('section', 'can_add')) {
            ?>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('add_section'); ?></h3>
                        </div>
                        <form action="<?php echo site_url('sections/index') ?>" id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
                            <div class="box-body">
                                <?php if ($this->session->flashdata('msg')) { ?>
                                    <?php echo $this->session->flashdata('msg') ?>
                                <?php } ?>
                                <?php echo $this->customlib->getCSRF(); ?>
                                <div class='form-group'>
                                    <label for='exampleInputEmail1'><?php echo $this->lang->line('branch'); ?></label><small class='req'> *</small>
                                    <select id='branch_id' name='branch_id' placeholder='' type='text' class='form-control'>
                                        <?php foreach ($branch as $key => $value) {  ?>
                                            <option value='<?php echo $value['id'] ?>'><?php echo $value['branch_name'] ?></option>
                                        <?php } ?>
                                    </select>
                                    <span class='text-danger'><?php echo form_error('branch'); ?></span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('section_name'); ?> </label><small class="req"> *</small>
                                    <input autofocus="" id="section" name="section" placeholder="" type="text" class="form-control" value="<?php echo set_value('section'); ?>" />
                                    <span class="text-danger"><?php echo form_error('section'); ?></span>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                            </div>
                        </form>
                    </div>
                </div>
            <?php } ?>
            <div class="col-md-<?php
                                if ($this->rbac->hasPrivilege('section', 'can_add')) {
                                    echo "8";
                                } else {
                                    echo "12";
                                }
                                ?>">
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('section_list'); ?></h3>
                    </div>
                    <div class="box-body ">
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php echo $this->lang->line('section_list'); ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('section'); ?></th>
                                        <th><?php echo $this->lang->line('branch'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php
                                    $count = 1;
                                    foreach ($sectionlist as $section) {
                                    ?>
                                        <tr>
                                            <td class="mailbox-name"> <?php echo $section['section'] ?></td>
                                            <td class="mailbox-name"> <?php echo $section['branch_name'] ?></td>
                                            <td class="mailbox-date pull-right">
                                                <?php
                                                if ($this->rbac->hasPrivilege('section', 'can_edit')) {
                                                ?>
                                                    <a data-placement="left" href="<?php echo base_url(); ?>sections/edit/<?php echo $section['id'] ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                <?php
                                                }
                                                if ($this->rbac->hasPrivilege('section', 'can_delete')) {
                                                ?>
                                                    <a data-placement="left" href="<?php echo base_url(); ?>sections/delete/<?php echo $section['id'] ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('Section will also delete all students under this Section so be careful as this action is irreversible --r');">
                                                        <i class="fa fa-remove"></i>
                                                    </a>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                    <?php
                                    }
                                    $count++;
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