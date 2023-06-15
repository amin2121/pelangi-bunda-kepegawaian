<style media="screen">
    <?php if ($row['tampil_facebook'] == '0') : ?>#form_facebook {
        display: none;
    }

    <?php else : ?>#form_facebook {
        display: block;
    }

    <?php endif; ?><?php if ($row['tampil_instagram'] == '0') : ?>#form_instagram {
        display: none;
    }

    <?php else : ?>#form_instagram {
        display: block;
    }

    <?php endif; ?><?php if ($row['tampil_twitter'] == '0') : ?>#form_twitter {
        display: none;
    }

    <?php else : ?>#form_twitter {
        display: block;
    }

    <?php endif; ?>
</style>
<script type="text/javascript">
    $(document).ready(function() {
        $('#tampil_facebook').click(function() {
            var cek = $('#tampil_facebook').is(":checked");

            if (cek == true) {
                $('#form_facebook').show();
            } else {
                $('#form_facebook').hide();
            }
        });

        $('#tampil_instagram').click(function() {
            var cek = $('#tampil_instagram').is(":checked");

            if (cek == true) {
                $('#form_instagram').show();
            } else {
                $('#form_instagram').hide();
            }
        });

        $('#tampil_twitter').click(function() {
            var cek = $('#tampil_twitter').is(":checked");

            if (cek == true) {
                $('#form_twitter').show();
            } else {
                $('#form_twitter').hide();
            }
        });
    });
</script>
<!-- Main-body start-->
<div class="main-body">
    <div class="page-wrapper">
        <div class="page-header">
            <div class="page-header-title">
                <h4>Ubah Struk</h4>
            </div>
            <div class="page-header-breadcrumb">
                <ul class="breadcrumb-title">
                    <li class="breadcrumb-item">
                        <i class="ti-money"></i>
                    </li>
                    <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>ubah_struk">Ubah Struk</a>
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
                            <h5>Ubah Struk</h5>
                            <div class="card-header-right">
                                <i class="icofont icofont-rounded-down"></i>
                            </div>
                        </div>
                        <div class="card-block panels-wells">
                            <form action="<?php echo base_url(); ?>ubah_struk/edit" method="POST" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Nama Cafe</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="nama_cafe" class="form-control" value="<?php echo $row['nama_cafe'] ?? ''; ?>">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Alamat</label>
                                    <div class="col-sm-10">
                                        <textarea name="alamat" class="form-control" id="alamat" rows="5"><?php echo $row['alamat'] ?? '' ?></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">No Telp</label>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                            <input type="tel" name="no_telp" class="form-control" value="<?php echo $row['no_telp'] ?? ''; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Logo Struk</label>
                                    <div class="col-sm-10">
                                        <input type="file" name="logo_struk" class="form-control"><br>
                                        <input type="hidden" name="logo_struk_hidden" value="<?php echo $row['logo_struk'] ?? ''; ?>">
                                        <span>Gambar Saat ini <img src="<?php echo base_url(); ?>assets/logo_struk/<?php echo $row['logo_struk'] ?? ''; ?>" style="height: 80px;" alt="<?php echo $row['logo_struk'] ?? ''; ?>"></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Tampilkan Facebook</label>
                                    <div class="col-sm-10">
                                        <div class="border-checkbox-section">
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="tampil_facebook" value="0">
                                                <input class="border-checkbox check_status" type="checkbox" name="tampil_facebook" value="1" id="tampil_facebook" <?php if (($row['tampil_facebook'] ?? null) == '1') { ?> checked <?php } ?>>
                                                <label class="border-checkbox-label" for="tampil_facebook"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="form_facebook">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Facebook</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="facebook" class="form-control" value="<?php echo $row['facebook'] ?? ''; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Tampilkan Instagram</label>
                                    <div class="col-sm-10">
                                        <div class="border-checkbox-section">
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="tampil_instagram" value="0">
                                                <input class="border-checkbox check_status" type="checkbox" name="tampil_instagram" value="1" id="tampil_instagram" <?php if (($row['tampil_instagram'] ?? null) == '1') { ?> checked <?php } ?>>
                                                <label class="border-checkbox-label" for="tampil_instagram"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="form_instagram">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Instagram</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="instagram" class="form-control" value="<?php echo $row['instagram'] ?? ''; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Tampilkan Twitter</label>
                                    <div class="col-sm-10">
                                        <div class="border-checkbox-section">
                                            <div class="border-checkbox-group border-checkbox-group-primary">
                                                <input type="hidden" name="tampil_twitter" value="0">
                                                <input class="border-checkbox check_status" type="checkbox" name="tampil_twitter" value="1" id="tampil_twitter" <?php if (($row['tampil_twitter'] ?? null) == '1') { ?> checked <?php } ?>>
                                                <label class="border-checkbox-label" for="tampil_twitter"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="form_twitter">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Twitter</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="twitter" class="form-control" value="<?php echo $row['twitter'] ?? ''; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Footer</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="footer" class="form-control" value="<?php echo $row['footer'] ?? ''; ?>">
                                    </div>
                                </div>
                                <!-- <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Keterangan</label>
                                        <div class="col-sm-10">
                                            <textarea rows="5" cols="5" name="keterangan" class="form-control"><?php echo $row['keterangan'] ?? ''; ?></textarea>
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