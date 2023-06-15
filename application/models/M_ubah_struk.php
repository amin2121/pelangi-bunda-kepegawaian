<?php
class M_ubah_struk extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function get_no_transaksi(){
    $this->db->select('RIGHT(ubah_struk.invoice,4) as kode, ubah_struk.id_user', FALSE);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $this->db->order_by('invoice','DESC');
    $this->db->limit(1);
    $query = $this->db->get('ubah_struk');      //cek dulu apakah ada sudah ada kode di tabel.
    if($query->num_rows() <> 0){
     //jika kode ternyata sudah ada.
     $data = $query->row();
     $kode = intval($data->kode) + 1;
    }
    else {
     $kode = 1;
    }
    $kodemax = str_pad($kode, 4, "0", STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
    $tanggal = date('dmy');
    $kodejadi = "PMS".$tanggal.$kodemax;    // hasilnya ODJ-9921-0001 dst.
    return $kodejadi;
  }

  public function edit() {
    $config['upload_path'] = './assets/logo_struk';
    $config['allowed_types'] = '*';
    $image = str_replace(' ','_', $_FILES['logo_struk']['name']);
    $config['file_name'] = $image;
    $this->load->library('upload', $config);

    if (empty($_FILES['logo_struk']['name'])) {
      $src_image = $this->input->post('logo_struk_hidden');
    } else {
        if (!$this->upload->do_upload('logo_struk')) {
          $erros = array('error' => $this->upload->display_errors());
          $src_image = 'no_avatar.jpg';
        } else {
          $data = array('upload_data' => $this->upload->data());
          $src_image = $image;
        }
    }

    if ($this->input->post('tampil_facebook') == '0') {
      $tampil_facebook = '0';
      $facebook = '';
    } else {
      $tampil_facebook = '1';
      $facebook = $this->input->post('facebook');
    }

    if ($this->input->post('tampil_instagram') == '0') {
      $tampil_instagram = '0';
      $instagram = '';
    } else {
      $tampil_instagram = '1';
      $instagram = $this->input->post('instagram');
    }

    if ($this->input->post('tampil_twitter') == '0') {
      $tampil_twitter = '0';
      $twitter = '';
    } else {
      $tampil_twitter = '1';
      $twitter = $this->input->post('twitter');
    }

    $data = array(
      'logo_struk' => $src_image,
      'tampil_facebook' => $tampil_facebook,
      'facebook' => $facebook,
      'tampil_instagram' => $tampil_instagram,
      'instagram' => $instagram,
      'tampil_twitter' => $tampil_twitter,
      'nama_cafe' => $this->input->post('nama_cafe'),
      'alamat' => $this->input->post('alamat'),
      'no_telp' => $this->input->post('no_telp'),
      'twitter' => $twitter,
      'keterangan' => $this->input->post('keterangan'),
      'footer' => $this->input->post('footer'),
    );

    $struk_db = $this->db->get('struk')->row_array();
    if(empty($struk_db)) {
      $this->db->insert('struk', $data);
    } else {
      $this->db->update('struk', $data);
    }

  }

  public function ubah_struk_result(){
    $this->db->select('*');
    $this->db->from('ubah_struk');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function ubah_struk_row(){
    $this->db->select('*');
    $this->db->from('struk');
    $this->db->where('id', '1');
    return $this->db->get()->row_array();
  }
}
