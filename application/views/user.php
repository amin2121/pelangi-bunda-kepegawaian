<script type="text/javascript">
function popup_detail(id){
  $('#btn_popup_detail').click();

  $.ajax({
    url : '<?php echo base_url(); ?>user/detail_user',
    data : {id:id},
    type : "POST",
    dataType : 	"json",
    success : function(row){

      var gambar = '<?php echo site_url();?>assets/ktp_pengguna/'+row.ktp+'';

      $('#gambar_ktp').attr('src', gambar);
      $('#nama_toko').val(row.nama_toko);
      $('#nama_lengkap').val(row.nama_lengkap);
      $('#alamat').val(row.alamat);
      $('#no_telepon').val(row.no_telepon);
      $('#username').val(row.username);
      $('#password').val(row.password);
    }
  });
}
</script>
<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>User</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-user"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>user">User</a>
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
                                <h5>Data User</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <!-- <div style="float:left">
                                <input type="text" name="" value="">
                              </div> -->
                              <div style="float:right;">
                                <a href="<?php echo base_url(); ?>user/backup_database"><button type="button" class="btn btn-success" name="button"><i class="icofont icofont-download"></i> Export Data</button></a>
                                <a href="<?php echo base_url(); ?>user/view_tambah"><button type="button" class="btn btn-primary" name="button"><i class="icofont icofont-plus"></i> Tambah</button></a>
                              </div>
                              <br><br><br>
                              <div class="dt-responsive table-responsive">
                                    <table id="simpletable" class="table table-striped table-bordered nowrap">
                                        <thead>
                                          <tr>
                                              <th style="text-align:center;">No</th>
                                              <th style="text-align:center;">Nama Lengkap</th>
                                              <th style="text-align:center;">Username</th>
                                              <th style="text-align:center;">Created At</th>
                                              <th style="text-align:center;">Level</th>
                                              <th style="text-align:center;">Aksi</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <?php
                                            $no = 0;
                                            foreach ($user as $u):
                                            $no++;
                                            ?>
                                            <tr>
                                              <td style="text-align:center;"><?php echo $no ?></td>
                                              <td style="text-align:center;"><?php echo $u['nama_lengkap']; ?></td>
                                              <td style="text-align:center;"><?php echo $u['username']; ?></td>
                                              <td style="text-align:center;"><?php echo $u['created_at']; ?></td>
                                              <td style="text-align:center;"><?php echo $u['level']; ?></td>
                                              <td style="text-align:center;">
                                                <button type="button" class="btn btn-warning btn-sm" name="button" onclick="popup_detail(<?php echo $u['id']; ?>);"><i class="fa fa-eye"></i> Detail</button>
                                                <a href="<?php echo base_url(); ?>user/view_edit/<?php echo $u['id']; ?>"><button type="button" class="btn btn-info btn-sm" name="button"><i class="fa fa-pencil"></i> Edit</button></a>
                                                <a href="<?php echo base_url(); ?>user/hapus/<?php echo $u['id']; ?>" onclick="return confirm('Apakah anda ingin menghapus data?')"><button type="button" class="btn btn-danger btn-sm"  name="button"><i class="fa fa-trash"></i> Hapus</button></a>
                                              </td>
                                            </tr>
                                          <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- <span>Jika anda ingin menghapus semua data transaksi atau data lainnya. Anda dapat melakukan <a href="<?php echo base_url(); ?>user/reset_data" onclick="return confirm('Apakah anda ingin mereset data?')">Reset Data</a></span> -->
                            </div>
                        </div>
                        <!-- Panel card end -->
                        <button id="btn_popup_detail" style="display:none;" type="button" class="btn btn-info col-md-12" data-toggle="modal" data-target="#detail-modal">modal</button>
                        <div class="modal fade" id="detail-modal" tabindex="-1">
                          <div class="modal-dialog modal-lg" role="document">
                              <div class="modal-content">
                                  <div class="modal-header">
                                      <h5 class="modal-title">Detail User</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                      </button>
                                  </div>
                                  <div class="modal-body p-b-0">
                                    <center>
                                      <img id="gambar_ktp" class="img-responsive" style="height: 140px;">
                                    </center><br>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Nama Toko</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="nama_toko" value="" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Nama Lengkap</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="nama_lengkap" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Alamat</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="alamat" value="" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">No Telepon</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="no_telepon" value="" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Username</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="username" value="" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <!-- <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Password</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="password" value="" class="form-control" readonly>
                                        </div>
                                    </div> -->
                                  <div class="modal-footer">
                                      <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
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
