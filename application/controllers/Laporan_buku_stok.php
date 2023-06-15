<?php
class Laporan_buku_stok extends CI_Controller{
  function __construct(){
		parent::__construct();
		// $this->load->model('M_laba','model');
    date_default_timezone_set('Asia/Jakarta');
    $this->load->database();
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'laporan';

    $this->load->view('templates/header', $data);
    $this->load->view('laporan/laporan_buku_stok');
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
                                        a.id as id_barang,
                                        a.nama_barang,
                                        a.stok,
                                        a.harga_jual
                                        FROM barang a
                                        WHERE a.id_user = $id_user
                                      ");
      $res_tanggal = $tanggal_sql->result_array();

      $data['judul'] = $tanggal_dari_fix.' - '.$tanggal_sampai_fix;
      $data['tanggal_dari'] = $tanggal_dari_fix;
      $data['tanggal_sampai'] = $tanggal_sampai_fix;
      $data['result'] = $res_tanggal;
      $data['title'] = 'Hari';

      $this->load->view('laporan/cetak/laporan_buku_stok', $data);
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
                                        LEFT JOIN (SELECT a.id_bahan, SUM(a.jumlah) AS jumlah_penjualan FROM stok_penjualan_detail a WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y') AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y') GROUP BY a.id_bahan) e ON e.id_bahan = b.id
                                        LEFT JOIN (SELECT a.id_bahan, SUM(a.jumlah) AS jumlah_retur FROM stok_retur_detail a WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y') AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y') GROUP BY a.id_bahan) f ON f.id_bahan = b.id
                                        ORDER BY a.id ASC
                                      ");
      $res_tanggal = $tanggal_sql->result_array();
      echo json_encode($res_tanggal);
    }
}
