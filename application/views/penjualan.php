<style media="screen">
  .barang-hover:hover{
    background-color: #E0E0E0;
  }
</style>
<script type="text/javascript">
  $(document).ready(function(){
    data_barang();

    setInterval(function () {
        // data_barang();
    }, 5000);

    $(window).keydown(function(e){

     if (e.keyCode == 115) {
       //F3 Dibayar
       e.preventDefault();
       $('#dibayar').focus();
     }else if (e.keyCode == 113) {
       // F2 Pencarian
       $('#cari_barang').focus();
     }else if (e.keyCode == 114) {
       // F4 bayar
       e.preventDefault();
       $('#btn_bayar').click();
     }else if (e.keyCode == 117) {
       //F5 bayar
       e.preventDefault();

       var sts_bayar = $('#sts_bayar').val();

       if (sts_bayar == 1) {
        $('#btn_proses_bayar').click();
      }else {

      }
     }

    });

     $('#cari_barang').focus();

     $('#btn_proses_bayar').click(function(){
        $('#btn_batal_bayar').click();
        $('#popup_load').show();
        $.ajax({
            url : '<?php echo base_url(); ?>penjualan/simpan_transaksi',
            data : $('#form_transaksi').serialize(),
            type : "POST",
            dataType : "json",
            success : function(row){
								var id_penjualan = row['id_penjualan'];
                // clear_setting_vfd();
								window.location.href = '<?php echo base_url(); ?>penjualan';
								var win = window.open('<?php echo base_url(); ?>penjualan/cetak_struk/'+id_penjualan, '_blank','location=yes,height=570,width=520,scrollbars=yes,status=yes');
								// win.focus();
            }
        });
    });

  });

function data_barang(){
  var search = $('#cari_barang').val();

  $.ajax({
  	url : '<?php echo base_url(); ?>penjualan/data_barang_result',
    data : {search:search},
  	type : "POST",
  	dataType : 	"json",
  	success : function(result){
  		$table = "";

  		if (result == "" || result == null) {
  			$table = '<li>'+
                    '<span style="text-align:center;">Data Barang Kosong</span>'+
                 '</li>';
  		}else {
  			var no = 0;
        for(var i=0; i<result.length; i++){
        	no++;

          if (result[i].stok == 0) {
            var pointer = '';
            var stok = '<label class="badge badge-danger">'+result[i].stok+'</label>';
          }else {
            var pointer = 'style="cursor:pointer;" class="barang-hover" onclick="tambah_keranjang('+result[i].id+');"';
            var stok = '<label class="badge badge-success">'+result[i].stok+'</label>';
          }

          if (result[i].status_diskon == 1) {
            diskon = '&nbsp;&nbsp;&nbsp;Diskon : '+result[i].diskon+'%';
          }else if (result[i].status_diskon == 2) {
            diskon = '&nbsp;&nbsp;&nbsp;Diskon : Rp. '+NumberToMoney(result[i].diskon)+'';
          }else if (result[i].status_diskon == 0) {
            diskon = '';
          }

  				$table += '<li '+pointer+'>'+
                      '<span style="font-size: 15px;">'+result[i].nama_barang+'</span><br>'+
                      '<p style="text-align:left; padding-bottom: 0px; margin-bottom: 0px;">'+result[i].kode_barang+'&nbsp;&nbsp;&nbsp;Stok : '+stok+'&nbsp;&nbsp;&nbsp;Harga : Rp. '+NumberToMoney(result[i].harga_jual)+''+diskon+'</p>'+
                    '</li>';

  			}
  		}
  		$('#list_barang').html($table);
  	}
  });

  $('#cari_barang').off('keyup').keyup(function(){
			data_barang();
	});
}

