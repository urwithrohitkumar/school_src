<script src="<?php echo base_url(); ?>backend/plugins/ckeditor/ckeditor.js"></script>
<style type="text/css">
    .material-switch > input[type="checkbox"] {
        display: none;   
    }

    .material-switch > label {
        cursor: pointer;
        height: 0px;
        position: relative; 
        width: 40px;  
    }

    .material-switch > label::before {
        background: rgb(0, 0, 0);
        box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
        border-radius: 8px;
        content: '';
        height: 16px;
        margin-top: -8px;
        position:absolute;
        opacity: 0.3;
        transition: all 0.4s ease-in-out;
        width: 40px;
    }
    .material-switch > label::after {
        background: rgb(255, 255, 255);
        border-radius: 16px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
        content: '';
        height: 24px;
        left: -4px;
        margin-top: -8px;
        position: absolute;
        top: -4px;
        transition: all 0.3s ease-in-out;
        width: 24px;
    }
    .material-switch > input[type="checkbox"]:checked + label::before {
        background: inherit;
        opacity: 0.5;
    }
    .material-switch > input[type="checkbox"]:checked + label::after {
        background: inherit;
        left: 20px;
    }
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-empire"></i> <?php echo $this->lang->line('front_cms'); ?>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <form  id="form1" action="<?php echo site_url('admin/ticket/add_ticket') ?>" enctype="multipart/form-data" id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
                <div class="col-md-7">
                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('add_tickets'); ?></h3>

                        </div><!-- /.box-header -->
                        <!-- form start -->

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



                           
                            <div class="row">   
							<div class="col-md-6 col-sm-6">
							<div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('schoo_name'); ?></label><small class="req"> *</small>
                                <input id="title" readonly name="schoo_name" placeholder="" type="text" class="form-control"  value="<?php echo $school_data['school_name'] ?>" />
                                <span class="text-danger"><?php echo form_error('schoo_name'); ?></span>
                            </div> 
							</div>

							<div class="col-md-6 col-sm-6">
							<div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('email'); ?></label><small class="req"> *</small>
                                <input id="title" readonly name="email" placeholder="" type="text" class="form-control"  value="<?php echo $school_data['email'] ?>" />
                                <span class="text-danger"><?php echo form_error('email'); ?></span>
                            </div> 
							</div>
							
							<div class="col-md-6 col-sm-6">
							<div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('subject'); ?></label><small class="req"> *</small>
                                <input id="title" name="subject" placeholder="" type="text" class="form-control"  value="<?php echo set_value('subject'); ?>" />
                                <span class="text-danger"><?php echo form_error('subject'); ?></span>
                            </div> 
							</div>

							<div class="col-md-6 col-sm-6">
							<div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('priority'); ?></label><small class="req"> *</small>
								<select class="form-control" name="priority" id="">
									<option value="">Select option</option>
									<option value="1">Low</option>
									<option value="2">Medium</option>
									<option value="3">High</option>

								</select>
                                <span class="text-danger"><?php echo form_error('priority'); ?></span>
                            </div> 
							</div>
                            
                            </div>

							<div class="col-md-12">
                                        <div class="form-group">
                                            <label for="exampleInputFile"><?php echo $this->lang->line('file'); ?></label><small class="req"> *</small>
                                            <input class="filestyle form-control" value="<?php echo set_value('file')?>" data-height="40" type='file' name='file' id="file" size='20' />

                                        </div>
                                        <span class="text-danger"><?php echo form_error('file'); ?></span>
                                    </div>


                            <div class="dividerhr mt0"></div>
                            <div class="formgroup10 mb10">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('issue'); ?></label><small style="color:red;"> *</small>
                               
                            </div>    
                            <div class="form-group">   
                                <textarea id="editor1" name="issue" placeholder="" type="text" class="form-control ss" >
                                    <?php echo set_value('issue'); ?>
                                </textarea>   
                                <span class="text-danger"><?php echo form_error('issue'); ?></span>
                            </div> 
							<div class="box box-primary">
                            <div class="box-body">
                                <button type="submit" class="btn cfees btn-block"><i class="fa fa-save"></i> <?php echo $this->lang->line('save'); ?></button>
                            </div><!-- /.box-body -->
                        </div>                          
                        </div><!-- /.box-body -->
                    </div>
                    
                </div><!--/.col (right) -->
                <!-- left column -->
                <div class="col-md-5 col-sm-12 uploadbarfixes">
                    <div class="">
                        <!-- page settings -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><?php echo $this->lang->line('Open_ticket_support'); ?></h3>
                               
                            </div>
							<table id="example" class="table table-bordered text-center">
							<thead>
							<tr>
							<th>Date Submitted	</th>
                            <th>Type</th>
							<th>Priority</th>
							<th>Status</th>
							</tr>
							</thead>
							<tbody>
                           
							
                            <?php

                                if($ticket_list == 0){
                                   
                                }else{
                                    foreach($ticket_list as $listRow){
                                        ?><tr><?php
                                        ?><td><?= date('D-m-Y',strtotime($listRow['created_at'])) ?></td><?php 
                                        ?><td><?= $listRow['subject'] ?></td><?php 
                                        ?><td <?php if($listRow['priority'] == '1')
                                        {
                                         //    echo "Low";
                                         echo 'style="color:#ffffff;background-color:#ff7f7f" '; 
                                      }elseif($listRow['priority'] == '2'){
                                           echo  'style="color:#ffffff;background-color:#ff0000" ';
                                        }else{
                                          echo  'style="color:#ffffff;background-color:#8B0000" ';
      
                                        } ?>  ><?php
                                         if($listRow['priority'] == '1')
                                         {
                                          //    echo "Low";
                                          ?> <strong style="color:#ffffff;"> Low </strong> <?php
                                         }elseif($listRow['priority'] == '2'){
                                      
                                          ?> <strong style="color:#ffffff;"> Medium </strong> <?php
      
                                         }else{
                                          ?> <strong style="color:#ffffff;"> High </strong> <?php
      
                                         }
                                         
                                         ?>
                                      </td>
                                      <td    <?php if($listRow['status'] == '1')
                                        {
                                         //    echo "Low";
                                         echo 'style="color:#ffffff;background-color:#90EE90" '; 
                                      }elseif($listRow['status'] == '2'){
                                           echo  'style="color:#ffffff;background-color:#00FF00" ';
                                        }else{
                                          echo  'style="color:#ffffff;background-color:#006400" ';
      
                                        } ?>>
                                      <?php
                                         if($listRow['status'] == 1)
                                         {
                                          //    echo "Low";
                                          ?> <strong style="color:#000;"> Open </strong> <?php
                                         }elseif($listRow['status'] == 2){
                                      
                                          ?> <strong style="color:#000;"> In-Progress </strong> <?php
      
                                         }else{
                                          ?> <strong style="color:#ffffff;"> Resolved </strong> <?php
      
                                         }
                                         
                                         ?>
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

            </form>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<script>

    $(document).ready(function () {
        var popup_target = 'media_images';

        CKEDITOR.replace('editor1',
                {
                    allowedContent: true
                });

        $('#mediaModal').modal({
            backdrop: 'static',
            keyboard: false,
            show: false
        });
        $(document).on('click', '.feture_image_btn', function (event) {

            $("#mediaModal").modal('toggle', $(this));
        });

        $('#mediaModal').on('show.bs.modal', function (event) {
            var a = $(event.relatedTarget) // Button that triggered the modal
            popup_target = a[0].id;
            var button = $(event.relatedTarget) // Button that triggered the modal
            console.log(button);
            var $modalDiv = $(event.delegateTarget);
            $('.modal-media-body').html("");
            $.ajax({
                type: "POST",
                url: baseurl + "admin/front/media/getMedia",
                dataType: 'text',
                data: {},
                beforeSend: function () {

                    $modalDiv.addClass('modal_loading');
                },
                success: function (data) {
                    $('.modal-media-body').html(data);
                },
                error: function (xhr) { // if error occured
                    $modalDiv.removeClass('modal_loading');
                },
                complete: function () {
                    $modalDiv.removeClass('modal_loading');
                },
            });
        });

        $('.detail_popover').popover({
            placement: 'right',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function () {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });






        $(document).on('click', '.add_media', function (event) {
            var content_html = $('div#media_div').find('.fadeoverlay.active').find('img').data('img');
            var is_image = $('div#media_div').find('.fadeoverlay.active').find('img').data('is_image');
            var content_name = $('div#media_div').find('.fadeoverlay.active').find('img').data('content_name');

            var content_type = $('div#media_div').find('.fadeoverlay.active').find('img').data('content_type');
            var vid_url = $('div#media_div').find('.fadeoverlay.active').find('img').data('vid_url');
            var content = "";
            if (popup_target === "media_images") {
                if (typeof content_html !== "undefined") {
                    if (is_image === 1) {
                        content = '<img src="' + content_html + '">';
                    } else if (content_type == "video") {

                        var youtubeID = YouTubeGetID(vid_url);


                        content = '<iframe id="video" width="420" height="315" src="//www.youtube.com/embed/' + youtubeID + '?rel=0" frameborder="0" allowfullscreen></iframe>';

                    } else {
                        content = '<a href="' + content_html + '">' + content_name + '</a>';

                    }
                    InsertHTML(content);
                    $('#mediaModal').modal('hide');
                }
            } else {
                if (is_image === 1) {


                    addImage(content_html);
                } else {
                    //error show  
                }
                $('#mediaModal').modal('hide');
            }

        });
        $(document).on("click", ".pagination li a", function (event) {
            event.preventDefault();
            var page = $(this).data("ci-pagination-page");
            load_country_data(page);
        });
    });

    
    function addImage(content_html) {
        $('.feature_image_url').attr('src', content_html);
        $('#image').val(content_html);
        $('#image_preview').css("display", "block");
    }


    $(document).on('click', '.delete_media', function () {
        $('.feature_image_url').attr('src', '');
        $('#image').val('');
        $('#image_preview').css("display", "none");
    });

    function InsertHTML(content_html) {
        // Get the editor instance that we want to interact with.
        var editor = CKEDITOR.instances.editor1;


        // Check the active editing mode.
        if (editor.mode == 'wysiwyg')
        {
            editor.insertHtml(content_html);
        } else
            alert('You must be in WYSIWYG mode!');
    }


    $(document).ready(function() {
    $('#example').DataTable();
} );
</script>

