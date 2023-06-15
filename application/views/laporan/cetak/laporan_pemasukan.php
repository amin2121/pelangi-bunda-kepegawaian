<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Laporan Pemasukan</title>
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
      border-collapse: collapse;
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
  <h2 style="text-align:center;">Total Pemasukan per <?php echo $title; ?></h2>

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
        <th style="text-align: center;">Nama Pemasukan</th>
        <th style="text-align: center;">Tanggal</th>
        <th style="text-align: center;">Nominal (Rp)</th>
        <!-- <th style="text-align: center;">Jumlah Pemasukan</th> -->
      </tr>
    </thead>
      <tbody>
      <?php
        $total = 0;
        if ($title == 'Tahun') {
        ?>
        <?php
          $no = 0;
          foreach ($result as $r):
          $no++;
            $bulan = $r['tanggal'];

            if ($bulan == '01') {
              $nama_bulan = 'Januari';
            }elseif ($bulan == '02') {
              $nama_bulan = 'Februari';
            }elseif ($bulan == '03') {
              $nama_bulan = 'Maret';
            }elseif ($bulan == '04') {
              $nama_bulan = 'April';
            }elseif ($bulan == '05') {
              $nama_bulan = 'Mei';
            }elseif ($bulan == '06') {
              $nama_bulan = 'Juni';
            }elseif ($bulan == '07') {
              $nama_bulan = 'Juli';
            }elseif ($bulan == '08') {
              $nama_bulan = 'Agustus';
            }elseif ($bulan == '09') {
              $nama_bulan = 'September';
            }elseif ($bulan == '10') {
              $nama_bulan = 'Oktober';
            }elseif ($bulan == '11') {
              $nama_bulan = 'November';
            }elseif ($bulan == '12') {
              $nama_bulan = 'Desember';
            }
          ?>
          <tr>
            <td style="text-align:center;"><?php echo $no; ?></td>
            <td style="text-align:center;">
              <?php echo $r['nama_pemasukan']; ?> Bulan <?php echo $nama_bulan; ?>
            </td>
            <td style="text-align:center;"><?php echo $nama_bulan; ?> <?php echo $judul; ?></td>
            <td style="text-align:right;"><?php echo number_format($r['nominal']); ?></td>

          </tr>
        <?php
        $nominal = $r['nominal'];
        $total += $nominal;
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
            <td style="text-align:center;">
              <?php
                if ($r['status'] == 'Penjualan') {
                ?>
                Penjualan Tanggal <?php echo $r['nama_pemasukan']; ?>
              <?php
                }elseif ($r['status'] == 'Pemasukan') {
                ?>
                <?php echo $r['nama_pemasukan']; ?>
              <?php
                }elseif ($r['status'] == 'Stok Masuk') {
                ?>
                Stok Masuk <?php echo $r['nama_pemasukan']; ?>
              <?php
                }
               ?>
            </td>
            <td style="text-align:center;"><?php echo $r['tanggal']; ?></td>
            <td style="text-align:right;"><?php echo number_format($r['nominal']); ?></td>
          </tr>
        <?php
        $nominal = $r['nominal'];
        $total += $nominal;
      endforeach; ?>
      <?php
        }
       ?>
       <tr>
         <td colspan="3" style="text-align:right;">Total</td>
         <td style="text-align:right;"><?php echo number_format($total); ?></td>
       </tr>
    </tbody>
  </table>
  <script>
    window.print();
    // window.onfocus = function () { window.close(); }
  </script>
</body>
</html>
