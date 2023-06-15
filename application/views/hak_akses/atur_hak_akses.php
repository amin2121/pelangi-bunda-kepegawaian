<!-- Main-body start-->
  <div class="main-body">
      <div class="page-wrapper">
          <div class="page-header">
              <div class="page-header-title">
                  <h4>Hak Akses</h4>
              </div>
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                        <i class="ti-archive"></i>
                      </li>
                      <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>hak_akses">Hak Akses</a>
                      </li>
                      <li class="breadcrumb-item">Atur Hak Akses
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
                                <h5>Atur Hak Akses</h5>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block panels-wells">
                              <form action="<?php echo base_url(); ?>hak_akses/atur_hak_akses" method="POST">                                    
                                    <div class="form-group row">
                                        <label for="input-hak-akses" class="col-sm-2 col-form-label">Nama Level</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="nama_level" value="<?= $row['nama_level'] ?>" readonly class="form-control" required>
                                        </div>
                                        <input type="hidden" name="level" value="<?= $row['id'] ?>">
                                    </div>
                                    <b style="margin-top: 3em !important; margin-bottom: 2em !important;display: block;">Hak Akses : </b>
                                    <div class="accordion-block mb-5 border-checkbox-section">
                                        <div class="accordion-box" id="single-open">
                                            <?php foreach ($menus_1 as $menu1): 
                                              $id_menu_1 = $menu1['id'];
                                              $level = $row['id'];
                                              $pengaturan_hak_akses_1 = $this->db->query("SELECT COUNT(*) as jumlah FROM pengaturan_hak_akses WHERE id_menu = $id_menu_1 AND level = '$level' AND tipe_menu = 'menu_1'")->row_array();
                                            ?>
                                                <a class="accordion-msg bg-primary b-none"><?= $menu1['nama'] ?></a>
                                                <div class="accordion-desc p-3" style="border: 1px solid #ccc; margin-bottom: 1em;">
                                                    <div class="form-group">
                                                        <div class="border-checkbox-group border-checkbox-group-primary">
                                                            <input class="border-checkbox" type="checkbox" name="menu_1[]" value="<?= $menu1['id'] ?>" id="<?= $menu1['nama'] ?>-checkbox" onchange="getCheckboxMenu1(this)" data-tipe-menu-1="<?= $menu1['nama'] ?>" <?= ($pengaturan_hak_akses_1['jumlah'] > 0) ? 'checked' : '' ?>>
                                                            <label class="border-checkbox-label" for="<?= $menu1['nama'] ?>-checkbox"><?= $menu1['nama'] ?></label>
                                                        </div>
                                                    </div>
                                                    <?php $menus_2 = $this->db->query("SELECT * FROM menu_2 WHERE id_menu_1 = $id_menu_1")->result_array(); ?>
                                                            <div class="row" style="margin-left: 2rem !important;">
                                                              <div class="col-sm-12">
                                                                  <?php foreach ($menus_2 as $menu2): 
                                                                    $id_menu_2 = $menu2['id'];
                                                                    $pengaturan_hak_akses_2 = $this->db->query("SELECT COUNT(*) as jumlah FROM pengaturan_hak_akses WHERE id_menu = $id_menu_2 AND level = '$level' AND tipe_menu = 'menu_2'")->row_array();
                                                                  ?>
                                                                    <div class="form-group row d-flex align-items-center">
                                                                      <div class="border-checkbox-group border-checkbox-group-success">
                                                                          <input class="border-checkbox checkbox-<?= $menu1['nama'] ?>" type="checkbox" name="menu_2[]" value="<?= $menu2['id'] ?>" id="<?= str_replace(' ', '-', $menu2['nama']) ?>-checkbox" data-tipe-menu-2="<?= str_replace(' ', '-', $menu2['nama']) ?>" data-tipe-menu-1="<?= str_replace(' ', '-', $menu1['nama']) ?>" onchange="getCheckboxMenu2(this)" <?= ($pengaturan_hak_akses_2['jumlah'] > 0) ? 'checked' : '' ?>>
                                                                          <label class="border-checkbox-label" for="<?= str_replace(' ', '-', $menu2['nama']) ?>-checkbox"><?= $menu2['nama'] ?></label>
                                                                      </div>
                                                                    </div>
                                                                    <?php
                                                                      $menus_3 = $this->db->query("SELECT * FROM menu_3 WHERE id_menu_2 = $id_menu_2")->result_array();
                                                                     ?>
                                                                      <div class="row" style="margin-left: 3em !important;">
                                                                          <?php if(count($menus_3) > 0) : ?>
                                                                              <div class="col-sm-12">
                                                                                  <?php foreach ($menus_3 as $menu3): 
                                                                                    $id_menu_3 = $menu3['id'];
                                                                                    $pengaturan_hak_akses_3 = $this->db->query("SELECT COUNT(*) as jumlah FROM pengaturan_hak_akses WHERE id_menu = $id_menu_3 AND level = '$level' AND tipe_menu = 'menu_3'")->row_array();
                                                                                  ?>
                                                                                    <div class="form-group row d-flex align-items-center">
                                                                                      <div class="border-checkbox-group border-checkbox-group-warning">
                                                                                          <input class="border-checkbox checkbox-<?= str_replace(' ', '-', $menu2['nama']) ?>" type="checkbox" value="<?= $menu3['id'] ?>" name="menu_3[]" id="<?= str_replace(' ', '-', $menu3['nama'].'-3') ?>-checkbox" onchange="getCheckboxMenu3(this)" data-tipe-menu-2="<?= str_replace(' ', '-', $menu2['nama']) ?>" data-tipe-menu-1="<?= str_replace(' ', '-', $menu1['nama']) ?>" <?= ($pengaturan_hak_akses_3['jumlah'] > 0) ? 'checked' : '' ?>>
                                                                                          <label class="border-checkbox-label" for="<?= str_replace(' ', '-', $menu3['nama'].'-3') ?>-checkbox"><?= $menu3['nama'] ?></label>
                                                                                      </div>
                                                                                    </div>
                                                                                  <?php endforeach ?>
                                                                              </div>
                                                                          <?php endif ?>
                                                                      </div>
                                                                      <hr>
                                                                  <?php endforeach ?>
                                                              </div>
                                                            </div>
                                                </div>
                                            <?php endforeach ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                      <button type="submit" class="btn btn-primary m-b-0"><i class="fa fa-save"></i>Simpan</button>
                                      <a href="<?= base_url('hak_akses') ?>" id="btn_kembali" class="btn btn-warning m-b-0"><i class="fa fa-mail-reply"></i> Kembali</a>
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
  "use strict";
  $(document).ready(function(){
      var icons = {
          header: "zmdi zmdi-chevron-down",
          activeHeader: "zmdi zmdi-chevron-up"
      };

      $( "#single-open" ).accordion({
          heightStyle: "content",
          icons: icons
      });

      if($(".accordion-msg").attr('aria-expanded') == 'true'){
          $(".accordion-msg").addClass("scale_active");
      }
      else{
          $(".accordion-msg").removeClass("scale_active");
      }

  })
    
    function getCheckboxMenu1(e) {
        var menu1 = $(`#${e.id}`)
        var tipeMenu1 = menu1.data('tipe-menu-1')

        var menu2 = $(`.checkbox-${tipeMenu1}`)
        if(menu1.is(':checked')) {
            // menu2.each(function(index) {
            //   $(this).prop('checked', true)
            //   // console.log($(this))
            // })
            menu2.prop('checked', true)
            menu2.each(function(index) {
                var tipeMenu2 = $(this).data('tipe-menu-2')
                var menu3 = $(`.checkbox-${tipeMenu2}`)
                menu3.prop('checked', true)
            })
        } else {
            // menu2.each(function(index) {
            //   $(this).prop('checked', false)
            // })
            menu2.prop('checked', false)
            menu2.each(function(index) {
                var tipeMenu2 = $(this).data('tipe-menu-2')
                var menu3 = $(`.checkbox-${tipeMenu2}`)
                menu3.prop('checked', false)
            })
        }
    }

    function getCheckboxMenu2(e) {
      var menu2 = $(`#${e.id}`)
      var tipeMenu2 = menu2.data('tipe-menu-2')
      var tipeMenu1 = menu2.data('tipe-menu-1')

      var menu3 = $(`.checkbox-${tipeMenu2}`)
      var menu1 = $(`#${tipeMenu1}-checkbox`)
      if(menu2.is(':checked')) {
        // console.log(true)
        // menu3.each(function(index) {
        //   $(this).prop('checked', true)
        // })
        menu3.prop('checked', true)
        // menu1.prop('checked', true)

      } else {
        // menu3.each(function(index) {
        //   $(this).prop('checked', true)
        // })
        // console.log(false)
        menu3.prop('checked', false)
        // menu1.prop('checked', false)
      }
    }

    function getCheckboxMenu3(e) {
      var menu3 = $(`#${e.id}`)
      var tipeMenu2 = menu3.data('tipe-menu-2')
      var tipeMenu1 = menu3.data('tipe-menu-1')

      var menu2 = $(`#${tipeMenu2}-checkbox`)
      var menu1 = $(`#${tipeMenu1}-checkbox`)
      if(menu3.is(':checked')) {
        // console.log(true)
        // menu3.each(function(index) {
        //   $(this).prop('checked', true)
        // })
        menu3.prop('checked', true)
        menu2.prop('checked', true)
        // menu1.prop('checked', true)
      } else {
        // menu3.each(function(index) {
        //   $(this).prop('checked', true)
        // })
        // console.log(false)
        menu3.prop('checked', false)
        menu2.prop('checked', false)
        // menu1.prop('checked', false)
      }
    }

</script>