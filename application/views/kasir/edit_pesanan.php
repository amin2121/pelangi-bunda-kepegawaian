<script type="text/javascript">
$(document).ready(function(){
  data_barang();

  let storageTampilBarang = localStorage.getItem('status_tampil_barang')
  if(storageTampilBarang == 'gambar') {
    $(`#btn-tampil-list`).removeClass('btn-primary')
    $(`#btn-tampil-list`).addClass('btn-outline-primary')

    $(`#btn-tampil-gambar`).addClass('btn-primary')
    $(`#btn-tampil-gambar`).removeClass('btn-outline-primary')
  } else {
    $(`#btn-tampil-gambar`).removeClass('btn-primary')
    $(`#btn-tampil-gambar`).addClass('btn-outline-primary')

    $(`#btn-tampil-list`).addClass('btn-primary')
    $(`#btn-tampil-list`).removeClass('btn-outline-primary')
  }

  $(`#btn-tampil-gambar`).click(function() {
    $(`#status-tampil-barang`).val('gambar')
    $(`#btn-tampil-list`).removeClass('btn-primary')
    $(`#btn-tampil-list`).addClass('btn-outline-primary')

    $(`#btn-tampil-gambar`).addClass('btn-primary')
    $(`#btn-tampil-gambar`).removeClass('btn-outline-primary')

    localStorage.setItem("status_tampil_barang", 'gambar');
    data_barang()
  })

  $(`#btn-tampil-list`).click(function() {
    $(`#status-tampil-barang`).val('list')
    $(`#btn-tampil-gambar`).removeClass('btn-primary')
    $(`#btn-tampil-gambar`).addClass('btn-outline-primary')

    $(`#btn-tampil-list`).addClass('btn-primary')
    $(`#btn-tampil-list`).removeClass('btn-outline-primary')

    localStorage.setItem("status_tampil_barang", 'list');
    data_barang()
  })

  var jumlah = $('#nilai_transaksi').val();
	if (jumlah == '0') {
		$('#btn_check_out').attr('disabled','disabled');
	}

  var nilai = '<?php echo $row['nilai_transaksi']; ?>';
  $('#total_nilai_transaksi').html(NumberToMoney(nilai));

  $('#btn_check_out').click(function(){
     $('#popup_load').show();
     $.ajax({
         url : '<?php echo base_url(); ?>kasir/check_out',
         data : $('#form_check_out').serialize(),
         type : "POST",
         dataType : "json",
         success : function(row){
              swal({
                 title: "Berhasil",
                 text: "Perubahan Pesanan Berhasil Disimpan",
                 type: "success"
              },
              function(isConfirm) {
                 if (isConfirm) {
                    window.location.href = '<?php echo base_url(); ?>kasir';
                 }
              });
         }
     });
 });

});

