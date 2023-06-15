<script type="text/javascript">
  $(document).ready(function(){
      stok_keluar_result();
    });

    function stok_keluar_result(){
      $('#popup_load').show();
      var search = $('#cari_stok_keluar').val();

      $.ajax({
      	url : '<?php echo base_url(); ?>stok_keluar/stok_keluar_result',
        data : {search:search},
      	type : "POST",
      	dataType : 	"json",
      	success : function(result){
      		$table = "";

      		if (result == "" || result == null) {
      			$table = '<tr>'+
                        '<td colspan="4" style="text-align:center;">Data Kosong</td>'+
                     '</tr>';
      		}else {
      			var no = 0;
            for(var i=0; i<result.length; i++){
            	no++;

      				$table += '<tr>'+
                          '<td style="text-align:center;">'+no+'</td>'+
                          '<td style="text-align:center;">'+result[i].kode_stok_keluar+'</td>'+
                          '<td style="text-align:center;">'+result[i].tanggal+'</td>'+
                          '<td style="text-align:center;">'+
                            '<a href="<?php echo base_url(); ?>stok_keluar/view_detail/'+result[i].id+'"><button type="button" class="btn btn-success btn-sm" name="button"><i class="fa fa-eye"></i> Detail</button></a>&nbsp;'+
                          '</td>'+
                        '</tr>';

      			}
      		}
      		$('#table_stok_keluar tbody').html($table);
          paging();
          $('#popup_load').fadeOut();
      	}
      });

      $('#cari_stok_keluar').off('keyup').keyup(function(){
          stok_keluar_result();
    	});
    }

    function hapus_stok_keluar(id){
    	var jawab = confirm("Apakah anda ingin menghapus data?");
    	  if (jawab === true) {
    	    $.ajax({
    	         url: '<?php echo base_url();?>stok_keluar/hapus',
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
            $selector = $("#table_stok_keluar tbody tr");
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
                  <h4>Stok Masuk</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>stok_keluar">Stok Masuk</a>
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
                                <h5>Data Stok Masuk</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <!-- <div style="float:left">
                                <input type="text" name="" value="">
                              </div> -->
                              <div style="float:right;">
                                <a href="<?php echo base_url(); ?>stok_keluar/view_tambah"><button type="button" class="btn btn-primary" name="button"><i class="icofont icofont-plus"></i> Tambah</button></a>
                              </div>
                              <br><br><br>
                              <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input type="text" id="cari_stok_keluar" placeholder="Cari Kode Stok Masuk" class="form-control">
                              </div>
                              <div class="dt-responsive table-responsive">
                                    <table id="table_stok_keluar" class="table table-striped table-bordered nowrap">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">No</th>
                                                <th style="text-align:center;">Kode Stok Masuk</th>
                                                <th style="text-align:center;">Tanggal</th>
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

  <!-- Main-body end-->
