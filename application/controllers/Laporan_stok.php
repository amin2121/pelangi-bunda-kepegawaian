<?php
class Laporan_stok extends CI_Controller{
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
    $this->load->view('laporan/laporan_stok');
    $this->load->view('templates/footer');
  }

  public function print_laporan(){
      $id_user = $this->session->userdata('id_user');

      $tanggal_sql = $this->db->query("SELECT
                                        a.nama_barang,
                                        a.harga_awal,
                                        a.harga_jual,
                                        a.stok
                                        FROM barang a
                                        WHERE a.id_user = $id_user
                                      ");
      $res_tanggal = $tanggal_sql->result_array();

      $data['result'] = $res_tanggal;

      $this->load->view('laporan/cetak/laporan_stok', $data);

  }

  public function cek_laporan(){
      $id_user = $this->session->userdata('id_user');

      $tanggal_sql = $this->db->query("SELECT
                                        a.nama_barang,
                                        a.harga_awal,
                                        a.harga_jual,
                                        a.stok
                                        FROM barang a
                                        WHERE a.id_user = $id_user
                                      ");
      $res_tanggal = $tanggal_sql->result_array();
      echo json_encode($res_tanggal);
  }
}
