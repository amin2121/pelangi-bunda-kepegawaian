<!DOCTYPE html>
<html lang="en">

<head>
    <title>Restaurantku</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="Phoenixcoded">
    <meta name="keywords" content=", Flat ui, Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="Phoenixcoded">
    <!-- Favicon icon -->
    <link rel="icon" href="<?php echo base_url(); ?>assets/favicon.png" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- sweet alert framework -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bower_components/sweetalert/dist/sweetalert.css">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/icon/themify-icons/themify-icons.css">
    <!-- list css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/pages/list-scroll/list.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bower_components/stroll/css/stroll.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/icon/font-awesome/css/font-awesome.min.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/icon/icofont/css/icofont.css">
    <!-- flag icon framework css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/pages/flag-icon/flag-icon.min.css">
    <!-- Menu-Search css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/pages/menu-search/css/component.css">
    <!-- Notification.css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/pages/notification/notification.css">
    <!-- Animate.css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bower_components/animate.css/animate.css">
    <!-- Horizontal-Timeline css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/pages/dashboard/horizontal-timeline/css/style.css">
    <!-- amchart css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/pages/dashboard/amchart/css/amchart.css">
    <!-- animation nifty modal window effects css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/component.css">
    <!-- flag icon framework css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/pages/flag-icon/flag-icon.min.css">
    <!-- Data Table Css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bower_components/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/pages/data-table/css/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bower_components/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <!-- Select 2 css -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/select2/dist/css/select2.min.css" />
    <!-- Switch component css -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bower_components/switchery/dist/switchery.min.css">
    <!-- Style.css -->
     <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/style.css">
    <!--color css-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/color/color-1.css" id="color"/>
    <!-- dropify -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/js/dropify/dist/css/dropify.min.css" id="color"/>

    <script type="text/javascript" rel="preconnect" src="<?php echo base_url(); ?>assets/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- <script type="text/javascript" src="<?php //echo base_url(); ?>assets/pages/session-idle-Timeout/session-idle-Timeout-custom.js"></script> -->
