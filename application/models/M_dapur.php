<?php
class M_dapur extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function pesanan_result(){
    $this->db->select('*');
    $this->db->from('pembayaran');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $this->db->where('status_dapur', '0');
    return $this->db->get()->result_array();
  }

  public function detail_pesanan($id){
    $this->db->select('*');
    $this->db->from('pembayaran_detail');
    $this->db->where('id_pembayaran', $id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function pesanan_selesai($id){
    $data = array(
      'status_dapur' => '1'
    );

    $this->db->where('id', $id);
    $this->db->update('pembayaran', $data);
  }

  public function jumlah_data(){
    $id_user = $this->session->userdata('id_user');
    $sql = $this->db->query("SELECT
                             COUNT(id) as jumlah_data
                             FROM pembayaran
                             WHERE id_user = '$id_user'
                             AND status_dapur = '0'
                             ");
    return $sql->row_array();
  }
}
