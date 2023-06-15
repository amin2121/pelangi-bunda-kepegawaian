<script type="text/javascript">
$(document).ready(function(){
$('#search_bahan').focus();


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
				 url : '<?php echo base_url(); ?>stok_keluar/simpan',
				 data : $('#form_stok_keluar').serialize(),
				 type : "POST",
				 dataType : "json",
				 success : function(row){
					 window.location.href = '<?php echo base_url(); ?>stok_keluar';
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

	function alert_konfirmasi(){
			 swal({
						 title: "Apakah anda yakin?",
						 text: "Anda akan mengganti harga jual dan harga awal bahan yang sudah ada!",
						 type: "warning",
						 showCancelButton: true,
						 confirmButtonClass: "btn-danger",
						 confirmButtonText: "Ya",
						 cancelButtonText: "Tidak",
						 closeOnConfirm: false,
						 closeOnCancel: false
					 },
					 function(isConfirm) {
						 if (isConfirm) {
							 // konfirmasi_timpa();
							 swal("Berhasil!", "Proses telah berhasil.", "success");
							 $('#form_stok_keluar').prop('action', '<?php echo site_url();?>stok_keluar/tambah');
							 $("#form_stok_keluar").submit();
							 e.preventDefault();
						 } else {
							 swal("Batal", "Proses telah dibatalkan", "error");
							 $('#form_stok_keluar').prop('action', '<?php echo site_url();?>stok_keluar/tambah_tidak');
							 $("#form_stok_keluar").submit();
							 e.preventDefault();
						 }
					 });
	}

	function konfirmasi_timpa(){
		$.ajax({
				url : '<?php echo base_url(); ?>stok_keluar/tambah',
				data : $('#form_stok_keluar').serialize(),
				type : "POST",
				dataType : "json",
				success : function(row){
						window.location.href = '<?php echo base_url(); ?>stok_keluar';
					}
			});
	}

	function simpan_biasa(){
		$.ajax({
				url : '<?php echo base_url(); ?>stok_keluar/tambah_biasa',
				data : $('#form_stok_keluar').serialize(),
				type : "POST",
				dataType : "json",
				success : function(row){
						window.location.href = '<?php echo base_url(); ?>stok_keluar';
					}
			});
	}

	function konfirmasi_tidak(){
		$.ajax({
				url : '<?php echo base_url(); ?>stok_keluar/tambah_tidak',
				data : $('#form_stok_keluar').serialize(),
				type : "POST",
				dataType : "json",
				success : function(row){
						window.location.href = '<?php echo base_url(); ?>stok_keluar';
					}
			});
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
		var harga_beli = $('#harga_beli_'+number).val();
    harga_beli = harga_beli.split(',').join('');

		if (harga_beli == '') {
			harga_beli = 0;
		}

		var jumlah_keluar = $('#jumlah_keluar_'+number).val();
    jumlah_keluar = jumlah_keluar.split(',').join('');

		if (jumlah_keluar == '') {
			jumlah_keluar = 0;
		}

		var total = jumlah_keluar * harga_beli;

		$('#total_harga_beli_'+number).val(NumberToMoney(total));
	}

  function tambah_bahan(){
    var jml_tr = $('#bahan_number').val();
    var i = parseInt(jml_tr) + 1;

    $menu =
    '<tr>'+
      '<td>'+
        '<div class="input-group">'+
          '<span class="input-group-addon" id="btn_popup_search" onclick="popup_bahan('+i+'); get_nama_bahan('+i+')"><i class="fa fa-search"></i></span>'+
          '<input type="text" name="nama_bahan[]" class="form-control" id="nama_bahan_'+i+'" readonly required>'+
          '<input type="hidden" name="id_bahan[]" class="form-control" id="id_bahan_'+i+'">'+
        '</div>'+
      '</td>'+
      '<td>'+
        '<input type="text" name="jumlah_keluar[]" class="form-control class_harga_beli" id="jumlah_keluar_'+i+'" onkeyup="FormatCurrency(this); hitung_total();" required>'+
      '</td>'+
      '<td>'+
        '<button type="button" class="btn btn-sm btn-danger" name="button" onclick="hapus_row_bahan(this, '+i+');"><i class="fa fa-trash"></i></button>'+
      '</td>'+
    '</tr>';


    $('#tabel_tambah_bahan').append($menu);
    $('#bahan_number').val(i);
  }

  function hapus_row_bahan(btn, id){
    var jumlah = $('#bahan_number').val();
    var i = parseInt(jumlah) - 1;

    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
  	$('#bahan_number').val(i);
  }

  function popup_bahan(id){
    $('#popup_bahan').click();
  }

  function get_nama_bahan(number){
		$('.popup_load_modal').show();
    var search = $('#search_bahan').val();

    $.ajax({
        url : '<?php echo base_url(); ?>stok_keluar/get_nama_bahan',
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

                    $tr += '<tr style="cursor:pointer;" onclick="klik_bahan('+result[i].id+','+number+');">'+
                                '<td>'+result[i].nama_bahan+'</td>'+
                                '<td>'+result[i].satuan+'</td>'+
                            '</tr>';
                }
            }

            $('.table_data_bahan tbody').html($tr);
            paging();
						$('.popup_load_modal').fadeOut();
        }
    });

    $('#search_bahan').off('keyup').keyup(function(){
        get_nama_bahan(number);
    });
}

