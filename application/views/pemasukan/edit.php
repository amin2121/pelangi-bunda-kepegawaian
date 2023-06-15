<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Pemasukan</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-money"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>pemasukan">Pemasukan</a>
                      </li>
                      <li class="breadcrumb-item">Edit Pemasukan
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
                                <h5>Edit Pemasukan</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <form action="<?php echo base_url(); ?>pemasukan/edit" method="POST">
                                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Nama Pemasukan</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="nama_pemasukan" class="form-control" value="<?php echo $row['nama_pemasukan']; ?>" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Nominal</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" name="nominal" class="form-control" onkeyup="FormatCurrency(this);" value="<?php echo number_format($row['nominal']); ?>" required>
                                          </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Keterangan</label>
                                        <div class="col-sm-10">
                                            <textarea rows="5" cols="5" name="keterangan" class="form-control" required><?php echo $row['keterangan']; ?></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2"></label>
                                        <div class="col-sm-10">
                                            <button type="submit" class="btn btn-primary m-b-0">Simpan</button>
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
