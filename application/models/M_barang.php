<?php
class M_barang extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  // public function get_kode_barang(){
  //   $this->db->select('RIGHT(barang.kode_barang,4) as kode, barang.id_user', FALSE);
  //   $this->db->where('id_user', $this->session->userdata('id_user'));
  //   $this->db->order_by('kode_barang','DESC');
  //   $this->db->limit(1);
  //   $query = $this->db->get('barang');      //cek dulu apakah ada sudah ada kode di tabel.
  //   if($query->num_rows() <> 0){
  //    //jika kode ternyata sudah ada.
  //    $data = $query->row();
  //    $kode = intval($data->kode) + 1;
  //   }
  //   else {
  //    $kode = 1;
  //   }
  //   $kodemax = str_pad($kode, 4, "0", STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
  //   $tanggal = date('dmy');
  //   $kodejadi = "KB".$kodemax;    // hasilnya ODJ-9921-0001 dst.
  //   return $kodejadi;
  // }

  public function jenis_barang_result(){
    $this->db->select('*');
    $this->db->from('jenis_barang');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function tambah(){
    $config['upload_path'] = './assets/foto_barang';
    $config['allowed_types'] = 'gif|jpg|png';
    $image = str_replace(' ','_', $_FILES['foto_barang']['name']);
    $config['file_name'] = $image;
    $this->load->library('upload', $config);

    if (!$this->upload->do_upload('foto_barang')) {
      $erros = array('error' => $this->upload->display_errors());
      $src_image = '';
    }else {

      // resize image
      $configResize['image_library'] = 'gd2';
      $configResize['source_image'] = './assets/foto_barang/'. $image;
      $configResize['quality'] = '70%';
      $configResize['create_thumb'] = FALSE;
      $configResize['maintain_ratio'] = TRUE;
      $configResize['width'] = 360;
      $configResize['height'] = 200;
      $configResize['new_image'] = './assets/foto_barang/small/';

      $this->load->library('image_lib', $configResize);
      $this->image_lib->resize();

      $data = array('upload_data' => $this->upload->data());
      $src_image = $image;
    }

    $jb = $this->db->get_where('jenis_barang', array('id' => $this->input->post('id_jenis_barang')))->row_array();

    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'id_jenis_barang' => $this->input->post('id_jenis_barang'),
      'nama_jenis_barang' => $jb['nama_jenis_barang'],
      'nama_barang' => $this->input->post('nama_barang'),
      'harga_awal' => str_replace(',', '', $this->input->post('harga_awal')),
      'harga_jual' => str_replace(',', '', $this->input->post('harga_jual')),
      'laba' => str_replace(',', '', $this->input->post('laba')),
      'foto_barang' => $src_image,
      'tanggal' => date('d-m-Y'),
      // 'status_produksi' => $this->input->post('status_produksi')
    );

    $this->db->insert('barang', $data);
  }

  public function edit(){
    $config['upload_path'] = './assets/foto_barang';
    $config['allowed_types'] = 'gif|jpg|png';
    $image = str_replace(' ','_', $_FILES['foto_barang']['name']);
    $config['file_name'] = $image;
    $this->load->library('upload', $config);
    $gambar_dulu = $this->input->post('foto_barang_hidden');

    if (empty($_FILES['foto_barang']['name'])) {
      $src_image = $this->input->post('foto_barang_hidden');
    }else {
      if (!$this->upload->do_upload('foto_barang')) {
          $erros = array('error' => $this->upload->display_errors());
          $src_image = 'no_avatar.jpg';
        }else {
          // resize image
          $configResize['image_library'] = 'gd2';
          $configResize['source_image'] = './assets/foto_barang/'. $image;
          $configResize['quality'] = '70%';
          $configResize['create_thumb'] = FALSE;
          $configResize['maintain_ratio'] = TRUE;
          $configResize['width'] = 360;
          $configResize['height'] = 200;
          $configResize['new_image'] = './assets/foto_barang/small/';

          $this->load->library('image_lib', $configResize);
          $this->image_lib->resize();

          $data = array('upload_data' => $this->upload->data());
          $src_image = $image;

          unlink('assets/foto_barang/'. $gambar_dulu);
          unlink('assets/foto_barang/small/'. $gambar_dulu);
        }
    }

    $jb = $this->db->get_where('jenis_barang', array('id' => $this->input->post('id_jenis_barang')))->row_array();

    $data = array(
      'id_jenis_barang' => $this->input->post('id_jenis_barang'),
      'nama_jenis_barang' => $jb['nama_jenis_barang'],
      'nama_barang' => $this->input->post('nama_barang'),
      'harga_awal' => str_replace(',', '', $this->input->post('harga_awal')),
      'harga_jual' => str_replace(',', '', $this->input->post('harga_jual')),
      'laba' => str_replace(',', '', $this->input->post('laba')),
      'foto_barang' => $src_image,
      // 'status_produksi' => $this->input->post('status_produksi')
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('barang', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('barang');
  }

  public function barang_result($search){
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

    if($search != ""){
			$where = $where." AND (a.nama_barang LIKE '%$search%' OR b.nama_jenis_barang LIKE '%$search%')";
      $limit = "LIMIT 500";
		}else{
			$where = $where;
      $limit = "LIMIT 1000";
		}

    $sql = $this->db->query("SELECT
                            a.*
                            FROM
                            barang a
                            LEFT JOIN jenis_barang b ON a.id_jenis_barang = b.id
                            WHERE $where
                            ORDER BY a.id DESC
                            $limit
                           ");

    return $sql->result_array();
  }

  public function barang_row($id){
    $this->db->select('a.*');
    $this->db->from('barang a');
    $this->db->where('a.id',$id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function barang_detail($id){
    $this->db->select('a.*, b.nama_jenis_barang');
    $this->db->from('barang a');
    $this->db->join('jenis_barang b', 'a.id_jenis_barang = b.id', 'LEFT');
    $this->db->where('a.id',$id);
    $this->db->where('a.id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function get_nama_bahan($search){
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

    if($search != ""){
			$where = $where." AND (b.nama_bahan LIKE '%$search%')";
      $limit = "LIMIT 500";
		}else{
			$where = $where;
      $limit = "LIMIT 1000";
		}

    $sql = $this->db->query("SELECT
                            a.id AS id_stok,
                            b.*
                            FROM
                            stok a
                            LEFT JOIN bahan b ON a.id_bahan = b.id
                            WHERE $where
                            ORDER BY b.id ASC
                            $limit
                           ");

    return $sql->result_array();
  }

  public function simpan_bahan($id_barang, $nama_barang, $value, $nama_bahan, $jumlah){
    $data = array(
      'id_barang' => $id_barang,
      'nama_barang' => $nama_barang,
      'id_bahan' => $value,
      'nama_bahan' => $nama_bahan,
      'jumlah' => $jumlah
    );

    $this->db->insert('kelola_bahan', $data);
  }

  public function klik_bahan($id){
    $this->db->select('a.*');
    $this->db->from('bahan a');
    $this->db->where('a.id', $id);
    $this->db->where('a.id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function produksi_result($id){
    $this->db->select('*');
    $this->db->from('kelola_bahan');
    $this->db->where('id_barang', $id);
    return $this->db->get()->result_array();
  }

  public function hapus_bahan($id){
    $this->db->where('id', $id);
    $this->db->delete('kelola_bahan');
  }

  public function ekspor_barang(){
    $this->db->select('a.*');
    $this->db->from('barang a');
    return $this->db->get()->result_array();
  }

  public function upload_file(){
    $this->load->library('upload'); // Load librari upload

    $config['upload_path'] = './assets/xls/barang';
    $config['allowed_types'] = 'xlsx|xls|jpg|png';
    $config['remove_spaces'] = TRUE;
    $config['overwrite'] = true;

    $this->upload->initialize($config); // Load konfigurasi uploadnya
    if($this->upload->do_upload('file_impor')){ // Lakukan upload dan Cek jika proses upload berhasil
      // Jika berhasil :
      $return = array('result' => 'success', 'file_impor' => $this->upload->data(), 'error' => '');
      return $_FILES['file_impor']['name'];
    }else{
      // Jika gagal :
      $return = array('result' => 'failed', 'file_impor' => '', 'error' => $this->upload->display_errors());
      return $return;
    }
  }

  function import_barang($data){
		$this->db->insert_batch('barang', $data);
	}
}
