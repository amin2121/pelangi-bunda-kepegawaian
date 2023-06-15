<?php
class Pemasukan extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_pemasukan','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'keuangan';
    $data['pemasukan'] = $this->model->pemasukan_result();

    $this->load->view('templates/header', $data);
    $this->load->view('pemasukan', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'keuangan';
    $data['no_transaksi'] = $this->model->get_no_transaksi();

    $this->load->view('templates/header', $data);
    $this->load->view('pemasukan/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'keuangan';
    $data['row'] = $this->model->pemasukan_row($id);

    $this->load->view('templates/header', $data);
    $this->load->view('pemasukan/edit', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->model->tambah();
    redirect('pemasukan');
  }

  public function edit(){
    $this->model->edit();
    redirect('pemasukan');
  }

  public function hapus($id){
    $this->model->hapus($id);
    redirect('pemasukan');
  }
}
