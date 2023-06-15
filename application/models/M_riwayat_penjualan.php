<?php
class M_riwayat_penjualan extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function riwayat_penjualan_result(){
    $id_user = $this->session->userdata('id_user');
    $id_kasir = $this->session->userdata('id_kasir');
    $sql = $this->db->query("SELECT
                               a.*,
                               b.nama_lengkap
                               FROM pembayaran a
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
                             FROM pembayaran a
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
    $this->db->from('pembayaran a');
    $this->db->join('user b', 'a.id_kasir = b.id');
    $this->db->where('status', '1');
    $like;
    $limit;
    return $this->db->get()->result_array();
  }

  public function detail_penjualan($id){
    $this->db->select('a.*');
    $this->db->from('pembayaran_detail a');
    $this->db->where('a.id_pembayaran', $id);
    $this->db->where('a.id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function hapus_penjualan($id, $id_retur){
    $pembayaran = $this->db->get_where('pembayaran', ['id' => $id])->row_array();
    $data_pembayaran = [
      'id_user' => $pembayaran['id_user'],
      'id_kasir' => $pembayaran['id_kasir'],
      'no_transaksi' => $pembayaran['no_transaksi'],
      'nilai_transaksi' => $pembayaran['nilai_transaksi'],
      'dibayar' => $pembayaran['dibayar'],
      'kembali' => $pembayaran['kembali'],
      'jenis_pembayaran' => $pembayaran['jenis_pembayaran'],
      'tanggal' => $pembayaran['tanggal'],
      'waktu' => $pembayaran['waktu'],
      'bulan' => $pembayaran['bulan'],
      'tahun' => $pembayaran['tahun'],
      'status' => $pembayaran['status'],
      'nama_meja' => $pembayaran['nama_meja'],
      'atas_nama' => $pembayaran['atas_nama'],
      'status_dapur' => $pembayaran['status_dapur'],
      'status_diskon' => $pembayaran['status_diskon'],
      'diskon' => $pembayaran['diskon'],
      'tipe_diskon' => $pembayaran['tipe_diskon'],
      'uniqcode' => $pembayaran['uniqcode'],
      'nilai_total_laba' => $pembayaran['nilai_total_laba'],
    ];

    $this->db->insert('pembayaran_hapus', $data_pembayaran);
    $id_pembayaran = $this->db->insert_id();

    $pembayaran_detail = $this->db->get_where('pembayaran_detail', ['id_pembayaran' => $id])->result_array();
    $data_pembayaran_detail = [];
    foreach ($pembayaran_detail as $key => $pd) {
      array_push($data_pembayaran_detail, [
        'id_user' => $pd['id_user'],
        'id_kasir' => $pd['id_kasir'],
        'id_pembayaran_hapus' => $id_pembayaran,
        'id_barang' => $pd['id_barang'],
        'nama_barang' => $pd['nama_barang'],
        'harga_barang' => $pd['harga_barang'],
        'total_harga_barang' => $pd['total_harga_barang'],
        'jumlah_beli' => $pd['jumlah_beli'],
        'tanggal' => $pd['tanggal'],
        'waktu' => $pd['waktu'],
        'uniqcode' => $pd['uniqcode'],
        'laba' => $pd['laba'],
        'total_laba' => $pd['total_laba'],
      ]);
    }

    if(!empty($data_pembayaran_detail)) {
      $this->db->insert_batch('pembayaran_detail_hapus', $data_pembayaran_detail);
    }

    $this->db->where('id', $id);
    $this->db->delete('pembayaran');

    $data_stok_update = [];
    $res = $this->db->get_where('pembayaran_detail', array('id_pembayaran' => $id))->result_array();
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

    $this->db->where('id_pembayaran', $id);
    return $this->db->delete('pembayaran_detail');
  }

  public function cek_produksi($id_retur, $id_barang, $jumlah_beli){
    $row = $this->db->get_where('barang', array('id' => $id_barang))->row_array();

    if ($row['status_produksi'] == '1') {
      $pro = $this->db->get_where('kelola_bahan', array('id_barang' => $id_barang))->result_array();

      foreach ($pro as $p) {
        $id_bahan = $p['id_bahan'];
        $jumlah = str_replace(',', '', $p['jumlah']);
        $hitung = $jumlah * str_replace(',', '', $jumlah_beli);

        $this->db->query("UPDATE stok SET stok = stok + $hitung WHERE id_bahan = '$id_bahan'");

        $data = array(
          'id_retur' => $id_retur,
          'id_user' => $this->session->userdata('id_user'),
          'id_bahan' => $p['id_bahan'],
          'nama_bahan' => $p['nama_bahan'],
          'jumlah' => $hitung,
          'tanggal' => date('d-m-Y'),
          'bulan' => date('m'),
          'tahun' => date('Y')
        );
        $this->db->insert('stok_retur_detail', $data);
      }
    }else {

    }
  }

}
