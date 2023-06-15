<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Stok Masuk</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-package"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>stok_masuk">Stok Masuk</a>
                      </li>
                      <li class="breadcrumb-item">Tambah Stok Masuk
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
                                <h5>Tambah Stok Masuk</h5>
                                <!-- <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div> -->
                            </div>
                            <div class="card-block panels-wells">
                              <button type="button" style="display:none;" class="btn btn-danger alert-success-cancel m-b-10" id="alert_konfirmasi">alert</button>
                              <form id="form_stok_masuk" action="" method="POST">
                                <input type="hidden" id="bahan_number" name="" value="1">

																	<div class="form-group row">
																			<label class="col-sm-2 col-form-label">Tanggal</label>
																			<div class="col-sm-10">
																					<input type="text" name="tanggal" class="form-control" value="<?php echo $row['tanggal']; ?>" readonly />
																			</div>
																	</div>

                                  <div class="form-group row">
																			<label class="col-sm-2 col-form-label">Catatan</label>
																			<div class="col-sm-10">
																					<textarea name="catatan" class="form-control" rows="3" readonly><?php echo $row['catatan']; ?></textarea>
																			</div>
																	</div>

                                      <div class="dt-responsive table-responsive">
                                            <table id="tabel_tambah_bahan" class="table table-striped table-bordered nowrap">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align:center;">Nama Bahan</th>
                                                        <th style="text-align:center;">Jumlah</th>
                                                        <th style="text-align:center;">Harga Beli</th>
                                                        <th style="text-align:center;">Total Harga Beli</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                  <?php foreach ($result as $r): ?>
                                                  <tr>
                                                    <td>
                                                      <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                                        <input type="text" name="nama_bahan" value="<?php echo $r['nama_bahan']; ?>" class="form-control input_isi" id="nama_bahan_1" readonly />
                                                      </div>
                                                    </td>
                                                    <td>
                                                      <input type="text" name="jumlah_beli" value="<?php echo number_format($r['jumlah_beli']); ?>" class="form-control input_isi" id="jumlah_beli_1" readonly />
                                                    </td>
                                                    <td>
                                                      <div class="input-group">
                                                        <span class="input-group-addon">Rp</span>
                                                        <input type="text" name="harga_beli" value="<?php echo number_format($r['harga_beli']); ?>" class="form-control input_isi" id="harga_beli_1" readonly />
                                                      </div>
                                                    </td>
                                                    <td>
                                                      <div class="input-group">
                                                        <span class="input-group-addon">Rp</span>
                                                        <input type="text" name="total_harga_beli" value="<?php echo number_format($r['total_harga_beli']); ?>" class="form-control input_isi class_harga_beli" id="total_harga_beli_1" readonly readonly />
                                                      </div>
                                                    </td>
                                                  </tr>
                                                  <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Total Semua Harga Beli</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" name="total_semua" class="form-control input_isi" id="total_semua" value="<?php echo number_format($row['total_semua']); ?>" readonly />
                                          </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2"></label>
                                        <div class="col-sm-10">
                                          <a href="<?php echo base_url(); ?>stok_masuk">
                                            <button type="button" id="btn_simpan" class="btn btn-warning m-b-0"><i class="fa fa-mail-reply"></i>Kembali</button>
                                          </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Panel card end -->
                        <button id="popup_bahan" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#bahan-modal">modal</button>
                        <div class="modal fade" id="bahan-modal" tabindex="-1">
                          <div class="modal-dialog" role="document">
                              <div class="modal-content">
																<div class="popup_load_modal" id="popup_load">
																	    <div class="window_load">
																	        <img src="<?=base_url()?>assets/Ellipsis.gif" height="120" width="120">
																	    </div>
																</div>
                                  <div class="modal-header">
                                      <h5 class="modal-title">Data Bahan</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                      </button>
                                  </div>
                                  <div class="modal-body p-b-0">
                                    <div class="input-group">
                                      <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                      <input type="text" name="search" id="search_bahan" class="form-control">
                                    </div>
                                    <table class="table table-striped table-bordered nowrap table_data_bahan table-hover">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">Nama Bahan</th>
                                                <th style="text-align:center;">Satuan</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                    <div id="pagination_bahan"></div>
                                    <br>
                                  <div class="modal-footer">
                                      <button type="button" id="tutup_bahan" class="btn btn-danger" data-dismiss="modal">Batal</button>
                                  </div>
                                  </form>
                              </div>
                          </div>
                      </div>
                    </div>

                    </div>

              </div>
          </div>
      </div>
  </div>
  <!-- Main-body end-->
