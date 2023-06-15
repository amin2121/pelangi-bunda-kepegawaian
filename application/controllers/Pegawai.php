<?php
class Pegawai extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_pegawai','model');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'kepegawaian';

    $this->load->view('templates/header', $data);
    $this->load->view('pegawai', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'kepegawaian';
    $data['jabatan'] = $this->model->jabatan_result();

    $this->load->view('templates/header', $data);
    $this->load->view('pegawai/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'kepegawaian';
    $data['row'] = $this->model->pegawai_row($id);
    $data['jabatan'] = $this->model->jabatan_result();

    $this->load->view('templates/header', $data);
    $this->load->view('pegawai/edit', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->model->tambah();
    redirect('pegawai');
  }

  public function edit(){
    $this->model->edit();
    redirect('pegawai');
  }

  public function hapus(){
    $id = $this->input->post('id');
    $data = $this->model->hapus($id);

    echo json_encode($data);
  }

  public function pegawai_result(){
    $search = $this->input->post('search');
    $data = $this->model->pegawai_result($search);

    echo json_encode($data);
  }

}
