// console.log('asdfasdf');

var base_url = $('script[data-base]').attr('data-base')

/**
 * On Change of branch Found Classes according to branch function
 */
$("#branch_id").on('change', function() {
        $('#section_id').html('<option selected disabled >Select</option>');
        let branch_id = $("#branch_id").val();
        // var base_url = '<?php echo base_url() ?>';
        $.ajax({
            type: "GET",
            url: base_url + "classes/branchClasss",
            data: {
                'branch_id': branch_id,
            },
            dataType: "json",
            success: function(class_details) {
                /**
                 * Item Details Option data according to branch id
                 */
                if (class_details.length > 0) {
                    var html = '<option selected disabled >Select</option>';
                    for (var count = 0; count < class_details.length; count++) {
                        html += '<option value="' + class_details[count].id + '">' + class_details[count].class + '</option>';
                    }
                    $('#class_id').html(html);
                }
            }
        });
    })
    /**
     * On Chanege of Classes Found Section according to branch And Classes function
     */
$("#class_id").on('change', function() {
    let branch_id = $("#branch_id").val();
    let class_id = $("#class_id").val();
    // var base_url = '<?php echo base_url() ?>';
    $.ajax({
        type: "GET",
        url: base_url + "classes/branchClasssSection",
        data: {
            'branch_id': branch_id,
            'class_id': class_id,
        },
        dataType: "json",
        success: function(section_details) {
            /**
             * Item Details Option data according to branch id
             */
            if (section_details.length > 0) {
                var html = '<option selected disabled >Select</option>';
                for (var count = 0; count < section_details.length; count++) {
                    html += '<option value="' + section_details[count].id + '">' + section_details[count].section + '</option>';
                }
                $('#section_id').html(html);
            }
        }
    });
})



/**
 * On Change of branch Found Fee Group according to branch function
 */
$("#branch_id").on('change', function() {
    $('#feegroup_id').html('<option selected disabled >Select</option>');
    let branch_id = $("#branch_id").val();
    // var base_url = '<?php echo base_url() ?>';
    $.ajax({
        type: "POST",
        url: base_url + "studentfee/branchFeeGroup",
        data: {
            'branch_id': branch_id,
        },
        dataType: "json",
        success: function(result) {
            var feeGroupBranch = result.feeGroupBranch;
            var feetype = result.feetype;

            /**
             * Item Details Option data according to branch id
             */
            if (feeGroupBranch.length > 0) {
                var html = '';
                for (var count = 0; count < feeGroupBranch.length; count++) {
                    html += '<optgroup label=' + feeGroupBranch[count].group_name + '>';

                    for (var count = 0; count < feetype.length; count++) {
                        html += '<option value="' + feeGroupBranch[count].id + ' - ' + feetype[count].id + '">' + feetype[count].code + '</option>';
                    }
                }
                $('#feegroup_id').html(html);
            }
        }
    });
})