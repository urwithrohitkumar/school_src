<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        font-size: small
    }
</style>

<body>
    <span>
        <table class="table table-striped table-bordered table-hover example">
            <caption class="text text-center h4"><?php echo $this->lang->line('category_report_title'); ?>
                <span class="text text-center h4" style="color: red; display:inline;"> (B= Boys, G= Girls, T= Transgender)</span>
            </caption>

            <thead>
                <tr>
                    <th class="text text-center"><?php echo $this->lang->line('class'); ?></th>
                    <th class="text text-center" colspan="3"><?php echo $this->lang->line('pre_nur'); ?></th>
                    <th class="text text-center" colspan="3"><?php echo $this->lang->line('pp_kg'); ?></th>
                    <?php for ($i = 1; $i <= 12; $i++) : ?>
                        <th class="text text-center" colspan="3"><?php echo $this->lang->line('class_' . $i); ?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th class="text text-center"><?php echo $this->lang->line('section'); ?></th>

                    <?php for ($i = 1; $i <= 14; $i++) : ?>
                        <th class="text text-center" colspan="3"><?= '1' ?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th class="text text-center"><?php echo $this->lang->line('category'); ?></th>
                    <?php for ($i = 0; $i < 14; $i++) : ?>
                        <th><?php echo $this->lang->line('b'); ?></th>
                        <th><?php echo $this->lang->line('g'); ?></th>
                        <th><?php echo $this->lang->line('t'); ?></th>
                    <?php endfor; ?>
                </tr>
            </thead>
            <tbody>
                <?php


                foreach ($students_list['category'] as $students_list_key => $students_list_value) {

                ?>
                    <tr>
                        <td class="text text-center"><?= $students_list_key ?></td>
                        <?php foreach ($students_list_value as $key => $section) :

                            foreach ($section as $key => $value) : ?>
                                <td class="text text-center"><?= $value['male'] ?></td>
                                <td class="text text-center"><?= $value['female'] ?></td>
                                <td class="text text-center"><?= $value['transgender'] ?></td>
                        <?php endforeach;
                        endforeach; ?>
                    </tr>
                <?php

                } ?>

                <!-- minorities -->

                <tr>
                    <td colspan="43" class="text h5" style="text-align: center;font-weight: 500;">
                        <?php echo $this->lang->line('minorities_category_title'); ?>
                    </td>
                </tr>

                <?php foreach ($students_list['minorities'] as $students_list_key => $students_list_value) { ?>
                    <tr>
                        <td class="text text-center"><?= $students_list_key ?></td>
                        <?php foreach ($students_list_value as $key => $section) :

                            foreach ($section as $key => $value) : ?>
                                <td class="text text-center"><?= $value['male'] ?></td>
                                <td class="text text-center"><?= $value['female'] ?></td>
                                <td class="text text-center"><?= $value['transgender'] ?></td>
                        <?php endforeach;
                        endforeach; ?>
                    </tr>
                <?php } ?>


                <!-- documents -->

                <tr>
                    <td colspan="43" class="text h5" style="text-align: center;font-weight: 500;">
                        <?php echo $this->lang->line('minorities_category_title'); ?>
                    </td>
                </tr>
                <?php
                foreach ($students_list['documents'] as $students_list_key => $students_list_value) { ?>
                    <tr>
                        <td class="text text-center"><?= ucfirst(str_replace('_', ' ',  $students_list_key)) ?></td>
                        <?php foreach ($students_list_value as $key => $section) :

                            foreach ($section as $key => $value) : ?>
                                <td class="text text-center"><?= $value['male'] ?></td>
                                <td class="text text-center"><?= $value['female'] ?></td>
                                <td class="text text-center"><?= $value['transgender'] ?></td>
                        <?php endforeach;
                        endforeach; ?>
                    </tr>
                <?php } ?>


            </tbody>

        </table>
    </span>
</body>

</html>