function handle(e){
      if(e.keyCode === 13){
          e.preventDefault(); // Ensure it is only this code that rusn
          var search = $('#cari_barang').val();
          $('#popup_load').show();

          $.ajax({
          	url : '<?php echo base_url(); ?>penjualan/tambah_keranjang_enter',
            data : {search:search},
          	type : "POST",
          	dataType : 	"json",
          	success : function(row){
              $table = "";

              if (row == "" || row == null) {
                $('#btn_bayar').attr('disabled');
                $('#cari_barang').val('');
              }else {
                if (row.stok == '0') {
                  // do_nothing
                }else {
                  $('#btn_bayar').removeAttr('disabled');
                  $('#cari_barang').val('');

                  if (row.status_diskon == 1) {
                    var jual = row.harga_jual;
                    var diskon = row.diskon;
                    var laba_row = row.laba;

                    var hitung_diskon = diskon / 100;
              			var hitung_diskon_2 =  jual - (jual * hitung_diskon);
              			var harga_jual = Math.ceil(hitung_diskon_2);

                    var hitung_diskon_laba = diskon / 100;
              			var hitung_diskon_laba_2 =  laba_row - (laba_row * hitung_diskon_laba);
              			var laba_jual = Math.ceil(hitung_diskon_laba_2);
                  }else if (row.status_diskon == 2) {
                    var jual = row.harga_jual;
                    var diskon = row.diskon;
                    var laba_row = row.laba;

              			var harga_jual = jual - diskon;

              			var laba_jual = laba_row - diskon;
                  }else if (row.status_diskon == 0) {
                    var harga_jual = row.harga_jual;
                    var laba_jual = row.laba;
                  }

                  if (row.status_grosir == 1) {
                    var tombol_grosir = '<button type="button" class="btn btn-warning btn-sm" onclick="show_grosir('+row.id+'); popup_grosir();" name="button"><i class="fa fa-shopping-cart"></i></button>';
                  }else {
                    var tombol_grosir = '';
                  }

            			var harga = 0;
                  $table += '<tr>'+
                              '<td style="display:none;">'+
                              '<input type="text" name="id_barang[]" value="'+row.id_barang+'">'+
                              '<input type="text" name="kode_barang[]" value="'+row.kode_barang+'">'+
                              '<input type="text" name="nama_barang[]" value="'+row.nama_barang+'">'+
                              '<input type="text" name="harga_jual[]" id="hidden_harga_jual_'+row.id+'" value="'+harga_jual+'">'+
                              '<input type="text" class="total_harga_beli" name="total_harga_beli[]" id="total_harga_beli_'+row.id+'" value="'+harga_jual+'">'+
                              '<input type="text" name="laba[]" id="hidden_laba_'+row.id+'" value="'+laba_jual+'">'+
                              '<input type="text" class="total_laba" name="total_laba[]" id="total_laba_'+row.id+'" value="'+laba_jual+'">'+
                              '<input type="text" name="stok[]" id="hidden_stok_'+row.id+'" value="'+row.stok+'">'+
                              '<input type="text" name="status_diskon[]" id="hidden_status_diskon_'+row.id+'" value="'+row.status_diskon+'">'+
                              '<input type="text" name="diskon[]" id="hidden_diskon_'+row.id+'" value="'+row.diskon+'">'+
                              '<input type="text" name="status_grosir[]" id="hidden_status_grosir_'+row.id+'" value="0">'+
                              '</td>'+
                              '<td style="text-align:center;">'+row.kode_barang+'</td>'+
                              '<td style="text-align:center;">'+row.nama_barang+'</td>'+
                              '<td style="text-align:center;"><input type="text" size="5" id="qty_'+row.id+'" name="jumlah_beli[]" onkeyup="FormatCurrency(this); hitung_beli('+row.id+'); hitung_total(); notif_lebih('+row.id+')" value="1"></td>'+
                              '<td style="text-align:right;"><label class="badge badge-success" style="font-size: 12px; cursor:pointer;" onclick="popup_ubah_harga(); ubah_harga('+row.id+');">Rp. <span id="total_harga_beli_span_'+row.id+'">'+NumberToMoney(harga_jual)+'</span></label></td>'+
                              '<td style="text-align:center;">'+
                              ''+tombol_grosir+''+
                              '<button type="button" class="btn btn-danger btn-sm" onclick="hapus_row_transaksi(this, '+row.id+');" name="button"><i class="fa fa-trash"></i></button>'+
                              '</td>'+
                            '</tr>';

            			harga = harga_jual;
            			var total_harga = $('#nilai_transaksi').val();
            			total_harga = total_harga.split(',').join('');
            			if (total_harga == '0' || total_harga == '') {
            				total_harga = 0;
            			}

                  laba = laba_jual;
            			var total_laba = $('#nilai_laba').val();
            			total_laba = total_laba.split(',').join('');
            			if (total_laba == '0' || total_laba == '') {
            				total_laba = 0;
            			}

            			var hitung = parseFloat(harga) + parseFloat(total_harga);
                  var hitung_laba = parseFloat(laba) + parseFloat(total_laba);

            			$('#nilai_transaksi').val(NumberToMoney(hitung));
                  $('#nilai_laba').val(NumberToMoney(hitung_laba));
                  $('#total_nilai_transaksi').html(NumberToMoney(hitung));
            			$('.table_data_keranjang tbody').append($table);
                }

                $('#popup_load').fadeOut();
                data_barang();
                }
          	}
          });
      }
    }

