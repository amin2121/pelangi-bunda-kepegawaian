<script src="http://code.responsivevoice.org/responsivevoice.js"></script>
<script type="text/javascript">
var snd = new Audio("<?php echo base_url(); ?>assets/sound/Google_Event-1.mp3");

$(document).ready(function(){
    pesanan_result();

    setInterval(function () {
        pesanan_result();
    }, 7000);
});

function pesanan_result(){
  $('#popup_load').show();

  $.ajax({
    url : '<?php echo base_url(); ?>dapur/pesanan_result',
    type : "POST",
    dataType : 	"json",
    success : function(result){
      var jumlah_data = result.length;
      var jumlah_data_lama = $('#jumlah_data').val();

      if (parseFloat(jumlah_data) > parseFloat(jumlah_data_lama)) {
        $('#jumlah_data').val(jumlah_data);

        responsiveVoice.speak(
            "Ada, Pesanan Baru",
            "Indonesian Female",
            {
             pitch: 1,
             rate: 1,
             volume: 1
            }
         );
      }else if (parseFloat(jumlah_data) == parseFloat(jumlah_data_lama)) {
        // responsiveVoice.pause();
      }

      $table = "";

      if (result == "" || result == null) {
        $table = '<div class="col-md-12">'+
                    '<span>Pesanan Kosong</span>'+
                  '</div>';
      }else {
        var no = 0;
        for(var i=0; i<result.length; i++){
          no++;

          var id = result[i].id;
          detail_pesanan(id);

          var link_selesai = '<div class="card-footer text-right"><button type="button" class="btn btn-info waves-effect waves-light" onclick="pesanan_selesai('+result[i].id+')"><i class="fa fa-check"></i> Selesai</button></div>';

          $table += '<div class="col-sm-4 default-grid-item">'+
                      '<div class="card">'+
                          '<div class="card-header">'+
                              '<div class="media">'+
                                  '<div class="media-body media-middle">'+
                                      '<div class="company-name">'+
                                          '<p>'+result[i].nama_meja+'</p>'+
                                          '<span class="text-muted f-14">'+result[i].tanggal+' '+result[i].waktu+'</span>'+
                                      '</div>'+
                                      '<div class="job-badge">'+
                                          '<label class="label bg-primary">Pesanan atas nama '+result[i].atas_nama+'</label>'+
                                      '</div>'+
                                  '</div>'+
                              '</div>'+
                          '</div>'+
                          '<div class="card-block">'+
                              '<h6 class="job-card-desc">List Pesanan</h6>'+
                              '<div class="dt-responsive table-responsive" style="height: 300px; overflow: auto;">'+
                                    '<table id="table_barang_'+result[i].id+'" class="table table-styling table-bordered">'+
                                        '<thead class="table-primary">'+
                                            '<tr>'+
                                                '<th style="text-align:center;">Nama Barang</th>'+
                                                '<th style="text-align:center;">Jumlah</th>'+
                                            '</tr>'+
                                        '</thead>'+
                                        '<tbody>'+

                                        '</tbody>'+
                                    '</table>'+
                                '</div>'+
                          '</div>'+
                          ''+link_selesai+''+
                      '</div>'+
                  '</div>';
        }
      }
      $('.data_pesanan').html($table);
      $('#popup_load').fadeOut();
    }
  });
}

function pesanan_selesai(id){
  var jawab = confirm("Apakah anda yakin?");
    if (jawab === true) {
      $.ajax({
           url: '<?php echo base_url();?>dapur/pesanan_selesai',
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

function detail_pesanan(id){
  $.ajax({
    url : '<?php echo base_url(); ?>dapur/detail_pesanan',
    data : {id:id},
    type : "POST",
    dataType : 	"json",
    success : function(result){
      $table = "";

      if (result == "" || result == null) {
        $table = '<tr>'+
                      '<td style="text-align:center;" colspan="2">List Kosong</td>'+
                  '</tr>';
      }else {
        var no = 0;
        for(var i=0; i<result.length; i++){
          no++;

          $table +=   '<tr>'+
                        '<td style="text-align:center;">'+result[i].nama_barang+'</td>'+
                        '<td style="text-align:center;">'+result[i].jumlah_beli+'</td>'+
                      '</tr>';

        }
      }
      $('#table_barang_'+id+' tbody').html($table);
    }
  });
}
</script>
<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Dapur</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>jenis_barang">Dapur</a>
                      </li>
                  </ul>
              </div>
          </div>
          <input type="hidden" id="jumlah_data" value="<?php echo $jumlah_data['jumlah_data']; ?>">
          <div class="page-body">
              <div class="row">
                <div class="col-sm-12">
                        <!-- Panel card start -->
                        <div class="row data_pesanan">

                        </div>
                        <!-- Panel card end -->
                    </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Main-body end-->
