<?php
class Penjualan extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_penjualan','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'penjualan';
    $data['no_transaksi'] = $this->model->get_no_transaksi();

    $this->load->view('templates/header', $data);
    $this->load->view('penjualan', $data);
    $this->load->view('templates/footer');
  }

  public function data_barang_result(){
    $search = $this->input->post('search');
    $data = $this->model->data_barang_result($search);

    echo json_encode($data);
  }

  public function tambah_keranjang(){
    $id = $this->input->post('id');
    $data = $this->model->tambah_keranjang($id);

    echo json_encode($data);
  }

  public function tambah_keranjang_enter(){
    $search = $this->input->post('search');
    $data = $this->model->tambah_keranjang_enter($search);

    echo json_encode($data);
  }

  public function simpan_transaksi(){
    $id_barang = $this->input->post('id_barang');
    $harga_jual = $this->input->post('harga_jual');
    $total_harga_beli = $this->input->post('total_harga_beli');
    $laba = $this->input->post('laba');
    $total_laba = $this->input->post('total_laba');
    $jumlah_beli = $this->input->post('jumlah_beli');
    $status_diskon = $this->input->post('status_diskon');
    $diskon = $this->input->post('diskon');
    $status_grosir = $this->input->post('status_grosir');
    $kode_barang = $this->input->post('kode_barang');
    $nama_barang = $this->input->post('nama_barang');

    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'id_kasir' => $this->session->userdata('id_kasir'),
      'no_transaksi' => $this->input->post('no_transaksi'),
      'nilai_transaksi' => str_replace(',', '', $this->input->post('nilai_transaksi')),
      'nilai_laba' => str_replace(',', '', $this->input->post('nilai_laba')),
      'dibayar' => str_replace(',', '', $this->input->post('dibayar')),
      'kembali' => str_replace(',', '', $this->input->post('kembali')),
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
      'bulan' => date('m'),
      'tahun' => date('Y')
    );

    $this->db->insert('penjualan', $data);
    $id_penjualan = $this->db->insert_id();

    foreach ($id_barang as $key => $value) {
      $this->model->simpan_transaksi($id_penjualan, $value, $harga_jual[$key], $total_harga_beli[$key], $laba[$key], $total_laba[$key], $jumlah_beli[$key], $status_diskon[$key], $diskon[$key], $status_grosir[$key], $kode_barang[$key], $nama_barang[$key]);
    }

    $data['id_penjualan'] = $id_penjualan;
    echo json_encode($data);
  }

  public function cetak_struk($id){
    $this->db->select('*');
    $this->db->from('penjualan');
    $this->db->where('id', $id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $data['row'] = $this->db->get()->row_array();

    $this->db->select('*');
    $this->db->from('penjualan_detail');
    $this->db->where('id_penjualan', $id);
    $this->db->where('penjualan_detail.id_user', $this->session->userdata('id_user'));
    $data['res'] = $this->db->get()->result_array();

    $this->load->view('cetak/struk', $data);
  }

  public function data_grosir_result(){
    $id = $this->input->post('id');
    $data = $this->model->data_grosir_result($id);

    echo json_encode($data);
  }

  public function klik_grosir(){
    $id = $this->input->post('id');
    $data = $this->model->klik_grosir($id);

    echo json_encode($data);
  }

  public function setting_vfd(){
    $total = $this->input->post('total');
    $com= "COM5";
    exec("mode $com: BAUD=9600 PARITY=n DATA=8 STOP=1 xon=off");
    $fp=fopen($com, 'w');
    fputs($fp, chr(12));
    fwrite($fp, "Total Transaksi\n\rRp $total\n\r");
    fclose($fp);
  }

  public function clear_setting_vfd(){
    $com= "COM5";
    exec("mode $com: BAUD=9600 PARITY=n DATA=8 STOP=1 xon=off");
    $fp=fopen($com, 'w');
    fputs($fp, chr(12));
    fwrite($fp, "Terima Kasih");
    sleep(2);
    fputs($fp, chr(12));
    fclose($fp);
  }
}