function data_barang(){
  var search = $('#cari_barang').val();

  $.ajax({
  	url : '<?php echo base_url(); ?>kasir/data_barang_result',
    data : {search:search},
  	type : "POST",
  	dataType : 	"json",
  	success : function(result){
  		$table = "";

      let storage = localStorage.getItem('status_tampil_barang')
      let statusTampilBarang = storage || $(`#status-tampil-barang`).val()

  		if (result == "" || result == null) {
  			$table = '<div class="col-md-12"><span style="text-align:center;">Data Barang Kosong</span></div>';
  		}else {

        if(statusTampilBarang == 'list') {
          $table += `<div class="col-sm-12" style="margin-top: 4px;">`
        }

  			var no = 0;        
        for(var i=0; i<result.length; i++){
        	no++;

          let stok = ''
          let aksi_tambah_pesanan = ''

          let jumlah_beli = $(`#qty_`+result[i].id).val()

          let stok_hidden = $(`#stok_hidden_`+result[i].id).val()
          stok_hidden = parseInt(stok_hidden)

          if(result[i].stok == 0) {
            stok = `<span style="color: #B22222;">Kosong</span>`
            aksi_tambah_pesanan = `onclick="alert('Stok Telah Kosong')"`
          } else {
            aksi_tambah_pesanan = `onclick="tambah_pesanan(${result[i].id});"`
            stok = `<span>Sisa : ${result[i].stok}</span>`

          }

          if(statusTampilBarang == 'gambar') {
              $table += `<div class="col-lg-4 col-md-6 col-sm-12 m-b-20">
                      <div class="card-sub" style="cursor:pointer; border-radius: 4px;" ${aksi_tambah_pesanan}>
                          <img class="card-img-top img-fluid" src="<?php echo base_url(); ?>assets/foto_barang/small/${result[i].foto_barang}" style="height: 170px; width: 100%;object-fit: cover;" onerror="this.onerror=null;this.src='<?php echo base_url(); ?>assets/gambar_default/<?= $gambar_default['nama_file'] ?>';">
                          <div class="card-block">
                              <h5 class="card-title" style="color: #212121; font-weight: bold;">${result[i].nama_barang}</h5>
                              <p class="card-text">
                                <span style="color: #758285;">${result[i].nama_jenis_barang}</span><br>
                                <label class="badge badge-inverse-primary" style="font-size: 14px; margin-right: 8px;">Rp. ${NumberToMoney(result[i].harga_jual)}</label>
                                ${stok}
                              </p>
                          </div>
                      </div>
                  </div>`;
          } else {
              $table += `<div class="card-sub" style="cursor:pointer; border-radius: 4px; margin-bottom: 14px;" ${aksi_tambah_pesanan}>
                              <div class="card-block">
                                  <div style="display: flex; justify-content: space-between;">
                                    <div>
                                      <h5 class="card-title" style="color: #212121; font-weight: bold;">${result[i].nama_barang}</h5>
                                      <p class="card-text">
                                        <span style="color: #758285;">${result[i].nama_jenis_barang}</span><br>
                                      </p>
                                    </div>
                                    <div style="display: flex; flex-direction: column; align-items: flex-end;">
                                      <label class="badge badge-inverse-primary" style="font-size: 14px;">Rp. ${NumberToMoney(result[i].harga_jual)}</label>
                                      ${stok}
                                    </div>
                                  </div>
                              </div>
                          </div>`
          }
  			}

        if(statusTampilBarang == 'list') {
          $table += `</div>`
        }

  		}
  		$('.list_barang').html($table);
  	}
  });

  $('#cari_barang').off('keyup').keyup(function(){
			data_barang();
	});
}

function filter_jenis_barang(id){
  $.ajax({
  	url : '<?php echo base_url(); ?>kasir/filter_jenis_barang',
    data : {id:id},
  	type : "POST",
  	dataType : 	"json",
  	success : function(result){
  		$table = "";

      let storage = localStorage.getItem('status_tampil_barang')
      let statusTampilBarang = storage || $(`#status-tampil-barang`).val()

  		if (result == "" || result == null) {
  			$table = '<div class="col-md-12"><span style="text-align:center;">Data Barang Kosong</span></div>';
  		} else {

        if(statusTampilBarang == 'list') {
          $table += `<div class="col-sm-12" style="margin-top: 4px;">`
        }

  			var no = 0;
        for(var i=0; i<result.length; i++) {
        	no++;

          let stok = ''
          let aksi_tambah_pesanan = ''

          let jumlah_beli = $(`#qty_`+result[i].id).val()

          let stok_hidden = $(`#stok_hidden_`+result[i].id).val()
          stok_hidden = parseInt(stok_hidden)

          if(result[i].stok == 0) {
            stok = `<span style="color: #B22222;">Kosong</span>`
            aksi_tambah_pesanan = `onclick="alert('Stok Telah Kosong')"`
          } else {
            aksi_tambah_pesanan = `onclick="tambah_pesanan(${result[i].id});"`
            stok = `<span>Sisa : ${result[i].stok}</span>`

          }

  				if(statusTampilBarang == 'gambar') {
              $table += `<div class="col-lg-4 col-md-6 col-sm-12 m-b-20">
                      <div class="card-sub" style="cursor:pointer; border-radius: 4px;" ${aksi_tambah_pesanan}>
                          <img class="card-img-top img-fluid" src="<?php echo base_url(); ?>assets/foto_barang/small/${result[i].foto_barang}" style="height: 170px; width: 100%;object-fit: cover;" onerror="this.onerror=null;this.src='<?php echo base_url(); ?>assets/gambar_default/<?= $gambar_default['nama_file'] ?>';">
                          <div class="card-block">
                              <h5 class="card-title" style="color: #212121; font-weight: bold;">${result[i].nama_barang}</h5>
                              <p class="card-text">
                                <span style="color: #758285;">${result[i].nama_jenis_barang}</span><br>
                                <label class="badge badge-inverse-primary" style="font-size: 14px; margin-right: 8px;">Rp. ${NumberToMoney(result[i].harga_jual)}</label>
                                ${stok}
                              </p>
                          </div>
                      </div>
                  </div>`;
          } else {
              $table += `<div class="card-sub" style="cursor:pointer; border-radius: 4px; margin-bottom: 14px;" ${aksi_tambah_pesanan}>
                              <div class="card-block">
                                  <div style="display: flex; justify-content: space-between;">
                                    <div>
                                      <h5 class="card-title" style="color: #212121; font-weight: bold;">${result[i].nama_barang}</h5>
                                      <p class="card-text">
                                        <span style="color: #758285;">${result[i].nama_jenis_barang}</span><br>
                                      </p>
                                    </div>
                                    <div style="display: flex; flex-direction: column; align-items: flex-end;">
                                      <label class="badge badge-inverse-primary" style="font-size: 14px;">Rp. ${NumberToMoney(result[i].harga_jual)}</label>
                                      ${stok}
                                    </div>
                                  </div>
                              </div>
                          </div>`
          }

  			}

        if(statusTampilBarang == 'list') {
          $table += `</div>`
        }
  		}
  		$('.list_barang').html($table);
  	}
  });

  $('#cari_barang').off('keyup').keyup(function(){
			data_barang();
	});
}

