<?php
class Stok extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_stok','model');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['active'] = 'inventori';

    $this->load->view('templates/header', $data);
    $this->load->view('stok', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'inventori';
    // $data['kode_stok'] = $this->model->get_kode_stok();
    $data['satuan_stok'] = $this->model->satuan_stok_result();

    $this->load->view('templates/header', $data);
    $this->load->view('stok/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'inventori';
    $data['row'] = $this->model->stok_row($id);
    $data['satuan_stok'] = $this->model->satuan_stok_result();

    $this->load->view('templates/header', $data);
    $this->load->view('stok/edit', $data);
    $this->load->view('templates/footer');
  }

  public function view_stok($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'inventori';
    $data['id_stok'] = $id;
    $data['row'] = $this->model->cek_stok($id);

    $this->load->view('templates/header', $data);
    $this->load->view('stok/stok', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->model->tambah();
    redirect('stok');
  }

  public function edit(){
    $this->model->edit();
    redirect('stok');
  }

  public function hapus(){
    $id = $this->input->post('id');
    $data = $this->model->hapus($id);

    echo json_encode($data);
  }

  public function tambah_stok(){
    $this->model->tambah_stok();
    redirect('stok');
  }

  public function stok_result(){
    $search = $this->input->post('search');

    $data = $this->model->stok_result($search);

    echo json_encode($data);
  }
}
