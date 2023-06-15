<style media="screen">
  #form_kategori{
    display: none;
  }
</style>
<script type="text/javascript">
$(document).ready(function(){
  $('#check_setiap_hari').click(function(){
    var cek = $('#check_setiap_hari').is(":checked");

    if(cek == true){
      $(".check_status").prop('checked','checked');
    }else{
      $(".check_status").removeAttr('checked');
    }
  });

  $('#check_kategori').click(function(){
    var cek = $('#check_kategori').is(":checked");

    if(cek == true){
      $('#form_kategori').show();
      $('#form_produk').hide();
    }else{
      $('#form_produk').show();
      $('#form_kategori').hide();
    }
  });
});
</script>
<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Promo Otomatis</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-user"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>promo_otomatis">Promo Otomatis</a>
                      </li>
                      <li class="breadcrumb-item">Tambah Promo Otomatis
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
                                <h5>Diskon produk dengan minimal transaksi N</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <span>Contoh : Belanja RP. 100.000 mendapat diskon 10%</span><br><br>
                              <form action="<?php echo base_url(); ?>promo_otomatis/tambah_promo_b" method="POST">
                                  <div id="form_produk">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Pilih Produk</label>
                                        <div class="col-sm-10">
                                          <select class="js-example-basic-single col-sm-12" name="nama_produk">
                                            <?php foreach ($produk as $p): ?>
                                              <option value="<?php echo $p['nama_barang']; ?>"><?php echo $p['nama_barang']; ?></option>
                                            <?php endforeach; ?>
                                          </select>
                                        </div>
                                      </div>
                                    </div>
                                    <div id="form_kategori">
                                      <div class="form-group row">
                                          <label class="col-sm-2 col-form-label">Pilih Kategori</label>
                                          <div class="col-sm-10">
                                            <select class="js-example-basic-single col-sm-12" name="nama_kategori">
                                              <?php foreach ($kategori as $k): ?>
                                                <option value="<?php echo $k['nama_jenis_barang']; ?>"><?php echo $k['nama_jenis_barang']; ?></option>
                                              <?php endforeach; ?>
                                            </select>
                                          </div>
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Banyak Bayar</label>
                                        <div class="col-sm-4">
                                          <div class="input-group">
                                            <span class="input-group-addon">Rp</span>
                                            <input type="text" name="banyak_bayar" class="form-control" onkeyup="FormatCurrency(this);" required>
                                          </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Pilih promo berdasarkan kategori</label>
                                        <div class="col-sm-10">
                                          <div class="border-checkbox-section">
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="promo_berdasarkan" value="0">
                                                <input class="border-checkbox" type="checkbox" name="promo_berdasarkan" value="1" id="check_kategori">
                                                <label class="border-checkbox-label" for="check_kategori"></label>
                                            </div>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Tipe Diskon</label>
                                        <div class="col-sm-1">
                                          <select class="js-example-basic-single col-sm-12" name="tipe_diskon">
                                            <option value="persen">%</option>
                                            <option value="nominal">Rp</option>
                                          </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Mendapat Diskon</label>
                                        <div class="col-sm-10">
                                          <input type="text" name="diskon" class="form-control" onkeyup="FormatCurrency(this);" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Tanggal Mulai</label>
                                        <div class="col-sm-10">
                                            <input type="date" name="tanggal_mulai" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Tanggal Berakhir</label>
                                        <div class="col-sm-10">
                                            <input type="date" name="tanggal_berakhir" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Berlaku Pada Hari</label>
                                        <div class="col-sm-10">
                                          <div class="border-checkbox-section">
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                              <input type="hidden" name="senin" value="0">
                                                <input class="border-checkbox check_status hari" type="checkbox" name="senin" value="1" id="senin">
                                                <label class="border-checkbox-label" for="senin">Senin</label>
                                            </div>
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="selasa" value="0">
                                                <input class="border-checkbox check_status hari" type="checkbox" name="selasa" value="1" id="selasa">
                                                <label class="border-checkbox-label" for="selasa">Selasa</label>
                                            </div>
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="rabu" value="0">
                                                <input class="border-checkbox check_status hari" type="checkbox" name="rabu" value="1" id="rabu">
                                                <label class="border-checkbox-label" for="rabu">Rabu</label>
                                            </div>
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="kamis" value="0">
                                                <input class="border-checkbox check_status hari" type="checkbox" name="kamis" value="1" id="kamis">
                                                <label class="border-checkbox-label" for="kamis">Kamis</label>
                                            </div>
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="jumat" value="0">
                                                <input class="border-checkbox check_status hari" type="checkbox" name="jumat" value="1" id="jumat">
                                                <label class="border-checkbox-label" for="jumat">Jumat</label>
                                            </div>
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="sabtu" value="0">
                                                <input class="border-checkbox check_status hari" type="checkbox" name="sabtu" value="1" id="sabtu">
                                                <label class="border-checkbox-label" for="sabtu">Sabtu</label>
                                            </div>
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="minggu" value="0">
                                                <input class="border-checkbox check_status hari" type="checkbox" name="minggu" value="1" id="minggu">
                                                <label class="border-checkbox-label" for="minggu">Minggu</label>
                                            </div>
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input class="border-checkbox check_status" type="checkbox" value="1" id="check_setiap_hari">
                                                <label class="border-checkbox-label" for="check_setiap_hari">Setiap Hari</label>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Jam Mulai</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control hour" name="jam_mulai" data-mask="99:99:99">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Jam Berakhir</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control hour" name="jam_berakhir" data-mask="99:99:99">
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
