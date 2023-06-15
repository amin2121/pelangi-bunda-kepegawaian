<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_stok_opname extends CI_Model {

	public function get_nama_barang($search = '')
	{
		$id_user = $this->session->userdata('id_user');
	    $where = "a.id_user = '$id_user'";

	    if($search != ""){
			$where = $where." AND (a.nama_barang LIKE '%$search%')";
	     	$limit = "LIMIT 500";
		}else{
			$where = $where;
	     	$limit = "LIMIT 1000";
		}

	    $sql = $this->db->query("SELECT
	                            a.*,
	                            b.nama_jenis_barang as jenis_barang
	                            FROM
	                            barang a
	                            LEFT JOIN jenis_barang b ON a.id_jenis_barang = b.id
	                            WHERE $where
	                            ORDER BY a.id ASC
	                            $limit
	                           ");

	    return $sql->result_array();
	}

	public function klik_barang($id){
      $this->db->select('a.*');
      $this->db->from('barang a');
      $this->db->where('a.id', $id);
      $this->db->where('a.id_user', $this->session->userdata('id_user'));
      return $this->db->get()->row_array();
  	}

	public function detail_stok_opname($search, $id){
	    $this->db->select('a.*');
	    $this->db->from('stok_opname_detail a');
	    $this->db->where('a.id_stok_opname', $id);
	    $this->db->like('a.nama_barang', $search);
	    return $this->db->get()->result_array();
  	}

  	public function stok_opname_result($search)
  	{
  		$id_user = $this->session->userdata('id_user');
	    $where = "a.id_user = '$id_user'";

	    if($search != ""){
			$where = $where." AND (a.kode LIKE '%$search%')";
	      	$limit = "LIMIT 500";
		}else{
			$where = $where;
	      	$limit = "LIMIT 1000";
		}

	    $sql = $this->db->query("SELECT
	                            a.*,
	                            (SELECT COUNT(*) FROM stok_opname_detail b WHERE b.id_stok_opname = a.id) as jumlah_barang,
	                            b.nama_lengkap as nama_user
	                            FROM
	                            stok_opname a
	                            LEFT JOIN user b ON a.id_kasir = b.id
	                            WHERE $where
	                            ORDER BY a.id DESC
	                            $limit
	                           ");

	    return $sql->result_array();
  	}

  	public function stok_barang_row($id)
  	{
  		$this->db->select('*');
	    $this->db->from('stok_opname');
	    $this->db->where('id', $id);
	    $this->db->where('id_user', $this->session->userdata('id_user'));
	    return $this->db->get()->row_array();
  	}

  	public function stok_barang_detail_result($id)
  	{
  		$this->db->select('*');
	    $this->db->from('stok_opname_detail');
	    $this->db->where('id_stok_opname', $id);
	    $this->db->where('id_user', $this->session->userdata('id_user'));
	    return $this->db->get()->result_array();
  	}

  	public function get_kode_stok_opname(){
	    $this->db->select('RIGHT(a.kode, 4) as kode, a.id_user', FALSE);
	    $this->db->where('a.id_user', $this->session->userdata('id_user'));
	    $this->db->order_by('a.kode','DESC');
	    $this->db->limit(1);
	    $query = $this->db->get('stok_opname a');      //cek dulu apakah ada sudah ada kode di tabel.
	    if($query->num_rows() <> 0){
	     //jika kode ternyata sudah ada.
	     $data = $query->row();
	     $kode = intval($data->kode) + 1;
	    }
	    else {
	     $kode = 1;
	    }
	    $kodemax = str_pad($kode, 4, "0", STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
	    $tanggal = date('dmy');
	    $kodejadi = "SP-".$tanggal.$kodemax;    // hasilnya ODJ-9921-0001 dst.
	    return $kodejadi;
	}

  	public function simpan($id_stok_opname, $nama_barang, $id_barang, $stok_sistem, $stok_dapur)
  	{
  		$data_stok_opname_detail = [];
		$data_stok_barang = [];
		$data_stok_update = [];

		foreach ($nama_barang as $idx => $nama_b) {
			array_push($data_stok_opname_detail, [
		      'id_user' => $this->session->userdata('id_user'),
			  'id_kasir' => $this->session->userdata('id_kasir'),
		      'id_stok_opname' => $id_stok_opname,
		      'id_barang' => $id_barang[$idx],
		      'nama_barang' => $nama_b,
		      'stok_sistem' => str_replace(',', '', $stok_sistem[$idx]),
		      'stok_dapur' => str_replace(',', '', $stok_dapur[$idx]),
		    ]);
		    	
		    $stok_after = str_replace(',', '', $stok_dapur[$idx]);

		    array_push($data_stok_update, ['stok' => $stok_after, 'id' => $id_barang[$idx]]);
		}

		// update batch stok
		if(!empty($data_stok_update)) {
		    $this->db->update_batch('barang', $data_stok_update, 'id');
		}

		// insert stok barang detail
	    return $this->db->insert_batch('stok_opname_detail', $data_stok_opname_detail);
  	}
}

/* End of file M_stok_opname.php */
/* Location: ./application/models/M_stok_opname.php */