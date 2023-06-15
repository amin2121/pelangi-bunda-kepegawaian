<?php
class Promo_otomatis extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_promo_otomatis','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'user';
    $data['promo'] = $this->model->promo_otomatis_result();

    $this->load->view('templates/header', $data);
    $this->load->view('promo_otomatis', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'user';
    $data['no_transaksi'] = $this->model->get_no_transaksi();

    $this->load->view('templates/header', $data);
    $this->load->view('promo_otomatis/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah_promo_a(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'user';
    $data['produk'] = $this->model->produk_result();
    $data['kategori'] = $this->model->kategori_result();

    $this->load->view('templates/header', $data);
    $this->load->view('promo_otomatis/tambah_promo_a', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah_promo_b(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'user';
    $data['produk'] = $this->model->produk_result();
    $data['kategori'] = $this->model->kategori_result();

    $this->load->view('templates/header', $data);
    $this->load->view('promo_otomatis/tambah_promo_b', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah_promo_c(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'user';
    $data['produk'] = $this->model->produk_result();
    $data['kategori'] = $this->model->kategori_result();

    $this->load->view('templates/header', $data);
    $this->load->view('promo_otomatis/tambah_promo_c', $data);
    $this->load->view('templates/footer');
  }

  public function view_edit($id, $jenis_promo){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'user';
    $data['produk'] = $this->model->produk_result();
    $data['kategori'] = $this->model->kategori_result();

    if ($jenis_promo == 'promo_a') {
      $data['row'] = $this->model->get_row_promo($id, $jenis_promo);

      $this->load->view('templates/header', $data);
      $this->load->view('promo_otomatis/edit_promo_a', $data);
      $this->load->view('templates/footer');
    }elseif ($jenis_promo == 'promo_b') {
      $data['row'] = $this->model->get_row_promo($id, $jenis_promo);

      $this->load->view('templates/header', $data);
      $this->load->view('promo_otomatis/edit_promo_b', $data);
      $this->load->view('templates/footer');
    }elseif ($jenis_promo == 'promo_c') {
      $data['row'] = $this->model->get_row_promo($id, $jenis_promo);

      $this->load->view('templates/header', $data);
      $this->load->view('promo_otomatis/edit_promo_c', $data);
      $this->load->view('templates/footer');
    }
  }

  public function tambah_promo_a(){
    $this->model->tambah_promo_a();
    redirect('promo_otomatis');
  }

  public function tambah_promo_b(){
    $this->model->tambah_promo_b();
    redirect('promo_otomatis');
  }

  public function tambah_promo_c(){
    $this->model->tambah_promo_c();
    redirect('promo_otomatis');
  }

  public function edit_promo_a(){
    $this->model->edit_promo_a();
    redirect('promo_otomatis');
  }

  public function edit_promo_b(){
    $this->model->edit_promo_b();
    redirect('promo_otomatis');
  }

  public function edit_promo_c(){
    $this->model->edit_promo_c();
    redirect('promo_otomatis');
  }

  public function hapus($id, $promo){
    $this->model->hapus($id, $promo);
    redirect('promo_otomatis');
  }

  public function aktifkan($id, $promo){
    $this->model->aktifkan($id, $promo);
    redirect('promo_otomatis');
  }

  public function non_aktifkan($id, $promo){
    $this->model->non_aktifkan($id, $promo);
    redirect('promo_otomatis');
  }
}
