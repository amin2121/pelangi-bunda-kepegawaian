<?php
class Meja extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_meja','model');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['meja'] = $this->model->meja_result();
    $data['active'] = 'barang';

    $this->load->view('templates/header', $data);
    $this->load->view('meja', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['active'] = 'barang';

    $this->load->view('templates/header', $data);
    $this->load->view('meja/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->model->tambah();
    redirect('meja');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['row'] = $this->model->meja_row($id);
    $data['active'] = 'barang';

    $this->load->view('templates/header', $data);
    $this->load->view('meja/edit', $data);
    $this->load->view('templates/footer');
  }

  public function edit(){
    $this->model->edit();
    redirect('meja');
  }

  public function hapus($id){
    $this->model->hapus($id);
    redirect('meja');
  }
}
