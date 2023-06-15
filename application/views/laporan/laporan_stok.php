<script type="text/javascript">
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
                  <h4>Laporan Stok Saat ini</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-receipt"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>laporan_stok">Laporan Stok Saat ini</a>
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
                                <h5>Data Laporan Stok Saat ini</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">

                                <form action="<?php echo base_url(); ?>laporan_stok/print_laporan" target="_blank" method="POST" id="form_cek">
                                    <div class="form-group row">
                                        <div class="col-sm-2">
                                          <button type="submit" class="btn btn-info" name="button"><i class="fa fa-search"></i>Print</button>
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
