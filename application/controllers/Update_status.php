<?php
class Update_status extends CI_Controller{
  function __construct(){
    parent::__construct();
    $this->load->database();
  }

  public function index(){
    $sql = $this->db->query("UPDATE faktur
                            SET status_bayar = '1'
                            WHERE tanggal_bayar = DATE_FORMAT(NOW(),'%d-%m-%Y')
                            AND status_bayar = '0'");
  }
}