function tambah_keranjang(id){
  $('#popup_load').show();
	$.ajax({
		url : '<?php echo base_url(); ?>penjualan/tambah_keranjang',
		data : {id:id},
		type : "POST",
		dataType : "json",
		success : function(row){
			$table = "";

      if (row == "" || row == null) {
        $('#btn_bayar').attr('disabled');
        $('#cari_barang').val('');
      }else {
        $('#btn_bayar').removeAttr('disabled');
        $('#cari_barang').val('');

        if (row.status_diskon == 1) {
          var jual = row.harga_jual;
          var diskon = row.diskon;
          var laba_row = row.laba;

          var hitung_diskon = diskon / 100;
    			var hitung_diskon_2 =  jual - (jual * hitung_diskon);
    			var harga_jual = Math.ceil(hitung_diskon_2);

          var hitung_diskon_laba = diskon / 100;
    			var hitung_diskon_laba_2 =  laba_row - (laba_row * hitung_diskon_laba);
    			var laba_jual = Math.ceil(hitung_diskon_laba_2);
        }else if (row.status_diskon == 2) {
          var jual = row.harga_jual;
          var diskon = row.diskon;
          var laba_row = row.laba;

    			var harga_jual = jual - diskon;

    			var laba_jual = laba_row - diskon;
        }else if (row.status_diskon == 0) {
          var harga_jual = row.harga_jual;
          var laba_jual = row.laba;
        }

        if (row.status_grosir == 1) {
          var tombol_grosir = '<button type="button" class="btn btn-warning btn-sm" onclick="show_grosir('+row.id+'); popup_grosir();" name="button"><i class="fa fa-shopping-cart"></i></button>';
        }else {
          var tombol_grosir = '';
        }

  			var harga = 0;
        $table += '<tr>'+
                    '<td style="display:none;">'+
                    '<input type="text" name="id_barang[]" value="'+row.id_barang+'">'+
                    '<input type="text" name="kode_barang[]" value="'+row.kode_barang+'">'+
                    '<input type="text" name="nama_barang[]" value="'+row.nama_barang+'">'+
                    '<input type="text" name="harga_jual[]" id="hidden_harga_jual_'+row.id+'" value="'+harga_jual+'">'+
                    '<input type="text" class="total_harga_beli" name="total_harga_beli[]" id="total_harga_beli_'+row.id+'" value="'+harga_jual+'">'+
                    '<input type="text" name="laba[]" id="hidden_laba_'+row.id+'" value="'+laba_jual+'">'+
                    '<input type="text" class="total_laba" name="total_laba[]" id="total_laba_'+row.id+'" value="'+laba_jual+'">'+
                    '<input type="text" name="stok[]" id="hidden_stok_'+row.id+'" value="'+row.stok+'">'+
                    '<input type="text" name="status_diskon[]" id="hidden_status_diskon_'+row.id+'" value="'+row.status_diskon+'">'+
                    '<input type="text" name="diskon[]" id="hidden_diskon_'+row.id+'" value="'+row.diskon+'">'+
                    '<input type="text" name="status_grosir[]" id="hidden_status_grosir_'+row.id+'" value="0">'+
                    '</td>'+
                    '<td style="text-align:center;">'+row.kode_barang+'</td>'+
                    '<td style="text-align:center;">'+row.nama_barang+'</td>'+
                    '<td style="text-align:center;"><input type="text" size="5" id="qty_'+row.id+'" name="jumlah_beli[]" onkeyup="FormatCurrency(this); hitung_beli('+row.id+'); hitung_total(); notif_lebih('+row.id+')" value="1"></td>'+
                    '<td style="text-align:right;"><label class="badge badge-success" style="font-size: 12px; cursor:pointer;" onclick="popup_ubah_harga(); ubah_harga('+row.id+');">Rp. <span id="total_harga_beli_span_'+row.id+'">'+NumberToMoney(harga_jual)+'</span></label></td>'+
                    '<td style="text-align:center;">'+
                    ''+tombol_grosir+''+
                    '<button type="button" class="btn btn-danger btn-sm" onclick="hapus_row_transaksi(this, '+row.id+');" name="button"><i class="fa fa-trash"></i></button>'+
                    '</td>'+
                  '</tr>';

  			harga = harga_jual;
  			var total_harga = $('#nilai_transaksi').val();
  			total_harga = total_harga.split(',').join('');
  			if (total_harga == '0' || total_harga == '') {
  				total_harga = 0;
  			}

        laba = laba_jual;
  			var total_laba = $('#nilai_laba').val();
  			total_laba = total_laba.split(',').join('');
  			if (total_laba == '0' || total_laba == '') {
  				total_laba = 0;
  			}

  			var hitung = parseFloat(harga) + parseFloat(total_harga);
        var hitung_laba = parseFloat(laba) + parseFloat(total_laba);

  			$('#nilai_transaksi').val(NumberToMoney(hitung));
        $('#nilai_laba').val(NumberToMoney(hitung_laba));
        $('#total_nilai_transaksi').html(NumberToMoney(hitung));
  			$('.table_data_keranjang tbody').append($table);
      }

      $('#popup_load').fadeOut();
      data_barang();
		}
	});
}

