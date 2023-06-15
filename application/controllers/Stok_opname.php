<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stok_opname extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('M_stok_opname','model');
  	}

	public function index()
	{
		if (!$this->session->userdata('logged_in')) {
	      redirect('login');
	    }

	    $data['active'] = 'barang';

	    $this->load->view('templates/header', $data);
	    $this->load->view('stok_opname', $data);
	    $this->load->view('templates/footer');
	}

	public function view_tambah(){
	    if (!$this->session->userdata('logged_in')) {
	      redirect('login');
	    }

	    $data['active'] = 'barang';

	    $this->load->view('templates/header', $data);
	    $this->load->view('stok_opname/tambah', $data);
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
	    $this->load->view('stok_opname/edit', $data);
	    $this->load->view('templates/footer');
	}

  	public function stok_opname_result()
  	{
  		$search = $this->input->post('search');
    	$data = $this->model->stok_opname_result($search);

    	echo json_encode($data);
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

  	public function simpan()
  	{
  		$kode_stok_opname = $this->model->get_kode_stok_opname();

	    $tanggal = $this->input->post('tanggal');
	    $tahun = substr($tanggal, 0, 4);
	    $bulan = substr($tanggal, 5, 2);
	    $hari = substr($tanggal, 8, 2);
	    $tanggal_fix = $hari.'-'.$bulan.'-'.$tahun;

	    $id_barang = $this->input->post('id_barang');
	    $nama_barang = $this->input->post('nama_barang');
	    $stok_sistem = $this->input->post('stok_sistem');
	    $stok_dapur = $this->input->post('stok_dapur');

	    $data = array(
	      'id_user' => $this->session->userdata('id_user'),
		  'id_kasir' => $this->session->userdata('id_kasir'),
	      'kode' => $kode_stok_opname,
	      'tanggal' => $tanggal_fix,
	      'bulan' => $bulan,
	      'tahun' => $tahun,
	      'waktu' => date('H:i:s'),	
	    );
	    $this->db->insert('stok_opname', $data);
	    $id_stok_opname = $this->db->insert_id();
 
	    $simpan_stok_opname_detail = $this->model->simpan($id_stok_opname, $nama_barang, $id_barang, $stok_sistem, $stok_dapur);
	    if($simpan_stok_opname_detail > 0) {
	    	echo json_encode(['status' => true]);
	    } else {
	    	echo json_encode(['status' => false]);
	    }
  	}

  	public function detail_stok_opname()
  	{
  		$search = $this->input->post('search');
  		$id =  $this->input->post('id');
    	$data = $this->model->detail_stok_opname($search, $id);

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

/* End of file Stok_opname.php */
/* Location: ./application/controllers/Stok_opname.php */