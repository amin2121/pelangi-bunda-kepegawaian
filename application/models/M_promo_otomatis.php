<?php
class M_promo_otomatis extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function get_no_transaksi(){
    $this->db->select('RIGHT(promo_otomatis.invoice,4) as kode, promo_otomatis.id_user', FALSE);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $this->db->order_by('invoice','DESC');
    $this->db->limit(1);
    $query = $this->db->get('promo_otomatis');      //cek dulu apakah ada sudah ada kode di tabel.
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

  public function tambah_promo_a(){
    $tanggal_mulai = $this->input->post('tanggal_mulai');
    $tahun_mulai = substr($tanggal_mulai, 0, 4);
    $bulan_mulai = substr($tanggal_mulai, 5, 2);
    $hari_mulai = substr($tanggal_mulai, 8, 2);
    $tanggal_mulai_fix = $hari_mulai.'-'.$bulan_mulai.'-'.$tahun_mulai;

    $tanggal_berakhir = $this->input->post('tanggal_berakhir');
    $tahun_berakhir = substr($tanggal_berakhir, 0, 4);
    $bulan_berakhir = substr($tanggal_berakhir, 5, 2);
    $hari_berakhir = substr($tanggal_berakhir, 8, 2);
    $tanggal_berakhir_fix = $hari_berakhir.'-'.$bulan_berakhir.'-'.$tahun_berakhir;

    $diskon = $this->input->post('diskon');

    if ($this->input->post('promo_berdasarkan') == '0') {
      $nama_dipromo = $this->input->post('nama_produk');
    }else {
      $nama_dipromo = $this->input->post('nama_kategori');
    }

    if ($this->input->post('tipe_diskon') == 'nominal') {
      $jumlah_diskon = 'Rp. '.$diskon;
    }else {
      $jumlah_diskon = $diskon.'%';
    }
    $nama_promo = 'Diskon '.$jumlah_diskon.' '.$nama_dipromo;
    $data = array(
      'nama_promo' => $nama_promo,
      'nama_dipromo' => $nama_dipromo,
      'promo_berdasarkan' => $this->input->post('promo_berdasarkan'),
      'diskon' => str_replace(',', '', $diskon),
      'tipe_diskon' => $this->input->post('tipe_diskon'),
      'banyak_beli' => $this->input->post('banyak_beli'),
      'tanggal_mulai' => $tanggal_mulai_fix,
      'tanggal_berakhir' => $tanggal_berakhir_fix,
      'jam_mulai' => date('H:i', strtotime($this->input->post('jam_mulai'))),
      'jam_berakhir' => date('H:i', strtotime($this->input->post('jam_berakhir'))),
      'senin' => $this->input->post('senin'),
      'selasa' => $this->input->post('selasa'),
      'rabu' => $this->input->post('rabu'),
      'kamis' => $this->input->post('kamis'),
      'jumat' => $this->input->post('jumat'),
      'sabtu' => $this->input->post('sabtu'),
      'minggu' => $this->input->post('minggu'),
      'status_promo' => '1'
    );

    $this->db->insert('promo_a', $data);
  }

