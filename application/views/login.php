<!DOCTYPE html>
<html lang="en">

<head>
    <title>Restaurantku</title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Phoenixcoded">
    <meta name="keywords" content=", Flat ui, Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="Phoenixcoded">
    <!-- Favicon icon -->
    <link rel="icon" href="<?php echo base_url(); ?>assets/favicon.png" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <style>
        html {
            height: 100%;
        }
    </style>
     <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/style.css">
    <!--color css-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/color/color-1.css" id="color"/>
</head>

<body class="horizontal-fixed" >
    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body">
                        <form class="md-float-material" action="<?php echo base_url(); ?>login/masuk" method="POST">
                          <div class="text-center">
                                <!-- <img src="assets/logo_2.png" alt="logo.png"> -->
                                <?php if($struk != null) : ?>
                                    <img src="<?= base_url('assets/logo_struk/'. $struk['logo_struk']) ?>" alt="" style="width: 120px;">
                                    <h3 style="text-shadow: 2px 4px 3px rgba(104,87,71,0.15); font-weight: bold; color: white; text-transform: uppercase; "><?= $struk['nama_cafe'] ?></h3>
                                <?php else : ?>
                                    <img src="assets/logo_2.png" alt="logo.png">
                                <?php endif ?>
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">Login</h3>
                                    </div>
                                </div>
                                <?php if ($this->session->flashdata('login_gagal')): ?>
                                <div class="alert alert-danger background-danger">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <i class="icofont icofont-close-line-circled text-white"></i>
                                    </button>
                                    <strong>Login Gagal!</strong><br> Username atau Password salah
                                </div>
                                <?php endif; ?>
                                <hr/>
                                  <div class="input-group">
                                      <input type="text" class="form-control" placeholder="Username" name="username" required>
                                      <span class="md-line"></span>
                                  </div>
                                  <div class="input-group">
                                      <input type="password" class="form-control" placeholder="Password" name="password" required>
                                      <span class="md-line"></span>
                                  </div>
                                  <div class="row m-t-30">
                                      <div class="col-md-12">
                                          <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Submit</button>
                                      </div>
                                  </div>
                                <hr/>
                                <p class="text-center" style="color: #696969;">
                                    Powered By Restaurantku
                                    &#x02014;
                                    <a href="https://ababilsoft.com/" target="_blank">Ababilsoft</a>
                                </p>
                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    <!-- Required Jquery -->
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/tether/dist/js/tether.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/modernizr/feature-detects/css-scrollbars.js"></script>?
    <!-- i18next.min.js -->
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/i18next/i18next.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/bower_components/jquery-i18next/jquery-i18next.min.js"></script>
    <!-- Custom js -->
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/js/script.js"></script>
    <!--color script-->
    <!-- <script type="text/javascript" src="<?php echo base_url(); ?>assets/js/common-pages.js"></script> -->
</body>

</html>
