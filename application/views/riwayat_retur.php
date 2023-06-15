<style media="screen">
  #form_filter_no_transaksi{
    display: none;
  }
</style>
<script type="text/javascript">
  $(document).ready(function(){
    data_barang();

    $('#filter_tanggal').click(function(){
      data_barang();
      $('#form_filter_tanggal').show();
      $('#form_filter_no_transaksi').hide();
    });

    $('#filter_no_transaksi').click(function(){
      data_barang();
      $('#form_filter_tanggal').hide();
      $('#form_filter_no_transaksi').show();
    });

  });

  function data_barang(){
    $('#popup_load').show();
    $.ajax({
    	url : '<?php echo base_url(); ?>riwayat_retur/riwayat_retur_result',
    	type : "POST",
    	dataType : 	"json",
    	success : function(result){
    		$table = "";

    		if (result == "" || result == null) {
    			$table = '<tr>'+
                      '<td colspan="6" style="text-align:center;">Data Kosong</td>'+
                    '</tr>';
    		}else {
    			var no = 0;
          for(var i=0; i<result.length; i++){
          	no++;

            var link = '<?php echo base_url(); ?>kasir/cetak_struk/'+result[i].id;

            var level = '<?php echo $this->session->userdata('level'); ?>';

            if (level == 'Admin') {
              var nama_lengkap = '<td style="text-align:center;">'+result[i].nama_lengkap+'</td>';
            }else {
              var nama_lengkap = '<td style="text-align:center;">'+result[i].nama_lengkap+'</td>';
            }

           if (result[i].status_diskon == '1') {
              status_diskon = '<label class="label bg-info">Diskon '+result[i].diskon+'</label>';
            }else {
              status_diskon = '';
            }

    				$table += '<tr>'+
                        '<td style="text-align:center;">'+result[i].no_transaksi+'<br>'+status_diskon+'</td>'+
                        ''+nama_lengkap+''+
                        '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].nilai_transaksi)+'</td>'+
                        '<td style="text-align:center;">'+result[i].tanggal+' '+result[i].waktu+'</td>'+
                        '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].dibayar)+'</td>'+
                        '<td style="text-align:center;">'+result[i].tanggal_retur+' '+result[i].waktu_retur+'</td>'+
                        '<td style="text-align:center;">'+result[i].alasan+'</td>'+
                        '<td style="text-align:center;">'+
                        '<button class="btn btn-warning btn-sm" type="button" onclick="detail_penjualan('+result[i].id+', '+result[i].nilai_transaksi+');"><i class="fa fa-eye"></i>Detail</button>&nbsp;'+
                        '</td>'+
                      '</tr>';

    			}
    		}
    		$('.table_riwayat_transaksi tbody').html($table);
        paging();
        $('#popup_load').fadeOut();
    	}
    });
  }

  function filter_tanggal(){
    var tanggal_dari = $('#tanggal_dari').val();
    var tanggal_sampai = $('#tanggal_sampai').val();
    $('#popup_load').show();
    $.ajax({
    	url : '<?php echo base_url(); ?>riwayat_retur/filter_tanggal',
      data : {tanggal_dari:tanggal_dari, tanggal_sampai:tanggal_sampai},
    	type : "POST",
    	dataType : 	"json",
    	success : function(result){
    		$table = "";

    		if (result == "" || result == null) {
          $table = '<tr>'+
                      '<td colspan="6" style="text-align:center;">Data Kosong</td>'+
                    '</tr>';
    		}else {
    			var no = 0;
          for(var i=0; i<result.length; i++){
          	no++;

            var link = '<?php echo base_url(); ?>kasir/cetak_struk/'+result[i].id;

            var level = '<?php echo $this->session->userdata('level'); ?>';

            if (level == 'Admin') {
              var nama_lengkap = '<td style="text-align:center;">'+result[i].nama_lengkap+'</td>';
            }else {
              var nama_lengkap = '<td style="text-align:center;">'+result[i].nama_lengkap+'</td>';
            }

            if (result[i].status_diskon == '1') {
               status_diskon = '<label class="label bg-info">Diskon '+result[i].diskon+'</label>';
             }else {
               status_diskon = '';
             }

             $table += '<tr>'+
                        '<td style="text-align:center;">'+result[i].no_transaksi+'<br>'+status_diskon+'</td>'+
                        ''+nama_lengkap+''+
                        '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].nilai_transaksi)+'</td>'+
                        '<td style="text-align:center;">'+result[i].tanggal+' '+result[i].waktu+'</td>'+
                        '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].dibayar)+'</td>'+
                        '<td style="text-align:center;">'+result[i].tanggal_retur+' '+result[i].waktu_retur+'</td>'+
                        '<td style="text-align:center;">'+result[i].alasan+'</td>'+
                        '<td style="text-align:center;">'+
                        '<button class="btn btn-warning btn-sm" type="button" onclick="detail_penjualan('+result[i].id+', '+result[i].nilai_transaksi+');"><i class="fa fa-eye"></i>Detail</button>&nbsp;'+
                        '</td>'+
                      '</tr>';

    			}
    		}
    		$('.table_riwayat_transaksi tbody').html($table);
        paging();
        $('#popup_load').fadeOut();
    	}
    });
  }

  function detail_penjualan(id, total){
    $('#btn_popup_detail').click();
    $('.popup_load_detail').show();

    $.ajax({
    	url : '<?php echo base_url(); ?>riwayat_retur/detail_penjualan',
      data : {id:id},
    	type : "POST",
    	dataType : 	"json",
    	success : function(result){
    		$table = "";

    		if (result == "" || result == null) {
          $table = '<tr>'+
                      '<td colspan="6" style="text-align:center;">Data Kosong</td>'+
                    '</tr>';
    		}else {
    			var no = 0;
          for(var i=0; i<result.length; i++){
          	no++;

    				$table += '<tr>'+
                        '<td style="text-align:center;">'+result[i].nama_barang+'</td>'+
                        '<td style="text-align:right;">'+NumberToMoney(result[i].harga_barang)+'</td>'+
                        '<td style="text-align:center;">'+result[i].jumlah_beli+'</td>'+
                        '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].total_harga_barang)+'</td>'+
                      '</tr>';

    			}
    		}
    		$('.table_detail_penjualan tbody').html($table);
        $('#total_detail').html(NumberToMoney(total));
        $('.popup_load_detail').fadeOut();
    	}
    });
  }

  function filter_no_transaksi(){
    var search = $('#search_no_transaksi').val();
    $('#popup_load').show();
    $.ajax({
    	url : '<?php echo base_url(); ?>riwayat_retur/filter_no_transaksi',
      data : {search:search},
    	type : "POST",
    	dataType : 	"json",
    	success : function(result){
    		$table = "";

    		if (result == "" || result == null) {
          $table = '<tr>'+
                      '<td colspan="6" style="text-align:center;">Data Kosong</td>'+
                    '</tr>';
    		}else {
    			var no = 0;
          for(var i=0; i<result.length; i++){
          	no++;

            var link = '<?php echo base_url(); ?>struk/cetak_struk/'+result[i].id;

            var level = '<?php echo $this->session->userdata('level'); ?>';

            if (level == 'Admin') {
              var nama_lengkap = '<td style="text-align:center;">'+result[i].nama_lengkap+'</td>';
            }else {
              var nama_lengkap = '<td style="text-align:center;">'+result[i].nama_lengkap+'</td>';
            }

            if (result[i].status_diskon == '1') {
               status_diskon = '<label class="label bg-info">Diskon '+result[i].diskon+'</label>';
             }else {
               status_diskon = '';
             }

             $table += '<tr>'+
                        '<td style="text-align:center;">'+result[i].no_transaksi+'<br>'+status_diskon+'</td>'+
                        ''+nama_lengkap+''+
                        '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].nilai_transaksi)+'</td>'+
                        '<td style="text-align:center;">'+result[i].tanggal+' '+result[i].waktu+'</td>'+
                        '<td style="text-align:right;">Rp. '+NumberToMoney(result[i].dibayar)+'</td>'+
                        '<td style="text-align:center;">'+result[i].tanggal_retur+' '+result[i].waktu_retur+'</td>'+
                        '<td style="text-align:center;">'+result[i].alasan+'</td>'+
                        '<td style="text-align:center;">'+
                        '<button class="btn btn-warning btn-sm" type="button" onclick="detail_penjualan('+result[i].id+', '+result[i].nilai_transaksi+');"><i class="fa fa-eye"></i>Detail</button>&nbsp;'+
                        '</td>'+
                      '</tr>';

    			}
    		}
    		$('.table_riwayat_transaksi tbody').html($table);
        paging();
        $('#popup_load').fadeOut();
    	}
    });
  }

  function paging($selector){
  	var jumlah_tampil = '10';

      if(typeof $selector == 'undefined')
      {
          $selector = $(".table_riwayat_transaksi tbody tr");
      }

      window.tp = new Pagination('#pagination_riwayat', {
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
                  <h4>Riwayat Retur</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-timer"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>riwayat_retur">Riwayat Retur</a>
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
                                <h5>Data Riwayat Retur</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">

                              <div class="form-radio">
                                  <div class="radio radio-inline">
                                      <label>
                                          <input type="radio" name="filter" id="filter_tanggal" checked="checked">
                                          <i class="helper"></i>Filter Tanggal
                                      </label>
                                  </div>
                                  <div class="radio radio-inline">
                                      <label>
                                          <input type="radio" name="filter" id="filter_no_transaksi">
                                          <i class="helper"></i>Filter No Transaksi
                                      </label>
                                  </div>
                              </div><br>

                              <div id="form_filter_tanggal">
                                <div class="form-group row">
                                    <div class="col-sm-2">
                                      <input type="date" class="form-control" id="tanggal_dari" name="dari" required value="">
                                    </div>
                                    <div class="col-sm-2">
                                      <input type="date" class="form-control" id="tanggal_sampai" name="sampai" required value="">
                                    </div>
                                    <div class="col-sm-2">
                                      <button type="button" class="btn btn-info" name="button" onclick="filter_tanggal();"><i class="fa fa-search"></i>Search</button>
                                    </div>
                                </div>
                              </div>

                                <div id="form_filter_no_transaksi">
                                  <div class="form-group row">
                                      <div class="col-sm-2">
                                        <input type="text" class="form-control" id="search_no_transaksi" name="search_no_transaksi" placeholder="Search No Transaksi" required value="">
                                      </div>
                                      <div class="col-sm-2">
                                        <button type="button" class="btn btn-info" name="button" onclick="filter_no_transaksi();"><i class="fa fa-search"></i>Search</button>
                                      </div>
                                  </div>
                                </div>                              
                              <div class="dt-responsive table-responsive">
                                    <table class="table table-striped table-bordered nowrap table_riwayat_transaksi">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">No Transaksi</th>
                                                <th style="text-align:center;">Nama Kasir</th>
                                                <th style="text-align:center;">Nilai Transaksi</th>
                                                <th style="text-align:center;">Tanggal & Waktu Transaksi</th>
                                                <th style="text-align:center;">Dibayar</th>
                                                <th style="text-align:center;">Tanggal & Waktu Retur</th>
                                                <th style="text-align:center;">Alasan Retur</th>
                                                <th style="text-align:center;">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                    <nav aria-label="Page navigation example">
                                      <div id="pagination_riwayat"></div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!-- Panel card end -->
                        <button id="btn_popup_detail" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#detail-modal">modal</button>
                        <div class="modal fade" id="detail-modal" tabindex="-1">
                          <div class="modal-dialog modal-lg" role="document">
                              <div class="modal-content">
                                <div class="popup_load_detail" id="popup_load">
                                      <div class="window_load">
                                          <img src="<?=base_url()?>assets/Ellipsis.gif" height="120" width="120">
                                      </div>
                                </div>
                                  <div class="modal-header">
                                      <h5 class="modal-title">Detail Penjualan</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                      </button>
                                  </div>
                                  <div class="modal-body p-b-0">
                                    <table class="table table-striped table-bordered nowrap table_detail_penjualan">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">Nama Barang</th>
                                                <th style="text-align:center;">Harga Barang</th>
                                                <th style="text-align:center;">Jumlah Beli</th>
                                                <th style="text-align:center;">Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                        <tfoot>
                                          <th colspan="3" style="text-align: right;">Total</th>
                                          <th style="text-align: right;">Rp. <span id="total_detail"></span></th>
                                        </tfoot>
                                    </table>
                                  <div class="modal-footer">
                                      <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
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
