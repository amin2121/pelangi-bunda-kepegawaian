<script type="text/javascript">
$(document).ready(function(){

	$('#btn_simpan').click(function(){
			$.ajax({
				 url : '<?php echo base_url(); ?>stok_opname/simpan',
				 data : $('#form_stok_opname').serialize(),
				 type : "POST",
				 dataType : "json",
				 success : function(row){
            if(row.status) {
              swal({
                 title: "Berhasil",
                 text: "Data Stok Berhasil Ditambahkan",
                 type: "success"
              },
              function(isConfirm) {
                 if (isConfirm) {
                   window.location.href = '<?php echo base_url(); ?>stok_opname';
                 }
              });
            } else {
              swal("Gagal", "Silahkan Anda Menambahkan Stok Barang Lagi!", "error");
            }
				 }
			 });
			 e.preventDefault();
  });

});

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
        '<input type="text" name="stok_sistem[]" class="form-control" id="stok_sistem_'+i+'" onkeyup="FormatCurrency(this);" readonly>'+
      '</td>'+
      '<td>'+
        '<input type="text" name="stok_dapur[]" class="form-control" id="stok_dapur_'+i+'" onkeyup="FormatCurrency(this);" required>'+
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
    var length_col = $(`.table_data_barang thead tr th`).length

    $.ajax({
        url : '<?php echo base_url(); ?>stok_opname/get_nama_barang',
        data : {search},
        type : "POST",
        dataType : "json",
        success : function(result){
            $tr = "";

            if(result == "" || result == null){
                $tr = `<tr><td colspan='${length_col}' style='text-align:center;'><b>Data tidak ditemukan</b></td></tr>`;
            }else{
                var no = 0;
                for(var i=0; i<result.length; i++){
                    no++;

                    $tr += '<tr style="cursor:pointer;" onclick="klik_barang('+result[i].id+','+number+');">'+
                                '<td>'+result[i].nama_barang+'</td>'+
                                '<td>'+result[i].jenis_barang+'</td>'+
                                '<td class="text-center">'+result[i].stok || 0+'</td>'+
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
        url : '<?php echo base_url(); ?>stok_opname/klik_barang',
        data : {id:id},
        type : "POST",
        dataType : "json",
        success : function(row){
          $('#id_barang_'+number).val(id);
          $('#nama_barang_'+number).val(row['nama_barang']);
          $(`#stok_sistem_`+number).val(NumberToMoney(row['stok']));

					$('#popup_load').fadeOut();
        }
    });
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
                  <h4>Stok Opname</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                        <i class="ti-package"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>stok_masuk">Stok Opname</a>
                      </li>
                      <li class="breadcrumb-item">Tambah Stok Opname
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
                          <h5>Tambah Stok Opname</h5>
                          <!-- <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                          </div> -->
                      </div>
                      <div class="card-block panels-wells">
                        <button type="button" style="display:none;" class="btn btn-danger alert-success-cancel m-b-10" id="alert_konfirmasi">alert</button>
                        <form id="form_stok_opname" action="" method="POST">
                          <input type="hidden" id="barang_number" name="" value="1">

  														<div class="form-group row">
  																<label class="col-sm-2 col-form-label">Tanggal</label>
  																<div class="col-sm-10">
  																		<input type="date" name="tanggal" value="<?= date('Y-m-d') ?>" class="form-control" required />
  																</div>
  														</div>

                              <div class="dt-responsive table-responsive">
                                  <table id="tabel_tambah_barang" class="table table-striped table-bordered nowrap">
                                      <thead>
                                          <tr>
                                              <th style="text-align:center;">Nama Barang</th>
                                              <th style="text-align:center;">Stok Sistem</th>
                                              <th style="text-align:center;">Stok Dapur</th>
                                              <th style="text-align:center;">Aksi</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <td>
                                            <div class="input-group">
                                              <span class="input-group-addon" id="btn_popup_search" onclick="popup_barang(1); get_nama_barang(1)"><i class="fa fa-search"></i></span>
                                              <input type="text" name="nama_barang[]" class="form-control input_isi" id="nama_barang_1" readonly required />
                                              <input type="hidden" name="id_barang[]" class="form-control" id="id_barang_1">
                                            </div>
                                          </td>
                                          <td>
                                            <input type="text" name="stok_sistem[]" class="form-control input_isi" id="stok_sistem_1" onkeyup="FormatCurrency(this);" readonly="" />
                                          </td>
                                          <td>
                                            <input type="text" name="stok_dapur[]" class="form-control input_isi" id="stok_dapur_1" onkeyup="FormatCurrency(this);" required />
                                          </td>
                                          <td>
                                            <button type="button" class="btn btn-sm btn-danger" disabled="" name="button"><i class="fa fa-lock"></i></button>
                                          </td>
                                        </tr>
                                      </tbody>
                                  </table>
                              </div>

                              <div class="form-group row">
                                <div class="col-sm-10">
                                    <button type="button" class="btn btn-inverse m-b-0" onclick="tambah_barang();"><i class="fa fa-plus"></i>Tambah Barang Baru</button>
                                </div>
                              </div>
                              <br><br>
                              <div class="form-group row">
                                <div class="col-sm-12">
                                    <hr>
                                    <button type="button" id="btn_simpan" class="btn btn-success m-b-0"><i class="fa fa-save"></i> Simpan</button>
                                    <a href="<?= base_url('stok_opname') ?>" id="btn_kembali" class="btn btn-warning m-b-0"><i class="fa fa-mail-reply"></i> Kembali</a>
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
                                                <th style="text-align:center;">Stok Sistem</th>
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
