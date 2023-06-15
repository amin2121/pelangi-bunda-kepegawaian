<script type="text/javascript">
  $(document).ready(function(){
      stok_result();
    });

    function stok_result(){
      $('#popup_load').show();
      var search = $('#cari_stok').val();

      $.ajax({
      	url : '<?php echo base_url(); ?>stok/stok_result',
        data : {search:search},
      	type : "POST",
      	dataType : 	"json",
      	success : function(result){
      		$table = "";

      		if (result == "" || result == null) {
      			$table = '<tr>'+
                        '<td colspan="7" style="text-align:center;">Data Kosong</td>'+
                     '</tr>';
      		}else {
      			var no = 0;
            for(var i=0; i<result.length; i++){
            	no++;

      				$table += '<tr>'+
                          '<td style="text-align:center;">'+no+'</td>'+
                          '<td style="text-align:center;">'+result[i].nama_bahan+'</td>'+
                          '<td style="text-align:center;">'+result[i].satuan+'</td>'+
                          '<td style="text-align:center; color: green;">'+NumberToMoney(result[i].jumlah_masuk)+'</td>'+
                          '<td style="text-align:center; color: red;">'+NumberToMoney(result[i].jumlah_keluar)+'</td>'+
                          '<td style="text-align:center; color: blue;">'+NumberToMoney(result[i].jumlah_penjualan)+'</td>'+
                          '<td style="text-align:center; color: purple;">'+NumberToMoney(result[i].jumlah_retur)+'</td>'+
                          '<td style="text-align:center;">'+NumberToMoney(result[i].stok)+'</td>'+
                        '</tr>';

      			}
      		}
      		$('#table_stok tbody').html($table);
          paging();
          $('#popup_load').fadeOut();
      	}
      });

      $('#cari_stok').off('keyup').keyup(function(){
          stok_result();
    	});
    }

    function hapus_stok(id){
    	var jawab = confirm("Apakah anda ingin menghapus data?");
    	  if (jawab === true) {
    	    $.ajax({
    	         url: '<?php echo base_url();?>stok/hapus',
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
            $selector = $("#table_stok tbody tr");
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
                  <h4>Stok</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>stok">Stok</a>
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
                                <h5>Data Stok</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <!-- <div style="float:left">
                                <input type="text" name="" value="">
                              </div> -->
                              <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input type="text" id="cari_stok" placeholder="Cari Nama Bahan" class="form-control">
                              </div>
                              <div class="dt-responsive table-responsive">
                                    <table id="table_stok" class="table table-striped table-bordered nowrap">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">No</th>
                                                <th style="text-align:center;">Nama Bahan</th>
                                                <th style="text-align:center;">Satuan</th>
                                                <th style="text-align:center;">Stok Masuk</th>
                                                <th style="text-align:center;">Stok Keluar</th>
                                                <th style="text-align:center;">Penjualan</th>
                                                <th style="text-align:center;">Retur</th>
                                                <th style="text-align:center;">Stok Akhir</th>
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
