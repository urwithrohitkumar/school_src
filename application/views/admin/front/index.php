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
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">

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
            <form id="form1" action="<?php echo site_url('admin/front/add_home_content/add') ?>" enctype="multipart/form-data" id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
                <div class="col-md-6">
                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('add_pagecontet'); ?></h3>

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
                            <div class="col-md-6 form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('title'); ?></label><small class="req"> *</small>
                                <input id="title" name="title" placeholder="" type="text" class="form-control"  value="<?php echo set_value('title'); ?>" />
                                <span class="text-danger"><?php echo form_error('title'); ?></span>
                            </div>

                            <div class="col-md-6 form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('add_subtitle'); ?></label><small class="req"> *</small>
                                <input id="title" name="add_subtitle" placeholder="" type="text" class="form-control"  value="<?php echo set_value('title'); ?>" />
                                <span class="text-danger"><?php echo form_error('add_subtitle'); ?></span>
                            </div>

                            </div>
                            
                            <div class="form-group">
                            <label for="exampleInputFile"><?php echo $this->lang->line('upload_icon'); ?></label><small class="req"> *</small>
                            <input class="filestyle form-control" value="<?php echo set_value('upload_icon')?>" data-height="40" type='file' name='upload_icon' id="upload_icon" size='20' />
                            <span class="text-danger"><?php echo form_error('upload_icon'); ?></span>
                            </div>
                            <div class="row">
                           
                            <div class="col-md-6  form-group">
                            <label for="exampleInputFile">Select direction</label><small class="req"> *</small>
                            <select name="direction" id="" class="form-control">
                                <option value="">Select Direction</option>
                                <option value="1">Top</option>
                                <option value="2">Middle</option>
                                <option value="3">Bottom</option>
                               
                            </select>
                            <span class="text-danger"><?php echo form_error('direction'); ?></span>
                            </div>
                            <!-- <div class="col-md-6  form-group">
                            <label for="exampleInputFile">Select option</label><small class="req"> *</small>
                            <select name="position" id="" class="form-control">
                                <option value="">Select position</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                            <span class="text-danger"><?php echo form_error('position'); ?></span>

                            </div> -->
                            </div>
                               


                            <div class="dividerhr mt0"></div>
                            <div class="formgroup10 mb10">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('description'); ?></label><small style="color:red;"> *</small>
                              
                            </div>    
                            <div class="form-group">   
                                <textarea id="editor1" name="description" placeholder="" type="text" class="form-control ss" >
                                    <?php echo set_value('description'); ?>
                                </textarea>   
                                <span class="text-danger"><?php echo form_error('description'); ?></span>
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
                <div class="col-md-6 col-sm-12 uploadbarfixes">
                    <div class="">
                        <!-- page settings -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><?php echo $this->lang->line('home_page_contentData'); ?></h3>
                                <div class="box-tools pull-right">
                                    <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" data-placement="left" title="Collapse"><i class="fa fa-minus"></i></button>
                                </div><!-- /.box-tools -->
                            </div><!-- /.box-header -->

                            <div class="box-body">

                            <table id="example" class="table table-bordered text-center">
							<thead>
							<tr>
							<th>Image	</th>
                            <th>Title</th>
							<th>Status</th>
							<th>Action</th>
							</tr>
							</thead>
							<tbody>
                           
							
                            <?php

                                if($homepage_data == 0){
                                   
                                }else{
                                    foreach($homepage_data as $listRow){
                                        ?><tr>
                                        <td>
                                        <img style="width:50px;height:50px;" src="<?= $listRow['file'] ?>" alt="">    
                                        </td>
                                        <td><?= $listRow['title'] ?></td>
                                        <td><input data-id="<?= $listRow['id']  ?>" class="toggle-class" type="checkbox" data-onstyle="success" data-offstyle="danger" data-toggle="toggle" data-on="Active" data-off="InActive"  <?= $listRow['statu'] ? 'checked' : '' ?>>			
                                        </td>
                                        <td style="display: inline-flex;">
                                        <a href="<?php echo base_url('admin/front/add_home_content/remove/' .$listRow['id']); ?>" onclick="return confirm('Are you sure to delete?')"><i class="fa fa-trash-o" style="font-size:24px;color:red;"></i></a>&nbsp;&nbsp;&nbsp;
        	                            <a href="<?php echo base_url('admin/front/add_home_content/edit/' .$listRow['id']); ?>"><i class="fa fa-edit" style="font-size:24px;color:blue;"></i></a>

                                        </td>
                                      </tr>
                                      <?php
                                      }
                                }
                              
                            ?>
                            
                           
                       
						
						
						
							</tbody>
							</table>

                                                    
                            </div><!-- /.box-body -->
                        </div><!-- /.box -->              

                      
                    </div>  
                </div><!-- /.col-md-4 -->

            </form>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>

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





        $(document).on('click', '.img_div_modal', function (event) {
            $('.img_div_modal div.fadeoverlay').removeClass('active');
            $(this).closest('.img_div_modal').find('.fadeoverlay').addClass('active');

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

    function YouTubeGetID(url) {
        var ID = '';
        url = url.replace(/(>|<)/gi, '').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/);
        if (url[2] !== undefined) {
            ID = url[2].split(/[^0-9a-z_\-]/i);
            ID = ID[0];
        } else {
            ID = url;
        }
        return ID;
    }
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


    $(document).on('keyup change', '#title', function () {
        var str = $(this).val();

        var url = string_to_slug(str);
        $('#url').val(url);
    });

    function string_to_slug(str) {
        str = str.replace(/^\s+|\s+$/g, ''); // trim
        str = str.toLowerCase();

        // remove accents, swap ñ for n, etc
        var from = "àáäâèéëêìíïîòóöôùúüûñç·/_,:;";
        var to = "aaaaeeeeiiiioooouuuunc------";
        for (var i = 0, l = from.length; i < l; i++) {
            str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
        }

        str = str.replace(/[^a-z0-9 -]/g, '') // remove invalid chars
                .replace(/\s+/g, '-') // collapse whitespace and replace by -
                .replace(/-+/g, '-'); // collapse dashes

        return str;
    }
    $(document).ready(function() {
    $('#example').DataTable();
} );


</script>



        <script>
        $(function() {
        $('.toggle-class').change(function() {
        var status = $(this).prop('checked') == true ? 1 : 0; 
        var content_id = $(this).data('id'); 

        $.ajax({
        type: "POST",
        dataType: "json",
        url: "<?= base_url() ?>admin/front/add_home_content/update_status",
        data: {'status': status, 'content_id': content_id},
        success: function(data){
        if(data == 1){
            
        $('#active').html("Status actived");



        }else if(data == 0){
        

        }
        }
        });
        })
        })
        </script>