function hitung_beli(id, stok) {
  var jumlah_beli = $('#qty_'+id).val();
  jumlah_beli = jumlah_beli.split(',').join('') || 0;
  jumlah_beli = parseInt(jumlah_beli)

  var jumlah_beli_def = $('#jumlah_beli_def_'+id).val();
  jumlah_beli_def = jumlah_beli_def.split(',').join('') || 0;
  jumlah_beli_def = parseInt(jumlah_beli_def)

  let stok_hidden = $(`#stok_hidden_`+id).val()
  stok_hidden_int = parseInt(stok_hidden)
  stok_hidden = stok_hidden_int - (jumlah_beli - jumlah_beli_def)
  console.log(stok_hidden_int, jumlah_beli - jumlah_beli_def, jumlah_beli_def)

  /**
   * jumlah_beli = 3 + 2
   * jumlah_beli_def = 3
   * jumlah_asli = (5 - 3) = 2
   * stok_hidden = 4
   */

  if(stok_hidden < 0) {
    alert('Stok Telah Kosong')
    $('#qty_'+id).val(0)
    jumlah_beli = 0
  } else {
    // $(`#stok_hidden_`+id).attr('value', stok_hidden)
  }

  var harga_barang = $('#hidden_harga_barang_'+id).val();
  var jumlah = jumlah_beli * harga_barang;
  var laba = $(`#laba_`+id).val();
  var jumlah_laba = jumlah_beli * laba;

  $('#total_harga_barang_'+id).attr('value', jumlah);
  $(`#total_laba_barang_`+id).attr('value', jumlah_laba);
  $('#total_harga_barang_span_'+id).html(NumberToMoney(jumlah));
}

function hitung_total(){
  var total = 0;
  $('.total_harga_barang').each(function(idx, elm){
    total += parseFloat(elm.value);
  });

  var total_laba = 0;
  $(`.total_laba_barang`).each(function(idx, elm){
    total_laba += parseFloat(elm.value);
  });

  $('#nilai_transaksi').val(NumberToMoney(total));
  $('#total_nilai_transaksi').html(NumberToMoney(total));
  $(`#nilai_total_laba`).val(NumberToMoney(total_laba))
}

