<?php
class Pengeluaran extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_pengeluaran','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'keuangan';
    $data['pengeluaran'] = $this->model->pengeluaran_result();

    $this->load->view('templates/header', $data);
    $this->load->view('pengeluaran', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'keuangan';
    $data['no_transaksi'] = $this->model->get_no_transaksi();

    $this->load->view('templates/header',$data);
    $this->load->view('pengeluaran/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'keuangan';
    $data['row'] = $this->model->pengeluaran_row($id);

    $this->load->view('templates/header', $data);
    $this->load->view('pengeluaran/edit', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->model->tambah();
    redirect('pengeluaran');
  }

  public function edit(){
    $this->model->edit();
    redirect('pengeluaran');
  }

  public function hapus($id){
    $this->model->hapus($id);
    redirect('pengeluaran');
  }
}
