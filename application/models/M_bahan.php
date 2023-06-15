<?php
class M_bahan extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function satuan_bahan_result(){
    $this->db->select('*');
    $this->db->from('satuan_bahan');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function tambah(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_bahan' => $this->input->post('nama_bahan'),
      'satuan' => $this->input->post('satuan')
    );

    $this->db->insert('bahan', $data);
  }

  public function edit(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_bahan' => $this->input->post('nama_bahan'),
      'satuan' => $this->input->post('satuan')
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('bahan', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('bahan');
  }

  public function bahan_result($search){
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

    if($search != ""){
			$where = $where." AND (a.nama_bahan LIKE '%$search%')";
      $limit = "LIMIT 500";
		}else{
			$where = $where;
      $limit = "LIMIT 1000";
		}

    $sql = $this->db->query("SELECT
                            a.*
                            FROM
                            bahan a
                            WHERE $where
                            ORDER BY a.id ASC
                            $limit
                           ");

    return $sql->result_array();
  }

  public function bahan_row($id){
    $this->db->select('a.*');
    $this->db->from('bahan a');
    $this->db->where('a.id',$id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }
}
