<style type="text/css">
    @media print
    {
        .no-print, .no-print *
        {
            display: none !important;
        }
    }
</style>
<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <i class="fa fa-bus"></i> <?php echo $this->lang->line('branch_title'); ?></h1>
    </section>
    <section class="content">
        <div class="row">
            <?php if ($this->rbac->hasPrivilege('branch', 'can_edit')) { ?>
                <div class="col-md-4">
                    <div class="box box-primary" >
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('edit_branch'); ?></h3>
                        </div>
                        <form id="form1" action="<?php echo site_url('admin/branch/edit/'.$id) ?>"  id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
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
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('branch_title'); ?></label><small class="req"> *</small>
                                    <input autofocus="" id="branch_title" name="branch_title" placeholder="" type="text" class="form-control"  value="<?php echo $Branchdata['branch_name'];?>" />
                                    <span class="text-danger"><?php echo form_error('branch_title'); ?></span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('address'); ?></label><small class="req"> *</small>
                                    <input autofocus="" id="branch_address" name="branch_address" placeholder="" type="text" class="form-control"  value="<?php echo $Branchdata['location'];?>" />
                                    <span class="text-danger"><?php echo form_error('branch_address'); ?></span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('status'); ?></label><small class="req"> *</small>
                            </br>
                                    <?php echo $this->lang->line('active'); ?> : <input autofocus="" id="branch_status" checked name="branch_status" placeholder="" type="radio" <?php if($Branchdata['branch_status'] == "1") { echo "checked";} ?>  value="1" /> &nbsp;&nbsp;&nbsp;
                                    <?php echo $this->lang->line('inactive'); ?> : <input autofocus="" id="branch_status" name="branch_status" placeholder="" type="radio" <?php if($Branchdata['branch_status'] == "0") { echo "checked";} ?> value="0" />
                                    <span class="text-danger"><?php echo form_error('branch_status'); ?></span>
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
            if ($this->rbac->hasPrivilege('branch', 'can_add')) {
                echo "8";
            } else {
                echo "12";
            }
            ?>">
                <div class="box box-primary" id="route">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('branch_list'); ?></h3>

                    </div>
                    <div class="box-body">
                        <div class="mailbox-controls">                         
                            <div class="pull-right">
                            </div>
                        </div>
                        <div class="mailbox-messages">
                            <div class="download_label"><?php echo $this->lang->line('branch_list'); ?></div>
                            <div class="table-responsive">  
                                <table class="table table-striped table-bordered table-hover example">
                                    <thead>
                                        <tr>
                                            <th><?php echo $this->lang->line('s_no'); ?></th>
                                            <th><?php echo $this->lang->line('branch_title'); ?></th>
                                            <th><?php echo $this->lang->line('address'); ?></th>
                                            <th class="text-right no-print"><?php echo $this->lang->line('action'); ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if (empty($BranchList)) {
                                            ?>

                                            <?php
                                        } else {
                                            $count = 1;
                                            foreach ($BranchList as $data) {
                                                ?>
                                                <tr>
                                                    <td class="mailbox-name"> <?php echo $count; ?></td>
                                                    <?php $count=$count+1; ?>
                                                    <td class="mailbox-name"> <?php echo $data['branch_name']; ?></td>
                                                    <td class="mailbox-name"> <?php echo $data['location']; ?></td>
                                                    <td class="mailbox-date pull-right no-print">
                                                        <?php if ($this->rbac->hasPrivilege('branch', 'can_edit')) { ?>
                                                            <a data-placement="left" href="<?php echo base_url(); ?>admin/branch/edit/<?php echo $data['id'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                                <i class="fa fa-pencil"></i>
                                                            </a>
                                                        <?php } if ($this->rbac->hasPrivilege('branch', 'can_delete')) { ?>
                                                            <a data-placement="left" href="<?php echo base_url(); ?>admin/branch/delete/<?php echo $data['id'] ?>"class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                                <i class="fa fa-remove"></i>
                                                            </a>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                                <?php
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
        <div class="row">           
            <div class="col-md-12">
            </div>
        </div> 
    </section>
</div>
<script type="text/javascript">
    $(document).ready(function () {
      
        $("#btnreset").click(function () {
            $("#form1")[0].reset();
        });
    });
</script>
<script type="text/javascript">
    var base_url = '<?php echo base_url() ?>';
    function printDiv(elem) {
        Popup(jQuery(elem).html());
    }
</script>