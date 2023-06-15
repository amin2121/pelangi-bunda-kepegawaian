<script type="text/javascript">
  $(document).ready(function(){
      stok_opname_result();
    });

    function stok_opname_result(){
      $('#popup_load').show();
      var search = $('#cari_stok_opname').val();
      var length_col = $(`#table_stok_opname thead tr th`).length

      $.ajax({
        url : '<?php echo base_url(); ?>stok_opname/stok_opname_result',
        data : {search},
        type : "POST",
        dataType :  "json",
        success : function(result){
          $table = "";

          if (result == "" || result == null) {
            $table = '<tr>'+
                        `<td colspan="${length_col}" style="text-align:center;">Data Kosong</td>`+
                     '</tr>';
          }else {
            var no = 0;
            for(var i=0; i<result.length; i++){
              no++;

              $table += '<tr>'+
                          '<td style="text-align:center;">'+no+'</td>'+
                          '<td style="text-align:center;">'+result[i].kode+'</td>'+
                          '<td style="text-align:center;">'+result[i].tanggal+'</td>'+
                          '<td style="text-align:center;">'+result[i].jumlah_barang+'</td>'+
                          '<td style="text-align:center;">'+result[i].nama_user+'</td>'+
                          '<td style="text-align:center;">'+
                            `<button type="button" class="btn btn-success btn-sm" name="button" onclick="popup_detail_stok_opname(); detail_stok_opname(${result[i].id});"><i class="fa fa-eye"></i> Detail</button>&nbsp;`+
                          '</td>'+
                        '</tr>';

            }
          }
          $('#table_stok_opname tbody').html($table);
          paging();
          $('#popup_load').fadeOut();
        }
      });

      $('#cari_stok_opname').off('keyup').keyup(function(){
          stok_opname_result();
      });
    }

    function popup_detail_stok_opname() {
      $(`#popup_detail_stok_opname`).click()
      setTimeout(function() { $('#search_barang').focus() }, 1000);
    }

    function detail_stok_opname(id) {
      let th_length = $(`#table_detail_stok_opname tr th`).length
      let search = $(`#search_barang`).val()

      $.ajax({
       url: '<?php echo base_url();?>stok_opname/detail_stok_opname',
       data : {id, search},
       dataType : "json",
       type: "POST",
       success: function (result){
          let tr = ''
          if(result.length > 0) {
            for(const item of result) {
              tr += `
                <tr>
                  <td class="text-center">${item.nama_barang}</td>
                  <td class="text-center">${item.stok_sistem}</td>
                  <td class="text-center">${item.stok_dapur}</td>
                </tr> 
              `
            }
          } else {
            tr = `
              <tr>
                <td class="text-center" colspan="${th_length}">Data Kosong</td>
              </tr>
            `
          }

          $(`#table_detail_stok_opname tbody`).html(tr)
          paging_opname()
        }
      });

      $('#search_opname').off('keyup').keyup(function(){
          detail_stok_opname(id);
      });
    }

    function paging_opname() {
      var jumlah_tampil = '10';

      if(typeof $selector == 'undefined')
      {
          $selector = $("#table_detail_stok_opname tbody tr");
      }

      window.tp = new Pagination('#pagination_opname', {
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

    function paging($selector){
      var jumlah_tampil = '10';

        if(typeof $selector == 'undefined')
        {
            $selector = $("#table_stok_opname tbody tr");
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
                  <h4>Stok Opname</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                        <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>stok_opname">Stok Opname</a>
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
                                <h5>Data Stok Opname</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <!-- <div style="float:left">
                                <input type="text" name="" value="">
                              </div> -->
                              <div style="float:right;">
                                <a href="<?php echo base_url(); ?>stok_opname/view_tambah"><button type="button" class="btn btn-primary" name="button"><i class="icofont icofont-plus"></i> Tambah</button></a>
                              </div>
                              <br><br><br>
                              <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input type="text" id="cari_stok_opname" placeholder="Cari Kode Stok" class="form-control">
                              </div>
                              <div class="dt-responsive table-responsive">
                                    <table id="table_stok_opname" class="table table-striped table-bordered nowrap">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">No</th>
                                                <th style="text-align:center;">Kode Stok</th>
                                                <th style="text-align:center;">Tanggal</th>
                                                <th style="text-align:center;">Jumlah Barang</th>
                                                <th style="text-align:center;">User</th>
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

<button id="popup_detail_stok_opname" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#modal-detail-stok-opaname"></button>
<div class="modal fade" id="modal-detail-stok-opaname" tabindex="-1">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="popup_load_modal" id="popup_load">
            <div class="window_load">
                <img src="<?=base_url()?>assets/Ellipsis.gif" height="120" width="120">
            </div>
          </div>
          <div class="modal-header">
              <h5 class="modal-title">Data Opname</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
            <div class="modal-body p-b-0">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" name="search" id="search_opname" class="form-control">
              </div>
              <table class="table table-striped table-bordered nowrap table-hover" id="table_detail_stok_opname">
                  <thead>
                      <tr>
                          <th style="text-align:center;">Nama Barang</th>
                          <th style="text-align:center;">Stok Sebelumn</th>
                          <th style="text-align:center;">Stok Sesudah</th>
                      </tr>
                  </thead>
                  <tbody>

                  </tbody>
              </table>
              <div id="pagination_opname"></div>
              <br>
          </div>
          <div class="modal-footer">
              <button type="button" id="tutup_barang" class="btn btn-danger" data-dismiss="modal">Batal</button>
          </div>
        </div>
    </div>
</div>

  <!-- Main-body end-->
