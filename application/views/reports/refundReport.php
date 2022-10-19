<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper" style="min-height: 1126px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-money"></i> <?php echo $this->lang->line('fees_collection'); ?> <small><?php echo $this->lang->line('student1'); ?></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <?php $this->load->view('reports/_finance'); ?>
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <div class="box removeboxmius">
                    <div class="box-header ptbnull"></div>
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>
                    <form action="<?= site_url('report/feerefund') ?>" method="post" accept-charset="utf-8">
                        <div class="box-body">
                            <?php echo $this->customlib->getCSRF(); ?>
                            <div class="row">
                                <div class='col-md-3'>
                                    <div class='form-group'>
                                        <label for='exampleInputEmail1'><?php echo $this->lang->line('branch'); ?></label><small class='req'> *</small>
                                        <select id='branch_id' name='branch_id' placeholder='' type='text' class='form-control'>
                                            <option disabled selected><?php echo $this->lang->line('select'); ?></option>
                                            <?php foreach ($branch as $key => $value) {  ?>
                                                <option value='<?php echo $value['id'] ?>'><?php echo $value['branch_name'] ?></option>
                                            <?php } ?>
                                        </select>
                                        <span class='text-danger'><?php echo form_error('branch'); ?></span>
                                    </div>
                                </div>
                                <div class='col-md-3'>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('class'); ?></label>
                                        <select autofocus="" id="class_id" name="class_id" class="form-control">
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                           
                                        </select>
                                        <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                    </div>
                                </div>
                                <div class='col-md-3'>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('section'); ?></label>
                                        <select id="section_id" name="section_id" class="form-control">
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                                    </div>
                                </div>
                                <div class='col-md-3'>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('student'); ?></label>
                                        <select id="student_id" name="student_id" class="form-control">
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('student_id'); ?></span>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-sm pull-right"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="">
                        <div class="box-header ptbnull"></div>
                        <div class="box-header ptbnull">
                            <h3 class="box-title titlefix"><i class="fa fa-money"></i> <?php echo $this->lang->line('refund') . " " . $this->lang->line('report'); ?></h3>
                        </div>
                        <div class="box-body table-responsive">
                            <div class="download_label"><?php echo $this->lang->line('refund') . " " . $this->lang->line('report');
                                                        $this->customlib->get_postmessage();
                                                        ?></div>

                            <table class="table table-striped table-bordered table-hover example" data-export-title="<?php echo $this->lang->line('expense') . " " . $this->lang->line('report');
                                                                                                                        $this->customlib->get_postmessage(); ?>">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('date'); ?></th>
                                        <th><?php echo $this->lang->line('receipt_number'); ?></th>
                                        <th><?php echo $this->lang->line('fee_group'); ?></th>
                                        <th><?php echo $this->lang->line('name'); ?></th>
                                        <th class="text text-right"><?php echo $this->lang->line('amount'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>
                                        <th><?php echo $this->lang->line('remark'); ?></span></th>
                                        <th><?php echo $this->lang->line('refund_by'); ?></span></th>
                                        <th class="text text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php

                                    if ($refund_list) : foreach ($refund_list as $key => $row) :
                                            $amountArr = json_decode($row->amount_detail, true);
                                            $fine = 0;
                                            $total = 0;
                                            if (count($amountArr) > 0) {
                                                foreach ($amountArr as $key => $amount) {
                                                    $total += intval($amount['amount']);
                                                    $fine += intval($amount['amount_fine']);
                                                }
                                            }
                                            $totaAmount = $total . '+' .  $fine;
                                    ?>
                                            <tr>
                                                <td><?= $row->created_at ?></td>
                                                <td><?= $row->receipt_number ?></td>
                                                <td><?= $row->type ?></td>
                                                <td><?= $row->student_name ?></td>
                                                <td class="text text-right"><?= $totaAmount ?></td>
                                                <td><?= $row->remark ?></td>
                                                <td><?= $row->refund_by ?></td>
                                                <td class="text text-right">
                                                    <button class="btn btn-xs btn-default printInv" data-fee_groups_feetype_id="<?= $row->fee_groups_feetype_id ?>" data-student_session_id="<?= $row->student_session_id ?>" data-receipt_number=<?= $row->receipt_number ?>" title="Print" autocomplete="off"><i class="fa fa-print"></i> </button>
                                                </td>
                                            </tr>

                                    <?php endforeach;
                                    endif; ?>


                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
</div>


<script type="text/javascript">
  

    $(document).ready(function() {
        $('.detail_popover').popover({
            placement: 'right',
            title: '',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function() {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });


        $(document).on('change', '#section_id', function(e) {
            getStudentsByClassAndSection();

        });
        var class_id = $('#class_id').val();
        var section_id = '<?php echo set_value('section_id') ?>';
        if (class_id != "" || section_id != "") {
            postbackStudentsByClassAndSection(class_id, section_id);
        }
    });

    function getStudentsByClassAndSection() {

        $('#student_id').html("");
        var class_id = $('#class_id').val();
        var section_id = $('#section_id').val();
        var branch_id = $('#branch_id').val();
        var student_id = '<?php echo set_value('student_id') ?>';
        var base_url = '<?php echo base_url() ?>';
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "student/getByClassAndSectionAndBranch",
            data: {
                'class_id': class_id,
                'section_id': section_id,
                'branch_id': branch_id,
            },
            dataType: "json",
            success: function(data) {
                $.each(data, function(i, obj) {
                    var sel = "";
                    if (section_id == obj.section_id) {
                        sel = "selected=selected";
                    }

                    if (obj.admission_no == "") {
                        div_data += "<option value=" + obj.id + ">" + obj.full_name + " </option>";
                    } else {
                        div_data += "<option value=" + obj.id + ">" + obj.full_name + " (" + obj.admission_no + ") </option>";
                    }

                });
                $('#student_id').append(div_data);
            }
        });
    }

    function postbackStudentsByClassAndSection(class_id, section_id) {
        $('#student_id').html("");
        var student_id = '<?php echo set_value('student_id') ?>';
        var base_url = '<?php echo base_url() ?>';
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "student/getByClassAndSection",
            data: {
                'class_id': class_id,
                'section_id': section_id
            },
            dataType: "json",
            success: function(data) {
                $.each(data, function(i, obj) {
                    var sel = "";
                    if (student_id == obj.id) {
                        sel = "selected=selected";
                    }
                    div_data += "<option value=" + obj.id + " " + sel + ">" + obj.full_name + " (" + obj.admission_no + ") </option>";
                });
                $('#student_id').append(div_data);
            }
        });
    }
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $('.table-fixed-header').fixedHeader();
    });

    (function($) {

        $.fn.fixedHeader = function(options) {
            var config = {
                topOffset: 50
                //bgColor: 'white'
            };
            if (options) {
                $.extend(config, options);
            }

            return this.each(function() {
                var o = $(this);

                var $win = $(window);
                var $head = $('thead.header', o);
                var isFixed = 0;
                var headTop = $head.length && $head.offset().top - config.topOffset;

                function processScroll() {
                    if (!o.is(':visible')) {
                        return;
                    }
                    if ($('thead.header-copy').size()) {
                        $('thead.header-copy').width($('thead.header').width());
                    }
                    var i;
                    var scrollTop = $win.scrollTop();
                    var t = $head.length && $head.offset().top - config.topOffset;
                    if (!isFixed && headTop !== t) {
                        headTop = t;
                    }
                    if (scrollTop >= headTop && !isFixed) {
                        isFixed = 1;
                    } else if (scrollTop <= headTop && isFixed) {
                        isFixed = 0;
                    }
                    isFixed ? $('thead.header-copy', o).offset({
                        left: $head.offset().left
                    }).removeClass('hide') : $('thead.header-copy', o).addClass('hide');
                }
                $win.on('scroll', processScroll);

                // hack sad times - holdover until rewrite for 2.1
                $head.on('click', function() {
                    if (!isFixed) {
                        setTimeout(function() {
                            $win.scrollTop($win.scrollTop() - 47);
                        }, 10);
                    }
                });

                $head.clone().removeClass('header').addClass('header-copy header-fixed').appendTo(o);
                var header_width = $head.width();
                o.find('thead.header-copy').width(header_width);
                o.find('thead.header > tr:first > th').each(function(i, h) {
                    var w = $(h).width();
                    o.find('thead.header-copy> tr > th:eq(' + i + ')').width(w);
                });
                $head.css({
                    margin: '0 auto',
                    width: o.width(),
                    'background-color': config.bgColor
                });
                processScroll();
            });
        };

    })(jQuery);
    $(document).ready(function() {
        $.extend($.fn.dataTable.defaults, {
            ordering: false,
            paging: false,
            bSort: false,
            info: false
        });
    });
