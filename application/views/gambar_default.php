<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Gambar Default</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>gambar_default">Gambar Default</a>
                      </li>
                      <li class="breadcrumb-item">Atur Gambar Default
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
                                <h5>Atur Gambar Default</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <form action="<?php echo base_url(); ?>gambar_default/atur_gambar_default" method="POST" enctype="multipart/form-data">
                                    <div class="form-group" id="form-gambar-default">
                                        <label>Gambar Barang</label>
                                        <input type="file" class="form-control dropify" placeholder="Upload Gambar Barang" name="gambar_default" data-max-file-size="50M" data-show-remove="false" data-default-file="<?= base_url('assets/gambar_default/'. $row['nama_file']) ?>">
                                        <input type="hidden" name="gambar_lama" value="<?= $row['nama_file'] ?>">
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-10">
                                            <button type="submit" class="btn btn-primary m-b-0"><i class="fa fa-save"></i>Simpan</button>
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