function popup_ubah_harga(){
  $('#popup_ubah_harga').click();
}

function ubah_harga(id){
  $('#popup_load').show();

      $div = '<div class="form-group row">'+
                '<label class="col-sm-2 col-form-label">Nominal</label>'+
                '<div class="col-sm-10">'+
                  '<div class="input-group">'+
                    '<span class="input-group-addon">Rp</span>'+
                    '<input type="text" id="ubah_harga_'+id+'" class="form-control" onkeyup="FormatCurrency(this); hitung_ubah_harga('+id+');" required>'+
                    '<input type="hidden" id="ubah_laba_'+id+'" class="form-control" onkeyup="FormatCurrency(this);" required>'+
                  '</div>'+
                '</div>'+
            '</div>';

      $button = '<button type="button" onclick="submit_ubah_harga('+id+');" class="btn btn-primary">Simpan</button>'+
                '<button type="button" id="btn_batal_rubah" class="btn btn-danger" data-dismiss="modal">Batal</button>';

      $('#form_ubah_harga').html($div);
      $('#form_button_ubah_harga').html($button);
      $('#popup_load').fadeOut();
}

function hitung_ubah_harga(id){
  var harga_ubah = $('#ubah_harga_'+id).val();
  harga_ubah = harga_ubah.split(',').join('');
  if (harga_ubah == null || harga_ubah == '') {
    harga_ubah = '0';
  }

  var harga = $('#total_harga_beli_'+id).val();
  harga = harga.split(',').join('');

  var laba = $('#total_laba_'+id).val();
  laba = laba.split(',').join('');

  var hitung = harga - harga_ubah;
  var hitung_laba = laba - hitung;

  $('#ubah_laba_'+id).val(hitung_laba);
}

