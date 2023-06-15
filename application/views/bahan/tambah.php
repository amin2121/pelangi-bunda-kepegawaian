<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Bahan</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>bahan">Bahan</a>
                      </li>
                      <li class="breadcrumb-item">Tambah Bahan
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
                                <h5>Tambah Bahan</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <form action="<?php echo base_url(); ?>bahan/tambah" method="POST" enctype="multipart/form-data">
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">Nama Bahan</label>
                                      <div class="col-sm-10">
                                          <input type="text" name="nama_bahan" class="form-control" required>
                                      </div>
                                  </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Satuan Bahan</label>
                                        <div class="col-sm-10">
                                            <select class="js-example-basic-single col-sm-12" name="satuan">
                                              <?php foreach ($satuan_bahan as $jb): ?>
                                                <option value="<?php echo $jb['satuan_bahan']; ?>"><?php echo $jb['satuan_bahan']; ?></option>
                                              <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2"></label>
                                        <div class="col-sm-10">
                                          <button type="submit" class="btn btn-primary m-b-0"><i class="fa fa-save"></i>Simpan</button>
                                          <a href="<?php echo base_url(); ?>bahan"><button type="button" class="btn btn-warning" name="button"><i class="fa fa-mail-reply"></i>Kembali</button></a>
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
