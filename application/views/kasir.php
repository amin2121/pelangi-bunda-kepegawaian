<style media="screen">
  .barang-hover:hover{
    background-color: #E0E0E0;
  }
  #form_diskon,
  #form_nominal{
    display: none;
  }
</style>
<script type="text/javascript">
$(document).ready(function(){
  data_pesanan();

  setInterval(function () {
      data_pesanan();
  }, 22000);

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

  $('#proses_pesanan').click(function(){
     $('#popup_load').show();
     $.ajax({
         url : '<?php echo base_url(); ?>kasir/proses_pembayaran',
         data : $('#form_pembayaran').serialize(),
         type : "POST",
         dataType : "json",
         success : function(row){
             var id_pembayaran = row['id_pembayaran'];
             window.location.href = '<?php echo base_url(); ?>kasir';
             var win = window.open('<?php echo base_url(); ?>kasir/cetak_struk/'+id_pembayaran, '_blank','location=yes,height=570,width=520,scrollbars=yes,status=yes');
             // win.focus();
         }
     });
     $('#tutup_pesanan').click();
   });

 $('#tutup_pesanan').click(function(){
   $('#dibayar').val('');
   $('#proses_pesanan').attr('disabled','disabled');
 });

});

function data_pesanan(){
  var search = $('#cari_pesanan').val();

  $.ajax({
  	url : '<?php echo base_url(); ?>kasir/pesanan_result',
    data : {search:search},
  	type : "POST",
  	dataType : 	"json",
  	success : function(result){
  		$table = "";

  		if (result == "" || result == null) {
  			$table = '<tr>'+
                    '<td style="text-align:center;" colspan="3">Pesanan Kosong</td>'+
                 '</tr>';
  		}else {
  			var no = 0;
        for(var i=0; i<result.length; i++){
        	no++;
          var nilai_transaksi = result[i].nilai_transaksi;
          var nilai_akhir = '';

          if (result[i].status_diskon == '1') {
            if (result[i].tipe_diskon == 'persen') {
              var hitung_diskon = result[i].diskon / 100;
              var hitung_diskon_2 =  nilai_transaksi - (nilai_transaksi * hitung_diskon);
              nilai_akhir = Math.ceil(hitung_diskon_2);
            }else if (result[i].tipe_diskon == 'nominal') {
              nilai_akhir = parseFloat(nilai_transaksi) - parseFloat(result[i].diskon);
            }
          }else {
            nilai_akhir = nilai_transaksi;
          }

          let html_detail_pesanan = ''
          let total_semua = 0;
          for(const detail_pesanan of result[i].detail) {
            html_detail_pesanan += `
              <tr>
                <td class="text-center">
                  ${detail_pesanan.nama_barang}
                </td>
                <td class="text-right">
                  Rp. ${NumberToMoney(detail_pesanan.harga_barang)}
                </td>
                <td class="text-center">
                  ${detail_pesanan.jumlah_beli}
                </td>
                <td class="text-right">
                  Rp. ${NumberToMoney(detail_pesanan.total_harga_barang)}
                </td>
              </tr>
            `

            total_semua += parseInt(detail_pesanan.total_harga_barang)
          }

          /**
           * <label class="label label-lg label-success" style="font-size: 15px;">
              ${result[i].nama_meja}
            </label>
            <label class="label label-lg label-primary" style="font-size: 15px;">
              ${result[i].atas_nama}
            </label>
            <label class="label label-lg label-info" style="font-size: 15px;">
              Rp. ${NumberToMoney(nilai_akhir)}
            </label>
           */

  				$table += `<tr class="accordion-toggle collapsed">
                      <td style="text-align:center; vertical-align: middle;">
                        <label class="label label-sm label-info" style="font-size: 15px;">
                          ${result[i].nama_meja}
                        </label>
                      </td>
                      <td style="text-align:center; vertical-align: middle;">
                        <b>${result[i].atas_nama.toUpperCase()}</b>
                      </td>
                      <td style="text-align:right; vertical-align: middle;">
                        Rp. ${NumberToMoney(nilai_akhir)}
                      </td>
                      <td style="text-align:center; vertical-align: middle;">
                        <button class="btn btn-primary btn-sm expand-button" type="button" data-toggle="collapse" data-parent="#accordion_${i}" href="#collapse_${i}" class=" btn btn-sm btn-info"><i class="fa fa-info"></i> Lihat Barang</button>
                        <button class="btn btn-success btn-sm" type="button" onclick="popup_detail_pesanan(); detail_pesanan(${result[i].id}); cek_pembayaran(${result[i].id});"><i class="fa fa-money"></i> Bayar Sekarang</button>
                      </td>
                    </tr>
                    <tr class="hide-table-padding">
                      <td colspan="8" style="padding: 0px;">
                      <div id="collapse_${i}" class="collapse in p-3 ">
                        <a id="link_edit_pesanan" href="<?php echo base_url(); ?>kasir/edit_pesanan/${result[i].id}">
                          <label class="label label-lg label-warning" style="font-size: 12px; cursor:pointer;">
                            <i class="fa fa-pencil"></i> Edit Pesanan
                          </label>
                        </a>
                        <a id="link_hapus_pesanan" href="<?php echo base_url(); ?>kasir/hapus_pesanan/${result[i].id}" onclick="return confirm('Apakah anda ingin membatalkan pesanan?')">
                          <label class="label label-lg label-danger" style="font-size: 12px; cursor:pointer;">
                            <i class="fa fa-trash"></i> Batalkan Pesanan
                          </label>
                        </a>
                        <br><br>
                        <div class="table-responsive">
                          <table class="tabelchild table table-striped table-styling table-bordered nowrap">
                            <thead class="table-primary">
                              <tr>
                                <th style="text-align:center;">Nama Barang</th>
                                <th style="text-align:center;">Harga</th>
                                <th style="text-align:center;">Jumlah</th>
                                <th style="text-align:center;">Subtotal</th>
                              </tr>
                            </thead>
                            <tbody>
                              ${html_detail_pesanan}
                            </tbody>
                            <tfoot>
                              <tr>
                                <td colspan="3" class="text-right">Total Semua : </td>
                                <td class="text-right"><b>Rp. ${NumberToMoney(total_semua)}</b></td>
                              </tr>
                            </tfoot>  
                          </table>
                        </div>
                      </div>
                      </td>
                    </tr>
                  `;
  			}
  		}
  		$('#table_pesanan tbody').html($table);
  	}
  });

  $('#cari_pesanan').off('keyup').keyup(function(){
			data_barang();
	});
}

