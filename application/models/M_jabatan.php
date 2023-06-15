<?php
class M_jabatan extends CI_Model{

  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function tambah(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'jabatan' => $this->input->post('jabatan'),
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
    );

    $this->db->insert('jabatan', $data);
  }

  public function edit(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'jabatan' => $this->input->post('jabatan'),
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('jabatan', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('jabatan');
  }

  public function jabatan_result($search){
    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user'";

    if($search != ""){
			$where = $where." AND (a.jabatan LIKE '%$search%')";
      $limit = "LIMIT 500";
		}else{
			$where = $where;
      $limit = "LIMIT 1000";
		}

    $sql = $this->db->query("SELECT
                            a.*
                            FROM
                            jabatan a
                            WHERE $where
                            ORDER BY a.id DESC
                            $limit
                           ");

    return $sql->result_array();
  }

  public function jabatan_row($id){
    $this->db->select('a.*');
    $this->db->from('jabatan a');
    $this->db->where('a.id', $id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }
}
