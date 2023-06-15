<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hak_akses extends CI_Controller {
	function __construct(){
		parent::__construct();
		$this->load->model('M_hak_akses','model');
  	}

	public function index()
	{
		if (!$this->session->userdata('logged_in')) {
	    	redirect('login');
	    }

	    $data['active'] = 'pengaturan';

	    $this->load->view('templates/header', $data);
	    $this->load->view('hak_akses', $data);
	    $this->load->view('templates/footer');
	}

	public function level_result(){
	    $search = $this->input->post('search');
	    $data = $this->model->level_result($search);

	    echo json_encode($data);
	}

	public function view_atur_hak_akses($id_level)
	{
		if (!$this->session->userdata('logged_in')) {
	    	redirect('login');
	    }

	    $data['active'] = 'pengaturan';
	    $data['row'] = $this->db->get_where('level', ['id' => $id_level])->row_array();
	    $data['menus_1'] = $this->db->get('menu_1')->result_array();

	    $this->load->view('templates/header', $data);
	    $this->load->view('hak_akses/atur_hak_akses', $data);
	    $this->load->view('templates/footer');
	}

	public function atur_hak_akses()
	{
		$this->model->atur_hak_akses();
		redirect('hak_akses');
	}
}

/* End of file Hak_akses.php */
/* Location: ./application/controllers/Hak_akses.php */