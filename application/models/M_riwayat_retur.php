<?php
class M_riwayat_retur extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function riwayat_retur_result(){
    $id_user = $this->session->userdata('id_user');
    $id_kasir = $this->session->userdata('id_kasir');
    if ($this->session->userdata('level') == 'Admin') {
      $sql = $this->db->query("SELECT
                               a.*,
                               b.nama_lengkap
                               FROM retur a
                               LEFT JOIN user b ON a.id_kasir = b.id
                               WHERE a.id_user = $id_user
                               AND status = '1'
                               ORDER BY STR_TO_DATE(a.tanggal, '%d-%m-%Y') DESC,
                               STR_TO_DATE(a.waktu, '%H:%i:%s') DESC
                               LIMIT 1000
                              ");
    }else {
      $sql = $this->db->query("SELECT
                               a.*,
                               b.nama_lengkap
                               FROM retur a
                               LEFT JOIN user b ON a.id_kasir = b.id
                               WHERE a.id_user = $id_user
                               AND a.id_kasir = $id_kasir
                               AND status = '1'
                               ORDER BY STR_TO_DATE(a.tanggal, '%d-%m-%Y') DESC,
                               STR_TO_DATE(a.waktu, '%H:%i:%s') DESC
                               LIMIT 1000
                              ");
    }
    return $sql->result_array();
  }

  public function filter_tanggal($tanggal_dari, $tanggal_sampai){
    $tahun_dari = substr($tanggal_dari, 0, 4);
    $bulan_dari = substr($tanggal_dari, 5, 2);
    $hari_dari = substr($tanggal_dari, 8, 2);

    $tanggal_dari_fix = $hari_dari.'-'.$bulan_dari.'-'.$tahun_dari;

    $tahun_sampai = substr($tanggal_sampai, 0, 4);
    $bulan_sampai = substr($tanggal_sampai, 5, 2);
    $hari_sampai = substr($tanggal_sampai, 8, 2);

    $tanggal_sampai_fix = $hari_sampai.'-'.$bulan_sampai.'-'.$tahun_sampai;

    $id_user = $this->session->userdata('id_user');
    $id_kasir = $this->session->userdata('id_kasir');

    if ($this->session->userdata('level') == 'Admin') {
    $sql = $this->db->query("SELECT
                             a.*,
                             b.nama_lengkap
                             FROM retur a
                             LEFT JOIN user b ON a.id_kasir = b.id
                             WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y')
														 AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y')
                             AND a.id_user = $id_user
                             AND status = '1'
                             ORDER BY STR_TO_DATE(a.tanggal, '%d-%m-%Y') DESC,
                             STR_TO_DATE(a.waktu, '%H:%i:%s') DESC
                            ");
    }else {
    $sql = $this->db->query("SELECT
                             a.*,
                             b.nama_lengkap
                             FROM retur a
                             LEFT JOIN user b ON a.id_kasir = b.id
                             WHERE STR_TO_DATE(a.tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y')
														 AND STR_TO_DATE(a.tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y')
                             AND a.id_user = $id_user
                             AND a.id_kasir = $id_kasir
                             AND status = '1'
                             ORDER BY STR_TO_DATE(a.tanggal, '%d-%m-%Y') DESC,
                             STR_TO_DATE(a.waktu, '%H:%i:%s') DESC
                            ");
    }
    return $sql->result_array();
  }

  public function filter_no_transaksi($search){
    if($search != ""){
      $like = $this->db->like('a.no_transaksi', $search);
      $limit = $this->db->limit('500');
    }else{
      $like = "";
      $limit = $this->db->limit('1000');
    }

    if ($this->session->userdata('level') == 'Admin') {
      $this->db->select('a.*, b.nama_lengkap');
      $this->db->from('retur a');
      $this->db->join('user b', 'a.id_kasir = b.id');
      $this->db->where('a.id_user', $this->session->userdata('id_user'));
      $this->db->where('status', '1');
      $like;
      $limit;
      return $this->db->get()->result_array();
    }else {
      $this->db->select('a.*, b.nama_lengkap');
      $this->db->from('retur a');
      $this->db->join('user b', 'a.id_kasir = b.id');
      $this->db->where('a.id_user', $this->session->userdata('id_user'));
      $this->db->where('a.id_kasir', $this->session->userdata('id_kasir'));
      $this->db->where('status', '1');
      $like;
      $limit;
      return $this->db->get()->result_array();
    }
  }

  public function detail_penjualan($id){
    $this->db->select('a.*');
    $this->db->from('retur_detail a');
    $this->db->where('a.id_pembayaran', $id);
    $this->db->where('a.id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }
  
}
