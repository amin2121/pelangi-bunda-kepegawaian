<?php
class M_riwayat_hapus_penjualan extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function riwayat_hapus_penjualan_result(){
    $id_user = $this->session->userdata('id_user');
    $id_kasir = $this->session->userdata('id_kasir');
    $sql = $this->db->query("SELECT
                               a.*,
                               b.nama_lengkap
                               FROM pembayaran_hapus a
                               LEFT JOIN user b ON a.id_kasir = b.id
                               WHERE status = '1'
                               ORDER BY STR_TO_DATE(a.tanggal, '%d-%m-%Y') DESC,
                               STR_TO_DATE(a.waktu, '%H:%i:%s') DESC
                               LIMIT 1000
                              ");

    return $sql->result_array();
  }

  public function filter_tanggal($tanggal_dari, $tanggal_sampai){
    $tahun_dari = substr($tanggal_dari, 0, 4);
    $bulan_dari = substr($tanggal_dari, 5, 2);
    $hari_dari = substr($tanggal_dari, 8, 2);

    $tanggal_dari_fix = $hari_dari.'-'.$bulan_dari.'-'.$tahun_dari;

    $tahun_sampai = substr($tanggal_sampai, 0, 4);
    $bulan_sampai = substr($tanggal_sampai, 5, 2);
    $hari_sampai = substr($tanggal_sampai, 8, 2);

    $tanggal_sampai_fix = $hari_sampai.'-'.$bulan_sampai.'-'.$tahun_sampai;

    $id_user = $this->session->userdata('id_user');
    $id_kasir = $this->session->userdata('id_kasir');

    $sql = $this->db->query("SELECT
                             a.*,
                             b.nama_lengkap
                             FROM pembayaran_hapus a
                             LEFT JOIN user b ON a.id_kasir = b.id
                             WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y')
														 AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y')
                             AND status = '1'
                             ORDER BY STR_TO_DATE(a.tanggal, '%d-%m-%Y') DESC,
                             STR_TO_DATE(a.waktu, '%H:%i:%s') DESC
                            ");

    return $sql->result_array();
  }

  public function filter_no_transaksi($search){
    if($search != ""){
      $like = $this->db->like('a.no_transaksi', $search);
      $limit = $this->db->limit('500');
    }else{
      $like = "";
      $limit = $this->db->limit('1000');
    }

    $this->db->select('a.*, b.nama_lengkap');
    $this->db->from('pembayaran_hapus a');
    $this->db->join('user b', 'a.id_kasir = b.id');
    $this->db->where('status', '1');
    $like;
    $limit;
    return $this->db->get()->result_array();
  }

  public function detail_hapus_penjualan($id){
    $this->db->select('a.*');
    $this->db->from('pembayaran_detail_hapus a');
    $this->db->where('a.id_pembayaran_hapus', $id);
    return $this->db->get()->result_array();
  }

  public function hapus_penjualan($id, $id_retur){
    $this->db->where('id', $id);
    $this->db->delete('pembayaran_hapus');

    $data_stok_update = [];
    $res = $this->db->get_where('pembayaran_detail_hapus', array('id_pembayaran_hapus' => $id))->result_array();
    foreach ($res as $r) {
      $id_barang = $r['id_barang'];
      $jumlah_beli = $r['jumlah_beli'];

      // set data update stok
      $data_stok = $this->db->get_where('barang', ['id' => $id_barang])->row_array();
      $stok_barang = $data_stok['stok'];

      array_push($data_stok_update, [
        'stok' => (int) $stok_barang + $r['jumlah_beli'],
        'id' => $id_barang
      ]);
      // $this->cek_produksi($id_retur, $id_barang, $jumlah_beli);
    }

    if(!empty($data_stok_update)) {
      $this->db->update_batch('barang', $data_stok_update, 'id');
    }

    $this->db->where('id_pembayaran_hapus', $id);
    return $this->db->delete('pembayaran_detail_hapus');
  }

}
