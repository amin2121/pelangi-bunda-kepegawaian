<?php
class M_kasir extends CI_Model{
  function __construct() {
    parent::__construct();
		$this->load->database();
  }

  public function simpan_transaksi($id_pembayaran, $value, $harga_barang, $total_harga_barang, $nama_barang, $jumlah_beli){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'id_kasir' => $this->session->userdata('id_kasir'),
      'id_pembayaran' => $id_pembayaran,
      'id_barang' => $value,
      'harga_barang' => $harga_barang,
      'total_harga_barang' => $total_harga_barang,
      'jumlah_beli' => $jumlah_beli,
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
      'nama_barang' => $nama_barang
    );
    $this->db->insert('pembayaran_detail', $data);

    // $this->cek_produksi($value, $jumlah_beli, $id_pembayaran);
  }

  // public function cek_produksi($id_barang, $jumlah_beli, $id_pembayaran){
  //   $row = $this->db->get_where('barang', array('id' => $id_barang))->row_array();

  //   if ($row['status_produksi'] == '1') {
  //     $pro = $this->db->get_where('kelola_bahan', array('id_barang' => $id_barang))->result_array();

  //     foreach ($pro as $p) {
  //       $id_bahan = $p['id_bahan'];
  //       $jumlah = str_replace(',', '', $p['jumlah']);
  //       $hitung = $jumlah * str_replace(',', '', $jumlah_beli);

  //       $this->db->query("UPDATE stok SET stok = stok - $hitung WHERE id_bahan = '$id_bahan'");

  //       $data = array(
  //         'id_pembayaran' => $id_pembayaran,
  //         'id_user' => $this->session->userdata('id_user'),
  //         'id_bahan' => $p['id_bahan'],
  //         'nama_bahan' => $p['nama_bahan'],
  //         'jumlah' => $hitung,
  //         'tanggal' => date('d-m-Y'),
  //         'bulan' => date('m'),
  //         'tahun' => date('Y')
  //       );
  //       $this->db->insert('stok_penjualan_detail', $data);
  //     }
  //   }else {

  //   }
  // }

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

  public function pesanan_result($search) {
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

		if($search != ""){
			$where = $where." AND (a.nama_meja LIKE '%$search%' OR a.atas_nama LIKE '%$search%')";
		}else{
			$where = $where;
		}

    $sql = $this->db->query("SELECT
                            a.*
                            FROM
                            pembayaran a
                            WHERE $where
                            AND status = '0'
                            LIMIT 100
                           ");

    return $sql->result_array();
  }

  public function detail_pesanan($id){
    $id_user = $this->session->userdata('id_user');

    $sql = $this->db->query("SELECT
                             *
                             FROM
                             pembayaran_detail a
                             WHERE a.id_pembayaran = '$id'
                             AND a.id_user = '$id_user'
                            ");
    return $sql->result_array();
  }

  public function edit_pesanan_row($id){
    $this->db->select('*');
    $this->db->from('pembayaran');
    $this->db->where('id', $id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function edit_pesanan_result($id){
    $id_user = $this->session->userdata('id_user');
    $sql = $this->db->query("SELECT
                              a.*,
                              b.stok
                             FROM
                             pembayaran_detail a
                             LEFT JOIN barang b ON a.id_barang = b.id
                             WHERE a.id_pembayaran = '$id'
                             AND a.id_user = '$id_user'
                            ");
    return $sql->result_array();
  }

  public function jenis_barang_result(){
    $this->db->select('*');
    $this->db->from('jenis_barang');
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

  public function hapus_list_pesanan($id, $id_pesanan){
    $id_user = $this->session->userdata('id_user');

    $bar = $this->db->get_where('pembayaran_detail', array('id' => $id_pesanan))->row_array();
    $total_harga_barang = $bar['total_harga_barang'];

    $this->db->query("UPDATE pembayaran SET nilai_transaksi = nilai_transaksi - $total_harga_barang WHERE id = '$id' AND id_user = '$id_user'");

    // update stok barang
    $stok_barang = $this->db->get_where('barang', ['id' => $bar['id_barang']])->row_array();

    $stok_after = $stok_barang['stok'] + $bar['jumlah_beli'];


    $this->db->trans_begin();
    $this->db->where('id', $bar['id_barang']);
    $this->db->update('barang', ['stok' => $stok_after]);

    $this->db->where('id', $id_pesanan);
    $this->db->delete('pembayaran_detail');
    $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {
        $this->db->trans_rollback();
        return false;
    } else {
        $this->db->trans_commit();
        return true;
    }
  }

  public function check_out_insert($id_pembayaran, $id_barang, $harga_barang, $total_harga_barang, $nama_barang, $jumlah_beli){

    $data_pembayaran_detail = [];
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
          'nama_barang' => $nama_barang[$key]
        ]);
    }

    $this->db->trans_begin();
    $this->db->insert_batch('pembayaran_detail', $data_pembayaran_detail);
    $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {
        $this->db->trans_rollback();
        return false;
    } else {
        $this->db->trans_commit();
        return true;
    }

  }

  public function check_out_update($id_pembayaran, $id_barang, $id_pesanan, $harga_barang_ada, $total_harga_barang_ada, $nama_barang_ada, $jumlah_beli_ada, $laba_ada, $total_laba_ada){

    $data_pembayaran_detail = [];
    foreach ($id_barang as $key => $id_b) {
        array_push($data_pembayaran_detail, [
          'id_user' => $this->session->userdata('id_user'),
          'id_kasir' => $this->session->userdata('id_kasir'),
          'id_pembayaran' => $id_pembayaran,
          'id_barang' => $id_b,
          'harga_barang' => $harga_barang_ada[$key],
          'total_harga_barang' => $total_harga_barang_ada[$key],
          'jumlah_beli' => $jumlah_beli_ada[$key],
          'nama_barang' => $nama_barang_ada[$key],
          'laba' => $laba_ada[$key],
          'total_laba' => $total_laba_ada[$key],
          'id' => $id_pesanan[$key],
        ]);
    }

    $this->db->trans_begin();
    $this->db->update_batch('pembayaran_detail', $data_pembayaran_detail, 'id');
    $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {
        $this->db->trans_rollback();
        return false;
    } else {
        $this->db->trans_commit();
        return true;
    }

  }

  public function hapus_pesanan($id){
    $data_pembayaran_detail = $this->db->get_where('pembayaran_detail', ['id_pembayaran' => $id])->result_array();
    $data_update_stok = [];
    foreach ($data_pembayaran_detail as $key => $val) {
      $stok_barang = $this->db->get_where('barang', ['id' => $val['id_barang']])->row_array();
      array_push($data_update_stok, [
        'id' => $val['id_barang'],
        'stok' => $stok_barang['stok'] + $val['jumlah_beli'],
      ]);
    }

    $this->db->trans_begin();

    $this->db->update_batch('barang', $data_update_stok, 'id');

    $this->db->where('id', $id);
    $this->db->delete('pembayaran');

    $this->db->where('id_pembayaran', $id);
    $this->db->delete('pembayaran_detail');

    $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {
        $this->db->trans_rollback();
        return false;
    } else {
        $this->db->trans_commit();
        return true;
    }

  }

  public function cek_pembayaran($id){
    $this->db->select('*');
    $this->db->from('pembayaran');
    $this->db->where('id', $id);
    return $this->db->get()->row_array();
  }
}
