<script type="text/javascript">
$(document).ready(function(){
    // pemasukan per tahun
    chart_pemasukan();
    // pemasukan per hari
    chart_pemasukan_perbulan();
    // pengeluaran per tahun
    chart_pengeluaran();
    // pengeluaran per hari
    chart_pengeluaran_perbulan();
    // pengjualan
    chart_penjualan();
});

function chart_pemasukan(){
	$.ajax({
	url : '<?php echo base_url(); ?>home/chart_pemasukan',
	type : "POST",
	dataType : "json",
	success : function(result){

    var chart = new CanvasJS.Chart("chart_pemasukan", {
    animationEnabled: true,
    // exportEnabled: true,
    theme: "light1", // "light1", "light2", "dark1", "dark2"
    title:{
      text: "Pemasukan Per Tahun"
    },
    data: [{
      type: "column", //change type to bar, line, area, pie, etc
      //indexLabel: "{y}", //Shows y value on all Data Points
      indexLabelFontColor: "#5A5757",
      indexLabelPlacement: "outside",
      dataPoints: result['pemasukan']
    }]
    });
    chart.render();

    }
	});
}

function chart_pemasukan_perbulan(){
	$.ajax({
	url : '<?php echo base_url(); ?>home/chart_pemasukan_perbulan',
	type : "POST",
	dataType : "json",
	success : function(result){

    var chart = new CanvasJS.Chart("chart_pemasukan_perbulan", {
    animationEnabled: true,
    // exportEnabled: true,
    theme: "light1", // "light1", "light2", "dark1", "dark2"
    title:{
      text: "Pemasukan Per Bulan"
    },
    data: [{
      type: "column", //change type to bar, line, area, pie, etc
      //indexLabel: "{y}", //Shows y value on all Data Points
      indexLabelFontColor: "#5A5757",
      indexLabelPlacement: "outside",
      dataPoints: result['pemasukan']
    }]
    });
    chart.render();

    }
	});
}

function chart_pengeluaran(){
	$.ajax({
	url : '<?php echo base_url(); ?>home/chart_pengeluaran',
	type : "POST",
	dataType : "json",
	success : function(result){

    var chart = new CanvasJS.Chart("chart_pengeluaran", {
    animationEnabled: true,
    // exportEnabled: true,
    theme: "light2", // "light1", "light2", "dark1", "dark2"
    title:{
      text: "Pengeluaran Per Tahun"
    },
    data: [{
      type: "column", //change type to bar, line, area, pie, etc
      //indexLabel: "{y}", //Shows y value on all Data Points
      indexLabelFontColor: "#5A5757",
      indexLabelPlacement: "outside",
      dataPoints: result['pengeluaran']
    }]
    });
    chart.render();

    }
	});
}

function chart_pengeluaran_perbulan(){
	$.ajax({
    url : '<?php echo base_url(); ?>home/chart_pengeluaran_perbulan',
    type : "POST",
    dataType : "json",
    success : function(result){

        console.table('bulan', result)

        var chart = new CanvasJS.Chart("chart_pengeluaran_perbulan", {
            animationEnabled: true,
            // exportEnabled: true,
            theme: "light2", // "light1", "light2", "dark1", "dark2"
            title:{
              text: "Pengeluaran Per Bulan"
            },
            data: [{
              type: "column", //change type to bar, line, area, pie, etc
              //indexLabel: "{y}", //Shows y value on all Data Points
              indexLabelFontColor: "#5A5757",
              indexLabelPlacement: "outside",
              dataPoints: result['pengeluaran']
            }]
        });
        chart.render();

        }
    });
 // console.log('bulan')
}

function chart_penjualan(){
  var id_kasir = '<?php echo $this->session->userdata('id_kasir'); ?>';
  var nama = '<?php echo $this->session->userdata('nama_lengkap'); ?>';
	$.ajax({
	url : '<?php echo base_url(); ?>home/chart_penjualan',
  data : {id_kasir:id_kasir},
	type : "POST",
	dataType : "json",
	success : function(result){

    var chart = new CanvasJS.Chart("chart_penjualan", {
    animationEnabled: true,
    // exportEnabled: true,
    theme: "light2", // "light1", "light2", "dark1", "dark2"
    title:{
      text: 'Penjualan Kasir '+nama+' Per Bulan'
    },
    data: [{
      type: "column", //change type to bar, line, area, pie, etc
      //indexLabel: "{y}", //Shows y value on all Data Points
      indexLabelFontColor: "#5A5757",
      indexLabelPlacement: "outside",
      dataPoints: result['penjualan']
    }]
    });
    chart.render();

    }
	});
}

