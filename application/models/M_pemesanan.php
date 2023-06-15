<?php
class M_pemesanan extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function get_no_transaksi(){
    $q = $this->db->query("SELECT
                            MAX(RIGHT(no_transaksi,4)) AS kd_max
                            FROM pembayaran
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
			$where = $where." AND (a.nama_barang LIKE '%$search%')";
		}else{
			$where = $where;
		}

    $sql = $this->db->query("SELECT
                            a.*, b.nama_jenis_barang
                            FROM
                            barang a
                            LEFT JOIN jenis_barang b ON a.id_jenis_barang = b.id
                            WHERE $where
                            LIMIT 100
                           ");

    return $sql->result_array();
  }

  public function tambah_pesanan($id){
    $this->db->select('*');
    $this->db->from('barang a');
    $this->db->where('a.id', $id);
    $this->db->where('a.id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function jenis_barang_result(){
    $this->db->select('*');
    $this->db->from('jenis_barang');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function meja_result(){
    $this->db->select('*');
    $this->db->from('meja');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function filter_jenis_barang($id){
    $id_user = $this->session->userdata('id_user');

    $filter_jenis = "";
    if ($id == 'semua') {
      $filter_jenis = "";
    }else {
      $filter_jenis = "AND a.id_jenis_barang = '$id'";
    }

    $sql = $this->db->query("SELECT
                            a.*, b.nama_jenis_barang
                            FROM
                            barang a
                            LEFT JOIN jenis_barang b ON a.id_jenis_barang = b.id
                            WHERE a.id_user = '$id_user'
                            $filter_jenis
                            LIMIT 100
                           ");

    return $sql->result_array();
  }

  public function pesan_transaksi($id_pembayaran, $id_barang, $harga_barang, $total_harga_barang, $nama_barang, $jumlah_beli, $laba, $total_laba_barang){

    $data_transaksi = [];
    $data_update_stok = [];
    foreach ($id_barang as $key => $id_b) {
      array_push($data_transaksi, [
        'id_user' => $this->session->userdata('id_user'),
        'id_kasir' => $this->session->userdata('id_kasir'),
        'id_pembayaran' => $id_pembayaran,
        'id_barang' => $id_b,
        'harga_barang' => $harga_barang[$key],
        'total_harga_barang' => $total_harga_barang[$key],
        'jumlah_beli' => $jumlah_beli[$key],
        'tanggal' => date('d-m-Y'),
        'waktu' => date('H:i:s'),
        'nama_barang' => $nama_barang[$key],
        'laba' => $laba[$key],
        'total_laba' => $total_laba_barang[$key],
      ]);

      // get data stok and set to array
      $stok = $this->db->get_where('barang', ['id' => $id_b])->row_array();
      array_push($data_update_stok, [
        'id' => $id_b,
        'stok' => (int) $stok['stok'] - $jumlah_beli[$key]
      ]);
    }

    $this->db->trans_begin();
    $this->db->insert_batch('pembayaran_detail', $data_transaksi);
    $this->db->update_batch('barang', $data_update_stok, 'id');
    $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {
        $this->db->trans_rollback();
        return false;
    } else {
        $this->db->trans_commit();
        return true;
    }

  }

  public function simpan_transaksi($id_pembayaran, $id_barang, $harga_barang, $total_harga_barang, $nama_barang, $jumlah_beli, $laba, $total_laba_barang){

    $data_pembayaran_detail = [];
    $data_update_stok = [];
    foreach ($id_barang as $key => $id_b) {
      array_push($data_pembayaran_detail, [
        'id_user' => $this->session->userdata('id_user'),
        'id_kasir' => $this->session->userdata('id_kasir'),
        'id_pembayaran' => $id_pembayaran,
        'id_barang' => $id_b,
        'harga_barang' => $harga_barang[$key],
        'total_harga_barang' => $total_harga_barang[$key],
        'jumlah_beli' => $jumlah_beli[$key],
        'tanggal' => date('d-m-Y'),
        'waktu' => date('H:i:s'),
        'nama_barang' => $nama_barang[$key],
        'laba' => $laba[$key],
        'total_laba' => $total_laba_barang[$key]
      ]);
      
      // $this->cek_produksi($id_b, $jumlah_beli[$key], $id_pembayaran);

      // get data stok and set to array
      $stok = $this->db->get_where('barang', ['id' => $id_b])->row_array();
      array_push($data_update_stok, [
        'id' => $id_b,
        'stok' => (int) $stok['stok'] - $jumlah_beli[$key]
      ]);
    }

    $this->db->trans_begin();
    $this->db->insert_batch('pembayaran_detail', $data_pembayaran_detail);
    $this->db->update_batch('barang', $data_update_stok, 'id');
    $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {
        $this->db->trans_rollback();
        return false;
    } else {
        $this->db->trans_commit();
        return true;
    }
  }

}