function detail_pesanan(id){
  var link_edit_pesanan = '<?php echo base_url(); ?>kasir/edit_pesanan/'+id;
  $('#link_edit_pesanan').attr('href', link_edit_pesanan);

  var link_hapus_pesanan = '<?php echo base_url(); ?>kasir/hapus_pesanan/'+id;
  $('#link_hapus_pesanan').attr('href', link_hapus_pesanan);

  $.ajax({
  	url : '<?php echo base_url(); ?>kasir/detail_pesanan',
    data : {id:id},
  	type : "POST",
  	dataType : 	"json",
  	success : function(result){
  		$table = "";

  		if (result == "" || result == null) {
  			$table = '<tr>'+
                    '<td colspan="4" style="text-align:center;">Pesanan Kosong</td>'+
                 '</tr>';
  		}else {
  			var no = 0;
        for(var i=0; i<result.length; i++){
        	no++;

  				$table += '<tr>'+
                    '<td style="text-align:center;">'+result[i].nama_barang+'</td>'+
                    '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].harga_barang)+'</td>'+
                    '<td style="text-align:center;">'+NumberToMoney(result[i].jumlah_beli)+'</td>'+
                    '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].total_harga_barang)+'</td>'+
                  '</tr>';
  			}
  		}
  		$('.table_data_pesanan tbody').html($table);
  	}
  });
}