  public function tambah_promo_b(){
    $tanggal_mulai = $this->input->post('tanggal_mulai');
    $tahun_mulai = substr($tanggal_mulai, 0, 4);
    $bulan_mulai = substr($tanggal_mulai, 5, 2);
    $hari_mulai = substr($tanggal_mulai, 8, 2);
    $tanggal_mulai_fix = $hari_mulai.'-'.$bulan_mulai.'-'.$tahun_mulai;

    $tanggal_berakhir = $this->input->post('tanggal_berakhir');
    $tahun_berakhir = substr($tanggal_berakhir, 0, 4);
    $bulan_berakhir = substr($tanggal_berakhir, 5, 2);
    $hari_berakhir = substr($tanggal_berakhir, 8, 2);
    $tanggal_berakhir_fix = $hari_berakhir.'-'.$bulan_berakhir.'-'.$tahun_berakhir;

    $diskon = $this->input->post('diskon');

    if ($this->input->post('promo_berdasarkan') == '0') {
      $nama_dipromo = $this->input->post('nama_produk');
    }else {
      $nama_dipromo = $this->input->post('nama_kategori');
    }

    if ($this->input->post('tipe_diskon') == 'nominal') {
      $jumlah_diskon = 'Rp. '.$diskon;
    }else {
      $jumlah_diskon = $diskon.'%';
    }
    $nama_promo = 'Diskon '.$jumlah_diskon.' '.$nama_dipromo;
    $data = array(
      'nama_promo' => $nama_promo,
      'nama_dipromo' => $nama_dipromo,
      'promo_berdasarkan' => $this->input->post('promo_berdasarkan'),
      'diskon' => str_replace(',', '', $diskon),
      'tipe_diskon' => $this->input->post('tipe_diskon'),
      'banyak_bayar' => str_replace(',', '', $this->input->post('banyak_bayar')),
      'tanggal_mulai' => $tanggal_mulai_fix,
      'tanggal_berakhir' => $tanggal_berakhir_fix,
      'jam_mulai' => date('H:i', strtotime($this->input->post('jam_mulai'))),
      'jam_berakhir' => date('H:i', strtotime($this->input->post('jam_berakhir'))),
      'senin' => $this->input->post('senin'),
      'selasa' => $this->input->post('selasa'),
      'rabu' => $this->input->post('rabu'),
      'kamis' => $this->input->post('kamis'),
      'jumat' => $this->input->post('jumat'),
      'sabtu' => $this->input->post('sabtu'),
      'minggu' => $this->input->post('minggu'),
      'status_promo' => '1'
    );

    $this->db->insert('promo_b', $data);
  }

  public function tambah_promo_c(){
    $tanggal_mulai = $this->input->post('tanggal_mulai');
    $tahun_mulai = substr($tanggal_mulai, 0, 4);
    $bulan_mulai = substr($tanggal_mulai, 5, 2);
    $hari_mulai = substr($tanggal_mulai, 8, 2);
    $tanggal_mulai_fix = $hari_mulai.'-'.$bulan_mulai.'-'.$tahun_mulai;

    $tanggal_berakhir = $this->input->post('tanggal_berakhir');
    $tahun_berakhir = substr($tanggal_berakhir, 0, 4);
    $bulan_berakhir = substr($tanggal_berakhir, 5, 2);
    $hari_berakhir = substr($tanggal_berakhir, 8, 2);
    $tanggal_berakhir_fix = $hari_berakhir.'-'.$bulan_berakhir.'-'.$tahun_berakhir;


    if ($this->input->post('promo_berdasarkan') == '0') {
      $nama_dipromo = $this->input->post('nama_produk');
    }else {
      $nama_dipromo = $this->input->post('nama_kategori');
    }
    $gratis_barang = $this->input->post('gratis_barang');

    $nama_promo = 'Beli '.$nama_dipromo.' Gratis '.$gratis_barang;
    $data = array(
      'nama_promo' => $nama_promo,
      'nama_dipromo' => $nama_dipromo,
      'gratis_barang' => $gratis_barang,
      'promo_berdasarkan' => $this->input->post('promo_berdasarkan'),
      'status_kelipatan' => $this->input->post('status_kelipatan'),
      'banyak_beli' => $this->input->post('banyak_beli'),
      'banyak_gratis' => $this->input->post('banyak_gratis'),
      'tanggal_mulai' => $tanggal_mulai_fix,
      'tanggal_berakhir' => $tanggal_berakhir_fix,
      'jam_mulai' => date('H:i', strtotime($this->input->post('jam_mulai'))),
      'jam_berakhir' => date('H:i', strtotime($this->input->post('jam_berakhir'))),
      'senin' => $this->input->post('senin'),
      'selasa' => $this->input->post('selasa'),
      'rabu' => $this->input->post('rabu'),
      'kamis' => $this->input->post('kamis'),
      'jumat' => $this->input->post('jumat'),
      'sabtu' => $this->input->post('sabtu'),
      'minggu' => $this->input->post('minggu'),
      'status_promo' => '1'
    );

    $this->db->insert('promo_c', $data);
  }

