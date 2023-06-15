<style media="screen">
  #form_diskon,
  #form_nominal{
    display: none;
  }
</style>
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

  $('.check_status').click(function(){
      var cek = $('.check_status').is(":checked");

      if(cek == true){
        $('#form_diskon').show();
        $('#input_persen').val('');
        $('#input_nominal').val('');
      }else{
        $('#form_diskon').hide();
        $('#input_persen').val('');
        $('#input_nominal').val('');
      }
  });

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

  $('#filter_persen').click(function(){
    $('#form_persen').show();
    $('#form_nominal').hide();
    $('#input_nominal').val('');

    // $('#input_persen').removeAttr('disabled');
    // $('#input_nominal').prop('disabled', 'disabled');
  });

  $('#filter_nominal').click(function(){
    $('#form_persen').hide();
    $('#input_persen').val('');
    $('#form_nominal').show();

    // $('#input_persen').prop('disabled', 'disabled');
    // $('#input_nominal').removeAttr('disabled');
  });

  $('#btn_pesan').click(function(){
    var atas_nama = $('#atas_nama').val();
    if (atas_nama == '') {
      alert('Atas nama tidak boleh kosong!');
    }else {
      $('#popup_load').show();
      $.ajax({
          url : '<?php echo base_url(); ?>pemesanan/pesan_transaksi',
          data : $('#form_transaksi').serialize(),
          type : "POST",
          dataType : "json",
          success : function(row){
              swal({
                 title: "Berhasil",
                 text: "Pemesanan Berhasil Ditambahkan, Silahkan Ke Menu Kasir",
                 type: "success"
              },
              function(isConfirm) {
                 if (isConfirm) {
                    window.location.href = '<?php echo base_url(); ?>pemesanan';
                 }
              });

          }
      });
    }
  });

  $('#btn_proses_bayar').click(function(){
    var atas_nama = $('#atas_nama').val();
    $('#btn_batal_bayar').click();
    if (atas_nama == '') {
      alert('Atas nama tidak boleh kosong!');
    } else {
      $('#popup_load').show();
      $.ajax({
          url : '<?php echo base_url(); ?>pemesanan/simpan_transaksi',
          data : $('#form_transaksi').serialize(),
          type : "POST",
          dataType : "json",
          success : function(row){
              var id_pembayaran = row['id_pembayaran'];
              window.location.href = '<?php echo base_url(); ?>pemesanan';
              var win = window.open('<?php echo base_url(); ?>kasir/cetak_struk/'+id_pembayaran, '_blank','location=yes,height=570,width=520,scrollbars=yes,status=yes');
              // win.focus();
          }
      });
    }

  });

});

