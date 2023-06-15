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
                  </ul>
              </div>
          </div>
          <div class="page-body">
              <div class="row">
                <div class="col-sm-12">
                        <!-- Panel card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5>Data Promo Otomatis</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <span>Merupakan promo yang akan otomatis diimplementasikan ketika konsumen mencapai kriteria tertentu<br>Contoh : Jika konsumen membeli A maka Gratis B</span>
                              <!-- <div style="float:left">
                                <input type="text" name="" value="">
                              </div> -->
                              <div style="float:right;">
                                <div class="btn-group dropdown-split-info">
                                    <button type="button" class="btn btn-info"><i class="icofont icofont-plus"></i>Tambah</button>
                                    <button type="button" class="btn btn-info dropdown-toggle dropdown-toggle-split waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="sr-only">Toggle primary</span>
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item waves-effect waves-light" href="<?php echo base_url(); ?>promo_otomatis/view_tambah_promo_a">Promo A</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item waves-effect waves-light" href="<?php echo base_url(); ?>promo_otomatis/view_tambah_promo_b">Promo B</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item waves-effect waves-light" href="<?php echo base_url(); ?>promo_otomatis/view_tambah_promo_c">Promo C</a>
                                    </div>
                                </div>
                              </div>
                              <br><br><br>
                              <div class="dt-responsive table-responsive">
                                    <table id="simpletable" class="table table-striped table-bordered nowrap">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">Nama Promo</th>
                                                <th style="text-align:center;">Tanggal Promo</th>
                                                <th style="text-align:center;">Hari</th>
                                                <th style="text-align:center;">Jam Promo</th>
                                                <th style="text-align:center;">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <?php foreach ($promo as $p): ?>
                                            <tr>
                                              <td align="center" style="vertical-align: middle;">
                                                <?php if ($p['status_promo'] == '1'): ?>
                                                  <i class="fa fa-circle" style="color: #64DD17;"></i>
                                                <?php else: ?>
                                                  <i class="fa fa-circle" style="color: grey;"></i>
                                                <?php endif; ?>
                                                <?php echo $p['nama_promo']; ?>
                                              </td>
                                              <td align="center">
                                                <?php echo $p['tanggal_mulai']; ?><br>
                                                s/d<br>
                                                <?php echo $p['tanggal_berakhir']; ?>
                                              </td>
                                              <td align="center" style="vertical-align: middle;">
                                                <?php
                                                  if ($p['senin'] == '1') {
                                                    echo 'Senin, ';
                                                  }
                                                  if ($p['selasa'] == '1') {
                                                    echo 'Selasa, ';
                                                  }
                                                  if ($p['rabu'] == '1') {
                                                    echo 'Rabu, ';
                                                  }
                                                  if ($p['kamis'] == '1') {
                                                    echo 'Kamis, ';
                                                  }
                                                  if ($p['jumat'] == '1') {
                                                    echo 'jumat, ';
                                                  }
                                                  if ($p['sabtu'] == '1') {
                                                    echo 'Sabtu, ';
                                                  }
                                                  if ($p['minggu'] == '1') {
                                                    echo 'Minggu.';
                                                  }
                                                 ?>
                                              </td>
                                              <td align="center">
                                                <?php echo $p['jam_mulai']; ?><br>
                                                s/d<br>
                                                <?php echo $p['jam_berakhir']; ?>
                                              </td>
                                              <td align="center" style="vertical-align: middle;">
                                                <?php if ($p['status_promo'] == '0'): ?>
                                                  <a href="<?php echo base_url(); ?>promo_otomatis/aktifkan/<?php echo $p['id']; ?>/<?php echo $p['jenis_promo']; ?>" onclick="return confirm('Apakah anda ingin mengaktifkan promo?')"><button type="button" class="btn btn-success btn-sm"  name="button"><i class="fa fa-circle"></i> Aktifkan</button></a>
                                                <?php else: ?>
                                                  <a href="<?php echo base_url(); ?>promo_otomatis/non_aktifkan/<?php echo $p['id']; ?>/<?php echo $p['jenis_promo']; ?>" onclick="return confirm('Apakah anda ingin mengnonaktifkan promo?')"><button type="button" class="btn btn-warning btn-sm"  name="button"><i class="fa fa-circle-o"></i> Non-Aktifkan</button></a>
                                                <?php endif; ?>
                                                <a href="<?php echo base_url(); ?>promo_otomatis/view_edit/<?php echo $p['id']; ?>/<?php echo $p['jenis_promo']; ?>"><button type="button" class="btn btn-info btn-sm"  name="button"><i class="fa fa-pencil"></i> Edit</button></a>
                                                <a href="<?php echo base_url(); ?>promo_otomatis/hapus/<?php echo $p['id']; ?>/<?php echo $p['jenis_promo']; ?>" onclick="return confirm('Apakah anda ingin menghapus data?')"><button type="button" class="btn btn-danger btn-sm"  name="button"><i class="fa fa-trash"></i> Hapus</button></a>
                                              </td>
                                            </tr>
                                          <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Panel card end -->
                    </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Main-body end-->