function tambah_pesanan(id){
  $('#popup_load').show();
	$.ajax({
		url : '<?php echo base_url(); ?>pemesanan/tambah_pesanan',
		data : {id:id},
		type : "POST",
		dataType : "json",
		success : function(row){
			$table = "";

      if (row == "" || row == null) {
        $('#btn_check_out').attr('disabled');
        $('#cari_barang').val('');
      }else {
        $('#btn_check_out').removeAttr('disabled');
        $('#cari_barang').val('');

  			var harga = 0;
        var laba = 0;
        $table += `<tr>
                    <td style="display:none;">
                    <input type="text" name="id_barang[]" value="${row.id}" class="id-barang">
                    <input type="text" name="nama_barang[]" value="${row.nama_barang}">
                    <input type="text" name="harga_barang[]" id="hidden_harga_barang_${row.id}" value="${row.harga_jual}">
                    <input type="text" name="harga_awal[]" id="hidden_harga_awal_${row.id}" value="${row.harga_awal}">
                    <input type="text" class="laba" name="laba[]" id="laba_${row.id}" value="${row.laba}">
                    <input type="text" class="total_harga_barang" name="total_harga_barang[]" id="total_harga_barang_${row.id}" value="${row.harga_jual}">
                    <input type="text" class="total_laba_barang" name="total_laba_barang[]" id="total_laba_barang_${row.id}" value="${row.laba}">
                    <input type="text" class="stok_hidden" name="stok_hidden[]" id="stok_hidden_${row.id}" value="${row.stok}">
                    <input type="text" class="jumlah_beli_def" name="jumlah_beli_def[]" id="jumlah_beli_def_${row.id}" value="0">
                    </td>
                    <td style="text-align:center;">${row.nama_barang}</td>
                    <td style="text-align:center;"><input type="text" size="5" id="qty_${row.id}" name="jumlah_beli[]" onkeyup="FormatCurrency(this); hitung_beli(${row.id}, ${row.stok}); hitung_total();" value="1"></td>
                    <td style="text-align:right;">Rp. <span id="total_harga_barang_span_${row.id}" class="total_harga_barang_span_${row.id}">${NumberToMoney(row.harga_jual)}</span></td>
                    <td style="text-align:center;">
                      <button type="button" class="btn btn-danger btn-sm" onclick="hapus_row_pesanan(this, ${row.id});" name="button"><i class="fa fa-trash"></i></button>
                    </td>
                  </tr>`;

  			harga = row.harga_jual;
        laba = row.laba;

  			var total_harga = $('#nilai_transaksi').val();
  			total_harga = total_harga.split(',').join('');
  			if (total_harga == '0' || total_harga == '') {
  				total_harga = 0;
  			}

        var total_laba = $('#nilai_total_laba').val();
        total_laba = total_laba.split(',').join('');
        if (total_laba == '0' || total_laba == '') {
          total_laba = 0;
        }

        var dataIdBarang = []
        $(`.id-barang`).each(function() {
          dataIdBarang.push($(this).val())
        })

        if(dataIdBarang.find(val => val == id) != undefined) {
          let qtyBarang = $(`#qty_`+row.id).val()
          qtyBarang = parseInt(qtyBarang)
          let total_harga_barang = $(`#hidden_harga_barang_`+row.id).val()
          total_harga_barang = parseInt(total_harga_barang) * (qtyBarang + 1)
          let total_laba_barang = $(`#total_laba_barang_`+row.id).val()
          total_laba_barang = parseInt(total_laba_barang) * (qtyBarang + 1)

          let stok_hidden = $(`#stok_hidden_`+row.id).val()
          stok_hidden = parseInt(stok_hidden)

          if(stok_hidden == 0) {
            alert('Stok Telah Kosong')
            $(`#qty_`+row.id).val(row.stok)
          } else {
            $(`#qty_`+row.id).val(qtyBarang + 1)
            stok_hidden = stok_hidden - 1
            $(`#stok_hidden_`+row.id).attr('value', stok_hidden)
          }
          
          $(`#total_harga_barang_span_`+row.id).html(NumberToMoney(total_harga_barang))
          $(`#total_harga_barang_`+row.id).attr('value', total_harga_barang)
          $(`#total_laba_barang_`+row.id).val(total_laba_barang)

        } else {
          $('.table_data_pesanan tbody').append($table);
        }
        
        var hitung = parseFloat(harga) + parseFloat(total_harga);
        var hitung_laba = parseFloat(laba) + parseFloat(total_laba);
  			
        var hitung = parseFloat(harga) + parseFloat(total_harga);
        var hitung_laba = parseFloat(laba) + parseFloat(total_laba);

  			$('#nilai_transaksi').val(NumberToMoney(hitung));
        $('#total_nilai_transaksi').html(NumberToMoney(hitung));
        $(`#nilai_total_laba`).val(hitung_laba)
      }

      $('#popup_load').fadeOut();
      data_barang();
		}
	});
}

