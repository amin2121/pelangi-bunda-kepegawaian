<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_level extends CI_Model {

  	public function level_result($search) {
	    $id_user = $this->session->userdata('id_user');
	    $where = "a.id_user = '$id_user'";

	    if($search != ""){
			$where = $where." AND (a.nama_level LIKE '%$search%')";
	      	$limit = "LIMIT 500";
		}else{
			$where = $where;
	      	$limit = "LIMIT 1000";
		}

	    $sql = $this->db->query("SELECT
	                            a.*
	                            FROM
	                            level a
	                            WHERE $where
	                            ORDER BY a.id DESC
	                            $limit
	                           ");

	    return $sql->result_array();
	}

  	public function level_row($id){
	    $this->db->select('a.*');
	    $this->db->from('level a');
	    $this->db->where('a.id',$id);
	    $this->db->where('id_user', $this->session->userdata('id_user'));
	    return $this->db->get()->row_array();
  	}

	public function tambah()
	{
		$data = array(
	      'nama_level' => $this->input->post('nama_level'),
	      'tanggal' => date('d-m-Y'),
	      'waktu' => date('H:i:s'),
	      'id_user' => $this->session->userdata('id_user'),
	    );

	    $this->db->insert('level', $data);
	}

	public function edit()
	{
		$id = $this->input->post('id');

		$data = array(
	      'nama_level' => $this->input->post('nama_level'),
	      'tanggal' => date('d-m-Y'),
	      'waktu' => date('H:i:s'),
	      'id_user' => $this->session->userdata('id_user'),
	    );

		$this->db->where('id', $id);
	    $this->db->update('level', $data);
	}

	public function hapus($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('level');
	}
}

/* End of file M_level.php */
/* Location: ./application/models/M_level.php */