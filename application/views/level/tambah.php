<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Level</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>level">Level</a>
                      </li>
                      <li class="breadcrumb-item">Tambah Level
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
                                <h5>Tambah Level</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <form action="<?php echo base_url(); ?>level/tambah" method="POST" enctype="multipart/form-data">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Nama Level</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="nama_level" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2"></label>
                                        <div class="col-sm-10">
                                          <button type="submit" class="btn btn-primary m-b-0"><i class="fa fa-save"></i>Simpan</button>
                                          <a href="<?php echo base_url(); ?>level"><button type="button" class="btn btn-warning" name="button"><i class="fa fa-mail-reply"></i>Kembali</button></a>
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

<script>
  function hitung_laba() {
    let harga_awal = parseInt($(`#harga_awal`).val().split(',').join('') || 0)
    let harga_jual = parseInt($(`#harga_jual`).val().split(',').join('') || 0)

    let laba = harga_jual - harga_awal
    $(`#laba`).val(NumberToMoney(laba))
  }
</script>