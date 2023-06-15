<style media="screen">
  #div_table{
    display: none;
  }
</style>
<script type="text/javascript">
function filter_tanggal(){
  var tanggal_dari = $('#tanggal_dari').val();
  var tanggal_sampai = $('#tanggal_sampai').val();
  $('#div_table').show();
  $.ajax({
    url : '<?php echo base_url(); ?>laba/filter_tanggal',
    data : {tanggal_dari:tanggal_dari, tanggal_sampai:tanggal_sampai},
    type : "POST",
    dataType : 	"json",
    success : function(result){
      $table = "";
      var total_laba = 0;

      if (result['res'] == "" || result['res'] == null) {
        $table = '<tr>'+
                    '<td colspan="5" style="text-align:center;">Data Kosong</td>'+
                  '</tr>';

        var nama_filter = 'Pemasukan Penjualan Dari Tanggal '+result['tanggal_dari']+' Sampai Tanggal '+result['tanggal_sampai'];
        $('.tabel_laba tbody').html($table);
        $('#nama_filter').val(nama_filter);
        $('#total_laba').val(total_laba);
        $('#span_total_laba').html(NumberToMoney(total_laba));
        $('#btn_simpan').attr('disabled', 'disabled');
      }else {
        var no = 0;
        for(var i=0; i<result['res'].length; i++){
          no++;
          total_laba += parseFloat(result['res'][i].nilai_laba);

          $table += '<tr>'+
                      '<td style="text-align:center;">'+result['res'][i].no_transaksi+'</td>'+
                      '<td style="text-align:center;">'+result['res'][i].tanggal+' '+result['res'][i].waktu+'</td>'+
                      '<td style="text-align:right;">Rp. '+NumberToMoney(result['res'][i].nilai_laba)+'</td>'+
                    '</tr>';

        }
        var nama_filter = 'Pemasukan Penjualan Dari Tanggal '+result['tanggal_dari']+' Sampai Tanggal '+result['tanggal_sampai'];
        $('.tabel_laba tbody').html($table);
        $('#nama_filter').val(nama_filter);
        $('#total_laba').val(total_laba);
        $('#span_total_laba').html(NumberToMoney(total_laba));
      }
    }
  });
}
</script>
<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Laba</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-money"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>laba">Laba</a>
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
                                <h5>Data Laba</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">

                              <form>
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
                              </form>

                              <form action="<?php echo base_url(); ?>laba/tambah_pemasukan" method="POST">
                                <div class="dt-responsive table-responsive" id="div_table">
                                  <input type="hidden" id="total_laba" name="total_laba" value="">
                                  <input type="hidden" id="nama_filter" name="nama_filter" value="">
                                      <table class="table table-striped table-bordered nowrap tabel_laba">
                                          <thead>
                                              <tr>
                                                  <th style="text-align:center;">No Transaksi</th>
                                                  <th style="text-align:center;">Tanggal & Waktu</th>
                                                  <th style="text-align:center;">Laba</th>
                                              </tr>
                                          </thead>
                                          <tbody>

                                          </tbody>
                                          <tfoot>
                                            <tr>
                                              <th colspan="2" style="text-align:right;">Total</th>
                                              <th style="text-align:right;">Rp. <span id="span_total_laba"></span></th>
                                            </tr>
                                          </tfoot>
                                      </table>
                                      <br>
                                      <button type="submit" class="btn btn-primary col-md-12" id="btn_simpan" name="button"><i class="fa fa-download"></i>Input Ke Pemasukan</button>
                                  </div>
                              </form>
                            </div>
                        </div>
                        <!-- Panel card end -->
                    </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Main-body end-->
