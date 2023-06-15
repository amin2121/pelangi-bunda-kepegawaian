<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Laporan Retur Penjualan</title>
    <script src="<?php echo base_url(); ?>assets/bower_components/jquery-ui/jquery-ui.min.js"></script>
  </head>
  <style type="text/css" media="print">
  @page {
    /* size: landscape; */
    margin: 1cm;
  }

  table{
    width: 100%;
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
    <center><h2>Laporan Retur Penjualan</h2></center>
    <div class="clear:both;"></div>
    <br>
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
      </tbody>
    </table>
    <br>
    <div class="clear:both;"></div>
    <table style="width: 100%;" class="grid">
      <thead>
        <th style="text-align: center;">No</th>
        <th style="text-align: center;">Nama Barang</th>
        <th style="text-align: center;">Tanggal Penjualan</th>
        <th style="text-align: center;">Kode Retur</th>
        <th style="text-align: center;">Jumlah Retur</th>
      </thead>
      <tbody>
        <?php
        $total_retur = 0;
        $no = 0;
         foreach ($result as $r):
        $no++;
          ?>
          <tr>
            <td style="text-align:center;"><?php echo $no; ?></td>
            <td style="text-align:center;"><?php echo $r['nama_barang']; ?></td>
            <td style="text-align:center;"><?php echo $r['tanggal']; ?></td>
            <td style="text-align:center;"><?php echo $r['kode_retur']; ?></td>
            <td style="text-align:center;"><?php echo $r['jumlah_retur']; ?></td>
          </tr>
        <?php
        $jumlah = $r['jumlah_retur'];
        $total_retur += $jumlah;
        endforeach; ?>
        <tr>
          <td colspan="4" style="text-align:center;">Total</td>
          <td style="text-align:center;"><?php echo number_format($total_retur); ?></td>
        </tr>
      </tbody>      
    </table>
    <script>
      window.print();
      // window.onfocus = function () { window.close(); }
    </script>
  </body>
</html>
