<?php
class Laba extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_laba','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'keuangan';

    $this->load->view('templates/header', $data);
    $this->load->view('laba');
    $this->load->view('templates/footer');
  }

  public function filter_tanggal(){
    $tanggal_dari = $this->input->post('tanggal_dari');
    $tanggal_sampai = $this->input->post('tanggal_sampai');

    $tahun_dari = substr($tanggal_dari, 0, 4);
    $bulan_dari = substr($tanggal_dari, 5, 2);
    $hari_dari = substr($tanggal_dari, 8, 2);

    $tanggal_dari_fix = $hari_dari.'-'.$bulan_dari.'-'.$tahun_dari;

    $tahun_sampai = substr($tanggal_sampai, 0, 4);
    $bulan_sampai = substr($tanggal_sampai, 5, 2);
    $hari_sampai = substr($tanggal_sampai, 8, 2);

    $tanggal_sampai_fix = $hari_sampai.'-'.$bulan_sampai.'-'.$tahun_sampai;

    $data = $this->model->filter_tanggal($tanggal_dari_fix, $tanggal_sampai_fix);

    $out['res'] = $data;
    $out['tanggal_dari'] = $tanggal_dari_fix;
    $out['tanggal_sampai'] = $tanggal_sampai_fix;

    echo json_encode($out);
  }

  public function tambah_pemasukan(){
    $this->model->tambah_pemasukan();
    redirect('laba');
  }
}
