<script type="text/javascript">
  $(document).ready(function(){
      barang_result();
    });

    function barang_result(){
      $('#popup_load').show();
      var search = $('#cari_barang').val();

      $.ajax({
      	url : '<?php echo base_url(); ?>barang/barang_result',
        data : {search:search},
      	type : "POST",
      	dataType : 	"json",
      	success : function(result){
          console.table(result)
      		$table = "";

      		if (result == "" || result == null) {
      			$table = '<tr>'+
                        '<td colspan="7" style="text-align:center;">Data Kosong</td>'+
                     '</tr>';
      		}else {
      			var no = 0;
            for(var i=0; i<result.length; i++){
            	no++;

              if (result[i].status_produksi == '1') {
                button_produksi = '<a href="<?php echo base_url(); ?>barang/view_produksi/'+result[i].id+'"><button type="button" class="btn btn-success btn-sm" name="button"><i class="fa fa-balance-scale"></i> Kelola Bahan</button></a>&nbsp;';
              }else {
                button_produksi = '';
              }

      				$table += '<tr>'+
                          '<td style="text-align:center;">'+result[i].nama_jenis_barang+'</td>'+
                          '<td style="text-align:center;">'+result[i].nama_barang+'</td>'+
                          '<td style="text-align:center;">Rp. '+NumberToMoney(result[i].harga_jual || 0)+'</td>'+
                          '<td style="text-align:center;">Rp. '+NumberToMoney(result[i].harga_awal || 0)+'</td>'+
                          '<td style="text-align:center;">Rp. '+NumberToMoney(result[i].laba || 0)+'</td>'+
                          '<td style="text-align:center;">'+result[i].stok+'</td>'+
                          '<td style="text-align:center;">'+
                            '<button class="btn btn-warning btn-sm" type="button" onclick="barang_detail('+result[i].id+');"><i class="fa fa-eye"></i>Detail</button>&nbsp;'+
                            '<a href="<?php echo base_url(); ?>barang/view_edit/'+result[i].id+'"><button type="button" class="btn btn-info btn-sm" name="button"><i class="fa fa-pencil"></i> Edit</button></a>&nbsp;'+
                            '<button onclick="hapus_barang('+result[i].id+')" type="button" class="btn btn-danger btn-sm"  name="button"><i class="fa fa-trash"></i> Hapus</button>&nbsp;'+
                            ''+button_produksi+''+
                          '</td>'+
                        '</tr>';

      			}
      		}
      		$('#table_barang tbody').html($table);
          paging();
          $('#popup_load').fadeOut();
      	}
      });

      $('#cari_barang').off('keyup').keyup(function(){
          barang_result();
    	});
    }

    function hapus_barang(id){
    	var jawab = confirm("Apakah anda ingin menghapus data?");
    	  if (jawab === true) {
    	    $.ajax({
    	         url: '<?php echo base_url();?>barang/hapus',
    	         data : {id:id},
    	         dataType : "json",
    	         type: "POST",
    	         async : false,
    	         success: function (result){
    						 	location.reload();
    	          }
    	        });
    	  } else {
    	    // location.reload();
    	    return false;
    	  }
    }

    function paging($selector){
    	var jumlah_tampil = '10';

        if(typeof $selector == 'undefined')
        {
            $selector = $("#table_barang tbody tr");
        }

        window.tp = new Pagination('#pagination', {
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

    function barang_detail(id){
      $('#btn_popup_detail').click();

      $.ajax({
        url : '<?php echo base_url(); ?>barang/barang_detail',
        data : {id:id},
        type : "POST",
        dataType : 	"json",
        success : function(row){

          var gambar = ''
          if(row.foto_barang != null) {
            gambar = '<?php echo site_url();?>assets/foto_barang/small/'+row.foto_barang+'';
          } else {
            gambar = '<?php echo site_url();?>assets/foto_barang/no_avatar.jpg';
          }

          $('#gambar_foto_barang').attr('src', gambar);
          $('#nama_barang').val(row.nama_barang);
          $('#jenis_barang').val(row.nama_jenis_barang);
          $('#harga_jual').val(NumberToMoney(row.harga_jual));
          $('#harga_awal').val(NumberToMoney(row.harga_awal));
          $('#laba').val(NumberToMoney(row.laba));
          $('#tanggal').val(row.tanggal);
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
                  <h4>Barang</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>barang">Barang</a>
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
                                <h5>Data Barang</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <!-- <div style="float:left">
                                <input type="text" name="" value="">
                              </div> -->
                              <div style="float:right;">
                                <!-- <a href="<?php echo base_url(); ?>barang/ekspor_barang"><button type="button" class="btn btn-outline-warning btn-warning" name="button"><i class="icofont icofont-swoosh-left"></i> Ekspor Barang</button></a> -->
                                <!-- <a href="#" data-toggle="modal" data-target="#impor-modal"><button type="button" class="btn btn-outline-warning btn-warning" name="button"><i class="icofont icofont-swoosh-right"></i> Impor Barang</button></a> -->
                                <a href="<?php echo base_url(); ?>barang/view_tambah"><button type="button" class="btn btn-primary" name="button"><i class="icofont icofont-plus"></i> Tambah</button></a>
                              </div>
                              <br><br><br>
                              <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input type="text" id="cari_barang" placeholder="Cari Nama Barang" class="form-control">
                              </div>
                              <div class="dt-responsive table-responsive">
                                    <table id="table_barang" class="table table-striped table-bordered nowrap">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">Jenis Barang</th>
                                                <th style="text-align:center;">Nama Barang</th>
                                                <th style="text-align:center;">Harga Jual</th>
                                                <th style="text-align:center;">Harga Awal</th>
                                                <th style="text-align:center;">Laba</th>
                                                <th style="text-align:center;">Stok</th>
                                                <th style="text-align:center;">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                    <ul id="pagination" class="pagination float-right">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Panel card end -->
                    </div>
              </div>
          </div>
      </div>
  </div>

  <button id="btn_popup_detail" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#detail-modal">modal</button>
  <div class="modal fade" id="detail-modal" tabindex="-1">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detail Barang</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body p-b-0">
              <center>
                <img id="gambar_foto_barang" class="img-responsive" style="height: 140px;" onerror="this.src='<?php echo base_url(); ?>assets/gambar_default/<?= $gambar_default['nama_file'] ?>';">
              </center><br>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Nama Barang</label>
                  <div class="col-sm-10">
                      <input type="text" id="nama_barang" value="" class="form-control" readonly>
                  </div>
              </div>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Jenis Barang</label>
                  <div class="col-sm-10">
                      <input type="text" id="jenis_barang" class="form-control" readonly>
                  </div>
              </div>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Harga Jual</label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon">Rp</span>
                      <input type="text" class="form-control" id="harga_jual" value="" readonly>
                    </div>
                  </div>
              </div>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Harga Awal</label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon">Rp</span>
                      <input type="text" class="form-control" id="harga_awal" value="" readonly>
                    </div>
                  </div>
              </div>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Laba</label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon">Rp</span>
                      <input type="text" class="form-control" id="laba" value="" readonly>
                    </div>
                  </div>
              </div>
              <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Tanggal Input</label>
                  <div class="col-sm-10">
                      <input type="text" id="tanggal" value="" class="form-control" readonly>
                  </div>
              </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
            </div>
            </form>
        </div>
    </div>
</div>
</div>
  <!-- Main-body end-->

  <div class="modal fade" id="impor-modal" tabindex="-1">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Impor Barang</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body p-b-0">
            <form class="" action="<?php echo base_url(); ?>barang/import_barang" method="post"  enctype="multipart/form-data">
              <div class="form-group row">
                  <div class="col-sm-12">
                    <p>Gunakan template file XLS ini untuk input data</p>
                    <a href="<?php echo base_url(); ?>assets/format_xls/format_import_barang.xlsx"><button type="button" style="width: 100%;" class="btn btn-primary btn-md" name="button">Download Template (.xls)</button></a>
                  </div>
              </div>
              <div class="form-group row">
                  <div class="col-sm-12">
                    <p>Pilih file XLS yang sudah Anda input data</p>
                    <input type="file" class="form-control" name="file_impor">
                  </div>
              </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
                <button type="submit" class="btn btn-success">Impor</button>
            </div>
            </form>
        </div>
    </div>
</div>
</div>
