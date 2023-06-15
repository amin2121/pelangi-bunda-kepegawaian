<style media="screen">
  #form_bulan,
  #form_tahun{
    display: none;
  }
</style>
<script type="text/javascript">
$(document).ready(function(){
  $('#filter_hari').click(function(){
    $('#form_hari').show();
    $('#form_bulan').hide();
    $('#form_tahun').hide();
  });

  $('#filter_bulan').click(function(){
    $('#form_hari').hide();
    $('#form_bulan').show();
    $('#form_tahun').hide();
  });

  $('#filter_tahun').click(function(){
    $('#form_hari').hide();
    $('#form_bulan').hide();
    $('#form_tahun').show();
  });

});
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
                  <h4>Laporan Pemasukan</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-receipt"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>laporan_pemasukan">Laporan Pemasukan</a>
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
                                <h5>Data Laporan Pemasukan</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">

                            <form action="<?php echo base_url(); ?>laporan_pemasukan/print_laporan" target="_blank" method="POST" id="form_cek">
                              <div class="form-radio">
                                  <div class="radio radio-inline">
                                      <label>
                                          <input type="radio" name="filter" value="hari" id="filter_hari" checked="checked">
                                          <i class="helper"></i>Hari
                                      </label>
                                  </div>
                                  <div class="radio radio-inline">
                                      <label>
                                          <input type="radio" name="filter" value="bulan" id="filter_bulan">
                                          <i class="helper"></i>Bulan
                                      </label>
                                  </div>
                                  <div class="radio radio-inline">
                                      <label>
                                          <input type="radio" name="filter" value="tahun" id="filter_tahun">
                                          <i class="helper"></i>Tahun
                                      </label>
                                  </div>
                              </div><br>

                              <div id="form_hari">
                                <div class="form-group row">
                                    <div class="col-sm-2">
                                      <input type="date" class="form-control" name="dari_tanggal" value="<?= date('Y-m-d') ?>">
                                    </div>
                                    <div class="col-sm-2">
                                      <input type="date" class="form-control" name="sampai_tanggal" value="<?= date('Y-m-d') ?>">
                                    </div>
                                    <div class="col-sm-2">
                                      <button type="submit" class="btn btn-info" name="button"><i class="fa fa-search"></i>Print</button>
                                    </div>
                                </div>
                              </div>

                              <div id="form_bulan">
                                <div class="form-group row">
                                    <div class="col-sm-2">
                                      <select class="form-control" name="filter_bulan">
                                        <?php
                                          $bulan=array("Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember");
                                          $selectedBulan = date('m');
                                          $no = 0;
                                        ?>
                                        <?php foreach ($bulan as $key => $b): $no = ++$key ?>
                                          <option value="<?= sprintf("%02s", $no); ?>" <?= $selectedBulan == sprintf("%02s", $no) ? 'selected': '' ?>><?= $b ?></option>
                                        <?php endforeach ?>
                                      </select>
                                    </div>
                                    <div class="col-sm-2">
                                      <select class="form-control" name="filter_tahun_bulan">
                                        <?php 
                                          $selectedTahun=date('Y');
                                          for ($a=2010;$a<=$selectedTahun;$a++) :
                                        ?>
                                          <option value="<?= $a ?>" <?= $a == $selectedTahun ? 'selected' : '' ?>><?= $a ?></option>
                                        <?php endfor ?>
                                      </select>
                                    </div>
                                    <div class="col-sm-2">
                                      <button type="submit" class="btn btn-info" name="button"><i class="fa fa-search"></i>Print</button>
                                    </div>
                                </div>
                              </div>

                              <div id="form_tahun">
                                <div class="form-group row">
                                    <div class="col-sm-2">
                                      <select class="form-control" name="filter_tahun">
                                        <?php 
                                          $selectedTahun=date('Y');
                                          for ($a=2010;$a<=$selectedTahun;$a++) :
                                        ?>
                                          <option value="<?= $a ?>" <?= $a == $selectedTahun ? 'selected' : '' ?>><?= $a ?></option>
                                        <?php endfor ?>
                                      </select>
                                    </div>
                                    <div class="col-sm-2">
                                      <button type="submit" class="btn btn-info" name="button"><i class="fa fa-search"></i>Print</button>
                                    </div>
                                </div>
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
