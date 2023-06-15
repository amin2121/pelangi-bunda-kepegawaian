<?php
class M_stok extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function satuan_stok_result(){
    $this->db->select('*');
    $this->db->from('satuan_stok');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function tambah(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_stok' => $this->input->post('nama_stok'),
      'satuan' => $this->input->post('satuan')
    );

    $this->db->insert('stok', $data);
  }

  public function edit(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_stok' => $this->input->post('nama_stok'),
      'satuan' => $this->input->post('satuan')
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('stok', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('stok');
  }

  public function stok_result($search){
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
                              a.*,
                              b.satuan,
                              IFNULL(c.jumlah_masuk, '0') AS jumlah_masuk,
                              IFNULL(d.jumlah_keluar, '0') AS jumlah_keluar,
                              IFNULL(e.jumlah_penjualan, '0') AS jumlah_penjualan,
                              IFNULL(f.jumlah_retur, '0') AS jumlah_retur
                              FROM
                              stok a
                              LEFT JOIN bahan b ON a.id_bahan = b.id
                              LEFT JOIN (SELECT a.id_bahan, SUM(a.jumlah_beli) AS jumlah_masuk FROM stok_masuk_detail a GROUP BY a.id_bahan) c ON c.id_bahan = b.id
                              LEFT JOIN (SELECT a.id_bahan, SUM(a.jumlah_keluar) AS jumlah_keluar FROM stok_keluar_detail a GROUP BY a.id_bahan) d ON d.id_bahan = b.id
                              LEFT JOIN (SELECT a.id_bahan, SUM(a.jumlah) AS jumlah_penjualan FROM stok_penjualan_detail a GROUP BY a.id_bahan) e ON e.id_bahan = b.id
                              LEFT JOIN (SELECT a.id_bahan, SUM(a.jumlah) AS jumlah_retur FROM stok_retur_detail a GROUP BY a.id_bahan) f ON f.id_bahan = b.id
                              WHERE $where
                              ORDER BY a.id ASC
                              $limit
                           ");

    return $sql->result_array();
  }

  public function stok_row($id){
    $this->db->select('a.*');
    $this->db->from('stok a');
    $this->db->where('a.id',$id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }
}
