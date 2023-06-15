<?php
class Riwayat_hapus_penjualan extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_riwayat_hapus_penjualan','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'riwayat';
    $this->load->view('templates/header', $data);
    $this->load->view('riwayat_hapus_penjualan');
    $this->load->view('templates/footer');
  }

  public function riwayat_hapus_penjualan_result(){
    $data = $this->model->riwayat_hapus_penjualan_result();

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

  public function cetak_struk($id){
    $this->db->select('*');
    $this->db->from('pembayaran_hapus');
    $this->db->where('id', $id);
    $data['row'] = $this->db->get()->row_array();

    $this->db->select('*');
    $this->db->from('pembayaran_detail_hapus');
    $this->db->where('id_pembayaran_hapus', $id);
    $data['res'] = $this->db->get()->result_array();
    $data['struk'] = $this->db->get('struk')->row_array();

    $this->load->view('cetak/struk', $data);
  }

  public function hapus_penjualan()
  {
    $id = $this->input->post('id');

    $this->db->where('id', $id);
    $this->db->delete('pembayaran_hapus');

    $this->db->where('id_pembayaran_hapus', $id);
    $status_hapus = $this->db->delete('pembayaran_detail_hapus');

    $response = [];
    if($status_hapus) {
      $response = [
        'status' => true,
        'message' => 'Transaksi Berhasil Dihapus'
      ];
    } else {
      $response = [
        'status' => false,
        'message' => 'Transaksi Gagal Dihapus'
      ];
    }

    echo json_encode($response);
  }

  public function detail_hapus_penjualan(){
    $id = $this->input->post('id');
    $data = $this->model->detail_hapus_penjualan($id);

    echo json_encode($data);
  }
}
