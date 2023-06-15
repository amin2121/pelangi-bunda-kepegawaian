<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Laporan Penjualan Detail</title>
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
    <center><h2>Total Penjualan per <?php echo $title; ?></h2></center>
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
        <tr>
          <td style="width: 15%;">Kasir</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $kasir; ?></td>
        </tr>
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
        <tr>
          <td style="width: 15%;">Kasir</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $kasir; ?></td>
        </tr>
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
        <tr>
          <td style="width: 15%;">Kasir</td>
          <td style="width: 2%;">:</td>
          <td><?php echo $kasir; ?></td>
        </tr>
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
        <th style="text-align: center;">No Transaksi</th>
        <th style="text-align: center;">Nama Kasir</th>
        <th style="text-align: center;">Tanggal & Waktu</th>
        <th style="text-align: center;">Penjualan Kotor (Rp)</th>
        <th style="text-align: center;">Laba Kotor (Rp)</th>
      </thead>
      <tbody>
        <?php
        $subtotal_n = 0;
        $total_t = 0;
        $total_j = 0;
        $total_l = 0;
        ?>
          <?php
            $no = 0;
            foreach ($result as $key => $r):
            $no++;
            ?>
            <tr>
              <td style="text-align:center;"><?php echo $no; ?></td>
              <td style="text-align:center;"><?php echo $r['no_transaksi']; ?></td>
              <td style="text-align:center;"><?php echo $r['nama_lengkap']; ?></td>
              <td style="text-align:center;"><?php echo $r['tanggal']; ?> <?php echo $r['waktu']; ?></td>
              <td style="text-align:right;"><?php echo number_format($r['nilai_transaksi']); ?></td>
              <td style="text-align:right;"><?php echo number_format($r['nilai_total_laba'] ?: 0); ?></td>
            </tr>
          <?php
          $transaksi = $r['nilai_transaksi'];
          $total_t += $transaksi;
          $total_l += $r['nilai_total_laba'] ?: 0;
        endforeach; ?>
         <tr>
           <td style="text-align:right;" colspan="4">Total</td>
           <td style="text-align:right;"><?php echo number_format($total_t); ?></td>
           <td style="text-align:right;"><?php echo number_format($total_l); ?></td>
         </tr>
      </tbody>
    </table>
    <script>
      window.print();
      // window.onfocus = function () { window.close(); }
    </script>
  </body>
</html>
