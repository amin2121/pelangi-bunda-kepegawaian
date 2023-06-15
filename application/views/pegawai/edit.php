<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Pegawai</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                        <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>pegawai">Pegawai</a>
                      </li>
                      <li class="breadcrumb-item">Edit Pegawai
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
                                <h5>Edit Pegawai</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <form action="<?php echo base_url(); ?>pegawai/edit" method="POST" enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                    
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Nama</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="nama" class="form-control" required value="<?php echo $row['nama'] ?>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">No Rekening</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="no_rekening" class="form-control" required value="<?php echo $row['no_rekening'] ?>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Jabatan</label>
                                        <div class="col-sm-10">
                                            <select class="js-example-basic-single col-sm-12" name="id_jabatan">
                                              <?php foreach ($jabatan as $jb): ?>
                                                <option value="<?php echo $jb['id']; ?>" <?php echo $row['id_jabatan'] == $jb['id'] ? 'selected' : '' ?>><?php echo $jb['jabatan']; ?></option>
                                              <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Alamat</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="alamat" class="form-control" required value="<?php echo $row['alamat'] ?>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">No Telepon</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="telepon" class="form-control" required value="<?php echo $row['telepon'] ?>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Gaji</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" id="gaji" name="gaji" class="form-control" onkeyup="FormatCurrency(this);" required value="<?php echo number_format($row['gaji'] == '' || $row['gaji'] == null ? 0 : $row['gaji']) ?>">
                                          </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">BPJS</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" id="bpjs" name="bpjs" class="form-control" onkeyup="FormatCurrency(this);" required value="<?php echo number_format($row['bpjs'] == '' || $row['bpjs'] == null ? 0 : $row['bpjs']) ?>">
                                          </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Status</label>
                                        <div class="col-sm-10">
                                            <select class="js-example-basic-single col-sm-12" name="status_pegawai">
                                                <option value="1" <?php echo $row['status_pegawai'] == 1 ? 'selected' : '' ?>>Aktif</option>
                                                <option value="0" <?php echo $row['status_pegawai'] == 0 ? 'selected' : '' ?>>Tidak Aktif</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2"></label>
                                        <div class="col-sm-10">
                                            <button type="submit" class="btn btn-primary m-b-0">Simpan</button>
                                            <a href="<?php echo base_url(); ?>jabatan"><button type="button" class="btn btn-warning" name="button"><i class="fa fa-mail-reply"></i>Kembali</button></a>
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
