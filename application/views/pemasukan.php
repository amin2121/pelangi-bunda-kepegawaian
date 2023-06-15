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
                  </ul>
              </div>
          </div>
          <div class="page-body">
              <div class="row">
                <div class="col-sm-12">
                        <!-- Panel card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5>Data Pemasukan</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <!-- <div style="float:left">
                                <input type="text" name="" value="">
                              </div> -->
                              <div style="float:right;">
                                <a href="<?php echo base_url(); ?>pemasukan/view_tambah"><button type="button" class="btn btn-primary" name="button"><i class="icofont icofont-plus"></i> Tambah</button></a>
                              </div>
                              <br><br><br>
                              <div class="dt-responsive table-responsive">
                                    <table id="simpletable" class="table table-striped table-bordered nowrap">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">No Invoice</th>
                                                <th style="text-align:center;">Nama Pemasukan</th>
                                                <th style="text-align:center;">Keterangan</th>
                                                <th style="text-align:center;">Tanggal & Waktu</th>
                                                <th style="text-align:center;">Nominal</th>
                                                <th style="text-align:center;">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <?php
                                          $total_pemasukan = 0;
                                          foreach ($pemasukan as $p): ?>
                                            <tr>
                                                <td style="text-align:center;"><?php echo $p['invoice']; ?></td>
                                                <td style="text-align:center; vertical-align:center;"><?php echo $p['nama_pemasukan']; ?></td>
                                                <td style="text-align:center;"><?php echo $p['keterangan']; ?></td>
                                                <td style="text-align:center;"><?php echo $p['tanggal']; ?> <?php echo $p['waktu']; ?></td>
                                                <td style="text-align:right;">Rp. <?php echo number_format($p['nominal']); ?></td>
                                                <td style="text-align:center;">
                                                  <a href="<?php echo base_url(); ?>pemasukan/view_edit/<?php echo $p['id']; ?>"><button type="button" class="btn btn-info btn-sm" name="button"><i class="fa fa-pencil"></i> Edit</button></a>
                                                  <a href="<?php echo base_url(); ?>pemasukan/hapus/<?php echo $p['id']; ?>" onclick="return confirm('Apakah anda ingin menghapus data?')"><button type="button" class="btn btn-danger btn-sm"  name="button"><i class="fa fa-trash"></i> Hapus</button></a>
                                                </td>
                                            </tr>
                                          <?php
                                          $total_pemasukan += $p['nominal'];
                                          endforeach;
                                          ?>
                                        </tbody>
                                        <tfoot>
                                          <th colspan="4" style="text-align:right">Total</th>
                                          <th style="text-align:right">Rp. <?php echo number_format($total_pemasukan); ?></th>
                                          <th></th>
                                        </tfoot>
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
