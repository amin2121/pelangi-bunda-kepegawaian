<?php
class Ubah_struk extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_ubah_struk','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'user';
    $data['row'] = $this->db->get('struk')->row_array();

    $this->load->view('templates/header', $data);
    $this->load->view('ubah_struk', $data);
    $this->load->view('templates/footer');
  }

  public function edit(){
    $this->model->edit();
    redirect('ubah_struk');
  }
}
