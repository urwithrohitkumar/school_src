<?php


$currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-money"></i> <?php echo $this->lang->line('fees_collection'); ?>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <?php
            if ($this->rbac->hasPrivilege('fees_type', 'can_add')) {
            ?>
                <div class="col-md-4">
                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('add_fees_type'); ?></h3>
                        </div><!-- /.box-header -->
                        <?php
                        if (!empty($feereminder)) {  ?>
                            <form id="form1" action="<?php echo base_url() ?>admin/feereminder/edit" id="employeeform" name="employeeform" method="post" accept-charset="utf-8">

                            <?php  } else { ?>

                                <form id="form1" action="<?php echo base_url() ?>admin/feereminder" id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
                                <?php }
                                ?>
                                <div class="box-body">
                                    <?php if ($this->session->flashdata('msg')) { ?>
                                        <?php echo $this->session->flashdata('msg') ?>
                                    <?php } ?>
                                    <?php
                                    if (isset($error_message)) {
                                        echo "<div class='alert alert-danger'>" . $error_message . "</div>";
                                    }
                                    ?>
                                    <?php echo $this->customlib->getCSRF(); ?>
                                    <input type="hidden" name="feereminderid" value="<?php if (!empty($feereminder)) {
                                                                                            echo $feereminder->id;
                                                                                        } ?>" />
                                    <div class='form-group'>
                                        <label for='exampleInputEmail1'><?php echo $this->lang->line('branch'); ?></label><small class='req'> *</small>
                                        <select id='branch_id' name='branch_id' placeholder='' type='text' class='form-control'>
                                            <?php foreach ($branch as $key => $value) {  ?>
                                                <option value='<?php echo $value['id'] ?>' <?php if (!empty($feereminder)) {
                                                                                                if ($feereminder->branch_id == $value['id']) {
                                                                                                    echo "selected";
                                                                                                }
                                                                                            } ?>><?php echo $value['branch_name'] ?></option>
                                            <?php } ?>
                                        </select>
                                        <span class='text-danger'><?php echo form_error('branch'); ?></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('name'); ?></label> <small class="req">*</small>
                                        <input autofocus="" id="name" name="name" type="text" class="form-control" value="<?php if (!empty($feereminder)) {
                                                                                                                                echo $feereminder->reminder_type;
                                                                                                                            } ?>" />
                                        <span class="text-danger"><?php echo form_error('name'); ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('days'); ?></label> <small class="req">*</small>
                                        <input id="days" name="days" type="text" class="form-control" value="<?php if (!empty($feereminder)) {
                                                                                                                    echo $feereminder->day;
                                                                                                                } ?>" />
                                        <span class="text-danger"><?php echo form_error('days'); ?></span>
                                    </div>
                                </div><!-- /.box-body -->

                                <div class="box-footer">
                                    <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                                </div>
                                </form>
                    </div>

                </div>
                <!--/.col (right) -->
                <!-- left column -->
            <?php } ?>
            <div class="col-md-<?php
                                if ($this->rbac->hasPrivilege('fees_type', 'can_add')) {
                                    echo "8";
                                } else {
                                    echo "12";
                                }
                                ?>">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('fees_type_list'); ?></h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="download_label"><?php echo $this->lang->line('fees_type_list'); ?></div>
                        <div class="mailbox-messages table-responsive">
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('name'); ?>
                                        </th>
                                        <th><?php echo $this->lang->line('branch'); ?></th>
                                        <th><?php echo $this->lang->line('days'); ?></th>
                                        <th><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    $last_key = count($feereminderlist);
                                    foreach ($feereminderlist as $note_key => $note_value) {

                                        $hr = "";

                                        if ($i != $last_key) {
                                            $hr = "<hr>";
                                        }
                                    ?>

                                        <tr>
                                            <td>
                                                <input type="hidden" name="ids[]" value="<?php echo $note_value->id; ?>">
                                                <?php echo $note_value->reminder_type; ?>
                                            </td>
                                            <td>
                                                <?php echo $note_value->branch_name; ?>
                                            </td>
                                            <td>
                                                <?php echo $note_value->day; ?>
                                            </td>
                                            <td class="mailbox-date pull-right">
                                                <?php
                                                if ($this->rbac->hasPrivilege('fees_type', 'can_edit')) {
                                                ?>
                                                    <a data-placement="left" href="<?php echo base_url(); ?>admin/feereminder/edit/<?php echo $note_value->id ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                <?php } ?>
                                                <?php
                                                if ($this->rbac->hasPrivilege('fees_type', 'can_delete')) {
                                                ?>
                                                    <a data-placement="left" href="<?php echo base_url(); ?>admin/feereminder/delete/<?php echo $note_value->id ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                        <i class="fa fa-remove"></i>
                                                    </a>
                                                <?php } ?>
                                            </td>
                                        </tr>


                                    <?php
                                        $i++;
                                    }
                                    ?>
                                </tbody>
                            </table><!-- /.table -->



                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->
                </div>
            </div>
            <!--/.col (left) -->
            <!-- right column -->

        </div>
        <div class="row">
            <!-- left column -->

            <!-- right column -->
            <div class="col-md-12">

            </div>
            <!--/.col (right) -->
        </div> <!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
    $(document).ready(function() {
        $('.detail_popover').popover({
            placement: 'right',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function() {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });
    });
</script>