</script>
  <!-- Main-body start-->
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-header">
                <div class="page-header-title">
                    <h4>Dashboard</h4>
                </div>
                <div class="page-header-breadcrumb">
                    <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                            <a href="<?php echo base_url(); ?>home">
                                <i class="icofont icofont-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>home">Dashboard</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="page-body">
                <div class="row">

                  <div class="col-md-12 col-xl-6">
                    <a href="<?php echo base_url(); ?>riwayat_penjualan">
                      <div class="card table-card widget-primary-card">
                          <div class="">
                              <div class="row-table">
                                  <div class="col-sm-3 card-block-big" style="background-color: #0D47A1">
                                      <i class="icofont icofont-cart-alt"></i>
                                  </div>
                                  <div class="col-sm-9">
                                      <h4><?php echo number_format($penjualan['jumlah_jual']); ?></h4>
                                      <h6>Penjualan Per Bulan</h6>
                                  </div>
                              </div>
                          </div>
                      </div>
                    </a>
                  </div>
                  <div class="col-md-12 col-xl-6">
                    <a href="<?php echo base_url(); ?>barang">
                    <div class="card table-card widget-success-card">
                        <div class="">
                            <div class="row-table">
                                <div class="col-sm-3 card-block-big">
                                    <i class="icofont icofont-box"></i>
                                </div>
                                <div class="col-sm-9">
                                    <h4><?php echo number_format($barang['jumlah_barang']); ?></h4>
                                    <h6>Jumlah Barang</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    </a>
                  </div>
                    <div class="col-md-12 col-xl-6">
                        <a href="<?php echo base_url(); ?>laporan_pemasukan">
                            <div class="card table-card widget-primary-card" style="background-color: #9c27b0;">
                             <div class="">
                                 <div class="row-table">
                                     <div class="col-sm-3 card-block-big" style="background-color: #6a0080;">
                                         <i class="icofont icofont-tasks-alt"></i>
                                     </div>
                                     <div class="col-sm-9">
                                         <h4>Rp. <?php echo number_format($keuntungan_bulan['jumlah_untung_bulan']); ?></h4>
                                         <h6>Keuntungan Per Bulan</h6>
                                     </div>
                                 </div>
                             </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-12 col-xl-6">
                        <a href="<?php echo base_url(); ?>laporan_pemasukan">
                        <div class="card table-card widget-primary-card" style="background-color: #FBC02D">
                            <div class="">
                                <div class="row-table">
                                    <div class="col-sm-3 card-block-big" style="background-color: #F57F17">
                                        <i class="icofont icofont-money"></i>
                                    </div>
                                    <div class="col-sm-9">
                                        <h4>Rp. <?php echo number_format($keuntungan['jumlah_untung']); ?></h4>
                                        <h6>Keuntungan Per Tahun</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </a>
                    </div>
                     <div class="col-sm-6">
                        <div class="card">
                            <div class="card-block panels-wells">
                               <div id="chart_pemasukan_perbulan" style="height: 300px; width: 100%;"></div>
                            </div>
                        </div>
                     </div>

                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-block panels-wells">
                               <div id="chart_pengeluaran_perbulan" style="height: 300px; width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                             
                     <div class="col-sm-6">
                        <div class="card">
                            <div class="card-block panels-wells">
                               <div id="chart_pemasukan" style="height: 300px; width: 100%;"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="card">
                             <div class="card-block panels-wells">
                               <div id="chart_pengeluaran" style="height: 300px; width: 100%;"></div>
                             </div>
                        </div>
                    </div>
                   <?php if ($this->session->userdata('level') == 'Umum'): ?>
                     <div class="col-sm-12">
                             <div class="card">
                                 <div class="card-block panels-wells">
                                   <div id="chart_penjualan" style="height: 400px; width: 100%;"></div>
                                 </div>
                             </div>
                         </div>
                   <?php endif; ?>

                </div>
            </div>
        </div>
    </div>
    <!-- Main-body end-->
