<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Level extends CI_Controller {
	function __construct(){
		parent::__construct();
		$this->load->model('M_level','model');
  	}

	public function index()
	{
		if (!$this->session->userdata('logged_in')) {
	    	redirect('login');
	    }

	    $data['active'] = 'pengaturan';

	    $this->load->view('templates/header', $data);
	    $this->load->view('level', $data);
	    $this->load->view('templates/footer');
	}

	public function view_tambah()
	{
		if (!$this->session->userdata('logged_in')) {
	      redirect('login');
	    }

	    $data['active'] = 'inventori';

	    $this->load->view('templates/header', $data);
	    $this->load->view('level/tambah', $data);
	    $this->load->view('templates/footer');
	}

	public function view_edit($id){
	    if (!$this->session->userdata('logged_in')) {
	    	redirect('login');
	    }
	    
	    $data['active'] = 'inventori';
	    $data['row'] = $this->model->level_row($id);

	    $this->load->view('templates/header', $data);
	    $this->load->view('level/edit', $data);
	    $this->load->view('templates/footer');
	}

  	public function tambah(){
	    $this->model->tambah();
	    redirect('level');
  	}

  	public function edit(){
	    $this->model->edit();
	    redirect('level');
  	}

  	public function hapus(){
  		$id = $this->input->get('id');

	    $this->model->hapus($id);
	    echo '1';
  	}

	public function level_result(){
	    $search = $this->input->post('search');
	    $data = $this->model->level_result($search);

	    echo json_encode($data);
	}
}

/* End of file Level.php */
/* Location: ./application/controllers/Level.php */