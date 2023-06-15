<?php
class M_meja extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function meja_result(){
    $this->db->select('*');
    $this->db->from('meja');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function meja_row($id){
    $this->db->select('*');
    $this->db->from('meja');
    $this->db->where('id', $id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function tambah(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_meja' => $this->input->post('nama_meja')
    );
    $this->db->insert('meja', $data);
  }

  public function edit(){
    $data = array(
      'nama_meja' => $this->input->post('nama_meja')
    );
    $this->db->where('id', $this->input->post('id'));
    $this->db->update('meja', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('meja');
  }
}
