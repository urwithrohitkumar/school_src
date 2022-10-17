<?php 

$currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-mortar-board"></i> <?php echo $this->lang->line('academics'); ?>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <?php
            if ($this->rbac->hasPrivilege('class', 'can_add') || $this->rbac->hasPrivilege('class', 'can_edit')) {
            ?>
                <div class="col-md-4">
                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('edit_class'); ?></h3>
                        </div><!-- /.box-header -->
                        <form id="form1" action="<?php echo site_url('classes/edit/' . $id) ?>" method="post" accept-charset="utf-8">
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
                                <input type="hidden" name="id" value="<?php echo set_value('id', $vehroute[0]->id); ?>">
                                <input type="hidden" name="pre_class_id" value="<?php echo $vehroute[0]->id; ?>">
                                <?php
                                foreach ($vehroute[0]->vehicles as $v_key => $v_value) {
                                ?>
                                    <input type="hidden" name="prev_sections[]" value="<?php echo $v_value->id; ?>">
                                <?php
                                }
                                ?>

                                <div class='form-group'>
                                    <label for='exampleInputEmail1'><?php echo $this->lang->line('branch'); ?></label><small class='req'> *</small>
                                    <select id='branch_id' name='branch_id' placeholder='' type='text' class='form-control'>
                                        <?php foreach ($branch as $key => $value) {  ?>
                                            <option value='<?php echo $value['id'] ?>' <?php if($vehroute[0]->vehicles[0]->branch_id == $value['id'] ) { echo "selected" ; } ?>><?php echo $value['branch_name'] ?></option>
                                        <?php } ?>
                                    </select>
                                    <span class='text-danger'><?php echo form_error('branch'); ?></span>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
                                    <input autofocus="" id="class" name="class" placeholder="" type="text" class="form-control" value="<?php echo set_value('class', $vehroute[0]->route_id); ?>" />
                                    <span class="text-danger"><?php echo form_error('class'); ?></span>
                                </div>
                                <div class="form-group" id="sectionDetails">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('sections'); ?></label><small class="req"> *</small>


                                    <?php
                                    foreach ($vehiclelist as $vehicle) {
                                    ?>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="sections[]" value="<?php echo $vehicle['id'] ?>" <?php echo set_checkbox('sections[]', $vehicle['id'], check_in_array($vehicle['id'], $vehroute[0]->vehicles)); ?>><?php echo $vehicle['section'] ?>
                                            </label>
                                        </div>
                                    <?php
                                    }
                                    ?>

                                    <span class="text-danger"><?php echo form_error('sections[]'); ?></span>
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
                                if ($this->rbac->hasPrivilege('class', 'can_add') || $this->rbac->hasPrivilege('class', 'can_edit')) {
                                    echo "8";
                                } else {
                                    echo "12";
                                }
                                ?>  ">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('class_list'); ?></h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php echo $this->lang->line('class_list'); ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>

                                        <th><?php echo $this->lang->line('class'); ?>
                                        </th>
                                        <th><?php echo $this->lang->line('sections'); ?>
                                        </th>
                                        <th><?php echo $this->lang->line('branch'); ?>
                                        </th>

                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    foreach ($vehroutelist as $vehroute) {
                                    ?>
                                        <tr>
                                            <td class="mailbox-name">
                                                <?php echo $vehroute->class; ?>

                                            </td>


                                            <td>
                                                <?php
                                                $vehicles = $vehroute->vehicles;
                                                if (!empty($vehicles)) {


                                                    foreach ($vehicles as $key => $value) {


                                                        echo "<div>" . $value->section . "</div>";
                                                    }
                                                }
                                                ?>

                                            </td>
                                            <td class="mailbox-name">
                                                <?php echo $vehroute->branch_name; ?>

                                            </td>

                                            <td class="mailbox-date pull-right">
                                                <?php
                                                if ($this->rbac->hasPrivilege('class', 'can_edit')) {
                                                ?>
                                                    <a data-placement="left" href="<?php echo base_url(); ?>classes/edit/<?php echo $vehroute->id; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                <?php
                                                }
                                                if ($this->rbac->hasPrivilege('class', 'can_delete')) {
                                                ?>
                                                    <a data-placement="left" href="<?php echo base_url(); ?>classes/delete/<?php echo $vehroute->id; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('deleting_class'); ?>');">
                                                    <?php } ?>
                                            </td>
                                        </tr>
                                    <?php
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

<?php

function check_in_array($find, $array)
{

    foreach ($array as $element) {
        if ($find == $element->id) {
            return TRUE;
        }
    }
    return FALSE;
}
?>

<script>
    $("#branch_id").on('change', function() {
        let branch_id = $(this).val();
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "classes/optionData",
            data: {
                'branch_id': branch_id
            },
            dataType: "json",
            success: function(result) {
                /**
                 * Item Details Option data according to branch id
                 */
                if (result) {
                    var html = '<label for="exampleInputEmail1"><?php echo $this->lang->line('sections'); ?></label><small class="req"> *</small>';
                    for (var count = 0; count < result.length; count++) {
                        html += '<div class="checkbox"><label><input type="checkbox" name="sections[]" value="' + result[count].id + '">'+ result[count].section +'</label></div>'
                    }
                    html += '<span class="text-danger"><?php echo form_error('sections[]'); ?></span>';
                    $('#sectionDetails').html(html);
                }
            }
        });
    })
</script>