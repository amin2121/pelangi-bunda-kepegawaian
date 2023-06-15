<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Laporan Faktur Barang</title>
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
    	border: 1px solid black;
        border-spacing: 0;
        border-collapse: collapse;
    }

    .grid tfoot{
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
  <h2 style="text-align:center;">Total Faktur Barang per <?php echo $title; ?></h2>

  <br>
  <?php
  if ($title == 'Hari') {
  ?>
  <table>
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
  <?php
  }elseif ($title == 'Bulan') {
  ?>
  <table>
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
    </tbody>
  </table>
  <?php
  }elseif ($title == 'Tahun') {
  ?>
  <table>
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
    </tbody>
  </table>
  <?php
    }
  ?>
  <br>

  <table style="width: 100%;" class="grid">
    <thead>
      <tr>
        <th style="text-align: center;">No</th>
        <th style="text-align: center;">Tanggal</th>
        <th style="text-align: center;">No Faktur</th>
        <th style="text-align: center;">Kode Barang</th>
        <th style="text-align: center;">Nama Barang</th>
        <th style="text-align: center;">Harga Jual (Rp)</th>
        <th style="text-align: center;">HPP (Rp)</th>
        <th style="text-align: center;">Laba Rugi (Rp)</th>
      </tr>
    </thead>
      <tbody>
        <?php
          $no = 0;
          $total_jual = 0;
          $total_awal = 0;
          $total_laba = 0;
          foreach ($result as $r):
          $no++;
          ?>
          <tr>
            <td style="text-align:center;"><?php echo $no; ?></td>
            <td style="text-align:center;"><?php echo $r['tanggal']; ?></td>
            <td style="text-align:center;"><?php echo $r['no_faktur']; ?></td>
            <td style="text-align:center;"><?php echo $r['kode_barang']; ?></td>
            <td style="text-align:center;"><?php echo wordwrap($r['nama_barang'], 20, '<br/>', true); ?></td>
            <td style="text-align:right;"><?php echo number_format($r['harga_jual']); ?></td>
            <td style="text-align:right;"><?php echo number_format($r['harga_awal']); ?></td>
            <td style="text-align:right;"><?php echo number_format($r['laba']); ?></td>
          </tr>
        <?php
        $jual = $r['harga_jual'];
        $total_jual += $jual;

        $awal = $r['harga_awal'];
        $total_awal += $awal;

        $laba = $r['laba'];
        $total_laba += $laba;
        endforeach;
        ?>
        <tr>
          <td colspan="5" style="text-align:right;">Total</td>
          <td style="text-align:right;"><?php echo number_format($total_jual); ?></td>
          <td style="text-align:right;"><?php echo number_format($total_awal); ?></td>
          <td style="text-align:right;"><?php echo number_format($total_laba); ?></td>
        </tr>
      </tbody>
  </table>
  <script>
    window.print();
    // window.onfocus = function () { window.close(); }
  </script>
</body>
</html>
