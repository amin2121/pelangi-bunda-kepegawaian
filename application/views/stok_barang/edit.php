<script type="text/javascript">
$(document).ready(function(){

$('#default').click(function(){
	$('#input_faktur_default').removeAttr('disabled');
	$('#input_faktur_generate').prop('disabled', 'disabled')

	$('#form_default').show();
	$('#form_generate').hide();
});

$('#generate').click(function(){
	$('#input_faktur_default').prop('disabled', 'disabled');
	$('#input_faktur_generate').removeAttr('disabled')

	$('#form_default').hide();
	$('#form_generate').show();
});

$('.check_status').click(function(){
	var cek = $('.check_status').is(":checked");

	if(cek == true){
		$('#form_diskon').show();
		$('#input_persen').val('');
	}else{
		$('#form_diskon').hide();
		$('#input_persen').val('');
	}
});

	$('#btn_simpan').click(function(){
			$.ajax({
				 url : '<?php echo base_url(); ?>stok_barang/simpan_edit',
				 data : $('#form_stok_barang').serialize(),
				 type : "POST",
				 dataType : "json",
				 success : function(row){
            if(row.status) {
              swal({
                 title: "Berhasil",
                 text: "Data Stok Berhasil Diedit",
                 type: "success"
              },
              function(isConfirm) {
                 if (isConfirm) {
                   window.location.href = '<?php echo base_url(); ?>stok_barang';
                 }
              });
            } else {
              swal("Gagal", "Silahkan Anda Mengedit Stok Barang Lagi!", "error");
            }
				 }
			 });

			 e.preventDefault();
	 });

});

	function pilih_bayar(status){
		if (status == 'Tunai') {
			$('#form_tanggal_bayar').hide();
			$('#form_tanggal_bayar').prop('disabled');
			$('#input_tanggal_bayar').prop('disabled');
		}else if (status == 'Kredit') {
			$('#form_tanggal_bayar').show();
			$('#form_tanggal_bayar').removeAttr('disabled');
			$('#input_tanggal_bayar').removeAttr('disabled');
		}
	}

  function hitung_total(){
    var total = 0;
    $('.class_harga_beli').each(function(idx, elm){
      var f = elm.value;
  			f = f.split(',').join('');
  			if (f == '') {
  				f = 0;
  			}
    total += parseFloat(f);
    });

    $('#total_semua').val(NumberToMoney(total));
		$('#total_semua_def').val(NumberToMoney(total));
  }

	function hitung_jumlah(number){
		var harga_jual = $('#harga_jual_'+number).val();
    harga_jual = harga_jual.split(',').join('');

		if (harga_jual == '') {
			harga_jual = 0;
		}

		var jumlah = $('#jumlah_'+number).val();
    jumlah = jumlah.split(',').join('');

		if (jumlah == '') {
			jumlah = 0;
		}

		var total = jumlah * harga_jual;
		$('#total_harga_'+number).val(NumberToMoney(total));
	}

  function tambah_barang(){
    var jml_tr = $('#barang_number').val();
    var i = parseInt(jml_tr) + 1;

    $menu =
    '<tr>'+
      '<td>'+
        '<div class="input-group">'+
          '<span class="input-group-addon" id="btn_popup_search" onclick="popup_barang('+i+'); get_nama_barang('+i+')"><i class="fa fa-search"></i></span>'+
          '<input type="text" name="nama_barang[]" class="form-control" id="nama_barang_'+i+'" readonly required>'+
          '<input type="hidden" name="id_barang[]" class="form-control" id="id_barang_'+i+'">'+
        '</div>'+
      '</td>'+
      '<td>'+
        '<input type="text" name="jumlah[]" class="form-control" id="jumlah_'+i+'" onkeyup="FormatCurrency(this); hitung_jumlah('+i+'); hitung_total();" required>'+
      '</td>'+
      '<td>'+
        '<div class="input-group">'+
          '<span class="input-group-addon">Rp</span>'+
					'<input type="text" name="harga_jual[]" class="form-control" id="harga_jual_'+i+'" onkeyup="FormatCurrency(this); hitung_jumlah('+i+'); hitung_total();" required>'+
        '</div>'+
      '</td>'+
      '<td>'+
        '<div class="input-group">'+
          '<span class="input-group-addon">Rp</span>'+
          '<input type="text" name="total_harga[]" class="form-control class_harga_beli" id="total_harga_'+i+'" onkeyup="FormatCurrency(this);" readonly required>'+
        '</div>'+
      '</td>'+
      '<td>'+
        '<button type="button" class="btn btn-sm btn-danger" name="button" onclick="hapus_row_barang(this, '+i+');"><i class="fa fa-trash"></i></button>'+
      '</td>'+
    '</tr>';

    $('#tabel_tambah_barang').append($menu);
    $('#barang_number').val(i);
  }

  function hapus_row_barang(btn, id){
    var jumlah = $('#barang_number').val();
    var i = parseInt(jumlah) - 1;

    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
  	$('#barang_number').val(i);
  }

  function popup_barang(id){
    $('#popup_barang').click();
    setTimeout(function() { $('#search_barang').focus() }, 1000);
  }

  function get_nama_barang(number){
		$('.popup_load_modal').show();
    var search = $('#search_barang').val();

    $.ajax({
        url : '<?php echo base_url(); ?>stok_barang/get_nama_barang',
        data : {search:search},
        type : "POST",
        dataType : "json",
        success : function(result){
            $tr = "";

            if(result == "" || result == null){
                $tr = "<tr><td colspan='4' style='text-align:center;'><b>Data tidak ditemukan</b></td></tr>";
            }else{
                var no = 0;
                for(var i=0; i<result.length; i++){
                    no++;

                    $tr += '<tr style="cursor:pointer;" onclick="klik_barang('+result[i].id+','+number+');">'+
                                '<td>'+result[i].nama_barang+'</td>'+
                                '<td>'+result[i].jenis_barang+'</td>'+
                                '<td class="text-right">Rp. '+NumberToMoney(result[i].harga_jual) || 0+'</td>'+
                            '</tr>';
                }
            }

            $('.table_data_barang tbody').html($tr);
            paging();
						$('.popup_load_modal').fadeOut();
        }
    });

    $('#search_barang').off('keyup').keyup(function(){
        get_nama_barang(number);
    });
}

