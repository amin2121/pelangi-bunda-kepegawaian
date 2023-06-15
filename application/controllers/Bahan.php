<?php
class Bahan extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_bahan','model');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['active'] = 'inventori';

    $this->load->view('templates/header', $data);
    $this->load->view('bahan', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }
    
    $data['active'] = 'inventori';
    // $data['kode_bahan'] = $this->model->get_kode_bahan();
    $data['satuan_bahan'] = $this->model->satuan_bahan_result();

    $this->load->view('templates/header', $data);
    $this->load->view('bahan/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'inventori';
    $data['row'] = $this->model->bahan_row($id);
    $data['satuan_bahan'] = $this->model->satuan_bahan_result();

    $this->load->view('templates/header', $data);
    $this->load->view('bahan/edit', $data);
    $this->load->view('templates/footer');
  }

  public function view_stok($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'inventori';
    $data['id_bahan'] = $id;
    $data['row'] = $this->model->cek_stok($id);

    $this->load->view('templates/header', $data);
    $this->load->view('bahan/stok', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->model->tambah();
    redirect('bahan');
  }

  public function edit(){
    $this->model->edit();
    redirect('bahan');
  }

  public function hapus(){
    $id = $this->input->post('id');
    $data = $this->model->hapus($id);

    echo json_encode($data);
  }

  public function tambah_stok(){
    $this->model->tambah_stok();
    redirect('bahan');
  }

  public function bahan_result(){
    $search = $this->input->post('search');

    $data = $this->model->bahan_result($search);

    echo json_encode($data);
  }
}
