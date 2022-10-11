<script src="<?php echo base_url(); ?>backend/js/sstoast.js"></script>

<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-user-plus"></i> <?php echo $this->lang->line('student_information'); ?>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <?php
            if (($this->rbac->hasPrivilege('disable_reason', 'can_edit'))) {
            ?>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-users"></i> <?php echo $this->lang->line('edit') . " " . $this->lang->line('disable') . " " . $this->lang->line('reason'); ?></h3>
                        </div>

                        <form id="form1" action="<?php echo base_url(); ?>admin/disable_reason/edit/<?php echo $id; ?>" id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
                            <div class="box-body">
                                <?php
                                if ($this->session->flashdata('msg')) {
                                    $msg = $this->session->flashdata('msg');
                                ?>

                                    <?php echo $this->session->flashdata('msg') ?>
                                <?php } ?>
                                <?php echo $this->customlib->getCSRF(); ?>
                                <div class="row">
                                    <input type="hidden" id="reason_id" name="reason_id">
                                    <div class='col-sm-12'>
                                        <div class='form-group'>
                                            <label for='exampleInputEmail1'><?php echo $this->lang->line('branch'); ?></label><small class='req'> *</small>
                                            <select id='branch_id' name='branch_id' placeholder='' type='text' class='form-control'>
                                                <?php foreach ($branch as $key => $value) {  ?>
                                                    <option value='<?php echo $value['id'] ?>' <?php if($branch_id == $value['id'] ) { echo "selected"; } ?>><?php echo $value['branch_name'] ?></option>
                                                <?php } ?>
                                            </select>
                                            <span class='text-danger'><?php echo form_error('branch'); ?></span>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="pwd"><?php echo $this->lang->line('name'); ?></label><small class="req"> *</small>
                                            <input type="text" value="<?php echo set_value('name', $name); ?>" name="name" id="name" class="form-control "><span class="text-danger">
                                                <p><?php echo form_error('name') ?></p>
                                            </span>

                                        </div>
                                    </div>
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
                                if (($this->rbac->hasPrivilege('disable_reason', 'can_edit'))) {
                                    echo "8";
                                } else {
                                    echo "12";
                                }
                                ?>">
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title"><i class="fa fa-users"></i> <?php echo $this->lang->line('disable') . " " . $this->lang->line('reason') . " " . $this->lang->line('list'); ?></h3>
                    </div>
                    <div class="box-body">
                        <div class="download_label"><?php echo $this->lang->line('disable') . " " . $this->lang->line('reason') . " " . $this->lang->line('list'); ?></div>
                        <div class="mailbox-messages table-responsive">
                            <table class="table table-hover table-striped table-bordered example">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('name') ?>
                                        <th><?php echo $this->lang->line('branch') ?>

                                        </th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?>

                                        </th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($results as $value) { ?>
                                        <tr>
                                            <td><?php echo $value['reason']; ?></td>
                                            <td><?php echo $value['branch_name']; ?></td>
                                            <td class="text-right"><a data-placement="left" class="btn btn-default btn-xs" href="<?php echo base_url(); ?>admin/disable_reason/edit/<?php echo $value['id']; ?>" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>"><i class="fa fa-pencil"></i></a>

                                                <a data-placement="left" onclick="return confirm('<?php echo $this->lang->line('delete_confirm'); ?>');" class="btn btn-default btn-xs" href="<?php echo base_url() ?>admin/disable_reason/delete/<?php echo $value['id'] ?>" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>"><i class="fa fa-remove"></i></a>
                                            </td>

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
    </section>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#btnreset").click(function() {
            $("#form1")[0].reset();
        });
    });
</script>