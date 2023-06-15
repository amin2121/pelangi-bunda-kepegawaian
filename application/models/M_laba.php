<?php
class M_laba extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function filter_tanggal($tanggal_dari_fix, $tanggal_sampai_fix){
    $id_user = $this->session->userdata('id_user');
    $sql = $this->db->query("SELECT
                             *
                             FROM penjualan
                             WHERE STR_TO_DATE(tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y')
														 AND STR_TO_DATE(tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y')
                             AND id_user = $id_user
                            ");
    return $sql->result_array();
  }

  public function tambah_pemasukan(){
    $this->db->select('RIGHT(pemasukan.invoice,4) as kode, pemasukan.id_user', FALSE);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $this->db->order_by('invoice','DESC');
    $this->db->limit(1);
    $query = $this->db->get('pemasukan');      //cek dulu apakah ada sudah ada kode di tabel.
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
    $kodejadi = "PMS".$tanggal.$kodemax;    // hasilnya ODJ-9921-0001 dst.

    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'invoice' => $kodejadi,
      'nama_pemasukan' => $this->input->post('nama_filter'),
      'nominal' => $this->input->post('total_laba'),
      'keterangan' => '-',
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
      'bulan' => date('m'),
      'tahun' => date('Y')
    );
    $this->db->insert('pemasukan', $data);
  }
}
