<?php
class M_pemasukan extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function get_no_transaksi(){
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
    return $kodejadi;
  }  

  public function tambah(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'invoice' => $this->input->post('invoice'),
      'nama_pemasukan' => $this->input->post('nama_pemasukan'),
      'nominal' => str_replace(',', '', $this->input->post('nominal')),
      'keterangan' => $this->input->post('keterangan'),
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
      'bulan' => date('m'),
      'tahun' => date('Y')
    );

    $this->db->insert('pemasukan', $data);
  }

  public function edit(){
    $data = array(
      'id_user' => $this->session->userdata('id_user'),
      'nama_pemasukan' => $this->input->post('nama_pemasukan'),
      'nominal' => str_replace(',', '', $this->input->post('nominal')),
      'keterangan' => $this->input->post('keterangan'),
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
      'bulan' => date('m'),
      'tahun' => date('Y')
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('pemasukan', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('pemasukan');
  }

  public function pemasukan_result(){
    $this->db->select('*');
    $this->db->from('pemasukan');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->result_array();
  }

  public function pemasukan_row($id){
    $this->db->select('*');
    $this->db->from('pemasukan');
    $this->db->where('id',$id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }
}