function submit_ubah_harga(id){
  $('#popup_load').show();

  var ubah_harga = $('#ubah_harga_'+id).val();
  ubah_harga = ubah_harga.split(',').join('');
  var ubah_laba = $('#ubah_laba_'+id).val();
  ubah_laba = ubah_laba.split(',').join('');

  $('#total_harga_beli_'+id).val(ubah_harga);
  $('#total_laba_'+id).val(ubah_laba);
  $('#total_harga_beli_span_'+id).html(NumberToMoney(ubah_harga));
  hitung_total();
  $('#btn_batal_rubah').click();

  $('#popup_load').fadeOut();
}

function popup_grosir(){
  $('#popup_grosir').click();
}

function show_grosir(id){
  $('#popup_load').show();
  $.ajax({
    url : '<?php echo base_url(); ?>penjualan/data_grosir_result',
    data : {id:id},
    type : "POST",
    dataType : 	"json",
    success : function(result){
      $table = "";

      if (result == "" || result == null) {
        $table = '<tr><td colspan="2">Tidak Ada Data</td></tr>';
      }else {
        var no = 0;
        for(var i=0; i<result.length; i++){
          no++;

          $table += '<tr style="cursor:pointer;" onclick="klik_grosir('+result[i].id+', '+id+');">'+
                      '<td style="text-align:center;">'+result[i].jumlah+'</td>'+
                      '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].harga_jual)+'</td>'+
                    '</tr>';

        }
      }
      $('.table_data_grosir tbody').html($table);
      $('#popup_load').fadeOut();
    }
  });
}

function klik_grosir(id, id_gudang){
  $('#popup_load').show();

  $.ajax({
		url : '<?php echo base_url(); ?>penjualan/klik_grosir',
		data : {id:id},
		type : "POST",
		dataType : "json",
		success : function(row){

      var jumlah = row.jumlah;
      var stok = $('#hidden_stok_'+id_gudang).val();

      if (parseFloat(jumlah) > parseFloat(stok)) {
        alert('Maaf Jumlah Pembelian Melebihi Stok Barang');
      }else {
        $('#total_harga_beli_'+id_gudang).val(row.harga_jual);
        $('#total_laba_'+id_gudang).val(row.laba);
        $('#qty_'+id_gudang).val(row.jumlah);
        $('#total_harga_beli_span_'+id_gudang).html(NumberToMoney(row.harga_jual));
        $('#hidden_status_grosir_'+id_gudang).val('1');
        $('#tutup_grosir').click();
        hitung_total();

        $('#popup_load').fadeOut();
      }
		}
	});
}

function hitung_beli(id){
  $('#hidden_status_grosir_'+id).val('0');

  var jumlah_beli = $('#qty_'+id).val();
  jumlah_beli = jumlah_beli.split(',').join('');

  var harga_jual = $('#hidden_harga_jual_'+id).val();
  var jumlah = jumlah_beli * harga_jual;

  var laba = $('#hidden_laba_'+id).val();
  var jumlah_laba = jumlah_beli * laba;

  $('#total_laba_'+id).val(jumlah_laba);
  $('#total_harga_beli_'+id).val(jumlah);
  $('#total_harga_beli_span_'+id).html(NumberToMoney(jumlah));
}

