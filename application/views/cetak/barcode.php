<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Barcode Print</title>
    <script src="<?php echo base_url(); ?>assets/bower_components/jquery-ui/jquery-ui.min.js"></script>
  </head>
  <style type="text/css" media="print">
  @page {
    /* size: landscape; */
    margin: 1.5cm;
  }

  .body {
    /* margin:0in 0.2in 0in 0.1in; */
    /* width: 100%; */
    /* margin: 1cm; */
    font-family: Arial, Helvetica, sans-serif;
   }

   .footer{
    position:absolute;
    /* right:0; */
    bottom:0;
  }

  .one-third{
    /* width: 25%; */
    float: left;
    /* margin-top: 1%;
    margin-bottom: 1%; */
    margin: 1%;
    text-align: center;
  }
  </style>
  <body class="body">
    <?php for ($i=0; $i < $res['kuantitas']; $i++) {
      ?>
      <div class="one-third">
        <span style="font-size: 10px; font-weight: bold; text-transform: uppercase;"><?php echo $res['nama_barang']; ?></span><br>
        <span style="font-size: 15px; font-weight: bold;">Rp. <?php echo number_format($res['harga_barang']); ?></span><br>
        <img src="<?php echo site_url();?>barcode/get_barcode/<?php echo $res['kode_barang'];?>" style="margin-top: 1%;">
      </div>
    <?php
      }
      ?>
    <script>
      window.print();
      // window.onfocus = function () { window.close(); }
    </script>
  </body>
</html>