function paging($selector){
	var jumlah_tampil = '10';

    if(typeof $selector == 'undefined')
    {
        $selector = $(".table_data_barang tbody tr");
    }

    window.tp = new Pagination('#pagination_barang', {
        itemsCount:$selector.length,
        pageSize : parseInt(jumlah_tampil),
        onPageSizeChange: function (ps) {
            console.log('changed to ' + ps);
        },
        onPageChange: function (paging) {
            //custom paging logic here
            //console.log(paging);
            var start = paging.pageSize * (paging.currentPage - 1),
                end = start + paging.pageSize,
                $rows = $selector;

            $rows.hide();

            for (var i = start; i < end; i++) {
                $rows.eq(i).show();
            }
        }
    });
}

function klik_barang(id, number){
    $('#tutup_barang').click();
		$('#popup_load').show();

    $.ajax({
        url : '<?php echo base_url(); ?>stok_barang/klik_barang',
        data : {id:id},
        type : "POST",
        dataType : "json",
        success : function(row){
          $('#id_barang_'+number).val(id);
          $('#nama_barang_'+number).val(row['nama_barang']);
          $(`#harga_jual_`+number).val(NumberToMoney(row['harga_jual']));

					$('#popup_load').fadeOut();
        }
    });
}

function hitung_diskon(){
	var beli = $('#total_harga_def').val();
	beli = beli.split(',').join('');

	var diskon = $('#input_diskon').val();
	diskon = diskon.split(',').join('');

	if (diskon == '') {
		diskon = 0;
	}

	var hitung_diskon = diskon / 100;
	var hitung_diskon_2 =  beli - (beli * hitung_diskon);

	if (diskon == 0) {
		var harga = $('#total_harga_def').val();
		harga = harga.split(',').join('');
	}else {
		var harga = Math.ceil(hitung_diskon_2);
	}

	$('#total_harga').val(NumberToMoney(harga));
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
                  <h4>Stok Barang</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-package"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>stok_masuk">Stok Barang</a>
                      </li>
                      <li class="breadcrumb-item">Edit Stok Barang
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
                                <h5>Edit Stok Barang</h5>
                                <!-- <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div> -->
                            </div>
                            <div class="card-block panels-wells">
                              <button type="button" style="display:none;" class="btn btn-danger alert-success-cancel m-b-10" id="alert_konfirmasi">alert</button>
                              <form id="form_stok_barang" action="" method="POST">
                                <?php $index = count($stok_detail); ?>
                                <input type="hidden" value="<?= $row['id'] ?>" name="id_stok_barang">
                                <input type="hidden" id="barang_number" name="" value="<?= $index ?>">

																	<div class="form-group row">
																			<label class="col-sm-2 col-form-label">Tanggal</label>
																			<div class="col-sm-10">
																					<input type="date" name="tanggal" class="form-control" required value="<?= date('Y-m-d', strtotime($row['tanggal'])) ?>"/>
																			</div>
																	</div>

                                    <div class="dt-responsive table-responsive">
                                        <table id="tabel_tambah_barang" class="table table-striped table-bordered nowrap">
                                            <thead>
                                                <tr>
                                                    <th style="text-align:center;">Nama Barang</th>
                                                    <th style="text-align:center;">Jumlah</th>
                                                    <th style="text-align:center;">Harga Jual</th>
                                                    <th style="text-align:center;">Total Harga</th>
                                                    <th style="text-align:center;">Aksi</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                              <?php foreach ($stok_detail as $key => $stok): ?>
                                                <tr>
                                                  <td>
                                                    <div class="input-group">
                                                      <span class="input-group-addon" id="btn_popup_search" onclick="popup_barang(<?= ++$key ?>); get_nama_barang(<?= ++$key ?>);"><i class="fa fa-search"></i></span>
                                                      <input type="text" name="nama_barang[]" class="form-control input_isi" id="nama_barang_<?= ++$key ?>" readonly required value="<?= $stok['nama_barang'] ?>"/>
                                                      <input type="hidden" name="id_barang[]" class="form-control" id="id_barang_<?= ++$key ?>" value="<?= $stok['id_barang'] ?>">
                                                    </div>
                                                  </td>
                                                  <td>
                                                    <input type="text" name="jumlah[]" class="form-control input_isi" id="jumlah_<?= ++$key ?>" onkeyup="FormatCurrency(this); hitung_jumlah(<?= ++$key ?>); hitung_total();" required value="<?= $stok['jumlah'] ?>"/>
                                                  </td>
                                                  <td>
                                                    <div class="input-group">
                                                      <span class="input-group-addon">Rp</span>
                                                      <input type="text" name="harga_jual[]" class="form-control input_isi" id="harga_jual_<?= ++$key ?>" onkeyup="FormatCurrency(this); hitung_jumlah(<?= ++$key ?>); hitung_total();" required value="<?= number_format($stok['harga_jual']) ?>"/>
                                                    </div>
                                                  </td>
                                                  <td>
                                                    <div class="input-group">
                                                      <span class="input-group-addon">Rp</span>
                                                      <input type="text" name="total_harga[]" class="form-control input_isi class_harga_beli" id="total_harga_<?= ++$key ?>" onkeyup="FormatCurrency(this);" readonly required value="<?= number_format($stok['total_harga']) ?>"/>
                                                    </div>
                                                  </td>
                                                  <td>
                                                    <button type="button" class="btn btn-sm btn-danger" name="button" onclick="hapus_row_barang(this, '<?= $stok['id'] ?>');"><i class="fa fa-trash"></i></button>
                                                  </td>
                                                </tr>
                                                
                                              <?php endforeach ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="form-group row">
                                      <div class="col-sm-10">
                                          <button type="button" class="btn btn-inverse m-b-0" onclick="tambah_barang();"><i class="fa fa-plus"></i>Tambah</button>
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Total Semua Harga</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" name="total_semua" class="form-control input_isi" id="total_semua" value="<?= number_format($row['total_semua']) ?>" readonly required  />
																						<input type="hidden" class="form-control" id="total_semua_def" value="<?= number_format($row['total_semua']) ?>">
                                          </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2"></label>
                                        <div class="col-sm-10">
                                            <button type="button" id="btn_simpan" class="btn btn-success m-b-0"><i class="fa fa-save"></i> Simpan</button>
                                            <a href="<?= base_url('stok_barang') ?>" id="btn_kembali" class="btn btn-warning m-b-0"><i class="fa fa-mail-reply"></i> Kembali</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Panel card end -->
                        <button id="popup_barang" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#barang-modal">modal</button>
                        <div class="modal fade" id="barang-modal" tabindex="-1">
                          <div class="modal-dialog modal-lg" role="document">
                              <div class="modal-content">
																<div class="popup_load_modal" id="popup_load">
																	    <div class="window_load">
																	        <img src="<?=base_url()?>assets/Ellipsis.gif" height="120" width="120">
																	    </div>
																</div>
                                  <div class="modal-header">
                                      <h5 class="modal-title">Data Barang</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                      </button>
                                  </div>
                                  <div class="modal-body p-b-0">
                                    <div class="input-group">
                                      <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                      <input type="text" name="search" id="search_barang" class="form-control">
                                    </div>
                                    <table class="table table-striped table-bordered nowrap table_data_barang table-hover">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">Nama Barang</th>
                                                <th style="text-align:center;">Jenis Barang</th>
                                                <th style="text-align:center;">Harga</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                    <div id="pagination_barang"></div>
                                    <br>
                                  <div class="modal-footer">
                                      <button type="button" id="tutup_barang" class="btn btn-danger" data-dismiss="modal">Batal</button>
                                  </div>
                              </div>
                          </div>
                      </div>
                    </div>

                  </div>

              </div>
          </div>
      </div>
  </div>
  <!-- Main-body end-->
