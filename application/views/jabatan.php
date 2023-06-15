<script type="text/javascript">
  $(document).ready(function(){
      jabatan_result();
    });

    function jabatan_result() {
      $('#popup_load').show();
      var search = $('#cari').val();

      $.ajax({
      	url : '<?php echo base_url(); ?>jabatan/jabatan_result',
        data : {search},
      	type : "POST",
      	dataType : 	"json",
      	success : function(result){
          console.table(result)
      		$table = "";

      		if (result == "" || result == null) {
      			$table = '<tr>'+
                        '<td colspan="3" style="text-align:center;">Data Kosong</td>'+
                     '</tr>';
      		}else {
      			var no = 0;
            for(var i=0; i<result.length; i++){
            	no++;

      				$table += `<tr>
                          <td style="text-align:center;">${no}</td>
                          <td style="text-align:center;">${result[i].jabatan}</td>
                          <td style="text-align: center;">
                            <a href="<?php echo base_url(); ?>jabatan/view_edit/${result[i].id}"><button type="button" class="btn btn-info btn-sm" name="button"><i class="fa fa-pencil"></i> Edit</button></a>&nbsp;
                            <button onclick="hapus_jabatan(${result[i].id})" type="button" class="btn btn-danger btn-sm" name="button"><i class="fa fa-trash"></i> Hapus</button>&nbsp;
                          </td>
                        </tr>`;

      			}
      		}

      		$('#table_data tbody').html($table);
          paging();
          $('#popup_load').fadeOut();
      	}
      });

      $('#cari').off('keyup').keyup(function(){
          jabatan_result();
    	});
    }

    function hapus_jabatan(id){
    	var jawab = confirm("Apakah anda ingin menghapus data?");
    	  if (jawab === true) {
    	    $.ajax({
    	         url: '<?php echo base_url();?>jabatan/hapus',
    	         data : {id},
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
            $selector = $("#table_data tbody tr");
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
                  <h4>Jabatan</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>jabatan">Jabatan</a>
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
                                <h5>Data Jabatan</h5>
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
                                <a href="<?php echo base_url(); ?>jabatan/view_tambah"><button type="button" class="btn btn-primary" name="button"><i class="icofont icofont-plus"></i> Tambah</button></a>
                              </div>
                              <br><br><br>
                              <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input type="text" id="cari" placeholder="Cari Jabatan" class="form-control">
                              </div>
                              <div class="dt-responsive table-responsive">
                                    <table id="table_data" class="table table-striped table-bordered nowrap">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">No</th>
                                                <th style="text-align:center;">Jabatan</th>
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
