<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Stok Saat ini</title>
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
    <center><h2>Laporan Stok Saat ini</h2></center>
    <div class="clear:both;"></div>
    <br>
    <table style="width: 100%;">
      <tbody>
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
        <th style="text-align: center;">Harga Awal (Rp.)</th>
        <th style="text-align: center;">Harga Jual (Rp.)</th>
        <th style="text-align: center;">Stok</th>
      </thead>
      <tbody>
        <?php
        $total_s = 0;
        $total_ha = 0;
        $total_hj = 0;
        $no = 0;
        foreach ($result as $r):
          $no++;
         ?>
          <tr>
            <td style="text-align:center"><?php echo $no; ?></td>
            <td style="text-align:center"><?php echo wordwrap($r['nama_barang'], 20, '<br/>', true); ?></td>
            <td style="text-align:right"><?php echo number_format($r['harga_awal']); ?></td>
            <td style="text-align:right"><?php echo number_format($r['harga_jual']); ?></td>
            <td style="text-align:center"><?php echo number_format($r['stok']); ?></td>
          </tr>
        <?php
        $total_s += $r['stok'];
        $total_ha += $r['harga_awal'];
        $total_hj += $r['harga_jual'];

        endforeach;
        ?>
        <tr>
          <td colspan="2" style="text-align:right;">Total</td>
          <td style="text-align:right;"><?php echo number_format($total_ha); ?></td>
          <td style="text-align:right;"><?php echo number_format($total_hj); ?></td>
          <td style="text-align:center;"><?php echo number_format($total_s); ?></td>
        </tr>
      </tbody>
    </table>
    <script>
      window.print();
      // window.onfocus = function () { window.close(); }
    </script>
  </body>
</html>
