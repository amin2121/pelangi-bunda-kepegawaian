<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_hak_akses extends CI_Model {

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

	public function atur_hak_akses()
	{
		$level = $this->input->post('level');
		$menu_1 = $this->input->post('menu_1');
		$menu_2 = $this->input->post('menu_2');
		$menu_3 = $this->input->post('menu_3');

		$this->db->where('level', $level);
		$this->db->delete('pengaturan_hak_akses');

		$menus = [];
		if($menu_1 != null) {
			foreach ($menu_1 as $m1) {
				array_push($menus, [
					'level'		=> $level,
					'id_menu'	=> $m1,
					'tipe_menu'	=> 'menu_1'
				]);
			}
		}

		if($menu_2 != null) {
			foreach ($menu_2 as $m2) {
				array_push($menus, [
					'level'		=> $level,
					'id_menu'	=> $m2,
					'tipe_menu'	=> 'menu_2'
				]);
			}
		}

		if($menu_3 != null) {
			foreach ($menu_3 as $m3) {
				array_push($menus, [
					'level'		=> $level,
					'id_menu'	=> $m3,
					'tipe_menu'	=> 'menu_3'
				]);
			}
		}

		
		$this->db->insert_batch('pengaturan_hak_akses', $menus);
	}
}

/* End of file M_hak_akses.php */
/* Location: ./application/models/M_hak_akses.php */