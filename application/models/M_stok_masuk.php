<?php
class M_stok_masuk extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function tambah(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_stok_masuk' => $this->input->post('nama_stok_masuk'),
      'satuan' => $this->input->post('satuan')
    );

    $this->db->insert('stok_masuk', $data);
  }

  public function get_no_transaksi(){
    $this->db->select('RIGHT(stok_masuk.kode_stok_masuk,4) as kode, stok_masuk.id_user', FALSE);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $this->db->order_by('kode_stok_masuk','DESC');
    $this->db->limit(1);
    $query = $this->db->get('stok_masuk');      //cek dulu apakah ada sudah ada kode di tabel.
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
    $kodejadi = "SM-".$tanggal.$kodemax;    // hasilnya ODJ-9921-0001 dst.
    return $kodejadi;
  }

  public function edit(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_stok_masuk' => $this->input->post('nama_stok_masuk'),
      'satuan' => $this->input->post('satuan')
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('stok_masuk', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('stok_masuk');
  }

  public function stok_masuk_result($search){
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

    if($search != ""){
			$where = $where." AND (a.kode_stok_masuk LIKE '%$search%')";
      $limit = "LIMIT 500";
		}else{
			$where = $where;
      $limit = "LIMIT 1000";
		}

    $sql = $this->db->query("SELECT
                            a.*
                            FROM
                            stok_masuk a
                            WHERE $where
                            ORDER BY a.id ASC
                            $limit
                           ");

    return $sql->result_array();
  }

  public function detail_stok_masuk_row($id){
    $this->db->select('a.*');
    $this->db->from('stok_masuk a');
    $this->db->where('a.id',$id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function detail_stok_masuk_result($id){
    $this->db->select('a.*');
    $this->db->from('stok_masuk_detail a');
    $this->db->where('a.id_stok_masuk',$id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function get_nama_bahan($search){
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

    if($search != ""){
			$where = $where." AND (a.nama_bahan LIKE '%$search%')";
      $limit = "LIMIT 500";
		}else{
			$where = $where;
      $limit = "LIMIT 1000";
		}

    $sql = $this->db->query("SELECT
                            a.*
                            FROM
                            bahan a
                            WHERE $where
                            ORDER BY a.id ASC
                            $limit
                           ");

    return $sql->result_array();
  }

  public function klik_bahan($id){
      $this->db->select('a.*');
      $this->db->from('bahan a');
      $this->db->where('a.id', $id);
      $this->db->where('a.id_user', $this->session->userdata('id_user'));
      return $this->db->get()->row_array();
  }

  public function simpan($id_stok_masuk, $value, $id_bahan, $jumlah_beli, $harga_beli, $total_harga_beli){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'id_stok_masuk' => $id_stok_masuk,
      'id_bahan' => $id_bahan,
      'nama_bahan' => $value,
      'jumlah_beli' => str_replace(',', '', $jumlah_beli),
      'harga_beli' => str_replace(',', '', $harga_beli),
      'total_harga_beli' => str_replace(',', '', $total_harga_beli)
    );
    $this->db->insert('stok_masuk_detail', $data);

    $this->db->select('COUNT(*) AS total');
    $this->db->from('stok');
    $this->db->where('id_bahan', $id_bahan);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $row = $this->db->get()->row_array();

    $total = $row['total'];
    if($total == 0){
      $data = array(
        'id_user' => $this->session->userdata('id_user'),
        'id_bahan' => $id_bahan,
        'nama_bahan' => $value,
        'stok' => str_replace(',', '', $jumlah_beli),
      );

      $this->db->insert('stok', $data);
		}else{
      $this->db->select('*');
      $this->db->from('stok');
      $this->db->where('id_bahan', $id_bahan);
      $this->db->where('id_user', $this->session->userdata('id_user'));
      $gon = $this->db->get()->row_array();

      $stok = $gon['stok'];
      $tambah_stok = $stok + str_replace(',', '', $jumlah_beli);

      $data = array(
        'stok' => $tambah_stok,
      );

      $this->db->where('id_bahan', $id_bahan);
      $this->db->update('stok', $data);
		}
  }
}