function cek_pembayaran(id){
  $.ajax({
    url : '<?php echo base_url(); ?>kasir/cek_pembayaran',
    data : {id:id},
    type : "POST",
    dataType : 	"json",
    success : function(row){
     var nilai_transaksi = row.nilai_transaksi;
     var nilai_akhir = '';

     if (row.status_diskon == '1') {
        $('.check_status').prop('checked', true);
        $('#form_diskon').show();
        $('#input_persen').val('');
        $('#input_nominal').val('');

        if (row.tipe_diskon == 'persen') {
          var hitung_diskon = row.diskon / 100;
          var hitung_diskon_2 =  nilai_transaksi - (nilai_transaksi * hitung_diskon);
          nilai_akhir = Math.ceil(hitung_diskon_2);

          $('#filter_persen').prop('checked', true);
          $('#filter_nominal').prop('checked', false);
          $('#form_persen').show();
          $('#form_nominal').hide();
          $('#input_persen').val(row.diskon);
          $('#input_nominal').val('');
        }else if (row.tipe_diskon == 'nominal') {
          nilai_akhir = parseFloat(nilai_transaksi) - parseFloat(row.diskon);

          $('#filter_persen').prop('checked', false);
          $('#filter_nominal').prop('checked', true);
          $('#form_persen').hide();
          $('#input_nominal').val(NumberToMoney(row.diskon));
          $('#input_persen').val('');
          $('#form_nominal').show();
        }
      }else {
        nilai_akhir = nilai_transaksi;
        $('.check_status').prop('checked', false);
        $('#form_diskon').hide();
        $('#input_persen').val('');
        $('#input_nominal').val('');
      }

      var total = 'Rp. '+NumberToMoney(nilai_akhir);
      $('#total_harga_barang').html(total);
      $('#id_pembayaran').val(id);
      $('#nilai_transaksi').val(NumberToMoney(nilai_transaksi));
      $('#nilai_transaksi_bayar').val(NumberToMoney(nilai_akhir));
    }
  });
}

function popup_detail_pesanan(){
  $('#popup_bayar').click();
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
				$('#proses_pesanan').attr('disabled','disabled');
    }else{
        var kembali = parseFloat(dibayar) - parseFloat(nilai_transaksi);
        $('#kembali').val(formatNumber(kembali));
				$('#proses_pesanan').removeAttr('disabled');
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
                  <h4>Kasir</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-shopping-cart"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>penjualan">Kasir</a>
                      </li>
                  </ul>
              </div>
          </div>
          <div class="page-body">
              <div class="row">
                <div class="col-sm-12">
                        <!-- Panel card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5>Data Pesanan</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <div class="row">
                                <div class="col-md-12">
                                  <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                    <input id="cari_pesanan" type="text" name="search" class="form-control" onkeypress="handle(event)">
                                  </div>
                                </div>
                                <div class="col-md-12">
                                  <div class="dt-responsive table-responsive" style="height: 500px; overflow: scroll;">
                                        <table id="table_pesanan" class="table table-bordered nowrap">
                                            <thead>
                                                <tr>
                                                    <th style="text-align:center;">Meja Pesanan</th>
                                                    <th style="text-align:center;">Atas Nama</th>
                                                    <th style="text-align:center;">Total Harga</th>
                                                    <th style="text-align:center;">Aksi</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                              </div>
                            </div>
                        </div>
                        <!-- Panel card end -->
                    </div>

                    <button id="popup_bayar" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#bayar-modal">modal</button>
                    <div class="modal fade" id="bayar-modal" tabindex="-1">
                      <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                              <div class="modal-header">
                                  <h5 class="modal-title">Detail Pesanan</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                  </button>
                              </div>
                              <div class="modal-body p-b-0">
                                <br>
                                <form id="form_pembayaran" method="POST">
                                  <input type="hidden" id="id_pembayaran" name="id_pembayaran" value="">
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">Nilai Transaksi</label>
                                      <div class="col-sm-10">
                                        <div class="input-group">
                                          <span class="input-group-addon">Rp</span>
                                          <input type="hidden" id="nilai_transaksi" class="form-control" name="nilai_transaksi" value="">
                                          <input type="text" id="nilai_transaksi_bayar" class="form-control" name="nilai_transaksi_bayar" readonly value="">
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
                                <div class="modal-footer">
                                  <button type="button" id="proses_pesanan" class="btn btn-success" disabled><i class="fa fa-money"></i> Proses</button>
                                  <button type="button" id="tutup_pesanan" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i> Tutup</button>
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
