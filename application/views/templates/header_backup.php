<ul class="main-navigation">
                
                <li <?php if($active == 'home'){echo 'class="nav-item has-class"';}else{echo 'class="nav-item"';}?>>
                    <a href="<?php echo base_url(); ?>home">
                        <i class="ti-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                  <li <?php if($active == 'penjualan'){echo 'class="nav-item has-class"';}else{echo 'class="nav-item"';}?>>
                      <a href="#">
                          <i class="ti-shopping-cart"></i>
                          <span>Penjualan</span>
                      </a>
                      <ul class="tree-1">
                          <li><a href="<?php echo base_url(); ?>pemesanan">Pemesanan</a></li>
                          <li><a href="<?php echo base_url(); ?>kasir">Kasir</a></li>
                          <li><a href="<?php echo base_url(); ?>dapur">Dapur</a></li>
                      </ul>
                  </li>
                  <?php if ($this->session->userdata('level') == 'Admin'): ?>
                  <li <?php if($active == 'keuangan'){echo 'class="nav-item has-class"';}else{echo 'class="nav-item"';}?>>
                      <a href="#">
                          <i class="ti-money"></i>
                          <span>Keuangan</span>
                      </a>
                      <ul class="tree-1">
                          <li><a href="<?php echo base_url(); ?>pemasukan">Pemasukan</a></li>
                          <li><a href="<?php echo base_url(); ?>pengeluaran">Pengeluaran</a></li>
                          <!-- <li><a href="<?php //echo base_url(); ?>laba">Laba</a></li> -->
                      </ul>
                  </li>
                <?php endif; ?>
                <?php if ($this->session->userdata('level') == 'Admin'): ?>
                <li <?php if($active == 'barang'){echo 'class="nav-item has-class"';}else{echo 'class="nav-item"';}?>>
                    <a href="#">
                        <i class="ti-archive"></i>
                        <span>Barang</span>
                    </a>
                    <ul class="tree-1">
                        <li><a href="<?php echo base_url(); ?>jenis_barang">Master Jenis Barang</a></li>
                        <li><a href="<?php echo base_url(); ?>barang">Master Barang</a></li>
                        <li><a href="<?php echo base_url(); ?>meja">Master Meja</a></li>
                        <li><a href="<?php echo base_url(); ?>stok_barang">Stok Barang</a></li>
                        <li><a href="<?php echo base_url(); ?>stok_opname">Stok Opname</a></li>
                    </ul>
                </li>
                <?php endif; ?>
                <li <?php if($active == 'inventori'){echo 'class="nav-item has-class"';}else{echo 'class="nav-item"';}?>>
                    <a href="#">
                        <i class="ti-receipt"></i>
                        <span>Inventori</span>
                    </a>
                    <ul class="tree-1">
                        <li><a href="<?php echo base_url(); ?>bahan">Master Bahan</a></li>
                        <li><a href="<?php echo base_url(); ?>stok">Buku Stok</a></li>
                        <li><a href="<?php echo base_url(); ?>stok_masuk">Stok Masuk</a></li>
                        <li><a href="<?php echo base_url(); ?>stok_keluar">Stok Keluar</a></li>
                    </ul>
                </li>
                <li <?php if($active == 'riwayat'){echo 'class="nav-item has-class"';}else{echo 'class="nav-item"';}?>>
                    <a href="#">
                        <i class="ti-timer"></i>
                        <span>Riwayat</span>
                    </a>
                    <ul class="tree-1">
                        <li><a href="<?php echo base_url(); ?>riwayat_penjualan">Riwayat Penjualan</a></li>
                        <li><a href="<?php echo base_url(); ?>riwayat_retur">Riwayat Retur Penjualan</a></li>
                    </ul>
                </li>
                <li <?php if($active == 'laporan'){echo 'class="nav-item has-class"';}else{echo 'class="nav-item"';}?>>
                    <a href="#">
                        <i class="ti-printer"></i>
                        <span>Laporan</span>
                    </a>
                    <ul class="tree-1">
                        <li class="nav-sub-item"><a href="#">Laporan Penjualan</a>
                            <ul class="tree-2">
                                <li><a href="<?php echo base_url(); ?>laporan_penjualan">Laporan Penjualan</a></li>
                                <?php if ($this->session->userdata('level') == 'Admin'): ?>
                                <li><a href="<?php echo base_url(); ?>laporan_penjualan_detail">Laporan Penjualan Detail</a></li>
                                <li><a href="<?php echo base_url(); ?>laporan_penjualan_jenis">Laporan Penjualan Per Jenis</a></li>
                                <?php endif; ?>
                            </ul>
                        </li>
                        <?php if ($this->session->userdata('level') == 'Admin'): ?>
                          <li class="nav-sub-item"><a href="#">Laporan Produk</a>
                              <ul class="tree-2">
                                  <li><a href="<?php echo base_url(); ?>penjualan_produk">Penjualan Produk</a></li>
                                  <li><a href="<?php echo base_url(); ?>produk_populer">Produk Populer</a></li>
                              </ul>
                          </li>
                          <li class="nav-sub-item"><a href="#">Laporan Stok</a>
                              <ul class="tree-2">
                                  <li><a href="<?php echo base_url(); ?>laporan_stok">Stok Saat ini</a></li>
                                  <li><a href="<?php echo base_url(); ?>laporan_buku_stok">Laporan Buku Stok</a></li>
                              </ul>
                          </li>
                          <li><a href="<?php echo base_url(); ?>laporan_pemasukan">Laporan Pemasukan</a></li>
                          <li><a href="<?php echo base_url(); ?>laporan_pengeluaran">Laporan Pengeluaran</a></li>
                        <?php endif; ?>
                    </ul>
                </li>
                <?php if ($this->session->userdata('level') == 'Admin'): ?>
                  <li <?php if($active == 'user'){echo 'class="nav-item has-class"';}else{echo 'class="nav-item"';}?>>
                      <a href="#">
                          <i class="ti-user"></i>
                          <span>Pengaturan</span>
                      </a>
                      <ul class="tree-1">
                          <li><a href="<?php echo base_url(); ?>ubah_struk">Ubah Struk</a></li>
                          <li><a href="<?php echo base_url(); ?>level">Level</a></li>
                          <li><a href="<?php echo base_url(); ?>hak_akses">Hak Akses</a></li>
                          <li><a href="<?php echo base_url(); ?>user">User</a></li>
                          <li><a href="<?php echo base_url(); ?>gambar_default">Gambar Default</a></li>
                          <li class="nav-sub-item"><a href="#">Promo</a>
                              <ul class="tree-2">
                                  <li><a href="<?php echo base_url(); ?>promo_otomatis">Promo Otomatis</a></li>
                              </ul>
                          </li>
                      </ul>
                  </li>
                <?php endif; ?>
            </ul>