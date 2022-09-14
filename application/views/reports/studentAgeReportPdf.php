<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=ec, initial-scale=1.0">
    <title>Students Age Reports</title>
</head>
<style type="text/css">
    body,
    div,
    table,
    thead,
    tbody,
    tfoot,
    tr,
    th,
    td,
    body {
        /* font-family: "Calibri"; */
        /* font-family: DejaVu Sans !important; */
        font-size: 15px
    }
</style>

<body>
    <div class="content-wrapper" >
         <section class="content-header">
            <h3 style="text-align:center;">
                Students Age Reports
            </h3>
        </section>
        
        <table  width=100%  border class="table table-striped table-bordered table-hover example">
            <th colspan="42" class="text text-center h4"><?php echo $this->lang->line('age_report_title'); ?>
                <span class="text text-center h4" style="color: red; display:inline;"> (B= Boys, G= Girls, T= Transgender)</span>
            </th>
            <thead>
                <tr>
                    <th class="text text-center"><?php echo $this->lang->line('class'); ?></th>
                    <th class="text text-center" colspan="3"><?php echo $this->lang->line('pre_nur'); ?></th>
                    <th class="text text-center" colspan="3"><?php echo $this->lang->line('pp_kg'); ?></th>
                    <?php for ($i = 1; $i <= 12; $i++) : ?>
                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_' . $i); ?></th>
                    <?php endfor; ?>
                      <!--<th class="text text-center" colspan="3">PCM</th>-->
                </tr>
                <tr>
                    <th><?php echo $this->lang->line('age'); ?></th>
                    <?php for ($i = 0; $i < 14; $i++) : ?>
                        <th><?php echo $this->lang->line('b'); ?></th>
                        <th><?php echo $this->lang->line('g'); ?></th>
                        <th><?php echo $this->lang->line('t'); ?></th>
                    <?php endfor; ?>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($students_list as $students_list_key => &$students_list_value) {
                    $students_list_key = str_replace("<", "&lt;", $students_list_key);
                ?>
                    <tr>
                        <td><?= $students_list_key ?></td>
                        <?php foreach ($students_list_value as $key => $value) :   ?>
                            <td><?= $value['male'] ?></td>
                            <td><?= $value['female'] ?></td>
                            <td><?= $value['transgender'] ?></td>
                        <?php endforeach; ?>
                    </tr>
                <?php
                }
                // exit;

                ?>
            </tbody>
        </table>








        <!-- 

        <table>
            <thead>
                <tr>
                    <th>Class</th>
                    <th>Pre/Nur</th>
                    <th>PP/KG</th>
                    <?php for ($i = 1; $i <= 12; $i++) : ?>
                        <th><?php echo $this->lang->line('class_' . $i); ?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th>sub header</th>
                    <th>sub header</th>
                    <th>sub header</th>
                    <th>sub header</th>
                    <th>sub header</th>
                    <th>sub header</th>
                    <th>sub header</th>
                    <th>sub header</th>
                    <th>sub header</th>
                    <th>sub header</th>
                    <th>sub header</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>row header</th>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                </tr>
            </tbody>
        </table> -->
    </div>
</body>

</html>