</script>

<script>
    var base_url = '<?php echo base_url() ?>';

    function Popup(data, winload = false) {
        var frame1 = $('<iframe />').attr("id", "printDiv");
        frame1[0].name = "frame1";
        frame1.css({
            "position": "absolute",
            "top": "-1000000px"
        });
        $("body").append(frame1);
        var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
        frameDoc.document.open();
        //Create a new HTML document.
        frameDoc.document.write('<html>');
        frameDoc.document.write('<head>');
        frameDoc.document.write('<title></title>');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/bootstrap/css/bootstrap.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/font-awesome.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/ionicons.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/AdminLTE.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/skins/_all-skins.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/iCheck/flat/blue.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/morris/morris.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/datepicker/datepicker3.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/daterangepicker/daterangepicker-bs3.css">');
        frameDoc.document.write('</head>');
        frameDoc.document.write('<body>');
        frameDoc.document.write(data);
        frameDoc.document.write('</body>');
        frameDoc.document.write('</html>');
        frameDoc.document.close();
        setTimeout(function() {
            document.getElementById('printDiv').contentWindow.focus();
            document.getElementById('printDiv').contentWindow.print();
            $("#printDiv", top.document).remove();
            // frame1.remove();
            if (winload) {
                window.location.reload(true);
            }
        }, 500);

        return true;
    }


    $(document).on('click', '.printInv', function() {
        var receipt_number = $(this).data('receipt_number');
        var student_session_id = $(this).data('student_session_id');
        var fee_groups_feetype_id = $(this).data('fee_groups_feetype_id');
        $.ajax({
            url: '<?php echo site_url("studentfee/printRefundFeesByGroup") ?>',
            type: 'post',
            data: {
                'fee_groups_feetype_id': fee_groups_feetype_id,
                'receipt_number': receipt_number,
                'fee_groups_feetype_id': fee_groups_feetype_id
            },
            success: function(response) {
                Popup(response);
            }
        });

    });
</script>