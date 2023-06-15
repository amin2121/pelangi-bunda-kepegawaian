<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Jenis Barang</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>jenis_barang">Jenis Barang</a>
                      </li>
                      <li class="breadcrumb-item">Edit Jenis Barang
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
                                <h5>Edit Jenis Barang</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <form action="<?php echo base_url(); ?>jenis_barang/edit" method="POST">
                                <input type="hidden" value="<?php echo $row['id']; ?>" name="id" value="">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Nama Jenis Barang</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="nama_jenis_barang" class="form-control" value="<?php echo $row['nama_jenis_barang']; ?>" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2"></label>
                                        <div class="col-sm-10">
                                          <button type="submit" class="btn btn-primary m-b-0"><i class="fa fa-save"></i>Simpan</button>
                                          <a href="<?php echo base_url(); ?>jenis_barang"><button type="button" class="btn btn-warning" name="button"><i class="fa fa-mail-reply"></i>Kembali</button></a>
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
