<?php
class M_login extends CI_Model{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function masuk($username, $password){
    $this->db->select('*');
    $this->db->from('user');
    $this->db->where('username', $username);
    $this->db->where('password', $password);
    // $this->db->where('status_login', 0);
    $result = $this->db->get();
    if ($result->num_rows() == 1) {
      return $result->row_array();
    }else {
      return false;
    }
  }
}
