<?php
class M_user extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function user_result(){
    $this->db->select('*');
    $this->db->from('user');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function user_row($id){
    $this->db->select('*');
    $this->db->from('user');
    $this->db->where('id', $id);
    return $this->db->get()->row_array();
  }

  // public function check_username($username){
  //   $query = $this->db->get_where('user', array('username' => $username));
  //   if (empty($query->row_array())) {
  //     return true;
  //   }else {
  //     return false;
  //   }
  // }

  public function tambah(){
    $created_at = date('d-m-y h:i:s');

    $config['upload_path'] = './assets/ktp_pengguna';
    $config['allowed_types'] = 'gif|jpg|png';
    $image = str_replace(' ','_', $_FILES['ktp']['name']);
    $config['file_name'] = $image;
    $this->load->library('upload', $config);

    if (!$this->upload->do_upload('ktp')) {
        $erros = array('error' => $this->upload->display_errors());
        $src_image = 'no_avatar.jpg';
    }else {
      $data = array('upload_data' => $this->upload->data());
      $src_image = $image;
    }

    $data_level = $this->db->get_where('level', ['id' => $this->input->post('level')])->row_array();

    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_toko' => $this->input->post('nama_toko'),
      'nama_lengkap' => $this->input->post('nama_lengkap'),
      'alamat' => $this->input->post('alamat'),
      'no_telepon' => $this->input->post('no_telepon'),
      'ktp' => $src_image,
      'username' => $this->input->post('username'),
      'password' => md5($this->input->post('password')),
      'id_level' => $this->input->post('level'),
      'level' => $data_level['nama_level'],
      'created_at' => $created_at
    );

    $this->db->insert('user', $data);
  }

  public function tambah_pelanggan($data){
    $this->db->trans_begin();

    $this->db->insert('user', $data);
    $id_user = $this->db->insert_id();

    $data2 = array(
      'id_user' => $id_user
    );
    $this->db->where('id', $id_user);
    $this->db->update('user', $data2);

    $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {

      $this->db->trans_rollback();

      $response = array(
        'result' => "false",
        'message' => "Data gagal disimpan, Silahkan coba kembali"
        );
    } else {
      $this->db->trans_commit();
      $response = array(
        'result' => "true",
        'message' => "Data berhasil disimpan"
        );
    }
    return $response;



  }

  public function edit(){
    $updated_at = date('d-m-y h:i:s');

    if ($this->input->post('password') == '') {
      $password = $this->input->post('password_hidden');
    }else {
      $password = md5($this->input->post('password'));
    }

    $config['upload_path'] = './assets/ktp_pengguna';
    $config['allowed_types'] = 'gif|jpg|png';
    $image = str_replace(' ','_', $_FILES['ktp']['name']);
    $config['file_name'] = $image;
    $this->load->library('upload', $config);

    if (empty($_FILES['ktp']['name'])) {
      $src_image = $this->input->post('ktp_hidden');
    }else {
      if (!$this->upload->do_upload('ktp')) {
          $erros = array('error' => $this->upload->display_errors());
          $src_image = 'no_avatar.jpg';
        }else {
          $data = array('upload_data' => $this->upload->data());
          $src_image = $image;
        }
    }

    $data_level = $this->db->get_where('level', ['id' => $this->input->post('level')])->row_array();

    $data = array(
      'nama_toko' => $this->input->post('nama_toko'),
      'nama_lengkap' => $this->input->post('nama_lengkap'),
      'alamat' => $this->input->post('alamat'),
      'no_telepon' => $this->input->post('no_telepon'),
      'ktp' => $src_image,
      'username' => $this->input->post('username'),
      'password' => $password,
      'id_level' => $this->input->post('level'),
      'level' => $data_level['nama_level'],
      'updated_at' => $updated_at
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('user', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('user');
  }

  public function detail_user($id){
    $this->db->select('*');
    $this->db->from('user');
    $this->db->where('id', $id);
    return $this->db->get()->row_array();
  }

  public function reset_data(){
    $this->db->empty_table('bahan');
    $this->db->empty_table('kelola_bahan');
    $this->db->empty_table('pemasukan');
    $this->db->empty_table('pembayaran');
    $this->db->empty_table('pembayaran_detail');
    $this->db->empty_table('pembayaran_promo_a');
    $this->db->empty_table('pembayaran_promo_b');
    $this->db->empty_table('pembayaran_promo_c');
    $this->db->empty_table('pengeluaran');
    $this->db->empty_table('promo_a');
    $this->db->empty_table('promo_b');
    $this->db->empty_table('promo_c');
    $this->db->empty_table('rekap_kas');
    $this->db->empty_table('rekap_kas_detail');
    $this->db->empty_table('retur');
    $this->db->empty_table('retur_detail');
    $this->db->empty_table('retur_promo_a');
    $this->db->empty_table('retur_promo_b');
    $this->db->empty_table('retur_promo_c');
    $this->db->empty_table('satuan_bahan');
    $this->db->empty_table('stok');
    $this->db->empty_table('stok_keluar');
    $this->db->empty_table('stok_keluar_detail');
    $this->db->empty_table('stok_masuk');
    $this->db->empty_table('stok_masuk_detail');
    $this->db->empty_table('stok_penjualan_detail');
    $this->db->empty_table('stok_retur_detail');
    $this->db->empty_table('struk');
  }
}
