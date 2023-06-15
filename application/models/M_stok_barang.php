<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_stok_barang extends CI_Model {

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

	public function klik_barang($id) {
      $this->db->select('a.*');
      $this->db->from('barang a');
      $this->db->where('a.id', $id);
      $this->db->where('a.id_user', $this->session->userdata('id_user'));
      return $this->db->get()->row_array();
  	}

  	public function stok_barang_result($search)
  	{
  		$id_user = $this->session->userdata('id_user');
	    $where = "a.id_user = '$id_user'";

	    if($search != ""){
			$where = $where." AND (a.kode LIKE '$search%')";
	      	$limit = "LIMIT 500";
		}else{
			$where = $where;
	      	$limit = "LIMIT 1000";
		}

	    $sql = $this->db->query("SELECT
	                            a.*,
								b.nama_lengkap as nama_user,
	                            (SELECT COUNT(*) FROM stok_barang_detail b WHERE b.id_stok_barang = a.id) as jumlah_barang
	                            FROM
	                            stok_barang a
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
	    $this->db->from('stok_barang');
	    $this->db->where('id', $id);
	    $this->db->where('id_user', $this->session->userdata('id_user'));
	    return $this->db->get()->row_array();
  	}

  	public function stok_barang_detail_result($id)
  	{
  		$this->db->select('*');
	    $this->db->from('stok_barang_detail');
	    $this->db->where('id_stok_barang', $id);
	    $this->db->where('id_user', $this->session->userdata('id_user'));
	    return $this->db->get()->result_array();
  	}

  	public function detail_stok_barang($search, $id){
	    $this->db->select('a.*');
	    $this->db->from('stok_barang_detail a');
	    $this->db->where('a.id_stok_barang', $id);
	    $this->db->like('a.nama_barang', $search);
	    return $this->db->get()->result_array();
  	}

  	public function get_kode_stok(){
	    $this->db->select('RIGHT(a.kode, 4) as kode, a.id_user', FALSE);
	    $this->db->where('a.id_user', $this->session->userdata('id_user'));
	    $this->db->order_by('a.kode','DESC');
	    $this->db->limit(1);
	    $query = $this->db->get('stok_barang a');      //cek dulu apakah ada sudah ada kode di tabel.
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
	    $kodejadi = "SB-".$tanggal.$kodemax;    // hasilnya ODJ-9921-0001 dst.
	    return $kodejadi;
	}

	public function simpan($id_stok_barang, $nama_barang, $id_barang, $jumlah, $harga_jual, $total_harga)
	{
		$data_stok_barang_detail = [];
		$data_stok_barang = [];
		$data_stok_update = [];
		foreach ($nama_barang as $idx => $nama_b) {
			array_push($data_stok_barang_detail, [
		      'id_user' => $this->session->userdata('id_user'),
			  'id_kasir' => $this->session->userdata('id_kasir'),
		      'id_stok_barang' => $id_stok_barang,
		      'id_barang' => $id_barang[$idx],
		      'nama_barang' => $nama_b,
		      'jumlah' => str_replace(',', '', $jumlah[$idx]),
		      'harga_jual' => str_replace(',', '', $harga_jual[$idx]),
		      'total_harga' => str_replace(',', '', $total_harga[$idx])
		    ]);
		    	
		    // getting barang
		    $this->db->select('*');
		    $this->db->from('barang');
		    $this->db->where('id', $id_barang[$idx]);
		    $row = $this->db->get()->row_array();

		    $stok = $row['stok'];
		    $tambah_stok = $stok + str_replace(',', '', $jumlah[$idx]);

		    array_push($data_stok_update, ['stok' => $tambah_stok, 'id' => $id_barang[$idx]]);
		}

		// update batch stok
		if(!empty($data_stok_update)) {
		    $this->db->update_batch('barang', $data_stok_update, 'id');
		}

		// insert stok barang detail
	    return $this->db->insert_batch('stok_barang_detail', $data_stok_barang_detail);
	}

	public function simpan_edit($id_stok_barang, $nama_barang, $id_barang, $jumlah, $harga_jual, $total_harga)
	{
		$data_stok_barang_detail = [];
		$data_stok_barang = [];
		$data_stok_update = [];

		// $d_stok_barang_detail = $this->db->get_where('stok_barang_detail', ['id_stok_barang' = $id_stok_barang])->result_array();
		$this->db->select('*');
	    $this->db->from('stok_barang_detail');
	    $this->db->where('id_stok_barang', $id_stok_barang);
	    $d_stok_barang_detail = $this->db->get()->row_array();

		foreach ($d_stok_barang_detail as $key => $val) {
			// getting barang
		    $this->db->select('*');
		    $this->db->from('barang');
		    $this->db->where('id', $val['id_barang']);
		    $row = $this->db->get()->row_array();

		    $stok = $row['stok'];
		    $kurang_stok = $stok - str_replace(',', '', $val['jumlah']);

		    array_push($data_stok_kurang, ['stok' => $kurang_stok, 'id' => $val['id_barang']]);
		}

		if(!empty($data_stok_kurang)) {
			$this->db->update_batch('barang', $data_stok_kurang, 'id');
		}

		$this->db->where('id_stok_barang', $id_stok_barang);
		$this->db->delete('stok_barang_detail');

		foreach ($nama_barang as $idx => $nama_b) {
			array_push($data_stok_barang_detail, [
		      'id_user' => $this->session->userdata('id_user'),
			  'id_kasir' => $this->session->userdata('id_kasir'),
		      'id_stok_barang' => $id_stok_barang,
		      'id_barang' => $id_barang[$idx],
		      'nama_barang' => $nama_b,
		      'jumlah' => str_replace(',', '', $jumlah[$idx]),
		      'harga_jual' => str_replace(',', '', $harga_jual[$idx]),
		      'total_harga' => str_replace(',', '', $total_harga[$idx])
		    ]);
		    	
		    // getting barang
		    $this->db->select('*');
		    $this->db->from('barang');
		    $this->db->where('id', $id_barang[$idx]);
		    $row = $this->db->get()->row_array();

		    $stok = $row['stok'];
		    $tambah_stok = $stok + str_replace(',', '', $jumlah[$idx]);

		    array_push($data_stok_update, ['stok' => $tambah_stok, 'id' => $id_barang[$idx]]);
		}

		// update batch stok
		if(!empty($data_stok_update)) {
		    $this->db->update_batch('barang', $data_stok_update, 'id');
		}

		// insert stok barang detail
	    return $this->db->insert_batch('stok_barang_detail', $data_stok_barang_detail);
	}

	public function hapus($id)
	{
		$stok_barang_detail = $this->db->get_where('stok_barang_detail', ['id_stok_barang' => $id])->result_array();

		$update_stok_barang = [];
		$delete_stok_barang_detail = [];
		foreach ($stok_barang_detail as $key => $stok_detail) {
			$jumlah = (int) $stok_detail['jumlah'];
			$data_barang = $this->db->get_where('barang', ['id' => $stok_detail['id_barang']])->row_array();
			$stok_barang = (int) $data_barang['stok'];
			$id_barang = (int) $data_barang['id'];

			// data update stok barang
			array_push($update_stok_barang, [
				'stok' => $stok_barang - $jumlah,
				'id' => $id_barang
			]);

			// data delete stok barang detail
			$delete_stok_barang_detail[] = $stok_detail['id'];
		}

		if(count($update_stok_barang) > 0 && count($delete_stok_barang_detail) > 0) {
			// update stok barang
			$this->db->update_batch('barang', $update_stok_barang, 'id');

			// delete stok barang detail
			$this->db->where_in('id', $delete_stok_barang_detail);
			$this->db->delete('stok_barang_detail');
		}

		// delete stok barang
		$this->db->where('id', $id);
    	return $this->db->delete('stok_barang');
	}
}

/* End of file M_stok_barang.php */
/* Location: ./application/models/M_stok_barang.php */