<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Meja</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                              <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>meja">Meja</a>
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
                                <h5>Data Meja</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <!-- <div style="float:left">
                                <input type="text" name="" value="">
                              </div> -->
                              <div style="float:right;">
                                <a href="<?php echo base_url(); ?>meja/view_tambah"><button type="button" class="btn btn-primary" name="button"><i class="icofont icofont-plus"></i> Tambah</button></a>
                              </div>
                              <br><br><br>
                              <div class="dt-responsive table-responsive">
                                    <table id="simpletable" class="table table-striped table-bordered nowrap">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">No</th>
                                                <th style="text-align:center;">Nama Meja</th>
                                                <th style="text-align:center;">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            $no = 0;
                                             foreach ($meja as $b):
                                               $no++;
                                               ?>
                                              <tr>
                                                <td style="text-align:center;"><?php echo number_format($no); ?></td>
                                                <td style="text-align:center;"><?php echo $b['nama_meja']; ?></td>
                                                <td style="text-align:center;">
                                                  <a href="<?php echo base_url(); ?>meja/view_edit/<?php echo $b['id']; ?>"><button type="button" class="btn btn-info btn-sm" name="button"><i class="fa fa-pencil"></i> Edit</button></a>
                                                  <a href="<?php echo base_url(); ?>meja/hapus/<?php echo $b['id']; ?>" onclick="return confirm('Apakah anda ingin menghapus data?')"><button type="button" class="btn btn-danger btn-sm"  name="button"><i class="fa fa-trash"></i> Hapus</button></a>
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
