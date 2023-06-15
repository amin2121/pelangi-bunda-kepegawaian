<script type="text/javascript">
  $(document).ready(function(){
      pegawai_result();
    });

    function pegawai_result() {
      $('#popup_load').show();
      var search = $('#cari').val();
      let count_col = $(`#table_data thead tr th`).length

      $.ajax({
      	url : '<?php echo base_url(); ?>pegawai/pegawai_result',
        data : {search},
      	type : "POST",
      	dataType : 	"json",
      	success : function(res){
          console.table(res)
          let tr = ''
          if(res.length > 0) {
            let no = 0
            for(const item of res) {

              let btn_finger = '';
              let finger_temp = '';
              if (item.finger_data == null || item.finger_data == '') {
                btn_finger = `<button class='btn btn-primary' onclick="user_register(${item.id}, &quot;${item.nama}&quot;); atur_waktu(${item.id}, &quot;${item.nama}&quot;)"><i class='fa fa-bullseye'></i></button>`;
                finger_temp = '0';
              }else {
                btn_finger = `<button class='btn btn-primary' onclick="user_register(${item.id}, &quot;${item.nama}&quot;); atur_waktu(${item.id}, &quot;${item.nama}&quot;)"><i class='fa fa-bullseye'></i></button>`;
                finger_temp = '1';
              }

              tr += `
                <tr>
                  <td style="text-align:center;">${item.kode}</td>
                  <td style="text-align:center;">${item.nama}</td>
                  <td style="text-align:center;">${item.jabatan}</td>
                  <td style="text-align:center;">${item.telepon}</td>
                  <td style="text-align:center;">${item.gaji != '' || item.gaji != null ? 'Rp.' + NumberToMoney(item.gaji) : 0}</td>
                  <td style="text-align:center;"><code id="user_finger_${item.id}">${finger_temp}</code></td>
                  <td style="text-align: center;">
                    ${btn_finger}
                    <a href="<?php echo base_url(); ?>pegawai/view_edit/${item.id}"><button type="button" class="btn btn-info btn-sm" name="button"><i class="fa fa-pencil"></i> Edit</button></a>&nbsp;
                    <button onclick="hapus_pegawai(${item.id})" type="button" class="btn btn-danger btn-sm" name="button"><i class="fa fa-trash"></i> Hapus</button>&nbsp;
                  </td>
                </tr>
              `
            }
          } else {
            tr = `
              <tr>
                <td colspan="${count_col}" class="text-center text-muted" ><span style="display: block; padding: 12px;">Data Belum Ada, Tambahkan Data</span></td>
              </tr>
            `
          }

          $(`#table_data tbody`).html(tr)
          paging();
          $('#popup_load').fadeOut();
      	}
      });

      $('#cari').off('keyup').keyup(function(){
          pegawai_result();
    	});
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

    function hapus_pegawai(id){
    	var jawab = confirm("Apakah anda ingin menghapus data?");
    	  if (jawab === true) {
    	    $.ajax({
    	         url: '<?php echo base_url();?>pegawai/hapus',
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
                  <h4>Pegawai</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>pegawai">Pegawai</a>
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
                                <h5>Data Pegawai</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <div style="float:right;">
                                <a href="<?php echo base_url(); ?>pegawai/view_tambah"><button type="button" class="btn btn-primary" name="button"><i class="icofont icofont-plus"></i> Tambah</button></a>
                              </div>
                              <br><br><br>
                              <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input type="text" id="cari" placeholder="Cari Pegawai" class="form-control">
                              </div>
                              <div class="dt-responsive table-responsive">
                                    <table id="table_data" class="table table-striped table-bordered nowrap">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">Kode</th>
                                                <th style="text-align:center;">Nama</th>
                                                <th style="text-align:center;">Jabatan</th>
                                                <th style="text-align:center;">Telepon</th>
                                                <th style="text-align:center;">Gaji</th>
                                                <th style="text-align:center;">Finger</th>
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
