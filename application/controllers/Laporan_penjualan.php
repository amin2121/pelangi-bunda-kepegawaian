<?php
class Laporan_penjualan extends CI_Controller{
  function __construct(){
		parent::__construct();
		// $this->load->model('M_laba','model');
    date_default_timezone_set('Asia/Jakarta');
    $this->load->database();
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'laporan';

    $this->db->select('*');
    $this->db->from('user');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $us = $this->db->get()->result_array();

    $data['user'] = $us;

    $this->load->view('templates/header', $data);
    $this->load->view('laporan/laporan_penjualan', $data);
    $this->load->view('templates/footer');
  }

  public function print_laporan(){

    $filter = $this->input->post('filter');
    if ($filter == 'hari') {
      $tanggal_dari = $this->input->post('dari_tanggal');
      $tahun_dari = substr($tanggal_dari, 0, 4);
      $bulan_dari = substr($tanggal_dari, 5, 2);
      $hari_dari = substr($tanggal_dari, 8, 2);
      $tanggal_dari_fix = $hari_dari.'-'.$bulan_dari.'-'.$tahun_dari;

      $tanggal_sampai = $this->input->post('sampai_tanggal');
      $tahun_sampai = substr($tanggal_sampai, 0, 4);
      $bulan_sampai = substr($tanggal_sampai, 5, 2);
      $hari_sampai = substr($tanggal_sampai, 8, 2);
      $tanggal_sampai_fix = $hari_sampai.'-'.$bulan_sampai.'-'.$tahun_sampai;

      $id_user = $this->session->userdata('id_user');

      if ($this->session->userdata('level') == 'Admin') {
        $user_hari = $this->input->post('user_hari');
        if ($this->input->post('user_hari') == 'semua') {
          $user = "";
          $nama_user = "Semua";
        }else {
          $user = "AND id_kasir = $user_hari";
          $usi = $this->db->get_where('user', array('id' => $user_hari))->row_array();
          $nama_user = $usi['nama_lengkap'];
        }
      }else {
        $user_hari = $this->session->userdata('id_kasir');
        $user = "AND id_kasir = $user_hari";
        $usi = $this->db->get_where('user', array('id' => $user_hari))->row_array();
        $nama_user = $usi['nama_lengkap'];
      }

      $tanggal_sql = $this->db->query("SELECT
                                       tanggal,
                                       SUM(nilai_transaksi) as nilai_transaksi,
                                       COUNT(id) as jumlah_penjualan,
                                       SUM(nilai_total_laba) as total_laba
                                       FROM pembayaran
                                       WHERE STR_TO_DATE(tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y')
                                       AND STR_TO_DATE(tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y')
                                       AND id_user = $id_user
                                       AND status = '1'
                                       $user
                                       GROUP BY tanggal
                                      ");
      $res_tanggal = $tanggal_sql->result_array();

      $data['judul'] = $tanggal_dari_fix.' - '.$tanggal_sampai_fix;
      $data['result'] = $res_tanggal;
      $data['title'] = 'Hari';
      $data['kasir'] = $nama_user;
      $this->load->view('laporan/cetak/laporan_penjualan', $data);

    }elseif ($filter == 'bulan') {
      $bulan = $this->input->post('filter_bulan');
      $tahun = $this->input->post('filter_tahun_bulan');

      if ($this->session->userdata('level') == 'Admin') {
        $user_bulan = $this->input->post('user_bulan');
        if ($this->input->post('user_bulan') == 'semua') {
          $user = '';
          $nama_user = 'Semua';
        }else {
          $user = $this->db->where('id_kasir', $this->input->post('user_bulan'));

          $usi = $this->db->query("SELECT * FROM user where id = '$user_bulan'")->row_array();
          $nama_user = $usi['nama_lengkap'];
        }
      }else {
        $user_bulan = $this->session->userdata('id_kasir');
        $user = $this->db->where('id_kasir', $user_bulan);

        $usi = $this->db->query("SELECT * FROM user where id = '$user_bulan'")->row_array();
        $nama_user = $usi['nama_lengkap'];
      }

      $this->db->select('
                        tanggal,
                        SUM(nilai_transaksi) as nilai_transaksi,
                        COUNT(id) as jumlah_penjualan,
                        SUM(nilai_total_laba) as total_laba
      ');
      $this->db->from('pembayaran');
      $this->db->where('bulan', $bulan);
      $this->db->where('tahun', $tahun);
      $this->db->where('id_user', $this->session->userdata('id_user'));
      $this->db->where('status', '1');
      $user;
      $this->db->group_by('tanggal');
      $res_bulan = $this->db->get()->result_array();

      if ($bulan == '01') {
        $nama_bulan = 'Januari';
      }elseif ($bulan == '02') {
        $nama_bulan = 'Februari';
      }elseif ($bulan == '03') {
        $nama_bulan = 'Maret';
      }elseif ($bulan == '04') {
        $nama_bulan = 'April';
      }elseif ($bulan == '05') {
        $nama_bulan = 'Mei';
      }elseif ($bulan == '06') {
        $nama_bulan = 'Juni';
      }elseif ($bulan == '07') {
        $nama_bulan = 'Juli';
      }elseif ($bulan == '08') {
        $nama_bulan = 'Agustus';
      }elseif ($bulan == '09') {
        $nama_bulan = 'September';
      }elseif ($bulan == '10') {
        $nama_bulan = 'Oktober';
      }elseif ($bulan == '11') {
        $nama_bulan = 'November';
      }elseif ($bulan == '12') {
        $nama_bulan = 'Desember';
      }

      $data['judul'] = $nama_bulan.' '.$tahun;
      $data['result'] = $res_bulan;
      $data['title'] = 'Bulan';
      $data['kasir'] = $nama_user;
      $this->load->view('laporan/cetak/laporan_penjualan', $data);

    }elseif ($filter == 'tahun') {

      $tahun = $this->input->post('filter_tahun');
      $id_user = $this->session->userdata('id_user');

      if ($this->session->userdata('level') == 'Admin') {
        $user_tahun = $this->input->post('user_tahun');
        if ($this->input->post('user_tahun') == 'semua') {
          $user = "";
          $nama_user = 'Semua';
        }else {
          $user = "AND id_kasir = $user_tahun";
          $usi = $this->db->get_where('user', array('id' => $user_tahun))->row_array();
          $nama_user = $usi['nama_lengkap'];
        }
      }else {
        $user_tahun = $this->session->userdata('id_kasir');
        $user = "AND id_kasir = $user_tahun";
        $usi = $this->db->get_where('user', array('id' => $user_tahun))->row_array();
        $nama_user = $usi['nama_lengkap'];
      }

      $sql_tahun = $this->db->query("SELECT
                                    a.bulan as tanggal,
                                    a.id_user,
                                    SUM(a.nilai_transaksi) as nilai_transaksi,
                                    COUNT(id) as jumlah_penjualan,
                                    SUM(nilai_total_laba) as total_laba
                                    FROM(
                                    SELECT
                                    *
                                    FROM pembayaran
                                    ) a
                                    WHERE a.tahun = '$tahun'
                                    AND a.id_user = '$id_user'
                                    AND a.status = '1'
                                    $user
                                    GROUP BY bulan");
      $res_tahun = $sql_tahun->result_array();

      $data['judul'] = $tahun;
      $data['result'] = $res_tahun;
      $data['title'] = 'Tahun';
      $data['kasir'] = $nama_user;
      $this->load->view('laporan/cetak/laporan_penjualan', $data);

    }
  }

  public function cek_laporan(){
    $filter = $this->input->post('filter');
    if ($filter == 'hari') {
      $tanggal_dari = $this->input->post('dari_tanggal');
      $tahun_dari = substr($tanggal_dari, 0, 4);
      $bulan_dari = substr($tanggal_dari, 5, 2);
      $hari_dari = substr($tanggal_dari, 8, 2);
      $tanggal_dari_fix = $hari_dari.'-'.$bulan_dari.'-'.$tahun_dari;

      $tanggal_sampai = $this->input->post('sampai_tanggal');
      $tahun_sampai = substr($tanggal_sampai, 0, 4);
      $bulan_sampai = substr($tanggal_sampai, 5, 2);
      $hari_sampai = substr($tanggal_sampai, 8, 2);
      $tanggal_sampai_fix = $hari_sampai.'-'.$bulan_sampai.'-'.$tahun_sampai;

      $id_user = $this->session->userdata('id_user');

      if ($this->session->userdata('level') == 'Admin') {
        $user_hari = $this->input->post('user_hari');
        if ($this->input->post('user_hari') == 'semua') {
          $user = "";
          $nama_user = "Semua";
        }else {
          $user = "AND id_kasir = $user_hari";
          $usi = $this->db->get_where('user', array('id' => $user_hari))->row_array();
          $nama_user = $usi['nama_lengkap'];
        }
      }else {
        $user_hari = $this->session->userdata('id_kasir');
        $user = "AND id_kasir = $user_hari";
        $usi = $this->db->get_where('user', array('id' => $user_hari))->row_array();
        $nama_user = $usi['nama_lengkap'];
      }

      $tanggal_sql = $this->db->query("SELECT
                                       tanggal,
                                       SUM(nilai_transaksi) as nilai_transaksi,
                                       COUNT(id) as jumlah_penjualan,
                                       SUM(nilai_total_laba) as total_laba
                                       FROM pembayaran
                                       WHERE STR_TO_DATE(tanggal,'%d-%m-%Y') >= STR_TO_DATE('$tanggal_dari_fix','%d-%m-%Y')
                                       AND STR_TO_DATE(tanggal,'%d-%m-%Y') <= STR_TO_DATE('$tanggal_sampai_fix','%d-%m-%Y')
                                       AND id_user = $id_user
                                       AND status = '1'
                                       $user
                                       GROUP BY tanggal
                                      ");
      $res_tanggal = $tanggal_sql->result_array();
      echo json_encode($res_tanggal);
    }elseif ($filter == 'bulan') {
      $bulan = $this->input->post('filter_bulan');
      $tahun = $this->input->post('filter_tahun_bulan');

      if ($this->session->userdata('level') == 'Admin') {
        $user_bulan = $this->input->post('user_bulan');
        if ($this->input->post('user_bulan') == 'semua') {
          $user = '';
          $nama_user = 'Semua';
        }else {
          $user = $this->db->where('id_kasir', $this->input->post('user_bulan'));

          $usi = $this->db->query("SELECT * FROM user where id = '$user_bulan'")->row_array();
          $nama_user = $usi['nama_lengkap'];
        }
      }else {
        $user_bulan = $this->session->userdata('id_kasir');
        $user = $this->db->where('id_kasir', $user_bulan);

        $usi = $this->db->query("SELECT * FROM user where id = '$user_bulan'")->row_array();
        $nama_user = $usi['nama_lengkap'];
      }

      $this->db->select('
                        tanggal,
                        SUM(nilai_transaksi) as nilai_transaksi,
                        COUNT(id) as jumlah_penjualan,
                        SUM(nilai_total_laba) as total_laba
      ');
      $this->db->from('pembayaran');
      $this->db->where('bulan', $bulan);
      $this->db->where('tahun', $tahun);
      $this->db->where('id_user', $this->session->userdata('id_user'));
      $this->db->where('status', '1');
      $user;
      $this->db->group_by('tanggal');
      $res_bulan = $this->db->get()->result_array();

      echo json_encode($res_bulan);
    }elseif ($filter == 'tahun') {
      $tahun = $this->input->post('filter_tahun');
      $id_user = $this->session->userdata('id_user');

      if ($this->session->userdata('level') == 'Admin') {
        $user_tahun = $this->input->post('user_tahun');
        if ($this->input->post('user_tahun') == 'semua') {
          $user = "";
          $nama_user = 'Semua';
        }else {
          $user = "AND id_kasir = $user_tahun";
          $usi = $this->db->get_where('user', array('id' => $user_tahun))->row_array();
          $nama_user = $usi['nama_lengkap'];
        }
      }else {
        $user_tahun = $this->session->userdata('id_kasir');
        $user = "AND id_kasir = $user_tahun";
        $usi = $this->db->get_where('user', array('id' => $user_tahun))->row_array();
        $nama_user = $usi['nama_lengkap'];
      }

      $sql_tahun = $this->db->query("SELECT
                                    a.bulan as tanggal,
                                    a.id_user,
                                    SUM(a.nilai_transaksi) as nilai_transaksi,
                                    COUNT(id) as jumlah_penjualan,
                                    SUM(a.nilai_total_laba) as total_laba
                                    FROM(
                                    SELECT
                                    *
                                    FROM pembayaran
                                    ) a
                                    WHERE a.tahun = '$tahun'
                                    AND a.id_user = '$id_user'
                                    AND a.status = '1'
                                    $user
                                    GROUP BY bulan");
      $res_tahun = $sql_tahun->result_array();
      echo json_encode($res_tahun);
    }
  }
}
