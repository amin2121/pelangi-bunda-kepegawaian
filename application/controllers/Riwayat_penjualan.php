<?php
class Riwayat_penjualan extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_riwayat_penjualan','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'riwayat';
    $this->load->view('templates/header', $data);
    $this->load->view('riwayat_penjualan');
    $this->load->view('templates/footer');
  }

  public function riwayat_penjualan_result(){
    $data = $this->model->riwayat_penjualan_result();

    echo json_encode($data);
  }

  public function filter_tanggal(){
    $tanggal_dari = $this->input->post('tanggal_dari');
    $tanggal_sampai = $this->input->post('tanggal_sampai');
    $data = $this->model->filter_tanggal($tanggal_dari, $tanggal_sampai);

    echo json_encode($data);
  }

  public function filter_no_transaksi(){
    $search = $this->input->post('search');
    $data = $this->model->filter_no_transaksi($search);

    echo json_encode($data);
  }

  public function detail_penjualan(){
    $id = $this->input->post('id');
    $data = $this->model->detail_penjualan($id);

    echo json_encode($data);
  }

  public function hapus_penjualan(){
    $id = $this->input->post('id');
    $alasan = $this->input->post('inputValue');

    $this->db->select('*');
    $this->db->from('pembayaran');
    $this->db->where('id', $id);
    $header = $this->db->get()->row_array();

    $array_header = array(
      // 'id' => $header['id'],
      'id_user' => $header['id_user'],
      'id_kasir' => $header['id_kasir'],
      'no_transaksi' => $header['no_transaksi'],
      'nilai_transaksi' => $header['nilai_transaksi'],
      'dibayar' => $header['dibayar'],
      'kembali' => $header['kembali'],
      'tanggal' => $header['tanggal'],
      'waktu' => $header['waktu'],
      'bulan' => $header['bulan'],
      'tahun' => $header['tahun'],
      'status' => $header['status'],
      'nama_meja' => $header['nama_meja'],
      'atas_nama' => $header['atas_nama'],
      'status_dapur' => $header['status_dapur'],
      'status_diskon' => $header['status_diskon'],
      'diskon' => $header['diskon'],
      'alasan' => $alasan,
      'tanggal_retur' => date('d-m-Y'),
      'waktu_retur' => date('h:i:s'),
      'jenis_pembayaran' => $header['jenis_pembayaran'],
      'tipe_diskon' => $header['tipe_diskon']
    );

    $this->db->insert('retur', $array_header);
    $id_retur = $this->db->insert_id();

    $this->db->select('*');
    $this->db->from('pembayaran_detail');
    $this->db->where('id_pembayaran', $id);
    $detail = $this->db->get()->result_array();

    $data_retur_detail = [];
    foreach ($detail as $d) {
      array_push($data_retur_detail, [
        'id_user' => $d['id_user'],
        'id_kasir' => $d['id_kasir'],
        'id_pembayaran' => $d['id_pembayaran'],
        'id_barang' => $d['id_barang'],
        'nama_barang' => $d['nama_barang'],
        'harga_barang' => $d['harga_barang'],
        'total_harga_barang' => $d['total_harga_barang'],
        'jumlah_beli' => $d['jumlah_beli'],
        'tanggal' => $d['tanggal'],
        'waktu' => $d['waktu'],
        'uniqcode' => $d['uniqcode'],
        'laba' => $d['laba'],
        'total_laba' => $d['total_laba'],
      ]);
    }

    if(!empty($data_retur_detail)) {
      $this->db->insert_batch('retur_detail', $data_retur_detail);
    }

    echo $this->model->hapus_penjualan($id, $id_retur);
  }
}
