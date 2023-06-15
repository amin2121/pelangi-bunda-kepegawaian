<?php
class M_stok_keluar extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function tambah(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_stok_keluar' => $this->input->post('nama_stok_keluar'),
      'satuan' => $this->input->post('satuan')
    );

    $this->db->insert('stok_keluar', $data);
  }

  public function get_no_transaksi(){
    $this->db->select('RIGHT(stok_keluar.kode_stok_keluar,4) as kode, stok_keluar.id_user', FALSE);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $this->db->order_by('kode_stok_keluar','DESC');
    $this->db->limit(1);
    $query = $this->db->get('stok_keluar');      //cek dulu apakah ada sudah ada kode di tabel.
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
      'nama_stok_keluar' => $this->input->post('nama_stok_keluar'),
      'satuan' => $this->input->post('satuan')
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('stok_keluar', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('stok_keluar');
  }

  public function stok_keluar_result($search){
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

    if($search != ""){
			$where = $where." AND (a.kode_stok_keluar LIKE '%$search%')";
      $limit = "LIMIT 500";
		}else{
			$where = $where;
      $limit = "LIMIT 1000";
		}

    $sql = $this->db->query("SELECT
                            a.*
                            FROM
                            stok_keluar a
                            WHERE $where
                            ORDER BY a.id ASC
                            $limit
                           ");

    return $sql->result_array();
  }

  public function detail_stok_keluar_row($id){
    $this->db->select('a.*');
    $this->db->from('stok_keluar a');
    $this->db->where('a.id',$id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function detail_stok_keluar_result($id){
    $this->db->select('a.*');
    $this->db->from('stok_keluar_detail a');
    $this->db->where('a.id_stok_keluar',$id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
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

  public function klik_bahan($id){
      $this->db->select('a.*');
      $this->db->from('bahan a');
      $this->db->where('a.id', $id);
      $this->db->where('a.id_user', $this->session->userdata('id_user'));
      return $this->db->get()->row_array();
  }

  public function simpan($id_stok_keluar, $value, $id_bahan, $jumlah_keluar){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'id_stok_keluar' => $id_stok_keluar,
      'id_bahan' => $id_bahan,
      'nama_bahan' => $value,
      'jumlah_keluar' => str_replace(',', '', $jumlah_keluar)
    );
    $this->db->insert('stok_keluar_detail', $data);

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
        'stok' => str_replace(',', '', $jumlah_keluar),
      );

      $this->db->insert('stok', $data);
		}else{
      $this->db->select('*');
      $this->db->from('stok');
      $this->db->where('id_bahan', $id_bahan);
      $this->db->where('id_user', $this->session->userdata('id_user'));
      $gon = $this->db->get()->row_array();

      $stok = $gon['stok'];
      $tambah_stok = $stok - str_replace(',', '', $jumlah_keluar);

      $data = array(
        'stok' => $tambah_stok,
      );

      $this->db->where('id_bahan', $id_bahan);
      $this->db->update('stok', $data);
		}
  }
}
