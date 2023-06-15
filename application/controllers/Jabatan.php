<?php
class Jabatan extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_jabatan','model');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'kepegawaian';

    $this->load->view('templates/header', $data);
    $this->load->view('jabatan', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'kepegawaian';

    $this->load->view('templates/header', $data);
    $this->load->view('jabatan/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'jabatan';
    $data['row'] = $this->model->jabatan_row($id);

    $this->load->view('templates/header', $data);
    $this->load->view('jabatan/edit', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->model->tambah();
    redirect('jabatan');
  }

  public function edit(){
    $this->model->edit();
    redirect('jabatan');
  }

  public function hapus(){
    $id = $this->input->post('id');
    $data = $this->model->hapus($id);

    echo json_encode($data);
  }

  public function jabatan_result(){
    $search = $this->input->post('search');
    $data = $this->model->jabatan_result($search);

    echo json_encode($data);
  }
  
}
