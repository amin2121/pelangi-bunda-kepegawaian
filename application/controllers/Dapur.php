<?php
class Dapur extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_dapur','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['active'] = 'penjualan';
    $data['jumlah_data'] = $this->model->jumlah_data();

    $this->load->view('templates/header', $data);
    $this->load->view('dapur', $data);
    $this->load->view('templates/footer');
  }

  public function pesanan_result(){
    $data = $this->model->pesanan_result();

    echo json_encode($data);
  }

  public function detail_pesanan(){
    $id = $this->input->post('id');
    $data = $this->model->detail_pesanan($id);

    echo json_encode($data);
  }

  public function pesanan_selesai(){
    $id = $this->input->post('id');
    $data = $this->model->pesanan_selesai($id);

    echo json_encode($data);
  }
}