function data_barang(){
  var search = $('#cari_barang').val();

  $.ajax({
  	url : '<?php echo base_url(); ?>pemesanan/data_barang_result',
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
  			var no = 0;

        if(statusTampilBarang == 'list') {
          $table += `<div class="col-sm-12" style="margin-top: 4px;">`
        }

        for(var i=0; i<result.length; i++){
        	no++;

          let stok = ''
          let aksi_tambah_pesanan = ''

          let jumlah_beli = $(`#qty_`+result[i].id).val()

          if(result[i].stok == 0) {
            stok = `<span style="color: #B22222;">Kosong</span>`
            aksi_tambah_pesanan = `onclick="alert('Stok Kosong Tidak Bisa Ditambahkan')"`
          } else {
            if(parseInt(jumlah_beli) >= result[i].stok) {
              aksi_tambah_pesanan = `onclick="alert('Stok Kosong Tidak Bisa Ditambahkan')"`
              stok = `<span>Sisa : ${result[i].stok}</span>`
            } else {
              stok = `<span>Sisa : ${result[i].stok}</span>`
              aksi_tambah_pesanan = `onclick="tambah_pesanan(${result[i].id});"` 
            }
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
  	url : '<?php echo base_url(); ?>pemesanan/filter_jenis_barang',
    data : {id:id},
  	type : "POST",
  	dataType : 	"json",
  	success : function(result){
  		$table = "";

      let storage = localStorage.getItem('status_tampil_barang')
      let statusTampilBarang = storage || $(`#status-tampil-barang`).val()

  		if (result == "" || result == null) {
  			$table = '<div class="col-md-12"><span style="text-align:center;">Data Barang Kosong</span></div>';
  		}else {
  			var no = 0;

        if(statusTampilBarang == 'list') {
          $table = `<div class="col-sm-12">`
        }

        for(var i=0; i<result.length; i++){
        	no++;

          let stok = ''
          let aksi_tambah_pesanan = ''

          let jumlah_beli = $(`#qty_`+result[i].id).val()

          if(result[i].stok == 0) {
            stok = `<span style="color: #B22222;">Kosong</span>`
            aksi_tambah_pesanan = `onclick="alert('Stok Kosong Tidak Bisa Ditambahkan')"`
          } else {
            stok = `<span>Sisa : ${result[i].stok}</span>`
            aksi_tambah_pesanan = `onclick="tambah_pesanan(${result[i].id});"`
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
              $table += `<div class="card-sub" style="cursor:pointer; border-radius: 4px;" ${aksi_tambah_pesanan}>
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
        $('#btn_bayar').attr('disabled');
        $('#btn_pesan').attr('disabled');
        $('#cari_barang').val('');
      } else {
        $('#btn_bayar').removeAttr('disabled');
        $('#btn_pesan').removeAttr('disabled');
        $('#cari_barang').val('');

  			var harga = 0;
        var laba = 0;
        $table += '<tr>'+
                    '<td style="display:none;">'+
                    '<input type="text" name="id_barang[]" value="'+row.id+'" class="id-barang">'+
                    '<input type="text" name="nama_barang[]" value="'+row.nama_barang+'">'+
                    '<input type="text" name="harga_barang[]" id="hidden_harga_barang_'+row.id+'" value="'+row.harga_jual+'">'+
                    '<input type="text" name="harga_awal[]" id="hidden_harga_awal_'+row.id+'" value="'+row.harga_awal+'">'+
                    '<input type="text" class="laba" name="laba[]" id="laba_'+row.id+'" value="'+row.laba+'">'+
                    '<input type="text" class="total_harga_barang" name="total_harga_barang[]" id="total_harga_barang_'+row.id+'" value="'+row.harga_jual+'">'+
                    '<input type="text" class="total_laba_barang" name="total_laba_barang[]" id="total_laba_barang_'+row.id+'" value="'+row.laba+'">'+
                    '</td>'+
                    '<td style="text-align:center;">'+row.nama_barang+'</td>'+
                    '<td style="text-align:center;"><input type="text" size="5" id="qty_'+row.id+'" name="jumlah_beli[]" onkeyup="FormatCurrency(this); hitung_beli('+row.id+', '+row.stok+'); hitung_total();" value="1"></td>'+
                    '<td style="text-align:right;">Rp. <span id="total_harga_barang_span_'+row.id+'">'+NumberToMoney(row.harga_jual)+'</span></td>'+
                    '<td style="text-align:center;">'+
                      '<button type="button" class="btn btn-danger btn-sm" onclick="hapus_row_pesanan(this, '+row.id+');" name="button"><i class="fa fa-trash"></i></button>'+
                    '</td>'+
                  '</tr>';

  			harga = row.harga_jual;
        laba = row.laba

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

          if(parseInt(qtyBarang+1) > row.stok) {
            alert('Jumlah Beli Melebihi Stok Yang Ada')
            $(`#qty_`+row.id).val(row.stok)
          } else {
            $(`#qty_`+row.id).val(qtyBarang + 1)
          }
          

          $(`#total_harga_barang_span_`+row.id).html(NumberToMoney(total_harga_barang))
          $(`#total_harga_barang_`+row.id).attr('value', total_harga_barang)
          $(`#total_laba_barang_`+row.id).attr('value', total_laba_barang)
          $(`#total_laba_barang_`+row.id).val(total_laba_barang)

        } else {
          $('.table_data_pesanan tbody').append($table);
        }
        
        var hitung = parseFloat(harga) + parseFloat(total_harga);
        var hitung_laba = parseFloat(laba) + parseFloat(total_laba);

  			$('#nilai_transaksi').val(NumberToMoney(hitung));
        $('#nilai_transaksi_bayar').val(NumberToMoney(hitung));
        $('#total_nilai_transaksi').html(NumberToMoney(hitung));
        $(`#nilai_total_laba`).val(hitung_laba)
      }

      $('#popup_load').fadeOut();
      data_barang();
		}
	});
}

function hitung_beli(id, stok){
  var jumlah_beli = $('#qty_'+id).val();
  jumlah_beli = jumlah_beli.split(',').join('') || 0;
  jumlah_beli = parseInt(jumlah_beli)

  if(stok < jumlah_beli) {
    alert('Jumlah Beli Melebihi Stok Yang Ada')
    $('#qty_'+id).val(stok)
    jumlah_beli = stok
  }

  var harga_barang = $('#hidden_harga_barang_'+id).val();
  var laba = $(`#laba_`+id).val();
  var jumlah = jumlah_beli * harga_barang;
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
  $('#nilai_transaksi_bayar').val(NumberToMoney(total));
  $('#total_nilai_transaksi').html(NumberToMoney(total));

  $(`#nilai_total_laba`).val(NumberToMoney(total_laba))
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
  $('#nilai_transaksi_bayar').val(NumberToMoney(jumlah));
  $('#total_nilai_transaksi').html(NumberToMoney(jumlah));

  $(`#nilai_total_laba`).val(NumberToMoney(jumlah_laba));

	var row = btn.parentNode.parentNode;
  row.parentNode.removeChild(row);

	if (jumlah == '0') {
		$('#btn_bayar').attr('disabled','disabled');
    $('#btn_pesan').attr('disabled','disabled');
	}
}

function get_bayar(){
    var nilai_transaksi = $('#nilai_transaksi_bayar').val();
		nilai_transaksi = nilai_transaksi.split(',').join('');
    var dibayar = $('#dibayar').val();
    dibayar = dibayar.split(',').join('');

    if(dibayar == ""){
        dibayar = 0;
    }

    if(parseFloat(dibayar) < parseFloat(nilai_transaksi)){
        var kembali = parseFloat(dibayar) - parseFloat(nilai_transaksi);
        $('#kembali').val(formatNumber(kembali));
				$('#btn_proses_bayar').attr('disabled','disabled');
    }else{
        var kembali = parseFloat(dibayar) - parseFloat(nilai_transaksi);
        $('#kembali').val(formatNumber(kembali));
				$('#btn_proses_bayar').removeAttr('disabled disabled');
    }
}

function hitung_diskon_persen(){
  var jual = $('#nilai_transaksi').val();
  jual = jual.split(',').join('');
  var diskon = $('#input_persen').val();
  diskon = diskon.split(',').join('');

  var hitung_diskon = diskon / 100;
  var hitung_diskon_2 =  jual - (jual * hitung_diskon);
  var harga_jual = Math.ceil(hitung_diskon_2);
  $('#nilai_transaksi_bayar').val(NumberToMoney(harga_jual));
}

function hitung_diskon_nominal(){
  var jual = $('#nilai_transaksi').val();
  jual = jual.split(',').join('');
  var diskon = $('#input_nominal').val();
  diskon = diskon.split(',').join('');

  var harga_jual = jual - diskon;
  $('#nilai_transaksi_bayar').val(NumberToMoney(harga_jual));
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
                  <h4>Pemesanan</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>jenis_barang">Pemesanan</a>
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

                          <div class="row list_barang scroll-list cards" id="draggableWithoutImg" style="height: 630px; width: 100%;">

                          </div>
                      </div>
                  </div>
                </div>
                <div class="col-sm-5">
                    <!-- Panel card start -->
                    <div class="card">
                        <div class="card-header">
                            <h5>List Pesanan</h5>
                            <div class="card-header-right">
                                <i class="icofont icofont-rounded-down"></i>
                            </div>
                        </div>
                      <form id="form_transaksi" method="POST">
                        <div class="card-block panels-wells">
                          <div class="form-group">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Nama Meja</label>
                                <div class="col-sm-9">
                                    <select class="js-example-basic-single col-sm-12" name="nama_meja">
                                      <?php foreach ($meja as $m): ?>
                                        <option value="<?php echo $m['nama_meja']; ?>"><?php echo $m['nama_meja']; ?></option>
                                      <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Atas Nama</label>
                                <div class="col-sm-9">
                                    <input type="text" id="atas_nama" name="atas_nama" class="form-control" required>
                                </div>
                            </div>
                            <input type="hidden" name="no_transaksi" value="<?php echo $no_transaksi; ?>">
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

                                  </tbody>
                                  <tfoot>
                                    <th colspan="2">Total</th>
                                    <th style="text-align:right;">Rp. <span id="total_nilai_transaksi"></span></th>
                                    <th></th>
                                  </tfoot>
                              </table>
                              <input type="hidden" id="nilai_transaksi" name="nilai_transaksi" value="0">
                              <input type="hidden" id="nilai_total_laba" name="nilai_total_laba" value="0">
                          </div>
                          <br>
                          <div class="row">
                            <div class="col-md-6">
                              <button id="btn_pesan" disabled type="button" class="btn btn-warning col-md-12"><i class="fa fa-cutlery"></i>Pesan Dahulu</button>
                            </div>
                            <div class="col-md-6">
                              <button id="btn_bayar" disabled type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#bayar-modal"><i class="fa fa-money"></i>Bayar Sekarang</button>
                            </div>
                          </div>
                        </div>
                    </div>
                    <!-- Panel card end -->
                </div>
              </div>
          </div>
      </div>
  </div>

  <div class="modal fade" id="bayar-modal" tabindex="-1">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Transaksi Pembayaran</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body p-b-0">
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Nilai Transaksi</label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon">Rp</span>
                      <input type="text" id="nilai_transaksi_bayar" class="form-control" name="nilai_transaksi_bayar" readonly value="0">
                    </div>
                  </div>
              </div>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Status Diskon</label>
                  <div class="col-sm-10">
                    <div class="border-checkbox-section">
                      <div class="border-checkbox-group border-checkbox-group-primary">
                          <input class="border-checkbox check_status" type="checkbox" name="status_diskon" value="1" id="checkbox0">
                          <label class="border-checkbox-label" for="checkbox0"></label>
                      </div>
                  </div>
                  </div>
              </div>
              <div id="form_diskon">
                <div class="form-radio">
                    <div class="radio radio-inline">
                        <label>
                            <input type="radio" name="status_diskon_pilih" value="persen" id="filter_persen" checked="checked">
                            <i class="helper"></i>Persen
                        </label>
                    </div>
                    <div class="radio radio-inline">
                        <label>
                            <input type="radio" name="status_diskon_pilih" value="nominal" id="filter_nominal">
                            <i class="helper"></i>Nominal
                        </label>
                    </div>
                </div>
                <div id="form_persen">
                  <div class="form-group row">
                      <label class="col-sm-2 col-form-label">Nilai Persen</label>
                      <div class="col-sm-10">
                        <div class="input-group">
                          <span class="input-group-addon">%</span>
                          <input type="text" name="diskon_persen" class="form-control" id="input_persen" onkeyup="FormatCurrency(this); hitung_diskon_persen();">
                        </div>
                      </div>
                  </div>
                </div>
                <div id="form_nominal">
                  <div class="form-group row">
                      <label class="col-sm-2 col-form-label">Nilai Nominal</label>
                      <div class="col-sm-10">
                        <div class="input-group">
                          <span class="input-group-addon">Rp</span>
                          <input type="text" name="diskon_nominal" class="form-control" id="input_nominal" onkeyup="FormatCurrency(this); hitung_diskon_nominal();">
                        </div>
                      </div>
                  </div>
                </div>
              </div>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Jenis Pembayaran</label>
                  <div class="col-sm-10">
                      <select class="form-control" name="jenis_pembayaran">
                        <option value="tunai">Tunai</option>
                        <option value="kartu">Kartu</option>
                      </select>
                  </div>
              </div>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Dibayar</label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon">Rp</span>
                      <input type="text" class="form-control" id="dibayar" name="dibayar" onkeyup="FormatCurrency(this); get_bayar();" required value="">
                    </div>
                  </div>
              </div>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Kembali</label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon">Rp</span>
                      <input type="text" class="form-control" id="kembali" name="kembali" readonly value="0">
                    </div>
                  </div>
              </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="btn_proses_bayar" disabled class="btn btn-success"><i class="fa fa-money"></i> Proses</button>
                <button type="button" id="btn_batal_bayar" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i> Tutup</button>
            </div>
            </form>
        </div>
    </div>
</div>
  <!-- Main-body end-->
