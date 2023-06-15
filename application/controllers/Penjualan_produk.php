<?php
class Penjualan_produk extends CI_Controller{
  function __construct() {
		parent::__construct();
		// $this->load->model('M_laba','model');
    date_default_timezone_set('Asia/Jakarta');
    $this->load->database();
  }

  public function index() {
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'laporan';

    $this->load->view('templates/header', $data);
    $this->load->view('laporan/penjualan_produk');
    $this->load->view('templates/footer');
  }

  public function print_laporan(){

      $tanggal_dari = $this->input->post('dari_tanggal');
      $tahun_dari = substr($tanggal_dari, 0, 4);
      $bulan_dari = substr($tanggal_dari, 5, 2);
      $hari_dari = substr($tanggal_dari, 8, 2);
      $tanggal_dari_fix = $hari_dari.'-'.$bulan_dari.'-'.$tahun_dari;

      $tanggal_sampai = $this->input->post('sampai_tanggal');
      $tahun_sampai = substr($tanggal_sampai, 0, 4);
      $bulan_sampai = substr($tanggal_sampai, 5, 2);
      $hari_sampai = substr($tanggal_sampai, 8, 2);
      $tanggal_sampai_fix = $hari_sampai.'-'.$bulan_sampai.'-'.$tahun_sampai;

      $id_user = $this->session->userdata('id_user');

      $tanggal_sql = $this->db->query("SELECT
                                       SUM(a.jumlah_beli) AS jumlah_jual,
                                       b.nama_barang,
                                       b.harga_jual,
                                       c.nama_jenis_barang,
                                       SUM(a.laba) as laba,
                                       SUM(a.total_laba) as total_laba,
                                       SUM(total_harga_barang) AS total_beli
                                       FROM pembayaran_detail a
                                       LEFT JOIN barang b ON a.id_barang = b.id
                                       LEFT JOIN jenis_barang c ON b.id_jenis_barang = c.id
                                       LEFT JOIN pembayaran e ON a.id_pembayaran = e.id
                                       WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y')
                                       AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y')
                                       AND a.id_user = $id_user
                                       AND e.status = '1'
                                       GROUP BY a.id_barang
                                      ");
      $res_tanggal = $tanggal_sql->result_array();

      $data['judul'] = $tanggal_dari_fix.' - '.$tanggal_sampai_fix;
      $data['result'] = $res_tanggal;
      $data['title'] = 'Hari';

      $this->load->view('laporan/cetak/penjualan_produk', $data);
  }

  public function cek_laporan(){
      $tanggal_dari = $this->input->post('dari_tanggal');
      $tahun_dari = substr($tanggal_dari, 0, 4);
      $bulan_dari = substr($tanggal_dari, 5, 2);
      $hari_dari = substr($tanggal_dari, 8, 2);
      $tanggal_dari_fix = $hari_dari.'-'.$bulan_dari.'-'.$tahun_dari;

      $tanggal_sampai = $this->input->post('sampai_tanggal');
      $tahun_sampai = substr($tanggal_sampai, 0, 4);
      $bulan_sampai = substr($tanggal_sampai, 5, 2);
      $hari_sampai = substr($tanggal_sampai, 8, 2);
      $tanggal_sampai_fix = $hari_sampai.'-'.$bulan_sampai.'-'.$tahun_sampai;

      $id_user = $this->session->userdata('id_user');

      $tanggal_sql = $this->db->query("SELECT
                                       SUM(a.jumlah_beli) AS jumlah_jual,
                                       b.nama_barang,
                                       b.harga_jual,
                                       c.nama_jenis_barang,
                                       SUM(a.laba) as laba,
                                       SUM(a.total_laba) as total_laba,
                                       SUM(total_harga_barang) AS total_beli
                                       FROM pembayaran_detail a
                                       LEFT JOIN barang b ON a.id_barang = b.id
                                       LEFT JOIN jenis_barang c ON b.id_jenis_barang = c.id
                                       LEFT JOIN pembayaran e ON a.id_pembayaran = e.id
                                       WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y')
                                       AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y')
                                       AND a.id_user = $id_user
                                       AND e.status = '1'
                                       GROUP BY a.id_barang
                                      ");
      $res_tanggal = $tanggal_sql->result_array();
      echo json_encode($res_tanggal);
  }
}