function hapus_row_pesanan(btn, id){
	var total = $('#nilai_transaksi').val();
  var total_laba = $(`#nilai_total_laba`).val()
	total = total.split(',').join('');
  total_laba = total_laba.split(',').join('');

	var harga_dipilih = $('#total_harga_barang_'+id).val();
  var laba_dipilih = $(`#total_laba_barang_`+id).val();

	var jumlah = parseFloat(total) - parseFloat(harga_dipilih);
  var jumlah_laba = parseFloat(total_laba) - parseFloat(laba_dipilih);

	$('#nilai_transaksi').val(NumberToMoney(jumlah));
  $('#total_nilai_transaksi').html(NumberToMoney(jumlah));
  $(`#nilai_total_laba`).val(NumberToMoney(jumlah_laba));

	var row = btn.parentNode.parentNode;
  row.parentNode.removeChild(row);

	if (jumlah == '0') {
		$('#btn_check_out').attr('disabled','disabled');
	}
}
</script>
<div id="popup_load">
	    <div class="window_load">
	        <img src="<?=base_url()?>assets/Ellipsis.gif" height="120" width="120">
	    </div>
</div>
<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Edit Pesanan</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>jenis_barang">Edit Pesanan</a>
                      </li>
                  </ul>
              </div>
          </div>
          <div class="page-body">
              <div class="row">
                <div class="col-sm-7">
                  <div class="card">
                      <div class="card-header">
                          <h5>List Barang</h5>
                          <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                          </div>
                      </div>
                      <div class="card-block">
                          <div class="input-group">
                            <select class="js-example-basic-single col-sm-12" onchange="filter_jenis_barang(this.value);">
                              <option value="semua">Semua</option>
                              <?php foreach ($jenis as $j): ?>
                                <option value="<?php echo $j['id']; ?>"><?php echo $j['nama_jenis_barang']; ?></option>
                              <?php endforeach; ?>
                            </select>
                          </div>
                          <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input id="cari_barang" type="text" name="search" class="form-control">
                          </div>

                          <input type="hidden" id="status-tampil-barang" value="gambar">
                          <button class="btn btn-primary btn-sm btn-round" style="cursor: pointer" id="btn-tampil-gambar"><i class="fa fa-th"></i> Lihat Sebagai Gambar</button>
                          <button class="btn btn-outline-primary btn-sm btn-round" style="cursor: pointer" id="btn-tampil-list"><i class="fa fa-list-ul"></i> Lihat Sebagai List</button>
                          <br><br>

                          <div class="row list_barang scroll-list cards" id="draggableWithoutImg" style="height: 630px;">

                          </div>
                      </div>
                  </div>
                </div>
                <div class="col-sm-5">
                  <form id="form_check_out" method="post">
                        <!-- Panel card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5>List Pesanan</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <div class="form-group">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Nama Meja</label>
                                    <div class="col-sm-9">
                                        <input readonly class="form-control" name="nama_meja" value="<?php echo $row['nama_meja']; ?>">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Atas Nama</label>
                                    <div class="col-sm-9">
                                        <input readonly name="atas_nama" class="form-control" value="<?php echo $row['atas_nama']; ?>">
                                    </div>
                                </div>
                              </div>
                              <div class="dt-responsive table-responsive">
                                  <table class="table table-striped table-bordered nowrap table_data_pesanan">
                                      <thead>
                                          <tr>
                                              <th>Nama Barang</th>
                                              <th>Qty</th>
                                              <th>Harga</th>
                                              <th>Aksi</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                        <?php foreach ($res as $r): ?>
                                          <tr>
                                            <td style="display:none;">
                                              <input type="text" name="id_pesanan[]" value="<?php echo $r['id']; ?>">
                                              <input type="text" name="id_barang_ada[]" value="<?php echo $r['id_barang']; ?>" class="id-barang">
                                              <input type="text" name="nama_barang_ada[]" value="<?php echo $r['nama_barang']; ?>">
                                              <input type="text" name="harga_barang_ada[]" id="hidden_harga_barang_<?php echo $r['id_barang']; ?>" value="<?php echo $r['harga_barang']; ?>">
                                              <input type="text" class="laba" name="laba_ada[]" id="laba_<?php echo $r['id_barang']; ?>" value="<?php echo $r['laba']; ?>">
                                              <input type="text" class="total_harga_barang" name="total_harga_barang_ada[]" id="total_harga_barang_<?php echo $r['id_barang']; ?>" value="<?php echo $r['total_harga_barang']; ?>">
                                              <input type="text" class="total_laba_barang" name="total_laba_barang_ada[]" id="total_laba_barang_<?php echo $r['id_barang']; ?>" value="<?php echo $r['total_laba']; ?>">
                                              <input type="text" class="stok_hidden" name="stok_hidden[]" id="stok_hidden_<?php echo $r['id_barang']; ?>" value="<?php echo $r['stok']; ?>">
                                              <input type="text" class="jumlah_beli_def" name="jumlah_beli_def[]" id="jumlah_beli_def_<?php echo $r['id_barang']; ?>" value="<?php echo $r['jumlah_beli']; ?>">
                                            </td>
                                            <td style="text-align:center;"><?php echo $r['nama_barang']; ?></td>
                                            <td style="text-align:center;">
                                              <input type="text" size="5" id="qty_<?php echo $r['id_barang']; ?>" name="jumlah_beli_ada[]" onkeyup="FormatCurrency(this); hitung_beli(<?php echo $r['id_barang']; ?>, <?php echo $r['stok']; ?>); hitung_total();" value="<?php echo $r['jumlah_beli']; ?>">
                                            </td>
                                            <td style="text-align:right;">Rp. <span id="total_harga_barang_span_<?php echo $r['id_barang']; ?>" class="total_harga_barang_span_<?php echo $r['id_barang']; ?>"><?php echo number_format($r['total_harga_barang']); ?></span></td>
                                            <td style="text-align:center;">
                                              <a href="<?php echo base_url(); ?>kasir/hapus_list_pesanan/<?php echo $row['id']; ?>/<?php echo $r['id']; ?>" onclick="return confirm('Apakah anda ingin menghapus pesanan?')">
                                                <button type="button" class="btn btn-danger btn-sm" name="button"><i class="fa fa-trash"></i></button>
                                              </a>
                                            </td>
                                          </tr>
                                        <?php endforeach; ?>
                                      </tbody>
                                      <tfoot>
                                        <th colspan="2">Total</th>
                                        <th style="text-align:right;">Rp. <span id="total_nilai_transaksi"></span></th>
                                        <th></th>
                                      </tfoot>
                                  </table>
                                  <input type="hidden" id="nilai_transaksi" name="nilai_transaksi" value="<?php echo $row['nilai_transaksi']; ?>">
                                  <input type="hidden" id="nilai_total_laba" name="nilai_total_laba" value="<?php echo $row['nilai_total_laba']; ?>">
                                  <input type="hidden" name="no_transaksi" value="<?php echo $row['no_transaksi']; ?>">
                                  <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                              </div>
                              <br>
                              <div class="row">
                                <div class="col-md-6">
                                  <a href="<?php echo base_url(); ?>kasir">
                                    <button type="button" class="btn btn-outline-warning col-md-12" style="cursor: pointer;"><i class="fa fa-mail-reply"></i>Kembali</button>
                                  </a>
                                </div>
                                <div class="col-md-6">
                                  <button id="btn_check_out" type="button" class="btn btn-primary col-md-12"><i class="fa fa-save"></i>Simpan</button>
                                </div>
                              </div>
                            </div>
                        </div>
                        <!-- Panel card end -->
                        </form>
                    </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Main-body end-->
