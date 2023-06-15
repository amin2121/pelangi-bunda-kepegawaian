<?php
class Kasir extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_kasir','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'penjualan';

    $this->load->view('templates/header', $data);
    $this->load->view('kasir', $data);
    $this->load->view('templates/footer');
  }

  public function edit_pesanan($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['active'] = 'penjualan';
    $data['row'] = $this->model->edit_pesanan_row($id);
    $data['res'] = $this->model->edit_pesanan_result($id);
    $data['jenis'] = $this->model->jenis_barang_result();
    $data['gambar_default'] = $this->db->get('gambar_default')->row_array();

    $this->load->view('templates/header', $data);
    $this->load->view('kasir/edit_pesanan', $data);
    $this->load->view('templates/footer');
  }

  public function data_barang_result(){
    $search = $this->input->post('search');
    $data = $this->model->data_barang_result($search);

    echo json_encode($data);
  }

  public function simpan_transaksi(){
    $id_barang = $this->input->post('id_barang');
    $harga_barang = $this->input->post('harga_barang');
    $total_harga_barang = $this->input->post('total_harga_barang');
    $jumlah_beli = $this->input->post('jumlah_beli');
    $nama_barang = $this->input->post('nama_barang');

    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'id_kasir' => $this->session->userdata('id_kasir'),
      'no_transaksi' => $this->input->post('no_transaksi'),
      'nilai_transaksi' => str_replace(',', '', $this->input->post('nilai_transaksi')),
      'dibayar' => str_replace(',', '', $this->input->post('dibayar')),
      'kembali' => str_replace(',', '', $this->input->post('kembali')),
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
      'bulan' => date('m'),
      'tahun' => date('Y'),
      'status' => '1',
      'status_dapur' => '0',
      'nama_meja' => $this->input->post('nama_meja'),
      'atas_nama' => $this->input->post('atas_nama')
    );

    $this->db->insert('pembayaran', $data);
    $id_pembayaran = $this->db->insert_id();

    $this->model->simpan_transaksi($id_pembayaran, $value, $harga_barang[$key], $total_harga_barang[$key], $nama_barang[$key], $jumlah_beli[$key]);
    

    $data['id_pembayaran'] = $id_pembayaran;
    echo json_encode($data);
  }

  public function pesanan_result(){
    $search = $this->input->post('search');
    $res = $this->model->pesanan_result($search);

    $data = [];
    foreach ($res as $key => $pesan_result) {
      $data_pesanan_detail = $this->model->detail_pesanan($pesan_result['id']);
      array_push($data, [
        'id' => $pesan_result['id'],
        'id_user' => $pesan_result['id_user'],
        'id_kasir' => $pesan_result['id_kasir'],
        'no_transaksi' => $pesan_result['no_transaksi'],
        'nilai_transaksi' => $pesan_result['nilai_transaksi'],
        'dibayar' => $pesan_result['dibayar'],
        'kembali' => $pesan_result['kembali'],
        'jenis_pembayaran' => $pesan_result['jenis_pembayaran'],
        'tanggal' => $pesan_result['tanggal'],
        'waktu' => $pesan_result['waktu'],
        'bulan' => $pesan_result['bulan'],
        'tahun' => $pesan_result['tahun'],
        'status' => $pesan_result['status'],
        'nama_meja' => $pesan_result['nama_meja'],
        'atas_nama' => $pesan_result['atas_nama'],
        'status_dapur' => $pesan_result['status_dapur'],
        'status_diskon' => $pesan_result['status_diskon'],
        'diskon' => $pesan_result['diskon'],
        'tipe_diskon' => $pesan_result['tipe_diskon'],
        'uniqcode' => $pesan_result['uniqcode'],
        'detail' => $data_pesanan_detail,
      ]);
    }

    echo json_encode($data);
  }

  public function detail_pesanan(){
    $id = $this->input->post('id');
    $data = $this->model->detail_pesanan($id);

    echo json_encode($data);
  }

  public function filter_jenis_barang(){
    $id = $this->input->post('id');
    $data = $this->model->filter_jenis_barang($id);

    echo json_encode($data);
  }

  public function hapus_list_pesanan($id, $id_pesanan){
    $this->model->hapus_list_pesanan($id, $id_pesanan);

    redirect('kasir/edit_pesanan/'.$id);
  }

  public function check_out() {

    $id_pesanan = $this->input->post('id_pesanan');
    $id_barang_ada = $this->input->post('id_barang_ada');
    $harga_barang_ada = $this->input->post('harga_barang_ada');
    $total_harga_barang_ada = $this->input->post('total_harga_barang_ada');
    $jumlah_beli_ada = $this->input->post('jumlah_beli_ada');
    $nama_barang_ada = $this->input->post('nama_barang_ada');
    $laba_ada = $this->input->post('laba_ada');
    $total_laba_ada = $this->input->post('total_laba_barang_ada');

    $id_barang = $this->input->post('id_barang');
    $harga_barang = $this->input->post('harga_barang');
    $total_harga_barang = $this->input->post('total_harga_barang');
    $jumlah_beli = $this->input->post('jumlah_beli');
    $nama_barang = $this->input->post('nama_barang');
    $laba = $this->input->post('laba');
    $total_laba = $this->input->post('total_laba_barang');

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
      'status_dapur' => '0',
      'nama_meja' => $this->input->post('nama_meja'),
      'atas_nama' => $this->input->post('atas_nama')
    );

    $id_pembayaran = $this->input->post('id');
    $this->db->where('id', $this->input->post('id'));
    $this->db->update('pembayaran', $data);

    if ($id_barang != '') {
      $this->model->check_out_insert($id_pembayaran, $id_barang, $harga_barang, $total_harga_barang, $nama_barang, $jumlah_beli, $laba, $total_laba);
    }

    if ($id_barang_ada != '') {
      $this->model->check_out_update($id_pembayaran, $id_barang_ada, $id_pesanan, $harga_barang_ada, $total_harga_barang_ada, $nama_barang_ada, $jumlah_beli_ada, $laba_ada, $total_laba_ada);
    }

    echo '1';
  }

  public function hapus_pesanan($id){
    $this->model->hapus_pesanan($id);
    redirect('kasir');
  }

  public function proses_pembayaran(){
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
      'nilai_transaksi' => str_replace(',', '', $this->input->post('nilai_transaksi_bayar')),
      'nilai_total_laba' =>str_replace(',', '', $this->input->post('nilai_total_laba')),
      'dibayar' => str_replace(',', '', $this->input->post('dibayar')),
      'kembali' => str_replace(',', '', $this->input->post('kembali')),
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
      'bulan' => date('m'),
      'tahun' => date('Y'),
      'status' => '1',
      'status_diskon' => $status_diskon,
      'diskon' => str_replace(',', '', $diskon),
      'jenis_pembayaran' => $this->input->post('jenis_pembayaran'),
      'tipe_diskon' => $this->input->post('status_diskon_pilih')
    );

    $id_pembayaran = $this->input->post('id_pembayaran');
    $this->db->where('id', $id_pembayaran);
    $this->db->update('pembayaran', $data);

    $data['id_pembayaran'] = $id_pembayaran;
    echo json_encode($data);
  }

  public function cetak_struk($id){
    $this->db->select('*');
    $this->db->from('pembayaran');
    $this->db->where('id', $id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $data['row'] = $this->db->get()->row_array();

    $this->db->select('*');
    $this->db->from('pembayaran_detail');
    $this->db->where('id_pembayaran', $id);
    $this->db->where('pembayaran_detail.id_user', $this->session->userdata('id_user'));
    $data['res'] = $this->db->get()->result_array();
    $data['struk'] = $this->db->get('struk')->row_array();

    $this->load->view('cetak/struk', $data);
  }

  public function cek_pembayaran(){
    $id = $this->input->post('id');
    $data = $this->model->cek_pembayaran($id);

    echo json_encode($data);
  }
}
