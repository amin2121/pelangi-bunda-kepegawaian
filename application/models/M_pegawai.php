<?php
class M_pegawai extends CI_Model{

  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function kode_pegawai(){
    $q = $this->db->query("SELECT
                            MAX(RIGHT(kode,4)) AS kd_max
                            FROM pegawai
                            ");
    $kd = "";
    if($q->num_rows()>0){
        foreach($q->result() as $k){
            $tmp = ((int)$k->kd_max)+1;
            $kd = sprintf("%04s", $tmp);
        }
    }else{
        $kd = "0001";
    }

    $kode = 'P'.$kd;
    return $kode;
  }

  public function tambah(){
    $id_jabatan = $this->input->post('id_jabatan');
    $jabatan = $this->db->get_where('jabatan', ['id' => $id_jabatan])->row_array();

    $data = array(
      'kode' => $this->kode_pegawai(),
      'nama' => $this->input->post('nama'),
      'no_rekening' => $this->input->post('no_rekening'),
      'alamat' => $this->input->post('alamat'),
      'telepon' => $this->input->post('telepon'),
      'id_jabatan' => $id_jabatan,
      'jabatan' => $jabatan['jabatan'],
      'gaji' => $this->input->post('gaji'),
      'bpjs' => $this->input->post('bpjs'),
      'status_pegawai' => $this->input->post('status_pegawai'),
      'tanggal' => date('d-m-Y'),
      'waktu' => date('H:i:s'),
    );

    $this->db->insert('pegawai', $data);
  }

  public function edit(){
    $id_jabatan = $this->input->post('id_jabatan');
    $jabatan = $this->db->get_where('jabatan', ['id' => $id_jabatan])->row_array();

    $data = array(
      'nama' => $this->input->post('nama'),
      'no_rekening' => $this->input->post('no_rekening'),
      'alamat' => $this->input->post('alamat'),
      'telepon' => $this->input->post('telepon'),
      'id_jabatan' => $id_jabatan,
      'jabatan' => $jabatan['jabatan'],
      'gaji' => $this->input->post('gaji'),
      'bpjs' => $this->input->post('bpjs'),
      'status_pegawai' => $this->input->post('status_pegawai'),
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('pegawai', $data);
  }

  public function hapus($id){
    $this->db->where('id', $id);
    $this->db->delete('pegawai');
  }

  public function pegawai_result($search){
    $sql = $this->db->query("SELECT
                            a.*,
                            b.jabatan
                            FROM
                            pegawai a
                            LEFT JOIN jabatan b ON a.id_jabatan = b.id
                            WHERE a.nama LIKE '%$search%'
                            ORDER BY a.id DESC
                            LIMIT 500
                           ");

    return $sql->result_array();
  }

  public function jabatan_result(){
    $sql = $this->db->get('jabatan');
    return $sql->result_array();
  }

  public function pegawai_row($id){
    $this->db->select('a.*');
    $this->db->from('pegawai a');
    $this->db->where('a.id', $id);
    return $this->db->get()->row_array();
  }
}