</head>
<style media="screen">
#popup_load {
  width: 100%;
  height: 100%;
  position: fixed;
  background: #fff;
  z-index: 9999;
  opacity:0.8;
  filter:alpha(opacity=80); /* For IE8 and earlier */
  top: 0;
  left: 0;
  display: none;
}
.window_load {
  width:60%;
  height:auto;
  border-radius: 10px;
  position: relative;
  padding: 10px;
  text-align: center;
  margin-top: 20%;
  margin-left: 20%;
}
</style>
<body class="horizontal-fixed">
  <script type="text/javascript">

  $(document).ready(function(){
    <?php if ($this->session->flashdata('check_username')): ?>
       var message = 'Username Sudah Ada !';
       check_username(message);
      <?php endif; ?>

    $.sessionTimeout({
        heading: 'h5',
        title: 'Notifikasi',
        message: 'Aplikasi telah tidak anda gunakan beberapa menit, apakah anda ingin logout?',
        warnAfter: 200000,
        redirAfter: 15000,
        keepAliveUrl: '/',
        redirUrl: '<?php echo base_url(); ?>',
        logoutUrl: '<?php echo base_url(); ?>login/keluar'
    });


    // setInterval(function () {
    //     jumlah_stok();
    //     barang_kosong();
    // }, 5000);
  });

  // $(document).idle({
  //       onIdle: function(){
  //           window.location='<?php //echo base_url(); ?>login/keluar';
  //       },
  //       idle: 10000
  //   });

  function check_username(message){
    $.growl({
            message: message
        },{
            type: 'inverse',
            allow_dismiss: false,
            label: 'Cancel',
            className: 'btn-xs btn-inverse',
            placement: {
                from: 'bottom',
                align: 'right'
            },
            delay: 2500,
            animate: {
                    enter: 'animated fadeIn',
                    exit: 'animated fadeOut'
            },
            offset: {
                x: 30,
                y: 30
            }
        });
  }
  </script>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div></div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <!-- Menu header start -->
    <nav class="navbar header-navbar">
        <div class="navbar-wrapper">
          <div class="navbar-logo">
              <a class="mobile-menu" id="mobile-collapse" href="#">
                  <i class="ti-menu"></i>
              </a>
              <a href="<?php echo base_url(); ?>home">
                <?php $stk = $this->db->get('struk')->row_array() ?>
                <!-- <img class="img-fluid" src="<?php echo base_url(); ?>assets/logo.png" alt="Theme-Logo" /> -->
                    <img class="img-fluid" src="<?php echo base_url(); ?>assets/logo.png" alt="Theme-Logo" />
                  <!--  -->
              </a>
              <a class="mobile-options">
                  <i class="ti-more"></i>
              </a>
          </div>
            <div class="navbar-container container-fluid">
                <div>
                    <ul class="nav-right">

                        <li class="user-profile header-notification">
                            <a href="#">
                                <img src="<?php echo base_url(); ?>assets/149071.png" alt="User-Profile-Image">
                                <span><?php echo $this->session->userdata('nama_lengkap'); ?></span>
                                <i class="ti-angle-down"></i>
                            </a>
                            <ul class="show-notification profile-notification">
                                <!-- <li>
                                    <a href="user-profile.html">
                                        <i class="ti-user"></i> Profile
                                    </a>
                                </li> -->
                                <li>
                                    <a href="<?php echo base_url(); ?>login/keluar" onclick="return confirm('Apakah anda ingin keluar?')">
                                        <i class="ti-layout-sidebar-left"></i> Logout
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- Menu header end -->
    <!-- Menu aside start -->
    <div class="main-menu">
        <div class="main-menu-header">
            <img class="img-40" src="<?php echo base_url(); ?>assets/149071.png" alt="User-Profile-Image">
            <div class="user-details">
                <span><?php echo $this->session->userdata('nama_lengkap'); ?></span>
            </div>
        </div>
        <div class="main-menu-content">
            <ul class="main-navigation">
              <?php $id_level = $this->session->userdata('id_level') ?>
              <?php $menu_1 = $this->db->query("
                  SELECT pengaturan_hak_akses.*, menu_1.* FROM pengaturan_hak_akses
                  LEFT JOIN menu_1 ON pengaturan_hak_akses.id_menu = menu_1.id
                  WHERE pengaturan_hak_akses.level = '$id_level'
                  AND pengaturan_hak_akses.tipe_menu = 'menu_1'
              ")->result_array() ?>
              <?php foreach ($menu_1 as $menu1): ?>
                  <li class="nav-item">
                    <a href="<?= $menu1['link'] == null ? '#' : base_url($menu1['link']) ?>">
                        <i class="<?= $menu1['icon'] ?>"></i>
                        <span><?= $menu1['nama'] ?></span>
                    </a>
                    <?php
                      $id_menu_1 = $menu1['id'];
                      $menu_2 = $this->db->query("
                          SELECT * FROM pengaturan_hak_akses a
                          LEFT JOIN menu_2 b ON a.id_menu = b.id
                          WHERE a.tipe_menu = 'menu_2'
                          AND a.level = '$id_level'
                          AND b.id_menu_1 = $id_menu_1
                      ")->result_array();
                     ?>
                      <?php if(count($menu_2) > 0) : ?>
                          <ul class="tree-1">
                              <?php foreach ($menu_2 as $menu2): ?>
                                <?php
                                  $id_menu_2 = $menu2['id'];
                                  $menu_3 = $this->db->query("
                                          SELECT a.*, b.* FROM pengaturan_hak_akses a
                                          LEFT JOIN menu_3 b ON a.id_menu = b.id
                                          WHERE a.tipe_menu = 'menu_3'
                                          AND a.level = '$id_level'
                                          AND b.id_menu_2 = '$id_menu_2'
                                      ")->result_array();
                                 ?>
                                  <?php if (count($menu_3) > 0): ?>
                                  <li class="nav-sub-item"><a href="<?= base_url($menu2['link']) ?>"><?= $menu2['nama'] ?></a>
                                        <ul class="tree-2">
                                            <?php foreach ($menu_3 as $menu3): ?>
                                                <li><a href="<?php echo base_url($menu3['link']) ?>"><?= $menu3['nama'] ?></a></li>
                                            <?php endforeach ?>
                                        </ul>
                                  </li>
                                  <?php else: ?>
                                  <li><a href="<?= base_url($menu2['link']) ?>"><?= $menu2['nama'] ?></a></li>
                                  <?php endif ?>
                              <?php endforeach ?>
                          </ul>
                      <?php else : ?>
                      <?php endif ?>
                  </li>
              <?php endforeach ?>
            </ul>
        </div>
    </div>
    <!-- Menu aside end -->