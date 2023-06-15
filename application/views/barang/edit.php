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
                      <li class="breadcrumb-item">Tambah Barang
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
                                <h5>Tambah Barang</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <form action="<?php echo base_url(); ?>barang/edit" method="POST" enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Jenis Barang</label>
                                        <div class="col-sm-10">
                                            <select class="js-example-basic-single col-sm-12" name="id_jenis_barang">
                                              <?php foreach ($jenis_barang as $jb): ?>
                                                <option value="<?php echo $jb['id']; ?>" <?php if ($jb['id']==$row['id_jenis_barang']) {echo 'selected';} ?>><?php echo $jb['nama_jenis_barang']; ?></option>
                                              <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Nama Barang</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="nama_barang" class="form-control" value="<?php echo $row['nama_barang']; ?>" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Harga Awal</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" id="harga_awal" name="harga_awal" class="form-control" onkeyup="FormatCurrency(this); hitung_laba();" required value="<?php echo number_format($row['harga_awal']); ?>">
                                          </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Harga Jual</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" id="harga_jual" name="harga_jual" class="form-control" onkeyup="FormatCurrency(this); hitung_laba();" required value="<?php echo number_format($row['harga_jual']); ?>">
                                          </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">laba</label>
                                        <div class="col-sm-10">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" id="laba" name="laba" class="form-control" onkeyup="FormatCurrency(this);" required value="<?php echo number_format($row['laba']); ?>">
                                          </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Foto Barang</label>
                                        <div class="col-sm-10">
                                            <input type="hidden" name="foto_barang_hidden" value="<?php echo $row['foto_barang']; ?>">
                                            <input type="file" name="foto_barang" class="form-control">
                                            <span><?php echo $row['foto_barang']; ?></span>
                                        </div>
                                    </div>
                                    <!-- <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Status Produksi</label>
                                        <div class="col-sm-10">
                                          <div class="border-checkbox-section">
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="status_produksi" value="0">
                                                <input class="border-checkbox check_status" type="checkbox" name="status_produksi" value="1" id="checkbox0" <?php if ($row['status_produksi'] == '1' ) { ?> checked <?php } ?>>
                                                <label class="border-checkbox-label" for="checkbox0"></label>

                                            </div>
                                        </div>
                                          <span>Apakah produk memiliki bahan baku? <br> Contoh: Donat. Bahan Baku : Tepung 100 gr dan Telur 2 Butir <br> Jika tidak maka jangan di centang</span>
                                      </div>
                                    </div> -->
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

<script>
  function hitung_laba() {
    let harga_awal = parseInt($(`#harga_awal`).val().split(',').join('') || 0)
    let harga_jual = parseInt($(`#harga_jual`).val().split(',').join('') || 0)

    let laba = harga_jual - harga_awal
    $(`#laba`).val(NumberToMoney(laba))
  }
</script>