function hitung_total(){
  var total = 0;
  $('.total_harga_beli').each(function(idx, elm){
  // console.log(elm.value);
  total += parseFloat(elm.value);
  });

  var total_laba = 0;
  $('.total_laba').each(function(idx, elm){
  // console.log(elm.value);
  total_laba += parseFloat(elm.value);
  });

  $('#nilai_laba').val(NumberToMoney(total_laba));
  $('#nilai_transaksi').val(NumberToMoney(total));
  $('#total_nilai_transaksi').html(NumberToMoney(total));
}

function hapus_row_transaksi(btn, id){
	var total = $('#nilai_transaksi').val();
	total = total.split(',').join('');

  var total_laba = $('#nilai_laba').val();
	total_laba = total_laba.split(',').join('');

	var harga_dipilih = $('#total_harga_beli_'+id).val();
  var harga_laba = $('#total_laba_'+id).val();

	var jumlah = parseFloat(total) - parseFloat(harga_dipilih);
  var jumlah_laba = parseFloat(total_laba) - parseFloat(harga_laba);

  $('#nilai_laba').val(NumberToMoney(jumlah_laba));
	$('#nilai_transaksi').val(NumberToMoney(jumlah));
  $('#total_nilai_transaksi').html(NumberToMoney(jumlah));

	var row = btn.parentNode.parentNode;
  row.parentNode.removeChild(row);

	if (jumlah == '0') {
		$('#btn_bayar').attr('disabled','disabled');
	}
}

function get_bayar(){
    var nilai_transaksi = $('#nilai_transaksi').val();
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
        $('#sts_bayar').val(0);
    }else{
        var kembali = parseFloat(dibayar) - parseFloat(nilai_transaksi);
        $('#kembali').val(formatNumber(kembali));
				$('#btn_proses_bayar').removeAttr('disabled');
        $('#sts_bayar').val(1);
    }
}

function notif_lebih(id){
  stok = $('#hidden_stok_'+id).val();

  qty = $('#qty_'+id).val();
  qty = qty.split(',').join('');

  if (parseInt(qty) > parseInt(stok)) {
    $('#qty_'+id).val(stok);
    hitung_beli(id);
    hitung_total();
    alert('Maaf Jumlah Pembelian Melebihi Stok Barang');
  }

}

function popup_help(){
  $('#popup_help').click();
}

