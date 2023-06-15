<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Struk Pembayaran</title>
    <script src="<?php echo base_url(); ?>assets/bower_components/jquery-ui/jquery-ui.min.js"></script>
  </head>
  <style type="text/css" media="print">
  @page {
    /* size: landscape; */
    margin: 0;

  }

  .body {
    margin:0in 0.2in 0in 0in;
    /* margin: 1.6cm;
    mso-header-margin:.5in;
    mso-footer-margin:.5in;
    mso-paper-source:4; */
    font-family: Arial, Helvetica, sans-serif;
   }

   .footer{
    position:absolute;
    /* right:0; */
    bottom:0;
  }
  </style>
  <body class="body">
    <br>
    <table style="width:100%; font-size: 14px; text-transform:uppercase;">
      <tbody>
        <tr>
          <td style="vertical-align: center; text-align:center;">
            <?php if($struk != null) : ?>
              <h4 style="margin: 0px; margin-top: 12px; font-size: 20px;"><?= $struk['nama_cafe'] ?></h4>
            <?php else : ?>
            <h4 style="margin: 0px; margin-top: 12px; font-size: 20px;">Nama Cafe</h4>
            <?php endif ?>
          </td>
        </tr>
        <tr>
          <td style="vertical-align: center; text-align:center;">
            <?= $struk['alamat'] ?? 'Alamat' ?><br>
            No Telepon : <?= $struk['no_telp'] ?? 'Telepon' ?>
          </td>
        </tr>
      </tbody>
    </table>
    <hr style="width: 100%; border: 0.5px solid black;">
    <table style="width:100%; font-size: 14px; text-transform:uppercase;">
      <tbody>
        <tr>
          <td style="width: 38%;">Nomor Transaksi</td>
          <td>:</td>
          <td><?php echo $row['no_transaksi']; ?></td>
        </tr>
        <tr>
          <td style="width: 38%;">Kasir</td>
          <td>:</td>
          <td><?php echo $this->session->userdata('nama_lengkap'); ?></td>
        </tr>
        <tr>
          <td style="width: 38%;">Tanggal & Waktu</td>
          <td>:</td>
          <td><?php echo date('d-m-Y H:i:s') ?></td>
        </tr>
      </tbody>
    </table>
    <table style="width:100%; font-size: 14px; text-transform:uppercase;">
      <thead>
        <tr>
          <td style='border-bottom: 0.5px dashed; width:25%; padding-top:1px; padding-bottom:1px; text-align: left;'>Nama</td>
          <td style='border-bottom: 0.5px dashed; width:25%; padding-top:1px; padding-bottom:1px; text-align: center;'>Qty</td>
          <td style='border-bottom: 0.5px dashed; width:25%; padding-top:1px; padding-bottom:1px; text-align: right;'>Harga</td>
          <td style='border-bottom: 0.5px dashed; width:25%; padding-top:1px; padding-bottom:1px; text-align: right;'>Jumlah</td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($res as $r): ?>
          <tr>
            <td style='border-bottom: 0.5px dashed; width:25%; padding-top:1px; padding-bottom:1px; text-align: left;'><?php echo $r['nama_barang']; ?></td>
            <td style='border-bottom: 0.5px dashed; width:25%; padding-top:1px; padding-bottom:1px; text-align: center;'><?php echo number_format($r['jumlah_beli']); ?></td>
            <td style='border-bottom: 0.5px dashed; width:25%; padding-top:1px; padding-bottom:1px; text-align: right;'><?php echo number_format($r['harga_barang']); ?></td>
            <td style='border-bottom: 0.5px dashed; width:25%; padding-top:1px; padding-bottom:1px; text-align: right;'><?php echo number_format($r['total_harga_barang']); ?></td>
          </tr>
        <?php endforeach; ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="3">
            Total
          </td>
          <td style="text-align: right;">
            <?php echo number_format($row['nilai_transaksi']); ?>
          </td>
        </tr>
      </tfoot>
    </table>
    <table style="width:100%; font-size: 14px; text-transform:uppercase;">
      <tbody>
        <tr>
          <td style="text-align:left;">Diskon</td>
          <td style="text-align:right;"><?php echo number_format($row['diskon']); ?></td>
        </tr>
        <tr>
          <td style="text-align:left;">Jumlah Uang</td>
          <td style="text-align:right;"><?php echo number_format($row['dibayar']); ?></td>
        </tr>
        <tr>
          <td style="text-align:left;">Kembali</td>
          <td style="text-align:right;"><?php echo number_format($row['kembali']); ?></td>
        </tr>
      </tbody>
    </table>
    <!-- <table style="width:80%; font-size: 14px;">
      <tbody>

        <?php if($struk['tampil_facebook'] != 0) : ?>
          <tr>
            <td style="text-align:center; width:100%;">Facebook : <?= $struk['facebook'] ?></td>
          </tr>
        <?php endif ?>

        <?php if($struk['tampil_instagram'] != 0) : ?>
          <tr>
            <td style="text-align:center; width:100%;">Instagram : <?= $struk['instagram'] ?></td>
          </tr>
        <?php endif ?>

        <?php if($struk['tampil_twitter'] != 0) : ?>
          <tr>
            <td style="text-align:center; width:100%;">Twitter : <?= $struk['twitter'] ?></td>
          </tr>
        <?php endif ?>

        <tr>
          <td style="text-align:center; width:100%;"><?= $struk['footer'] ?? 'Terima Kasih & Datang Kembali' ?></td>
        </tr>
      </tbody>
    </table> -->
    <br>
    <?php if($struk['tampil_facebook'] != 0) : ?>
      <p style="text-align:center; font-size: 14px; margin: 0; padding: 0; margin-bottom: 1px;">Facebook : <?= $struk['facebook'] ?></p>
    <?php endif ?>
    <?php if($struk['tampil_instagram'] != 0) : ?>
      <p style="text-align:center; font-size: 14px; margin: 0; padding: 0; margin-bottom: 1px;">Instagram : <?= $struk['instagram'] ?></p>
    <?php endif ?>
    <?php if($struk['tampil_twitter'] != 0) : ?>
      <p style="text-align:center; font-size: 14px; margin: 0; padding: 0; margin-bottom: 1px;">Twitter : <?= $struk['twitter'] ?></p>
    <?php endif ?>
    <p style="text-align:center; font-size: 14px; margin: 0; padding: 0; margin-bottom: 1px;"><?= $struk['footer'] ?? 'Terima Kasih & Datang Kembali' ?></p>
    <!-- <div class="footer">
      <table style="width: 100%; margin-bottom: 14px;">
        <tr>
          <td style="text-align:right; text-transform: uppercase; font-size: 14px;">Copyright &copy; Aladzivie Soft - Jasa pembuatan aplikasi / program lumajang - 082232802556 / 083114029547</td>
        </tr>
      </table>
    </div> -->
    <script>
      window.print();
      window.onfocus = function () { window.close(); }
    </script>
  </body>
</html>
