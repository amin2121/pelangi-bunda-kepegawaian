<?php
class Riwayat_retur extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_riwayat_retur','model');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'riwayat';
    $this->load->view('templates/header', $data);
    $this->load->view('riwayat_retur');
    $this->load->view('templates/footer');
  }

  public function riwayat_retur_result(){
    $data = $this->model->riwayat_retur_result();

    echo json_encode($data);
  }

  public function filter_tanggal(){
    $tanggal_dari = $this->input->post('tanggal_dari');
    $tanggal_sampai = $this->input->post('tanggal_sampai');
    $data = $this->model->filter_tanggal($tanggal_dari, $tanggal_sampai);

    echo json_encode($data);
  }

  public function filter_no_transaksi(){
    $search = $this->input->post('search');
    $data = $this->model->filter_no_transaksi($search);

    echo json_encode($data);
  }

  public function detail_penjualan(){
    $id = $this->input->post('id');
    $data = $this->model->detail_penjualan($id);

    echo json_encode($data);
  }
  
}
