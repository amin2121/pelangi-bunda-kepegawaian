<?PHP
  header("Cache-Control: no-cache, no-store, must-revalidate");
  header("Content-Type: application/vnd.ms-excel");
  header("Content-Disposition: attachment; filename=$filename.xls");
?>
<style>
	.grid {
			border: 1px solid black;
		}
	.gridth {
			height: 40px;
			font-size: 13px;
			width: 200px;
			text-align: center;
			border: 1px solid black;
      background: #00E5FF;
		}
	.gridtd {
			vertical-align: middle;
			font-size: 10px;
			/* height: 30px; */
			padding-left: 10px;
			padding-right: 10px;
			border: 1px solid;
			width: 100px;
			border: 1px solid black;
		}

	 tr.title {
		 border-style: solid;
		 border-color: black;
		 border-left: 1px;
		 border-right: 1px;
	 }
</style>
	<table class="grid">
		<thead>
        <th class="gridth">Nama Barang</th>
        <th class="gridth">Jenis Barang</th>
        <th class="gridth">Harga Barang</th>
        <th class="gridth">Memiliki Bahan Baku</th>
		</thead>
		<tbody>
      <?php foreach ($res as $r): ?>
        <tr>
          <td class="gridtd"><?php echo $r['nama_barang']; ?></td>
          <td class="gridtd"><?php echo $r['nama_jenis_barang']; ?></td>
          <td class="gridtd" style="text-align: right"><?php echo $r['harga_jual']; ?></td>
          <td class="gridtd">
            <?php if ($r['status_produksi'] == '0'): ?>
              TIDAK
              <?php else: ?>
              IYA
            <?php endif; ?>
          </td>
        </tr>
      <?php endforeach; ?>
		</tbody>
	</table>
	<?php
	  exit();
	 ?>
