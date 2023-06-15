<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Gambar_default extends CI_Controller {
	function __construct(){
		parent::__construct();
  	}

	public function index()
	{
		if (!$this->session->userdata('logged_in')) {
	    	redirect('login');
	    }

	    $data['active'] = 'penjualan';
	    $data['row'] = $this->db->get('gambar_default')->row_array();

	    $this->load->view('templates/header', $data);
	    $this->load->view('gambar_default', $data);
	    $this->load->view('templates/footer');
	}

	public function atur_gambar_default()
	{
		$gambar_lama = $this->input->post('gambar_lama');

		$config['upload_path'] = './assets/gambar_default/';
        $config['allowed_types'] = 'jpg|png|jpeg|pdf';
        $config['overwrite'] = false;
        $config['max_size'] = '1000000';
        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        // delete gambar
        $this->db->where('id', 1);
        $this->db->delete('gambar_default');

        $true_gambar = '';
        if ($this->upload->do_upload('gambar_default')) {
            $true_gambar = $this->upload->data('file_name');
            if($gambar_lama != null) {
            	unlink('assets/gambar_default/' . $gambar_lama);
            }
        } else {
            $true_gambar = 'default.jpg';
        }

        // insert gambar
        $data = ['id' => 1, 'nama_file' => $true_gambar, 'tanggal' => date('d-m-Y')];
        $this->db->insert('gambar_default', $data);
        redirect('gambar_default');
	}
}

/* End of file Gambar_default.php */
/* Location: ./application/controllers/Gambar_default.php */