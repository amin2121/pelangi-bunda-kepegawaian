<?php
class Stok_masuk extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_stok_masuk','model');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['active'] = 'inventori';

    $this->load->view('templates/header', $data);
    $this->load->view('stok_masuk', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'inventori';
    // $data['kode_stok_masuk'] = $this->model->get_kode_stok_masuk();

    $this->load->view('templates/header', $data);
    $this->load->view('stok_masuk/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function view_detail($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'inventori';
    $data['row'] = $this->model->detail_stok_masuk_row($id);
    $data['result'] = $this->model->detail_stok_masuk_result($id);

    $this->load->view('templates/header', $data);
    $this->load->view('stok_masuk/detail', $data);
    $this->load->view('templates/footer');
  }


  public function tambah(){
    $this->model->tambah();
    redirect('stok_masuk');
  }

  public function stok_masuk_result(){
    $search = $this->input->post('search');

    $data = $this->model->stok_masuk_result($search);

    echo json_encode($data);
  }

  public function get_nama_bahan(){
    $search = $this->input->post('search');

    $data = $this->model->get_nama_bahan($search);

    echo json_encode($data);
  }

  public function klik_bahan(){
    $id = $this->input->post('id');
    $data = $this->model->klik_bahan($id);

    echo json_encode($data);
  }

  public function simpan(){
    $kode_stok_masuk = $this->model->get_no_transaksi();
    $catatan = $this->input->post('catatan');
    $total_semua = $this->input->post('total_semua');

    $tanggal = $this->input->post('tanggal');
    $tahun_dari = substr($tanggal, 0, 4);
    $bulan_dari = substr($tanggal, 5, 2);
    $hari_dari = substr($tanggal, 8, 2);
    $tanggal_fix = $hari_dari.'-'.$bulan_dari.'-'.$tahun_dari;

    $id_bahan = $this->input->post('id_bahan');
    $nama_bahan = $this->input->post('nama_bahan');
    $jumlah_beli = $this->input->post('jumlah_beli');
    $harga_beli = $this->input->post('harga_beli');
    $total_harga_beli = $this->input->post('total_harga_beli');

    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'kode_stok_masuk' => $kode_stok_masuk,
      'catatan' => $catatan,
      'total_semua' => str_replace(',', '', $total_semua),
      'tanggal' => $tanggal_fix,
      'bulan' => $bulan_dari,
      'tahun' => $tahun_dari
    );
    $this->db->insert('stok_masuk', $data);
    $id_stok_masuk = $this->db->insert_id();

    foreach ($nama_bahan as $key => $value) {
      $this->model->simpan($id_stok_masuk, $value, $id_bahan[$key], $jumlah_beli[$key], $harga_beli[$key], $total_harga_beli[$key]);
    }

    echo "1";
  }
}
