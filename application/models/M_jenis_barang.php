<?php
class M_jenis_barang extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function jenis_barang_result(){
    $this->db->select('*');
    $this->db->from('jenis_barang');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function jenis_barang_row($id){
    $this->db->select('*');
    $this->db->from('jenis_barang');
    $this->db->where('id', $id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function tambah(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_jenis_barang' => $this->input->post('nama_jenis_barang')
    );
    $this->db->insert('jenis_barang', $data);
  }

  public function edit(){
    $data = array(
      'nama_jenis_barang' => $this->input->post('nama_jenis_barang')
    );
    $this->db->where('id', $this->input->post('id'));
    $this->db->update('jenis_barang', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('jenis_barang');
  }
}
