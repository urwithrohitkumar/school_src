<?php if ($page['description'] != ""): ?>
    <?php echo $page['description']; ?>
<?php endif; ?>
<div class="container">
    <?php
     $top =  $this->db->query("SELECT * from tb_pagecontain where direction='1'  AND statu='0' ");
     $topdata = $top->row();
      if($top->num_rows() > 0){
        ?>
     <div class="row" style="padding-top: 30px!important;">
        <div class="col-md-9 mx-auto pb-20">
            <div class="container">
                <div class="row">
                <div class="col-md-4">
                    <img src="<?= $topdata->file ?>" class="img-rounded bg-img-css" style="width:100%;">
                </div>
                  <div class="col-md-5">
                      <h3 class="text-center"> <?= $topdata->title ?> </h3>
                      <p class="text-center about-school">
                      <?= $topdata->description ?>  
                    </p>
                  </div>
                </div>
            </div>
          <!-- <h4 class="text-center">Our Mission</h4>
            <p class="text-center">
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publsihing software like Aldus PageMaker including versions of Lorem Ipsum.</p> -->
        
        </div>
    </div>
     
     <?php
      }
     

    ?>
    
</div>

  <div class="container">
    <section class="services section-bg" id="services">
    <div class="section-header">
      <h2 class="plan-head">View Our 2021-2022 Reopening Plan </h2>
    </div>
    <div class="row">
      <?php
           $secondData =  $this->db->query("SELECT * from tb_pagecontain where direction='2' AND statu='0' ");
           if($secondData->num_rows() > 0){
            foreach($secondData->result() as $secData ){

              ?>
              <div class="col-md-6 col-lg-3">
           <div class="box">
             <div class="icon">
               <!-- <i class="fa fa-registered service-icon" style="color: #c59c35;"></i> -->
               <img  class="fa fa-registered service-icon" style="width:80px;height:80px;" src="<?=$secData->file ?>" alt="">
             </div>
   
             <h4 class="title"><a href=""><?=$secData->add_subtitle ?></a></h4>
   
             <p class="description"><?=$secData->description ?></p>
           </div>
         </div>
              
              <?php
  
             }
           }
           
         

      ?>
    </div>
    </section>
  </div>
  <!--event-->
  <div class="container pb-25">
  <div class="row">
    <h2 class="event-head">  Events </h2>
    <!-- <p class="text-center">“ The Achievements of an Organisation are the result of
      combined Effort of each Individual.”</p> -->

      <?php

$frontCrmData =  $this->db->query("SELECT * from front_cms_programs where is_active='no' and type='events' ");
$getData = $frontCrmData->row();        

if($frontCrmData->num_rows()>0){
  foreach($frontCrmData->result() as $getEentdata ){

    ?>
      <div class="col-md-6" style="margin-bottom:20px;">
               <div class="schedule-warp">
                   <div class="day-one"> <?= date("D M Y",strtotime($getEentdata->date))  ?></div>
                <div class="schedule-card">
                  <a href="<?= base_url($getEentdata ->url) ?>">
                  <div class="insidebox">
                      <span class="schedule-tag"> 8:00 AM - 4:30 PM </span> 
                       <span class="schedule-start"><?= $getEentdata->title ?></span>                  
                  </div> 
                </a>
                   </div>
                
              </div>
               </div>
             
    <?php
   }
}


?>
                
    </div>
</div>
<!--event-end-->
<!--gallery-->
 <div class="container pb-25">
  <div class="row">
     <h2 class="event-head"> School Gallery</h2>
<div class="no-touch"> 
  
  <div class="wrap">
    <div class="owl-carousel owl-theme" id="gallery"> 
    <div class="item"> 
      <div class="box-gallery">
        <a href=" https://thewingshield.com/school_src/read/our-main-gallary">
      <div class="boxInner">
        <img src="https://gurukulpublicschool.thewingshield.com/backend/themes/material_pink/images/gallery/7.jpg" />
        <div class="titleBox">Laboratories</div>
      </div>
    </a>
    </div>
  </div>
    <div class="item"> 
      <div class="box-gallery">
        <a href=" https://thewingshield.com/school_src/read/our-main-gallary">
      <div class="boxInner">
        <img src="https://gurukulpublicschool.thewingshield.com/backend/themes/material_pink/images/gallery/lab.jpg" />
        <div class="titleBox">Computer Labs </div>
      </div>
    </a>
    </div>
  </div>
    <div class="item">
      <div class="box-gallery">
        <a href=" https://thewingshield.com/school_src/read/our-main-gallary">
      <div class="boxInner">
        <img src="https://gurukulpublicschool.thewingshield.com/backend/themes/material_pink/images/gallery/lcd.jpg" />
        <div class="titleBox">LCD TEACHING</div>
      </div>
    </a>
    </div>
  </div>
    <div class="item">
      <div class="box-gallery">
        <a href=" https://thewingshield.com/school_src/read/our-main-gallary">
      <div class="boxInner">
        <img src="https://gurukulpublicschool.thewingshield.com/backend/themes/material_pink/images/gallery/sports.jpg" />
        <div class="titleBox">Sports</div>
      </div>
    </a>
    </div>
  </div>
    <div class="item">
      <div class="box-gallery">
        <a href=" https://thewingshield.com/school_src/read/our-main-gallary">
      <div class="boxInner">
        <img src="https://gurukulpublicschool.thewingshield.com/backend/themes/material_pink/images/gallery/20.jpg" />
        <div class="titleBox">Conference Hall</div>
      </div>
    </a>
    </div>
  </div>
     <div class="item">
      <div class="box-gallery">
        <a href=" https://thewingshield.com/school_src/read/our-main-gallary">
      <div class="boxInner">
        <img src="https://gurukulpublicschool.thewingshield.com/backend/themes/material_pink/images/gallery/19.jpg" />
        <div class="titleBox">Music Room </div>
      </div>
    </a>
    </div>
  </div>
     <div class="item">
      <div class="box-gallery">
        <a href=" https://thewingshield.com/school_src/read/our-main-gallary">
      <div class="boxInner">
        <img src="https://gurukulpublicschool.thewingshield.com/backend/themes/material_pink/images/gallery/3.jpg" />
        <div class="titleBox">Transport</div>
      </div>
    </a>
    </div>
  </div>
  </div>
  </div>
  <!-- /#wrap -->
  
</div> 
</div>
</div>
<!--gallery end-->
