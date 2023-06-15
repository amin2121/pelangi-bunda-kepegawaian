<?php
class Login extends CI_Controller{
  function __construct(){
		parent::__construct();
		$this->load->model('M_login','model');
    date_default_timezone_set('Asia/Jakarta');
  }

  public function index(){
    // $serial = shell_exec('wmic bios get serialnumber 2>&1');
    // $r1 = str_replace('SerialNumber','', $serial);
    // $string = preg_replace('/\s+/', '', $r1);
    //
    // if ($string != 'LXRFK0C03411916CF02000') {
    //   $this->load->view('error_404');
    // }else {
    //   if ($this->session->userdata('logged_in')) {
    //   redirect('home');
    //   }
    //
    //   $this->load->view('login');
    // }

    if ($this->session->userdata('logged_in')) {
      redirect('home');
    }

    $data['struk'] = $this->db->get('struk')->row_array();

    $this->load->view('login', $data);
  }

  public function page_error(){
    $this->load->view('');
  }

  public function masuk(){
      $username = $this->input->post('username');
      $password = md5($this->input->post('password'));
      $id_user = $this->model->masuk($username, $password);
      if ($id_user) {
        $user_data = array(
          'id_user' => $id_user['id_user'],
          'id_kasir' => $id_user['id'],
          'username' => $username,
          'level' => $id_user['level'],
          'id_level' => $id_user['id_level'],
          'nama_lengkap' => $id_user['nama_lengkap'],
          'nama_toko' => $id_user['nama_toko'],
          'logged_in' => true
        );
        $this->session->set_userdata($user_data);

        $id_login = $this->session->userdata('id_user');
        $this->db->query("UPDATE user SET status_login = '1' WHERE id = '$id_login'");
        redirect('home');
      }else {
        $this->session->set_flashdata('login_gagal', '1');
        redirect('login');
      }
  }

  public function keluar(){
      $id_user = $this->session->userdata('id_user');
      $this->db->query("UPDATE user SET status_login = '0' WHERE id = '$id_user'");

      $this->session->unset_userdata('logged_in');
      $this->session->unset_userdata('id_user');
      $this->session->unset_userdata('username');
      $this->session->sess_destroy();
      // $this->session->set_flashdata('user_loggedout', 'You are now logged out');
      redirect('login');
    }
}
