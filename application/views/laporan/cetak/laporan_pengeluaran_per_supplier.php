<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Laporan Pengeluaran Per Supplier</title>
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
    <center><h2>Total Pengeluaran per Supplier per <?php echo $title; ?></h2></center>
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
      </tbody>
    </table>
    <?php
      }
    ?>
    <br>
    <div class="clear:both;"></div>
      <table style="width: 100%;" class="grid">
          <thead>
            <tr>
              <th colspan="2">Nama Supplier</th>
              <th colspan="2">Total</th>
            </tr>
          </thead>
          <tbody>
            <?php
            foreach ($result as $r):
            ?>
            <tr>
              <td colspan="2" style="text-align: center; font-weight: bold; font-size: 15px;"><?php echo $r['nama_supplier']; ?></td>
              <td colspan="2" style="text-align: center; font-weight: bold; font-size: 15px;"><?php echo $r['jumlah']; ?></td>
              <thead>
                <tr>
                  <th style="text-align: center;">No</th>
                  <th style="text-align: center;">Tanggal</th>
                  <th style="text-align: center;">Jumlah Faktur</th>
                  <th style="text-align: center;">Harga Beli (Rp)</th>
                </tr>
              </thead>
              <tbody>
                <?php
                  $total_harga_beli = 0;
                  if ($title == 'Hari') {
                 ?>
                <?php
                $id_user = $this->session->userdata('id_user');
                $id_supplier = $r['id'];

                $tanggal_sql = $this->db->query("SELECT
                                                 a.tanggal,
                                                 SUM(a.total_harga_beli) AS total_harga_beli,
                                                 COUNT(a.id) AS jumlah_faktur
                                                 FROM faktur a
                                                 WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari','%d-%m-%Y')
                                                 AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai','%d-%m-%Y')
                                                 AND a.id_user = $id_user
                                                 AND a.id_supplier = $id_supplier
                                                 GROUP BY a.tanggal
                                                ");
                $reres = $tanggal_sql->result_array();

                $no = 0;
                foreach ($reres as $r):
                $no++;
                ?>
                <tr>
                  <td style="text-align:center;"><?php echo $no; ?></td>
                  <td style="text-align:center;"><?php echo $r['tanggal']; ?></td>
                  <td style="text-align:center;"><?php echo $r['jumlah_faktur']; ?></td>
                  <td style="text-align:right;"><?php echo number_format($r['total_harga_beli']); ?></td>
                </tr>
                <?php
                $harga_beli = $r['total_harga_beli'];
                $total_harga_beli += $harga_beli;
                endforeach;
                ?>
                <tr>
                  <td colspan="3" style="text-align:right;">Total</td>
                  <td style="text-align:right;"><?php echo number_format($total_harga_beli); ?></td>
                </tr>
                <?php
                  }elseif ($title == 'Bulan') {
                 ?>
                 <?php
                 $id_user = $this->session->userdata('id_user');
                 $id_supplier = $r['id'];

                 $bulan_sql = $this->db->query("SELECT
                                                a.tanggal,
                                                SUM(a.total_harga_beli) AS total_harga_beli,
                                                COUNT(a.id) AS jumlah_faktur
                                                FROM faktur a
                                                WHERE a.id_supplier = $id_supplier
                                                AND a.id_user = $id_user
                                                AND a.bulan = $bulan
                                                GROUP BY a.tanggal
                                                ");
                 $reres = $bulan_sql->result_array();

                 $no = 0;
                 foreach ($reres as $r):
                  $no++;
                   ?>
                   <tr>
                     <td style="text-align:center;"><?php echo $no; ?></td>
                     <td style="text-align:center;"><?php echo $r['tanggal']; ?></td>
                     <td style="text-align:center;"><?php echo $r['jumlah_faktur']; ?></td>
                     <td style="text-align:right;"><?php echo number_format($r['total_harga_beli']); ?></td>
                   </tr>
                 <?php
                 $harga_beli = $r['total_harga_beli'];
                 $total_harga_beli += $harga_beli;
                endforeach;
                ?>
                <tr>
                  <td colspan="3" style="text-align:right;">Total</td>
                  <td style="text-align:right;"><?php echo number_format($total_harga_beli); ?></td>
                </tr>
                <?php
              }elseif ($title == 'Tahun') {
                 ?>
                   <?php
                   $id_user = $this->session->userdata('id_user');
                   $id_supplier = $r['id'];

                   $bulan_sql = $this->db->query("SELECT
                                                  a.bulan AS tanggal,
                                                  SUM(a.total_harga_beli) AS total_harga_beli,
                                                  COUNT(a.id) AS jumlah_faktur
                                                  FROM faktur a
                                                  WHERE a.id_supplier = $id_supplier
                                                  AND a.tahun = $tahun
                                                  AND a.id_user = $id_user
                                                  GROUP BY a.bulan
                                                   ");
                   $reres = $bulan_sql->result_array();

                   $no = 0;
                   foreach ($reres as $r):
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
                       <td style="text-align:center;"><?php echo $nama_bulan; ?> <?php echo $judul; ?></td>
                       <td style="text-align:center;"><?php echo $r['jumlah_faktur']; ?></td>
                       <td style="text-align:right;"><?php echo number_format($r['total_harga_beli']); ?></td>
                     </tr>
                   <?php
                   $harga_beli = $r['total_harga_beli'];
                   $total_harga_beli += $harga_beli;
                 endforeach; ?>
                   <tr>
                     <td colspan="3" style="text-align:right;">Total</td>
                     <td style="text-align:right;"><?php echo number_format($total_harga_beli); ?></td>
                   </tr>
                 <?php
                  }
                  ?>
              </tbody>
            </tr>
            <?php endforeach; ?>
          </tbody>
      </table>
    <script>
      window.print();
      // window.onfocus = function () { window.close(); }
    </script>
  </body>
</html>
