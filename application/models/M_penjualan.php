<?php
class M_penjualan extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }  

  public function get_no_transaksi(){
    $q = $this->db->query("SELECT
                            MAX(RIGHT(no_transaksi,4)) AS kd_max
                            FROM penjualan
                            WHERE tanggal = DATE_FORMAT(NOW(),'%d-%m-%Y')
                            ");
    $kd = "";
    if($q->num_rows()>0){
        foreach($q->result() as $k){
            $tmp = ((int)$k->kd_max)+1;
            $kd = sprintf("%04s", $tmp);
        }
    }else{
        $kd = "0001";
    }
    return 'TRN'.date('dmy').$kd;
  }

  public function data_barang_result($search){
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

		if($search != ""){
			$where = $where." AND (b.kode_barang LIKE '%$search%' OR b.nama_barang LIKE '%$search%')";
		}else{
			$where = $where;
		}

    $sql = $this->db->query("SELECT
                            a.*, b.kode_barang, b.nama_barang
                            FROM
                            gudang a
                            JOIN barang b ON a.id_barang = b.id
                            WHERE $where
                            LIMIT 100
                           ");

    return $sql->result_array();

    //  if($search != ""){
    //    $where = $this->db->where('a.id_user', $this->session->userdata('id_user'));
 		// 	$like = $this->db->like('b.nama_barang', $search);
    //    $like2 = $this->db->or_like('b.kode_barang', $search);
 		// }else{
    //    $where = $this->db->where('a.id_user', $this->session->userdata('id_user'));
 		// 	$like = "";
    //    $like2 = "";
 		// }

    // $this->db->select('a.*, b.nama_barang, b.kode_barang');
    // $this->db->from('gudang a');
    // $this->db->join('barang b', 'a.id_barang = b.id');
    // $where;
    // $like;
    // $like2;
    // return $this->db->get()->result_array();
  }

  public function tambah_keranjang($id){
    $this->db->select('a.*, b.nama_barang, b.kode_barang');
    $this->db->from('gudang a');
    $this->db->join('barang b', 'a.id_barang = b.id');
    $this->db->where('a.id', $id);
    $this->db->where('a.id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function tambah_keranjang_enter($search){
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

		if($search != ""){
			$where = $where." AND (b.kode_barang LIKE '%$search%' OR b.nama_barang LIKE '%$search%')";
		}else{
			$where = $where;
		}

    $sql = $this->db->query("SELECT
                      *
                      FROM
                      gudang a
                      JOIN barang b ON a.id_barang = b.id
                      WHERE $where
                     ");

    return $sql->row_array();
  }

  public function simpan_transaksi($id_penjualan, $value, $harga_jual, $total_harga_beli, $laba, $total_laba, $jumlah_beli, $status_diskon, $diskon, $status_grosir, $kode_barang, $nama_barang){

    if ($status_grosir == 1) {
      $stat_dis = '0';
      $dis = '0';
    }else {
      $stat_dis = $status_diskon;
      $dis = $diskon;
    }


    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'id_kasir' => $this->session->userdata('id_kasir'),
      'id_penjualan' => $id_penjualan,
      'id_barang' => $value,
      'harga_jual' => $harga_jual,
      'total_harga_beli' => $total_harga_beli,
      'laba' => $laba,
      'total_laba' => $total_laba,
      'jumlah_beli' => $jumlah_beli,
      'status_diskon' => $stat_dis,
      'diskon' => $dis,
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
      'kode_barang' => $kode_barang,
      'nama_barang' => $nama_barang
    );
    $this->db->insert('penjualan_detail', $data);

    $id_user = $this->session->userdata('id_user');
    $this->db->query("UPDATE gudang SET stok = stok - $jumlah_beli WHERE id_barang = '$value' AND id_user = '$id_user'");
  }

  public function data_grosir_result($id){
    $this->db->select('*');
    $this->db->from('grosir');
    $this->db->where('id_gudang', $id);
    return $this->db->get()->result_array();
  }

  public function klik_grosir($id){
    $this->db->select('*');
    $this->db->from('grosir');
    $this->db->where('id', $id);
    return $this->db->get()->row_array();
  }
}
