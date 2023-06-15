<?php
class Barang extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_barang','model');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'barang';
    $data['gambar_default'] = $this->db->get('gambar_default')->row_array();

    $this->load->view('templates/header', $data);
    $this->load->view('barang', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }
    $data['active'] = 'barang';
    // $data['kode_barang'] = $this->model->get_kode_barang();
    $data['jenis_barang'] = $this->model->jenis_barang_result();

    $this->load->view('templates/header', $data);
    $this->load->view('barang/tambah', $data);
    $this->load->view('templates/footer');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'barang';
    $data['row'] = $this->model->barang_row($id);
    $data['jenis_barang'] = $this->model->jenis_barang_result();

    $this->load->view('templates/header', $data);
    $this->load->view('barang/edit', $data);
    $this->load->view('templates/footer');
  }

  public function view_stok($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'barang';
    $data['id_barang'] = $id;
    $data['row'] = $this->model->cek_stok($id);

    $this->load->view('templates/header', $data);
    $this->load->view('barang/stok', $data);
    $this->load->view('templates/footer');
  }

  public function view_produksi($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'barang';

    $row = $this->db->get_where('barang', array('id' => $id))->row_array();

    $data['id_barang'] = $id;
    $data['nama_barang'] = $row['nama_barang'];
    $data['result'] = $this->model->produksi_result($id);

    $this->load->view('templates/header', $data);
    $this->load->view('barang/produksi', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->model->tambah();
    redirect('barang');
  }

  public function edit(){
    $this->model->edit();
    redirect('barang');
  }

  public function hapus(){
    $id = $this->input->post('id');
    $data = $this->model->hapus($id);

    echo json_encode($data);
  }

  public function tambah_stok(){
    $this->model->tambah_stok();
    redirect('barang');
  }

  public function barang_result(){
    $search = $this->input->post('search');

    $data = $this->model->barang_result($search);

    echo json_encode($data);
  }

  public function barang_detail(){
    $id = $this->input->post('id');
    $data = $this->model->barang_detail($id);

    echo json_encode($data);
  }

  public function get_nama_bahan(){
    $search = $this->input->post('search');
    $data = $this->model->get_nama_bahan($search);

    echo json_encode($data);
  }

  public function simpan_bahan(){
    $id_barang = $this->input->post('id_barang');
    $nama_barang = $this->input->post('nama_barang');

    $id_bahan = $this->input->post('id_bahan');
    $nama_bahan = $this->input->post('nama_bahan');
    $jumlah = $this->input->post('jumlah');

    foreach ($id_bahan as $key => $value) {
      $this->model->simpan_bahan($id_barang, $nama_barang, $value, $nama_bahan[$key], $jumlah[$key]);
    }

    redirect('barang');
  }

  public function klik_bahan(){
    $id = $this->input->post('id');
    $data = $this->model->klik_bahan($id);

    echo json_encode($data);
  }

  public function hapus_bahan($id, $id_barang){
    $this->model->hapus_bahan($id);

    redirect('barang/view_produksi/'.$id_barang);
  }

  public function ekspor_barang(){
    $data['res'] = $this->model->ekspor_barang();

    $filename = 'ekspor_barang_'.date('d_m_y');
    $data['filename'] = $filename;
    $this->load->view('cetak/xls/ekspor_barang', $data);
  }

  public function import_barang(){
    include APPPATH.'third_party/PHPExcel/PHPExcel.php';

    $filename_upload = $this->model->upload_file();
    $path = 'assets/xls/barang/'.$filename_upload;    

    $object = PHPExcel_IOFactory::load($path);
    foreach($object->getWorksheetIterator() as $worksheet){
      $highestRow = $worksheet->getHighestRow();
      $highestColumn = $worksheet->getHighestColumn();
      for($row = 4; $row <= $highestRow; $row++){
        $jenis_barang = $worksheet->getCellByColumnAndRow(0, $row)->getValue();
        $nama_barang = $worksheet->getCellByColumnAndRow(1, $row)->getValue();
        $harga_barang = $worksheet->getCellByColumnAndRow(2, $row)->getValue();
        $status_produksi = $worksheet->getCellByColumnAndRow(3, $row)->getValue();

        $this->cek_jenis_barang($jenis_barang);
        $id_jenis_barang = $this->cek_id_jenis_barang($jenis_barang);

        $data[] = array(
          'id_user'	=>	$this->session->userdata('id_user'),
          'id_jenis_barang'	=>	$id_jenis_barang,
          'nama_jenis_barang' =>	$jenis_barang,
          'nama_barang' =>	$nama_barang,
          'tanggal' => date('d-m-Y'),
          'harga_jual' =>	$harga_barang,
          'foto_barang' => 'no_avatar.jpg',
          'status_produksi' =>	$status_produksi
        );

      }
    }
    $this->model->import_barang($data);
    redirect('barang');
  }

  public function cek_jenis_barang($jenis_barang){
    $this->db->select('COUNT(id) AS jumlah');
    $this->db->from('jenis_barang');
    $this->db->like('nama_jenis_barang', $jenis_barang);
    $rj = $this->db->get()->row_array();

    if ($rj['jumlah'] == '0') {
      $data_jenis = array(
        'id_user' => $this->session->userdata('id_user'),
        'nama_jenis_barang' => $jenis_barang
      );

      $this->db->insert('jenis_barang', $data_jenis);
    }else {

    }
  }

  public function cek_id_jenis_barang($jenis_barang){
    $this->db->select('*');
    $this->db->from('jenis_barang');
    $this->db->like('nama_jenis_barang', $jenis_barang);
    $rj = $this->db->get()->row_array();
    return $rj['id'];
  }
}