function paging($selector){
	var jumlah_tampil = '10';

    if(typeof $selector == 'undefined')
    {
        $selector = $(".table_data_bahan tbody tr");
    }

    window.tp = new Pagination('#pagination_bahan', {
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

function klik_bahan(id, number){
    $('#tutup_bahan').click();
		$('#popup_load').show();

    $.ajax({
        url : '<?php echo base_url(); ?>stok_keluar/klik_bahan',
        data : {id:id},
        type : "POST",
        dataType : "json",
        success : function(row){
          $('#id_bahan_'+number).val(id);
          $('#nama_bahan_'+number).val(row['nama_bahan']);

					$('#popup_load').fadeOut();
        }
    });
}

function hitung_diskon(){
	var beli = $('#total_harga_beli_def').val();
	beli = beli.split(',').join('');

	var diskon = $('#input_diskon').val();
	diskon = diskon.split(',').join('');

	if (diskon == '') {
		diskon = 0;
	}

	var hitung_diskon = diskon / 100;
	var hitung_diskon_2 =  beli - (beli * hitung_diskon);

	if (diskon == 0) {
		var harga_beli = $('#total_harga_beli_def').val();
		harga_beli = harga_beli.split(',').join('');
	}else {
		var harga_beli = Math.ceil(hitung_diskon_2);
	}

	$('#total_harga_beli').val(NumberToMoney(harga_beli));
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
                  <h4>Stok Keluar</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-package"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>stok_keluar">Stok Keluar</a>
                      </li>
                      <li class="breadcrumb-item">Tambah Stok Keluar
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
                                <h5>Tambah Stok Keluar</h5>
                                <!-- <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div> -->
                            </div>
                            <div class="card-block panels-wells">
                              <button type="button" style="display:none;" class="btn btn-danger alert-success-cancel m-b-10" id="alert_konfirmasi">alert</button>
                              <form id="form_stok_keluar" action="" method="POST">
                                <input type="hidden" id="bahan_number" name="" value="1">

																	<div class="form-group row">
																			<label class="col-sm-2 col-form-label">Tanggal</label>
																			<div class="col-sm-10">
																					<input type="date" name="tanggal" class="form-control" required />
																			</div>
																	</div>

                                  <div class="form-group row">
																			<label class="col-sm-2 col-form-label">Catatan</label>
																			<div class="col-sm-10">
																					<textarea name="catatan" class="form-control" rows="3"></textarea>
																			</div>
																	</div>

                                      <div class="dt-responsive table-responsive">
                                            <table id="tabel_tambah_bahan" class="table table-striped table-bordered nowrap">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align:center;">Nama Bahan</th>
                                                        <th style="text-align:center;">Jumlah</th>
                                                        <th style="text-align:center;">Aksi</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td>
                                                      <div class="input-group">
                                                        <span class="input-group-addon" id="btn_popup_search" onclick="popup_bahan(1); get_nama_bahan(1)"><i class="fa fa-search"></i></span>
                                                        <input type="text" name="nama_bahan[]" class="form-control input_isi" id="nama_bahan_1" readonly required />
                                                        <input type="hidden" name="id_bahan[]" class="form-control" id="id_bahan_1">
                                                      </div>
                                                    </td>
                                                    <td>
                                                      <input type="text" name="jumlah_keluar[]" class="form-control input_isi class_harga_beli" id="jumlah_keluar_1" onkeyup="FormatCurrency(this); hitung_total();" required />
                                                    </td>
                                                    <td>
                                                      <button type="button" disabled class="btn btn-sm btn-danger" name="button"><i class="fa fa-lock"></i></button>
                                                    </td>
                                                  </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    <div class="form-group row">
                                      <div class="col-sm-10">
                                          <button type="button" class="btn btn-inverse m-b-0" onclick="tambah_bahan();"><i class="fa fa-plus"></i>Tambah</button>
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Total Semua</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" name="total_semua" class="form-control input_isi" id="total_semua" readonly required />
																						<input type="hidden" class="form-control" id="total_semua_def">
                                          </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2"></label>
                                        <div class="col-sm-10">
                                            <button type="button" id="btn_simpan" class="btn btn-success m-b-0">Simpan</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Panel card end -->
                        <button id="popup_bahan" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#bahan-modal">modal</button>
                        <div class="modal fade" id="bahan-modal" tabindex="-1">
                          <div class="modal-dialog" role="document">
                              <div class="modal-content">
																<div class="popup_load_modal" id="popup_load">
																	    <div class="window_load">
																	        <img src="<?=base_url()?>assets/Ellipsis.gif" height="120" width="120">
																	    </div>
																</div>
                                  <div class="modal-header">
                                      <h5 class="modal-title">Data Bahan</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                      </button>
                                  </div>
                                  <div class="modal-body p-b-0">
                                    <div class="input-group">
                                      <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                      <input type="text" name="search" id="search_bahan" class="form-control">
                                    </div>
                                    <table class="table table-striped table-bordered nowrap table_data_bahan table-hover">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">Nama Bahan</th>
                                                <th style="text-align:center;">Satuan</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                    <div id="pagination_bahan"></div>
                                    <br>
                                  <div class="modal-footer">
                                      <button type="button" id="tutup_bahan" class="btn btn-danger" data-dismiss="modal">Batal</button>
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
  </div>
  <!-- Main-body end-->
