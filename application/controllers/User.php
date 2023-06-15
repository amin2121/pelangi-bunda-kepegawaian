<?php
class User extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_user','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'user';
    $data['user'] = $this->model->user_result();

    $this->load->view('templates/header', $data);
    $this->load->view('user', $data);
    $this->load->view('templates/footer');
  }

  public function view_tambah(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }

    $data['active'] = 'user';
    $data['level'] = $this->db->get('level')->result_array();

    $this->load->view('templates/header', $data);
    $this->load->view('user/tambah');
    $this->load->view('templates/footer');
  }

  public function view_edit($id){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'user';
    $data['row'] = $this->model->user_row($id);
    $data['level'] = $this->db->get('level')->result_array();

    $this->load->view('templates/header', $data);
    $this->load->view('user/edit', $data);
    $this->load->view('templates/footer');
  }

  public function tambah(){
    $this->form_validation->set_rules('username', 'Username', 'required|callback_check_username');
    // if ($this->form_validation->run() == FALSE){
    //   $this->session->set_flashdata('check_username', '1');
    //   redirect('user/view_tambah');
    // }else {
    //   $this->model->tambah();
    //   redirect('user');
    // }

    $this->model->tambah();
    redirect('user');
  }

  // public function check_username($username){
  //    if ($this->model->check_username($username)) {
  //      return true;
  //    }else {
  //      return false;
  //    }
  //  }

  public function tambah_pelanggan(){
   	$username = $this->input->post('username');
  	$sql = $this->db->query("SELECT username FROM user where username='$username'");
  	$cek_username = $sql->num_rows();
  	if ($cek_username > 0) {
  		$response = 1;
  		$this->output
          ->set_status_header(200)
          ->set_content_type('application/json', 'utf-8')
          ->set_output(json_encode($response,  JSON_PRETTY_PRINT))
          ->_display();
          exit;

  	}else{

      $data['username'] = $this->input->post('username');
  		$data['password'] = md5($this->input->post('password'));
  		$data['nama_toko'] = $this->input->post('nama_toko');
  		$data['nama_lengkap'] = $this->input->post('nama_lengkap');
  		$data['alamat'] = $this->input->post('alamat');
  		$data['no_telepon'] = $this->input->post('no_telepon');
  		$data['level'] = $this->input->post('level');
  		$data['latitude'] = $this->input->post('latitude');
  		$data['longitude'] = $this->input->post('longitude');
  		$data['created_at'] = date("Y-m-d H:i:s");

  		$images = $this->input->post('ktp');
  		$err = 0;
  		$random = uniqid().substr(str_shuffle("0123456789abcdefghijklmnopqrstvwxyz"), 0, 11).".png";
  		$path = "./assets/ktp_pengguna/";

  		if (file_put_contents($path."/".$random,base64_decode($images))){

  		$data['ktp'] = $random;

  		$response = $this->model->tambah_pelanggan($data);

  		$this->output
          ->set_status_header(200)
          ->set_content_type('application/json', 'utf-8')
          ->set_output(json_encode($response,  JSON_PRETTY_PRINT))
          ->_display();
          exit;

          }else{
  			$err++;
  		}
  	}
  }

  public function edit(){
    $this->model->edit();
    redirect('user');
  }

  public function hapus($id){
    $this->model->hapus($id);
    redirect('user');
  }

  public function detail_user(){
    $id = $this->input->post('id');
    $data = $this->model->detail_user($id);

    echo json_encode($data);
  }

  public function reset_data(){
    $this->model->reset_data();
    redirect('user');
  }

  public function backup_database() {
      // Load the DB utility class
      $this->load->dbutil();

      // Backup your entire database and assign it to a variable

      $backup =& $this->dbutil->backup(); 

      // Load the file helper and write the file to your server

      $this->load->helper('file');

      $date = date('d-m-Y');
      write_file("/assets/database_backup/backup-data-$date.sql", $backup); 

      // Load the download helper and send the file to your desktop

      $this->load->helper('download');

      force_download("backup-data-$date.sql", $backup);
  }

}