  public function promo_otomatis_result(){
    $sql = $this->db->query("SELECT
                              id,
                              nama_promo,
                              status_promo,
                              tanggal_mulai,
                              tanggal_berakhir,
                              senin,
                              selasa,
                              rabu,
                              kamis,
                              jumat,
                              sabtu,
                              minggu,
                              jam_mulai,
                              jam_berakhir,
                              'promo_a' AS jenis_promo
                              FROM promo_a

                              UNION ALL

                              SELECT
                              id,
                              nama_promo,
                              status_promo,
                              tanggal_mulai,
                              tanggal_berakhir,
                              senin,
                              selasa,
                              rabu,
                              kamis,
                              jumat,
                              sabtu,
                              minggu,
                              jam_mulai,
                              jam_berakhir,
                              'promo_b' AS jenis_promo
                              FROM promo_b

                              UNION ALL

                              SELECT
                              id,
                              nama_promo,
                              status_promo,
                              tanggal_mulai,
                              tanggal_berakhir,
                              senin,
                              selasa,
                              rabu,
                              kamis,
                              jumat,
                              sabtu,
                              minggu,
                              jam_mulai,
                              jam_berakhir,
                              'promo_c' AS jenis_promo
                              FROM promo_c");
    return $sql->result_array();
  }

  public function promo_otomatis_row($id){
    $this->db->select('*');
    $this->db->from('promo_otomatis');
    $this->db->where('id',$id);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    return $this->db->get()->row_array();
  }

  public function produk_result(){
    return $this->db->get('barang')->result_array();
  }

  public function kategori_result(){
    return $this->db->get('jenis_barang')->result_array();
  }

  public function hapus($id, $promo){
    if ($promo == 'promo_a') {
      $this->db->where('id', $id);
      $this->db->delete('promo_a');
    }elseif ($promo == 'promo_b') {
      $this->db->where('id', $id);
      $this->db->delete('promo_b');
    }elseif ($promo == 'promo_c') {
      $this->db->where('id', $id);
      $this->db->delete('promo_c');
    }
  }

  public function aktifkan($id, $promo){
    if ($promo == 'promo_a') {
      $this->db->query("UPDATE promo_a SET status_promo = '1' WHERE id = '$id'");
    }elseif ($promo == 'promo_b') {
      $this->db->query("UPDATE promo_b SET status_promo = '1' WHERE id = '$id'");
    }elseif ($promo == 'promo_c') {
      $this->db->query("UPDATE promo_c SET status_promo = '1' WHERE id = '$id'");
    }
  }

  public function non_aktifkan($id, $promo){
    if ($promo == 'promo_a') {
      $this->db->query("UPDATE promo_a SET status_promo = '0' WHERE id = '$id'");
    }elseif ($promo == 'promo_b') {
      $this->db->query("UPDATE promo_b SET status_promo = '0' WHERE id = '$id'");
    }elseif ($promo == 'promo_c') {
      $this->db->query("UPDATE promo_c SET status_promo = '0' WHERE id = '$id'");
    }
  }

  public function get_row_promo($id, $promo){
    if ($promo == 'promo_a') {
      return $this->db->get_where('promo_a', array('id' => $id))->row_array();
    }elseif ($promo == 'promo_b') {
      return $this->db->get_where('promo_b', array('id' => $id))->row_array();
    }elseif ($promo == 'promo_c') {
      return $this->db->get_where('promo_c', array('id' => $id))->row_array();
    }
  }

  public function edit_promo_a(){
    $tanggal_mulai = $this->input->post('tanggal_mulai');
    $tahun_mulai = substr($tanggal_mulai, 0, 4);
    $bulan_mulai = substr($tanggal_mulai, 5, 2);
    $hari_mulai = substr($tanggal_mulai, 8, 2);
    $tanggal_mulai_fix = $hari_mulai.'-'.$bulan_mulai.'-'.$tahun_mulai;

    $tanggal_berakhir = $this->input->post('tanggal_berakhir');
    $tahun_berakhir = substr($tanggal_berakhir, 0, 4);
    $bulan_berakhir = substr($tanggal_berakhir, 5, 2);
    $hari_berakhir = substr($tanggal_berakhir, 8, 2);
    $tanggal_berakhir_fix = $hari_berakhir.'-'.$bulan_berakhir.'-'.$tahun_berakhir;

    if ($tanggal_mulai == '' || $tanggal_mulai == null) {
      $tanggal_m = $this->input->post('tanggal_mulai_hidden');
    }else {
      $tanggal_m = $tanggal_mulai_fix;
    }

    if ($tanggal_berakhir == '' || $tanggal_berakhir == null) {
      $tanggal_b = $this->input->post('tanggal_berakhir_hidden');
    }else {
      $tanggal_b = $tanggal_berakhir_fix;
    }

    $diskon = $this->input->post('diskon');

    if ($this->input->post('promo_berdasarkan') == '0') {
      $nama_dipromo = $this->input->post('nama_produk');
    }else {
      $nama_dipromo = $this->input->post('nama_kategori');
    }

    if ($this->input->post('tipe_diskon') == 'nominal') {
      $jumlah_diskon = 'Rp. '.$diskon;
    }else {
      $jumlah_diskon = $diskon.'%';
    }
    $nama_promo = 'Diskon '.$jumlah_diskon.' '.$nama_dipromo;
    $data = array(
      'nama_promo' => $nama_promo,
      'nama_dipromo' => $nama_dipromo,
      'promo_berdasarkan' => $this->input->post('promo_berdasarkan'),
      'diskon' => str_replace(',', '', $diskon),
      'tipe_diskon' => $this->input->post('tipe_diskon'),
      'banyak_beli' => $this->input->post('banyak_beli'),
      'tanggal_mulai' => $tanggal_m,
      'tanggal_berakhir' => $tanggal_b,
      'jam_mulai' => date('H:i', strtotime($this->input->post('jam_mulai'))),
      'jam_berakhir' => date('H:i', strtotime($this->input->post('jam_berakhir'))),
      'senin' => $this->input->post('senin'),
      'selasa' => $this->input->post('selasa'),
      'rabu' => $this->input->post('rabu'),
      'kamis' => $this->input->post('kamis'),
      'jumat' => $this->input->post('jumat'),
      'sabtu' => $this->input->post('sabtu'),
      'minggu' => $this->input->post('minggu'),
      'status_promo' => '1'
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('promo_a', $data);
  }

  public function edit_promo_b(){
    $tanggal_mulai = $this->input->post('tanggal_mulai');
    $tahun_mulai = substr($tanggal_mulai, 0, 4);
    $bulan_mulai = substr($tanggal_mulai, 5, 2);
    $hari_mulai = substr($tanggal_mulai, 8, 2);
    $tanggal_mulai_fix = $hari_mulai.'-'.$bulan_mulai.'-'.$tahun_mulai;

    $tanggal_berakhir = $this->input->post('tanggal_berakhir');
    $tahun_berakhir = substr($tanggal_berakhir, 0, 4);
    $bulan_berakhir = substr($tanggal_berakhir, 5, 2);
    $hari_berakhir = substr($tanggal_berakhir, 8, 2);
    $tanggal_berakhir_fix = $hari_berakhir.'-'.$bulan_berakhir.'-'.$tahun_berakhir;

    if ($tanggal_mulai == '' || $tanggal_mulai == null) {
      $tanggal_m = $this->input->post('tanggal_mulai_hidden');
    }else {
      $tanggal_m = $tanggal_mulai_fix;
    }

    if ($tanggal_berakhir == '' || $tanggal_berakhir == null) {
      $tanggal_b = $this->input->post('tanggal_berakhir_hidden');
    }else {
      $tanggal_b = $tanggal_berakhir_fix;
    }

    $diskon = $this->input->post('diskon');

    if ($this->input->post('promo_berdasarkan') == '0') {
      $nama_dipromo = $this->input->post('nama_produk');
    }else {
      $nama_dipromo = $this->input->post('nama_kategori');
    }

    if ($this->input->post('tipe_diskon') == 'nominal') {
      $jumlah_diskon = 'Rp. '.$diskon;
    }else {
      $jumlah_diskon = $diskon.'%';
    }
    $nama_promo = 'Diskon '.$jumlah_diskon.' '.$nama_dipromo;
    $data = array(
      'nama_promo' => $nama_promo,
      'nama_dipromo' => $nama_dipromo,
      'promo_berdasarkan' => $this->input->post('promo_berdasarkan'),
      'diskon' => str_replace(',', '', $diskon),
      'tipe_diskon' => $this->input->post('tipe_diskon'),
      'banyak_bayar' => str_replace(',', '', $this->input->post('banyak_bayar')),
      'tanggal_mulai' => $tanggal_m,
      'tanggal_berakhir' => $tanggal_b,
      'jam_mulai' => date('h:i', strtotime($this->input->post('jam_mulai'))),
      'jam_berakhir' => date('h:i', strtotime($this->input->post('jam_berakhir'))),
      'senin' => $this->input->post('senin'),
      'selasa' => $this->input->post('selasa'),
      'rabu' => $this->input->post('rabu'),
      'kamis' => $this->input->post('kamis'),
      'jumat' => $this->input->post('jumat'),
      'sabtu' => $this->input->post('sabtu'),
      'minggu' => $this->input->post('minggu')
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('promo_b', $data);
  }

  public function edit_promo_c(){
    $tanggal_mulai = $this->input->post('tanggal_mulai');
    $tahun_mulai = substr($tanggal_mulai, 0, 4);
    $bulan_mulai = substr($tanggal_mulai, 5, 2);
    $hari_mulai = substr($tanggal_mulai, 8, 2);
    $tanggal_mulai_fix = $hari_mulai.'-'.$bulan_mulai.'-'.$tahun_mulai;

    $tanggal_berakhir = $this->input->post('tanggal_berakhir');
    $tahun_berakhir = substr($tanggal_berakhir, 0, 4);
    $bulan_berakhir = substr($tanggal_berakhir, 5, 2);
    $hari_berakhir = substr($tanggal_berakhir, 8, 2);
    $tanggal_berakhir_fix = $hari_berakhir.'-'.$bulan_berakhir.'-'.$tahun_berakhir;

    if ($tanggal_mulai == '' || $tanggal_mulai == null) {
      $tanggal_m = $this->input->post('tanggal_mulai_hidden');
    }else {
      $tanggal_m = $tanggal_mulai_fix;
    }

    if ($tanggal_berakhir == '' || $tanggal_berakhir == null) {
      $tanggal_b = $this->input->post('tanggal_berakhir_hidden');
    }else {
      $tanggal_b = $tanggal_berakhir_fix;
    }


    if ($this->input->post('promo_berdasarkan') == '0') {
      $nama_dipromo = $this->input->post('nama_produk');
    }else {
      $nama_dipromo = $this->input->post('nama_kategori');
    }
    $gratis_barang = $this->input->post('gratis_barang');

    $nama_promo = 'Beli '.$nama_dipromo.' Gratis '.$gratis_barang;
    $data = array(
      'nama_promo' => $nama_promo,
      'nama_dipromo' => $nama_dipromo,
      'gratis_barang' => $gratis_barang,
      'promo_berdasarkan' => $this->input->post('promo_berdasarkan'),
      'status_kelipatan' => $this->input->post('status_kelipatan'),
      'banyak_beli' => $this->input->post('banyak_beli'),
      'banyak_gratis' => $this->input->post('banyak_gratis'),
      'tanggal_mulai' => $tanggal_m,
      'tanggal_berakhir' => $tanggal_b,
      'jam_mulai' => date('H:i', strtotime($this->input->post('jam_mulai'))),
      'jam_berakhir' => date('H:i', strtotime($this->input->post('jam_berakhir'))),
      'senin' => $this->input->post('senin'),
      'selasa' => $this->input->post('selasa'),
      'rabu' => $this->input->post('rabu'),
      'kamis' => $this->input->post('kamis'),
      'jumat' => $this->input->post('jumat'),
      'sabtu' => $this->input->post('sabtu'),
      'minggu' => $this->input->post('minggu'),
      'status_promo' => '1'
    );

    $this->db->where('id', $this->input->post('id'));
    $this->db->update('promo_c', $data);
  }
}
