<?php
class Pemesanan extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_pemesanan','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['jenis'] = $this->model->jenis_barang_result();
    $data['meja'] = $this->model->meja_result();
    $data['no_transaksi'] = $this->model->get_no_transaksi();
    $data['gambar_default'] = $this->db->get('gambar_default')->row_array();
    $data['active'] = 'penjualan';

    $this->load->view('templates/header', $data);
    $this->load->view('pemesanan', $data);
    $this->load->view('templates/footer');
  }

  public function data_barang_result(){
    $search = $this->input->post('search');
    $data = $this->model->data_barang_result($search);

    echo json_encode($data);
  }

  public function tambah_pesanan(){
    $id = $this->input->post('id');
    $data = $this->model->tambah_pesanan($id);

    echo json_encode($data);
  }

  public function filter_jenis_barang(){
    $id = $this->input->post('id');
    $data = $this->model->filter_jenis_barang($id);

    echo json_encode($data);
  }

  public function pesan_transaksi(){
      $id_barang = $this->input->post('id_barang');
      $harga_barang = $this->input->post('harga_barang');
      $total_harga_barang = $this->input->post('total_harga_barang');
      $jumlah_beli = $this->input->post('jumlah_beli');
      $nama_barang = $this->input->post('nama_barang');
      $laba = $this->input->post('laba');
      $total_laba_barang = $this->input->post('total_laba_barang');

      $data = array(
        'id_user' => $this->session->userdata('id_user'),
        'id_kasir' => $this->session->userdata('id_kasir'),
        'no_transaksi' => $this->input->post('no_transaksi'),
        'nilai_transaksi' => str_replace(',', '', $this->input->post('nilai_transaksi')),
        'nilai_total_laba' =>str_replace(',', '', $this->input->post('nilai_total_laba')),
        'tanggal' => date('d-m-Y'),
        'waktu' => date('H:i:s'),
        'bulan' => date('m'),
        'tahun' => date('Y'),
        'status' => '0',
        'status_dapur' => '0',
        'nama_meja' => $this->input->post('nama_meja'),
        'atas_nama' => $this->input->post('atas_nama')
      );

      $this->db->insert('pembayaran', $data);
      $id_pembayaran = $this->db->insert_id();

      echo $this->model->pesan_transaksi($id_pembayaran, $id_barang, $harga_barang, $total_harga_barang, $nama_barang, $jumlah_beli, $laba, $total_laba_barang);
  }

  public function simpan_transaksi(){
    $id_barang = $this->input->post('id_barang');
    $harga_barang = $this->input->post('harga_barang');
    $total_harga_barang = $this->input->post('total_harga_barang');
    $jumlah_beli = $this->input->post('jumlah_beli');
    $nama_barang = $this->input->post('nama_barang');
    $laba = $this->input->post('laba');
    $total_laba_barang = $this->input->post('total_laba_barang');

    $status_diskon = '';
    $diskon = '';

    if ($this->input->post('status_diskon') == '1') {
      if ($this->input->post('status_diskon_pilih') == 'persen') {
        $diskon = $this->input->post('diskon_persen');
      }elseif ($this->input->post('status_diskon_pilih') == 'nominal') {
        $diskon = $this->input->post('diskon_nominal');
      }
      $status_diskon = '1';
    }else {
      $status_diskon = '0';
      $diskon = '0';
    }

    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'id_kasir' => $this->session->userdata('id_kasir'),
      'no_transaksi' => $this->input->post('no_transaksi'),
      'nilai_transaksi' => str_replace(',', '', $this->input->post('nilai_transaksi_bayar')),
      'nilai_total_laba' =>str_replace(',', '', $this->input->post('nilai_total_laba')),
      'dibayar' => str_replace(',', '', $this->input->post('dibayar')),
      'kembali' => str_replace(',', '', $this->input->post('kembali')),
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
      'bulan' => date('m'),
      'tahun' => date('Y'),
      'status' => '1',
      'status_dapur' => '0',
      'nama_meja' => $this->input->post('nama_meja'),
      'atas_nama' => $this->input->post('atas_nama'),
      'status_diskon' => $status_diskon,
      'diskon' => str_replace(',', '', $diskon),
      'jenis_pembayaran' => $this->input->post('jenis_pembayaran'),
      'tipe_diskon' => $this->input->post('status_diskon_pilih')
    );

    $this->db->insert('pembayaran', $data);
    $id_pembayaran = $this->db->insert_id();

    // simpan transaksi
    $this->model->simpan_transaksi($id_pembayaran, $id_barang, $harga_barang, $total_harga_barang, $nama_barang, $jumlah_beli, $laba, $total_laba_barang);
    $data['id_pembayaran'] = $id_pembayaran;
    echo json_encode($data);
  }
}
