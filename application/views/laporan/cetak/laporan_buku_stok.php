<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Laporan Buku Stok</title>
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
    <center><h2>Laporan Laporan Buku Stok</h2></center>
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
        <tr>
          <th style="text-align: center;">No</th>
          <th style="text-align: center;">Nama Barang</th>
          <th style="text-align: center;">Stok Masuk</th>
          <th style="text-align: center;">Stok Keluar</th>
          <!-- <th style="text-align: center;">Retur</th> -->
          <th style="text-align: center;">Stok Akhir</th>
        </tr>
      </thead>
      <tbody>
        <?php
        $no = 0;
        foreach ($result as $r):
        $no++;
          ?>
          <tr>
            <td style="text-align:center;"><?php echo $no; ?></td>
            <td style="text-align:center;"><?php echo wordwrap($r['nama_barang'], 20, '<br/>', true); ?></td>
            <?php
              $id_barang = $r['id_barang'];
              $id_user = $this->session->userdata('id_user');

              $sql_masuk = $this->db->query("SELECT
                                              id_barang,
                                              IFNULL(jumlah, '0') AS jumlah
                                              FROM(
                                                SELECT
                                                b.id_barang,
                                                IFNULL(SUM(b.jumlah), '0') AS jumlah
                                                FROM stok_barang_detail b
                                                LEFT JOIN stok_barang c ON b.id_stok_barang = c.id 
                                                WHERE STR_TO_DATE(c.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari','%d-%m-%Y')
                                                AND STR_TO_DATE(c.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai','%d-%m-%Y')
                                                AND c.id_user = $id_user
                                                AND b.id_barang = $id_barang
                                              ) a
                                              GROUP BY a.id_barang
                                             ");
              $row_masuk = $sql_masuk->row_array();
             ?>
             <td style="text-align:center;"><?php echo $row_masuk['jumlah']; ?></td>
             <?php
               $sql_penjualan = $this->db->query("SELECT
                                                 id_barang,
                                                 IFNULL(jumlah, '0') AS jumlah
                                                 FROM(
                                                   SELECT
                                                   a.id_barang,
                                                   IFNULL(SUM(a.jumlah_beli), '0') AS jumlah
                                                   FROM pembayaran_detail a
                                                   WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari','%d-%m-%Y')
                                                   AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai','%d-%m-%Y')
                                                   AND a.id_user = $id_user
                                                   AND a.id_barang = $id_barang
                                                 ) a
                                                 GROUP BY a.id_barang
                                                ");
               $row_penjualan = $sql_penjualan->row_array();
              ?>
              <td style="text-align:center;"><?php echo $row_penjualan['jumlah']; ?></td>
              <td style="text-align:center;"><?php echo $r['stok']; ?></td>
          </tr>
        <?php
        endforeach;
        ?>
      </tbody>
    </table>
    <script>
      window.print();
      // window.onfocus = function () { window.close(); }
    </script>
  </body>
</html>
