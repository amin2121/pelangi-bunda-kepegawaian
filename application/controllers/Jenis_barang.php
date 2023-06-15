<?php
class Jenis_barang extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_jenis_barang','model');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['jenis_barang'] = $this->model->jenis_barang_result();
    $data['active'] = 'barang';

    $this->load->view('templates/header', $data);
    $this->load->view('jenis_barang', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['active'] = 'barang';

    $this->load->view('templates/header', $data);
    $this->load->view('jenis_barang/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->model->tambah();
    redirect('jenis_barang');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['row'] = $this->model->jenis_barang_row($id);
    $data['active'] = 'barang';

    $this->load->view('templates/header', $data);
    $this->load->view('jenis_barang/edit', $data);
    $this->load->view('templates/footer');
  }

  public function edit(){
    $this->model->edit();
    redirect('jenis_barang');
  }

  public function hapus($id){
    $this->model->hapus($id);
    redirect('jenis_barang');
  }
}
