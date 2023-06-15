<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Laporan Laba Rugi</title>
    <script src="<?php echo base_url(); ?>assets/bower_components/jquery-ui/jquery-ui.min.js"></script>
  </head>
  <style type="text/css" media="print">
  @page {
    /* size: landscape; */
    margin: 1cm;
  }

  .body {
    font-family: Arial, Helvetica, sans-serif;
  }

   .grid th {
    	background: white;
    	vertical-align: middle;
      border: 1px solid black;
    	color : black;
        text-align: center;
        height: 30px;
        font-size: 13px;
    }
    .grid td {
    	background: #FFFFFF;
    	vertical-align: middle;
      border: 1px solid black;
    	font: 11px/15px sans-serif;
    	font-size: 11px;
        height: 20px;
        padding-left: 5px;
        padding-right: 5px;
    }
    .grid {
    	background: black;
      border-collapse: collapse;
    	border: 1px solid black;
        border-spacing: 0;
    }

    .grid tfoot td{
    	background: white;
    	vertical-align: middle;
    	color : black;
        text-align: center;
        height: 20px;
    }

   .footer{
    position:absolute;
    /* right:0; */
    bottom:0;
  }
  </style>
  <body class="body">
    <center><h2>Laporan Laba Rugi per <?php echo $title; ?></h2></center>
    <div class="clear:both;"></div>
    <br>
    <?php
    if ($title == 'Hari') {
    ?>
    <table style="width: 100%;">
      <tbody>
        <tr>
          <td style="width: 15%;">Tanggal</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $judul; ?></td>
        </tr>
        <tr>
          <td style="width: 15%;">Nama Toko</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $this->session->userdata('nama_toko'); ?></td>
        </tr>
        <!-- <tr>
          <td style="width: 15%;">Kasir</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $kasir; ?></td>
        </tr> -->
      </tbody>
    </table>
    <?php
    }elseif ($title == 'Bulan') {
    ?>
    <table style="width: 100%;">
      <tbody>
        <tr>
          <td style="width: 15%;">Bulan</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $judul; ?></td>
        </tr>
        <tr>
          <td style="width: 15%;">Nama Toko</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $this->session->userdata('nama_toko'); ?></td>
        </tr>
        <!-- <tr>
          <td style="width: 15%;">Kasir</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $kasir; ?></td>
        </tr> -->
      </tbody>
    </table>
    <?php
    }elseif ($title == 'Tahun') {
    ?>
    <table style="width: 100%;">
      <tbody>
        <tr>
          <td style="width: 15%;">Tahun</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $judul; ?></td>
        </tr>
        <tr>
          <td style="width: 15%;">Nama Toko</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $this->session->userdata('nama_toko'); ?></td>
        </tr>
        <!-- <tr>
          <td style="width: 15%;">Kasir</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $kasir; ?></td>
        </tr> -->
      </tbody>
    </table>
    <?php
      }
    ?>
    <br>
    <div class="clear:both;"></div>
    <table style="width: 100%;" class="grid">
      <thead>
        <th style="text-align: center;">No</th>
        <th style="text-align: center;">Nama Barang</th>
        <th style="text-align: center;">HPP</th>
        <th style="text-align: center;">Harga Jual</th>
        <th style="text-align: center;">Quantity Laku</th>
        <th style="text-align: center;">Laba</th>
      </thead>
      <tbody>
        <?php
        $total_j = 0;
        $total_tl = 0;
          if ($title == 'Tahun') {
          ?>
          <?php
            $no = 0;
            foreach ($result as $r):
            $no++;
            ?>
            <!-- 
              <th style="text-align: center;">No</th>
              <th style="text-align: center;">Nama Barang</th>
              <th style="text-align: center;">HPP</th>
              <th style="text-align: center;">Harga Jual</th>
              <th style="text-align: center;">Quantity Laku</th>
              <th style="text-align: center;">Laba</th>
             -->
            <tr>
              <td style="text-align:center;"><?php echo $no; ?></td>
              <td style="text-align:center;"><?php echo $r['nama_barang']; ?></td>
              <td style="text-align:right;"><?php echo number_format($r['harga_awal']); ?></td>
              <td style="text-align:right;"><?php echo number_format($r['harga_jual']); ?></td>
              <td style="text-align:right;"><?php echo number_format($r['jumlah_beli']); ?></td>
              <td style="text-align:right;"><?php echo number_format($r['laba'] * $r['jumlah_beli']); ?></td>
            </tr>
          <?php
          $total_laba = $r['laba'] * $r['jumlah_beli'];
          $total_tl += $total_laba;

          $jumlah_beli = $r['jumlah_beli'];
          $total_j += $jumlah_beli;
          endforeach; ?>
        <?php
          }else {
          ?>
          <?php
            $no = 0;
            foreach ($result as $r):
            $no++;
            ?>
            <tr>
              <td style="text-align:center;"><?php echo $no; ?></td>
              <td style="text-align:center;"><?php echo $r['nama_barang']; ?></td>
              <td style="text-align:right;"><?php echo number_format($r['harga_awal']); ?></td>
              <td style="text-align:right;"><?php echo number_format($r['harga_jual']); ?></td>
              <td style="text-align:right;"><?php echo number_format($r['jumlah_beli']); ?></td>
              <td style="text-align:right;"><?php echo number_format($r['laba'] * $r['jumlah_beli']); ?></td>
            </tr>
          <?php
          $total_laba = $r['laba'] * $r['jumlah_beli'];
          $total_tl += $total_laba;

          $jumlah_beli = $r['jumlah_beli'];
          $total_j += $jumlah_beli;
        endforeach; ?>
        <?php
          }
         ?>
         <tr>
           <td style="text-align:right;" colspan="4">Total</td>
           <td style="text-align:right;"><?php echo number_format($total_j); ?></td>
           <td style="text-align:right;"><?php echo number_format($total_tl); ?></td>           
         </tr>
      </tbody>
    </table>
    <script>
      window.print();
      // window.onfocus = function () { window.close(); }
    </script>
  </body>
</html>
