<?php
class Laporan_pengeluaran_per_supplier extends CI_Controller{
  function __construct(){
		parent::__construct();
		// $this->load->model('M_laba','model');
    // $this->load->library('fpdf/HTML2PDF');
    date_default_timezone_set('Asia/Jakarta');
    $this->load->database();
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'laporan';

    $this->load->view('templates/header', $data);
    $this->load->view('laporan/laporan_pengeluaran_per_supplier');
    $this->load->view('templates/footer');
  }

  public function print_laporan(){

    $filter = $this->input->post('filter');
    if ($filter == 'hari') {
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
                                       b.id,
                                       b.nama_supplier,
                                       COUNT(a.id) AS jumlah
                                       FROM faktur a
                                       LEFT JOIN supplier b ON a.id_supplier = b.id
                                       WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y')
                                       AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y')
                                       AND a.status_bayar = '1'
                                       AND a.id_user = $id_user
                                       GROUP BY b.id
                                      ");
      $res_tanggal = $tanggal_sql->result_array();

      $data['judul'] = $tanggal_dari_fix.' - '.$tanggal_sampai_fix;
      $data['result'] = $res_tanggal;
      $data['title'] = 'Hari';
      $data['settitle'] = 'Laporan Pengeluaran';
      $data['filename'] = date('dmy').'_laporan_pengeluaran_per_supplier';

      $data['tanggal_dari'] = $tanggal_dari_fix;
      $data['tanggal_sampai'] = $tanggal_sampai_fix;

      $this->load->view('laporan/cetak/laporan_pengeluaran_per_supplier', $data);

    }elseif ($filter == 'bulan') {
      $bulan = $this->input->post('filter_bulan');
      $tahun = $this->input->post('filter_tahun_bulan');
      $id_user = $this->session->userdata('id_user');

      $sql_bulan = $this->db->query("SELECT
                                      b.id,
                                      b.nama_supplier,
                                      COUNT(a.id) AS jumlah
                                      FROM faktur a
                                      LEFT JOIN supplier b ON a.id_supplier = b.id
                                      WHERE a.id_user = $id_user
                                      AND a.bulan = $bulan
                                      AND a.tahun = $tahun
                                      AND a.status_bayar = '1'
                                      GROUP BY b.id
                                      ");
      // $this->db->group_by('bulan');
      $res_bulan = $sql_bulan->result_array();

      if ($bulan == '01') {
        $nama_bulan = 'Januari';
      }elseif ($bulan == '02') {
        $nama_bulan = 'Februari';
      }elseif ($bulan == '03') {
        $nama_bulan = 'Maret';
      }elseif ($bulan == '04') {
        $nama_bulan = 'April';
      }elseif ($bulan == '05') {
        $nama_bulan = 'Mei';
      }elseif ($bulan == '06') {
        $nama_bulan = 'Juni';
      }elseif ($bulan == '07') {
        $nama_bulan = 'Juli';
      }elseif ($bulan == '08') {
        $nama_bulan = 'Agustus';
      }elseif ($bulan == '09') {
        $nama_bulan = 'September';
      }elseif ($bulan == '10') {
        $nama_bulan = 'Oktober';
      }elseif ($bulan == '11') {
        $nama_bulan = 'November';
      }elseif ($bulan == '12') {
        $nama_bulan = 'Desember';
      }

      $data['judul'] = $nama_bulan.' '.$tahun;
      $data['result'] = $res_bulan;
      $data['title'] = 'Bulan';
      $data['settitle'] = 'Laporan Pengeluaran';
      $data['filename'] = date('dmy').'_laporan_pengeluaran_per_supplier';

      $data['bulan'] = $this->input->post('filter_bulan');
      $data['tahun'] = date('Y');
      $this->load->view('laporan/cetak/laporan_pengeluaran_per_supplier', $data);

    }elseif ($filter == 'tahun') {

      $tahun = $this->input->post('filter_tahun');
      $id_user = $this->session->userdata('id_user');

      $sql_tahun = $this->db->query("SELECT
                                      b.id,
                                      b.nama_supplier,
                                      COUNT(a.id) AS jumlah
                                      FROM faktur a
                                      LEFT JOIN supplier b ON a.id_supplier = b.id
                                      WHERE a.id_user = $id_user
                                      AND a.tahun = $tahun
                                      AND a.status_bayar = '1'
                                      GROUP BY b.id
                                    ");
      $res_tahun = $sql_tahun->result_array();

      $data['judul'] = $tahun;
      $data['result'] = $res_tahun;
      $data['title'] = 'Tahun';
      $data['settitle'] = 'Laporan Pengeluaran';
      $data['filename'] = date('dmy').'_laporan_pengeluaran_per_supplier';

      $data['tahun'] = $this->input->post('filter_tahun');
      $this->load->view('laporan/cetak/laporan_pengeluaran_per_supplier', $data);
    }

  }
}
