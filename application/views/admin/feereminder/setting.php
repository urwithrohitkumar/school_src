<?php $currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
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
                        <form id="form1" action="<?php echo base_url() ?>admin/feetype" id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
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
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('name'); ?></label> <small class="req">*</small>
                                    <input autofocus="" id="name" name="name" type="text" class="form-control" value="<?php echo set_value('name'); ?>" />
                                    <span class="text-danger"><?php echo form_error('name'); ?></span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('fees_code'); ?></label> <small class="req">*</small>
                                    <input id="code" name="code" type="text" class="form-control" value="<?php echo set_value('code'); ?>" />
                                    <span class="text-danger"><?php echo form_error('code'); ?></span>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('description'); ?></label>
                                    <textarea class="form-control" id="description" name="description" rows="3"><?php echo set_value('description'); ?></textarea>
                                    <span class="text-danger"></span>
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
                                            <td width="15%">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="isactive_<?php echo $note_value->id; ?>" value="1" <?php echo set_checkbox('isactive_' . $note_value->id, 1, set_value('isactive_' . $note_value->id, $note_value->is_active) ? true : false); ?>> <?php echo $this->lang->line('active'); ?>
                                                </label>

                                            </td>
                                            <td width="15%">
                                                <input type="hidden" name="ids[]" value="<?php echo $note_value->id; ?>">
                                                <?php echo $this->lang->line($note_value->reminder_type); ?>
                                            </td>
                                            <td width="20%">
                                                <input type="number" name="days<?php echo $note_value->id; ?>" value="<?php echo set_value('days' . $note_value->id, $note_value->day) ?>" class="form-control">
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