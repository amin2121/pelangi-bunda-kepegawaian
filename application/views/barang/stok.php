<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Barang</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>barang">Barang</a>
                      </li>
                      <li class="breadcrumb-item">Stok Barang
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
                                <h5>Stok Barang</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <form action="<?php echo base_url(); ?>barang/tambah_stok" method="POST">
                                    <input type="hidden" name="id_barang" value="<?php echo $id_barang; ?>">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Stok</label>
                                        <div class="col-sm-10">
                                          <?php
                                          if ($row['cek_barang'] == '0') {
                                            $jumlah = '0';
                                          }else {
                                            $jumlah = $row['stok'];
                                          }
                                          ?>
                                            <input type="text" name="stok" class="form-control" value="<?php echo $jumlah; ?>" required>
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
