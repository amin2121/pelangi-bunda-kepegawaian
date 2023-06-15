<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stok_barang extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('M_stok_barang','model');
  	}

 	public function index(){
	    if (!$this->session->userdata('logged_in')) {
	      redirect('login');
	    }

	    $data['active'] = 'barang';

	    $this->load->view('templates/header', $data);
	    $this->load->view('stok_barang', $data);
	    $this->load->view('templates/footer');
  	}

  	public function view_tambah(){
	    if (!$this->session->userdata('logged_in')) {
	      redirect('login');
	    }

	    $data['active'] = 'barang';

	    $this->load->view('templates/header', $data);
	    $this->load->view('stok_barang/tambah', $data);
	    $this->load->view('templates/footer');
	}

	public function view_edit($id) {
	    if (!$this->session->userdata('logged_in')) {
	      redirect('login');
	    }

	    $data['active'] = 'barang';
	    $data['row'] = $this->model->stok_barang_row($id);
	    $data['stok_detail'] = $this->model->stok_barang_detail_result($id);

	    $this->load->view('templates/header', $data);
	    $this->load->view('stok_barang/edit', $data);
	    $this->load->view('templates/footer');
	}

	public function get_nama_barang()
	{
		$search = $this->input->post('search');

    	$data = $this->model->get_nama_barang($search);

    	echo json_encode($data);
	}

	public function klik_barang(){
    	$id = $this->input->post('id');
    	$data = $this->model->klik_barang($id);

    	echo json_encode($data);
  	}

  	public function simpan() {
	    $kode_stok = $this->model->get_kode_stok();
	    $total_semua = $this->input->post('total_semua');

	    $tanggal = $this->input->post('tanggal');
	    $tahun = substr($tanggal, 0, 4);
	    $bulan = substr($tanggal, 5, 2);
	    $hari = substr($tanggal, 8, 2);
	    $tanggal_fix = $hari.'-'.$bulan.'-'.$tahun;

	    $id_barang = $this->input->post('id_barang');
	    $nama_barang = $this->input->post('nama_barang');
	    $jumlah = $this->input->post('jumlah');
	    $harga_jual = $this->input->post('harga_jual');
	    $total_harga = $this->input->post('total_harga');

	    $data = array(
	      'id_user' => $this->session->userdata('id_user'),
		  'id_kasir' => $this->session->userdata('id_kasir'),
	      'kode' => $kode_stok,
	      'total_semua' => str_replace(',', '', $total_semua),
	      'tanggal' => $tanggal_fix,
	      'bulan' => $bulan,
	      'tahun' => $tahun,
	      'waktu' => date('H:i:s'),	
	    );
	    $this->db->insert('stok_barang', $data);
	    $id_stok_barang = $this->db->insert_id();
 
	    $simpan_stok_barang_detail = $this->model->simpan($id_stok_barang, $nama_barang, $id_barang, $jumlah, $harga_jual, $total_harga);
	    if($simpan_stok_barang_detail > 0) {
	    	echo json_encode(['status' => true]);
	    } else {
	    	echo json_encode(['status' => false]);
	    }
  	}

  	public function simpan_edit()
  	{
  		$kode_stok = $this->model->get_kode_stok();
	    $total_semua = $this->input->post('total_semua');
	    $id_stok_barang = $this->input->post('id_stok_barang');

	    $tanggal = $this->input->post('tanggal');
	    $tahun = substr($tanggal, 0, 4);
	    $bulan = substr($tanggal, 5, 2);
	    $hari = substr($tanggal, 8, 2);
	    $tanggal_fix = $hari.'-'.$bulan.'-'.$tahun;

	    $id_barang = $this->input->post('id_barang');
	    $nama_barang = $this->input->post('nama_barang');
	    $jumlah = $this->input->post('jumlah');
	    $harga_jual = $this->input->post('harga_jual');
	    $total_harga = $this->input->post('total_harga');

	    $data = array(
	      'id_user' => $this->session->userdata('id_user'),
		  'id_kasir' => $this->session->userdata('id_kasir'),
	      'kode' => $kode_stok,
	      'total_semua' => str_replace(',', '', $total_semua),
	      'tanggal' => $tanggal_fix,
	      'bulan' => $bulan,
	      'tahun' => $tahun,
	      'waktu' => date('H:i:s'),	
	    );
	    $this->db->where('id', $id_stok_barang);
	    $this->db->update('stok_barang', $data);
 
	    $simpan_stok_barang_detail = $this->model->simpan_edit($id_stok_barang, $nama_barang, $id_barang, $jumlah, $harga_jual, $total_harga);
	    if($simpan_stok_barang_detail > 0) {
	    	echo json_encode(['status' => true]);
	    } else {
	    	echo json_encode(['status' => false]);
	    }
  	}

  	public function stok_barang_result()
  	{
  		$search = $this->input->post('search');
    	$data = $this->model->stok_barang_result($search);

    	echo json_encode($data);
  	}

  	public function detail_stok_barang()
  	{
  		$search = $this->input->post('search');
  		$id =  $this->input->post('id');
    	$data = $this->model->detail_stok_barang($search, $id);

    	echo json_encode($data);
  	}

  	public function hapus()
  	{
  		$id = $this->input->get('id');
  		$hapus_data = $this->model->hapus($id);
  		if($hapus_data) {
  			echo json_encode(['status' => true]);
  		} else {
  			echo json_encode(['status' => false]);
  		}
  	}
}

/* End of file Stok_barang.php */
/* Location: ./application/controllers/Stok_barang.php */