// function setting_vfd(){
//   var total = $('#total_nilai_transaksi').html();
//
//   $.ajax({
// 		url : '<?php //echo base_url(); ?>penjualan/setting_vfd',
// 		data : {total:total},
// 		type : "POST",
// 		dataType : "json",
// 		success : function(row){
//       console.log('sukses');
// 		}
// 	});
// }
//
// function clear_setting_vfd(){
//   $.ajax({
// 		url : '<?php //echo base_url(); ?>penjualan/clear_setting_vfd',
// 		type : "POST",
// 		dataType : "json",
// 		success : function(row){
//       console.log('sukses');
// 		}
// 	});
// }
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
                  <h4>Penjualan</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-shopping-cart"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>penjualan">Penjualan</a>
                      </li>
                  </ul>
              </div>
          </div>
          <div class="page-body">
              <div class="row">
                <div class="col-sm-5">
                        <!-- Panel card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5>Data Barang</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont icofont-question-circle" onclick="popup_help();"></i>
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input id="cari_barang" type="text" name="search" class="form-control" onkeypress="handle(event)">
                              </div>
                                <div class="card card-block user-card">
                                    <ul class="scroll-list cards" id="list_barang">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Panel card end -->
                    </div>
                    <div class="col-sm-7">
                            <!-- Panel card start -->
                            <div class="card">
                                <div class="card-header">
                                    <h5>Keranjang</h5>
                                    <div class="card-header-right">
                                        <i class="icofont icofont-rounded-down"></i>
                                    </div>
                                </div>
                                <form id="form_transaksi" method="POST">
                                <div class="card-block panels-wells">
                                  <div class="dt-responsive table-responsive">
                                      <table class="table table-striped table-bordered nowrap table_data_keranjang">
                                          <thead>
                                              <tr>
                                                  <th>Kode Barang</th>
                                                  <th>Nama Barang</th>
                                                  <th>Qty</th>
                                                  <th>Harga</th>
                                                  <th>Aksi</th>
                                              </tr>
                                          </thead>
                                          <tbody>

                                          </tbody>
                                          <tfoot>
                                            <th colspan="3">Total</th>
                                            <th style="text-align:right;">Rp. <span id="total_nilai_transaksi"></span></th>
                                            <th></th>
                                          </tfoot>
                                      </table>
                                  </div>
                                  <br>
                                  <button id="btn_bayar" disabled type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#bayar-modal"><i class="fa fa-money"></i>Bayar</button>
                                </div>
                            </div>
                            <!-- Panel card end -->
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
                                    <input type="hidden" name="no_transaksi" value="<?php echo $no_transaksi; ?>">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Nilai Transaksi</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" id="nilai_transaksi" class="form-control" name="nilai_transaksi" readonly value="">
                                          </div>
                                        </div>
                                    </div>
                                    <input type="hidden" class="form-control" id="nilai_laba" name="nilai_laba" readonly value="">
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
                                    <input type="hidden" id="sts_bayar" value="0">
                                  </div>
                                  <div class="modal-footer">
                                      <button type="button" id="btn_proses_bayar" disabled class="btn btn-primary">Proses</button>
                                      <button type="button" id="btn_batal_bayar" class="btn btn-danger" data-dismiss="modal">Batal</button>
                                  </div>
                                  </form>
                              </div>
                          </div>
                      </div>


                      <button id="popup_grosir" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#grosir-modal">modal</button>
                      <div class="modal fade" id="grosir-modal" tabindex="-1">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Data Grosir</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-b-0">
                                  <table class="table table-striped table-bordered nowrap table_data_grosir table-hover">
                                      <thead>
                                          <tr>
                                              <th style="text-align:center;">Jumlah</th>
                                              <th style="text-align:center;">Harga Jual</th>
                                          </tr>
                                      </thead>
                                      <tbody>

                                      </tbody>
                                  </table>
                                  <div id="pagination_grosir"></div>
                                  <br>
                                <div class="modal-footer">
                                    <button type="button" id="tutup_grosir" class="btn btn-danger" data-dismiss="modal">Batal</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                  </div>

                  <button id="popup_ubah_harga" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#ubah-harga-modal">modal</button>
                  <div class="modal fade" id="ubah-harga-modal" tabindex="-1">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Ubah Harga</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body p-b-0">
                              <div id="form_ubah_harga">

                              </div>
                              <div class="modal-footer" id="form_button_ubah_harga">

                              </div>
                            </form>
                        </div>
                    </div>
                </div>
              </div>


              </div>
          </div>
      </div>
  </div>
  <!-- Main-body end-->
  <div class="animation-model">
    <button type="button" style="display:none;" class="btn btn-default btn-outline-default waves-effect md-trigger" id="popup_help" data-modal="modal-1">Fade in &amp; Scale</button>
    <div class="md-modal md-effect-1" id="modal-1">
        <div class="md-content">
            <h3>Bantuan</h3>
            <div>
                <ul>
                    <li><strong>F2:</strong> Pencarian Data Barang</li>
                    <li><strong>F3:</strong> Tampilkan Popup Bayar</li>
                    <li><strong>F4:</strong> Input Nilai Pembayaran</li>
                    <li><strong>F6:</strong> Proses Pembayaran</li>
                </ul>
                <button type="button" class="btn btn-primary waves-effect md-close">Close</button>
            </div>
        </div>
    </div>
    <div class="md-overlay"></div>
  </div>
