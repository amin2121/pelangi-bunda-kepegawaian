<?php
class Home extends CI_Controller{
  function __construct(){
    parent::__construct();
		$this->load->database();
  }

  public function index(){
    if (!$this->session->userdata('logged_in')) {
      redirect('login');
    }

    $data['active'] = 'home';

    $hari = date('d-m-Y');
    $bulan = date('m');
    $tahun = date('Y');

    if ($this->session->userdata('level') == 'Admin') {
      $this->db->select('COUNT(*) AS jumlah_jual');
      $this->db->from('pembayaran');
      $this->db->where('bulan', $bulan);
      $this->db->where('id_user', $this->session->userdata('id_user'));
      $sql_pembayaran = $this->db->get()->row_array();
    } else {
      $this->db->select('COUNT(*) AS jumlah_jual');
      $this->db->from('pembayaran');
      $this->db->where('tahun', $tahun);
      $this->db->where('id_user', $this->session->userdata('id_user'));
      $this->db->where('id_kasir', $this->session->userdata('id_kasir'));
      $sql_pembayaran = $this->db->get()->row_array();
    }

    $this->db->select('COUNT(*) AS jumlah_barang');
    $this->db->from('barang');
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $sql_barang = $this->db->get()->row_array();

    // tahun
    $this->db->select('SUM(nilai_transaksi) AS jumlah_untung');
    $this->db->from('pembayaran');
    $this->db->where('tahun', $tahun);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $sql_keuntungan = $this->db->get()->row_array();

    $this->db->select('SUM(nominal) AS jumlah_keluar');
    $this->db->from('pengeluaran');
    $this->db->where('tahun', $tahun);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $sql_keluaran = $this->db->get()->row_array();

    // bulan
    $this->db->select('SUM(nilai_transaksi) AS jumlah_untung_bulan');
    $this->db->from('pembayaran');
    $this->db->where('bulan', $bulan);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $sql_keuntungan_bulan = $this->db->get()->row_array();

    $this->db->select('SUM(nominal) AS jumlah_keluar_bulan');
    $this->db->from('pengeluaran');
    $this->db->where('bulan', $bulan);
    $this->db->where('id_user', $this->session->userdata('id_user'));
    $sql_keluaran_bulan = $this->db->get()->row_array();

    $data['penjualan'] = $sql_pembayaran;
    $data['barang'] = $sql_barang;
    $data['keuntungan'] = $sql_keuntungan;
    $data['keluaran'] = $sql_keluaran;
    $data['keuntungan_bulan'] = $sql_keuntungan_bulan;
    $data['keluaran_bulan'] = $sql_keluaran_bulan;

    $this->load->view('templates/header', $data);
    $this->load->view('home', $data);
    $this->load->view('templates/footer');
  }

  public function bantuan_aplikasi(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'home';

    $this->load->view('templates/header', $data);
    $this->load->view('bantuan_aplikasi', $data);
    $this->load->view('templates/footer');
  }

  public function tentang_kami(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'home';

    $this->load->view('templates/header', $data);
    $this->load->view('tentang_kami', $data);
    $this->load->view('templates/footer');
  }

  public function chart_pemasukan(){
    $tahun = date('Y');
    $id_user = $this->session->userdata('id_user');
    $query = $this->db->query("SELECT
                                SUM(a.hitung) AS jumlah,
                                a.*
                                FROM(
                                SELECT
                                COUNT(a.id) AS hitung,
                                a.bulan,
                                a.id_user,
                                a.tahun
                                FROM pemasukan a
                                WHERE a.tahun = $tahun
                                GROUP BY a.bulan

                                UNION ALL

                                SELECT
                                COUNT(a.id) AS hitung,
                                a.bulan,
                                a.id_user,
                                a.tahun
                                FROM pembayaran a
                                WHERE a.tahun = $tahun
                                GROUP BY a.bulan
                                ) a
                                WHERE a.id_user = $id_user
                                GROUP BY a.bulan
                               ");
    $data_pemasukan = $query->result_array();

    $array_pemasukan = array();
    foreach ($data_pemasukan as $value) {
      if ($value['bulan'] == '01') {
        $bulan = 'Januari';
      }elseif ($value['bulan'] == '02') {
        $bulan = 'Februari';
      }elseif ($value['bulan'] == '03') {
        $bulan = 'Maret';
      }elseif ($value['bulan'] == '04') {
        $bulan = 'April';
      }elseif ($value['bulan'] == '05') {
        $bulan = 'Mei';
      }elseif ($value['bulan'] == '06') {
        $bulan = 'Juni';
      }elseif ($value['bulan'] == '07') {
        $bulan = 'Juli';
      }elseif ($value['bulan'] == '08') {
        $bulan = 'Agustus';
      }elseif ($value['bulan'] == '09') {
        $bulan = 'September';
      }elseif ($value['bulan'] == '10') {
        $bulan = 'Oktober';
      }elseif ($value['bulan'] == '11') {
        $bulan = 'November';
      }elseif ($value['bulan'] == '12') {
        $bulan = 'Desember';
      }

      $array_pemasukan[] = array(
        'label' => $bulan,
        'y' => intval($value['jumlah'])
      );
    }

    $keluar['pemasukan'] = $array_pemasukan;
    echo json_encode($keluar);
  }

  public function chart_pemasukan_perbulan(){
    $id_user = $this->session->userdata('id_user');
    $tahun = date('Y');
    $bulan = date('m');
    $query = $this->db->query("SELECT
                                SUM(a.hitung) AS jumlah,
                                a.*
                                FROM(
                                SELECT
                                COUNT(a.id) AS hitung,
                                a.tanggal,
                                a.id_user,
                                a.tahun
                                FROM pemasukan a
                                WHERE  tahun = $tahun
                                AND bulan = $bulan
                                GROUP BY tanggal

                                UNION ALL

                                SELECT
                                COUNT(a.id) AS hitung,
                                a.tanggal,
                                a.id_user,
                                a.tahun
                                FROM pembayaran a
                                WHERE  tahun = $tahun
                                AND bulan = $bulan
                                GROUP BY tanggal
                                ) a
                                WHERE a.id_user = $id_user
                                GROUP BY tanggal
                                ORDER BY STR_TO_DATE(tanggal, '%d-%m-%Y') ASC
                               ");
    $data_pemasukan = $query->result_array();

    $array_pemasukan = [];
    foreach ($data_pemasukan as $value) {

      $array_pemasukan[] = array(
        'label' => $value['tanggal'],
        'y' => intval($value['jumlah'])
      );
    }

    $keluar['pemasukan'] = $array_pemasukan;
    echo json_encode($keluar);
  }

  public function chart_pengeluaran(){
    $tahun = date('Y');
    $id_user = $this->session->userdata('id_user');
    $query = $this->db->query("SELECT
                                SUM(a.hitung) AS jumlah,
                                a.*
                                FROM(
                                SELECT
                                COUNT(a.id) AS hitung,
                                a.bulan,
                                a.id_user,
                                a.tahun
                                FROM pengeluaran a
                                WHERE a.tahun = $tahun
                                GROUP BY a.bulan
                                ) a
                                WHERE a.id_user = $id_user
                                GROUP BY a.bulan
                               ");
    $data_pengeluaran = $query->result_array();

    $array_pengeluaran = array();
    foreach ($data_pengeluaran as $value) {
      if ($value['bulan'] == '01') {
        $bulan = 'Januari';
      }elseif ($value['bulan'] == '02') {
        $bulan = 'Februari';
      }elseif ($value['bulan'] == '03') {
        $bulan = 'Maret';
      }elseif ($value['bulan'] == '04') {
        $bulan = 'April';
      }elseif ($value['bulan'] == '05') {
        $bulan = 'Mei';
      }elseif ($value['bulan'] == '06') {
        $bulan = 'Juni';
      }elseif ($value['bulan'] == '07') {
        $bulan = 'Juli';
      }elseif ($value['bulan'] == '08') {
        $bulan = 'Agustus';
      }elseif ($value['bulan'] == '09') {
        $bulan = 'September';
      }elseif ($value['bulan'] == '10') {
        $bulan = 'Oktober';
      }elseif ($value['bulan'] == '11') {
        $bulan = 'November';
      }elseif ($value['bulan'] == '12') {
        $bulan = 'Desember';
      }

      $array_pengeluaran[] = array(
        'label' => $bulan,
        'y' => intval($value['jumlah'])
      );
    }

    $keluar['pengeluaran'] = $array_pengeluaran;
    echo json_encode($keluar);
  }

  public function chart_pengeluaran_perbulan(){
    $id_user = $this->session->userdata('id_user');
    $tahun = date('Y');
    $bulan = date('m');
    $query = $this->db->query("SELECT
                                SUM(a.hitung) AS jumlah,
                                a.*
                                FROM(
                                SELECT
                                COUNT(a.id) AS hitung,
                                a.tanggal,
                                a.id_user,
                                a.tahun
                                FROM pengeluaran a
                                WHERE  tahun = $tahun
                                AND bulan = $bulan
                                GROUP BY tanggal
                                ) a
                                WHERE a.id_user = $id_user
                                GROUP BY tanggal
                                ORDER BY STR_TO_DATE(tanggal, '%d-%m-%Y') ASC
                               ");
    $data_pengeluaran = $query->result_array();

    $array_pengeluaran = [];
    foreach ($data_pengeluaran as $value) {

      $array_pengeluaran[] = array(
        'label' => $value['tanggal'],
        'y' => intval($value['jumlah'])
      );
    }

    $keluar['pengeluaran'] = $array_pengeluaran;
    echo json_encode($keluar);
  }

  public function chart_pembayaran(){
    $tahun = date('Y');
    $bulan = date('m');
    $id_user = $this->session->userdata('id_user');
    $id_kasir = $this->input->post('id_kasir');

    $query = $this->db->query("SELECT
                                tanggal,
                                COUNT(id) AS jumlah
                                FROM pembayaran
                                WHERE id_kasir = $id_kasir
                                AND tahun = $tahun
                                AND bulan = $bulan
                                GROUP BY tanggal
                                ORDER BY STR_TO_DATE(tanggal, '%d-%m-%Y') ASC
                               ");
    $data_pembayaran = $query->result_array();

    $array_pembayaran = array();
    foreach ($data_pembayaran as $value) {

      $array_pembayaran[] = array(
        'label' => $value['tanggal'],
        'y' => intval($value['jumlah'])
      );
    }

    $keluar['pembayaran'] = $array_pembayaran;
    echo json_encode($keluar);
  }

  public function jumlah_stok(){
    $id_user = $this->session->userdata('id_user');
    $sql = $this->db->query("SELECT
                             COUNT(*) AS total
                             FROM
                             gudang
                             WHERE stok = 0
                             AND id_user = $id_user
                             ");
    $data = $sql->row_array();

    echo json_encode($data);
  }

  public function barang_kosong(){
    $id_user = $this->session->userdata('id_user');
    $sql = $this->db->query("SELECT
                             b.kode_barang,
                             b.nama_barang
                             FROM
                             gudang a
                             LEFT JOin barang b ON a.id_barang = b.id
                             WHERE stok = 0
                             AND a.id_user = $id_user
                             LIMIT 10
                             ");
     $data = $sql->result_array();

     echo json_encode($data);
  }

  public function jumlah_kadaluarsa(){
    $id_user = $this->session->userdata('id_user');
    $sql = $this->db->query("SELECT
                              COUNT(*) AS jumlah_kadaluarsa
                              FROM
                              (SELECT
                              	*,
                              	DATEDIFF(kadaluarsa,tanggal_sekarang) AS selisih
                              	FROM
                              		(SELECT
                              		STR_TO_DATE(kadaluarsa,'%d-%m-%Y') AS kadaluarsa,
                              		DATE_FORMAT(NOW(),'%Y-%m-%d') AS tanggal_sekarang,
                              		id_user
                              		FROM
                              		gudang
                              		)a
                              	WHERE a.kadaluarsa IS NOT NULL
                              ) b
                              WHERE selisih <= 0
                              AND id_user = $id_user
                             ");
    $data = $sql->row_array();

    echo json_encode($data);
  }

  public function barang_kadaluarsa(){
    $id_user = $this->session->userdata('id_user');
    $sql = $this->db->query("SELECT
                              kadaluarsa,
                              tanggal_sekarang,
                              id_user,
                              GREATEST(selisih, 0) AS selisih,
                              kode_barang,
                              nama_barang
                              FROM
                              (SELECT
                              	*,
                              	DATEDIFF(kadaluarsa,tanggal_sekarang) AS selisih
                              	FROM
                              		(SELECT
                              		STR_TO_DATE(a.kadaluarsa,'%d-%m-%Y') AS kadaluarsa,
                              		DATE_FORMAT(NOW(),'%Y-%m-%d') AS tanggal_sekarang,
                              		a.id_user,
                              		b.nama_barang,
                              		b.kode_barang
                              		FROM
                              		gudang a
                              		LEFT JOIN barang b ON a.id_barang = b.id
                              		)a
                              	WHERE a.kadaluarsa IS NOT NULL
                              ) b
                              WHERE selisih <= 0
                              AND id_user = $id_user
                              LIMIT 10
                             ");
     $data = $sql->result_array();

     echo json_encode($data);
  }

  public function view_stok_habis(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'home';

    $this->load->view('templates/header', $data);
    $this->load->view('stok_habis', $data);
    $this->load->view('templates/footer');
  }

  public function stok_habis_result(){
    $search = $this->input->post('search');

    $id_user = $this->session->userdata('id_user');
    $where = "a.id_user = '$id_user' AND a.stok = '0'";

    if($search != ""){
			$where = $where." AND (b.kode_barang LIKE '%$search%' OR b.nama_barang LIKE '%$search%')";
		}else{
			$where = $where;
		}

    $sql = $this->db->query("SELECT
                            a.*,
                            b.nama_barang,
                            b.kode_barang
                            FROM
                            gudang a
                            LEFT JOIN barang b ON a.id_barang = b.id
                            WHERE $where
                            ORDER BY a.id ASC
                           ");

    $data = $sql->result_array();

    echo json_encode($data);
  }

  public function view_barang_kadaluarsa(){
    if (!$this->session->userdata('logged_in')) {
    redirect('login');
    }
    $data['active'] = 'home';

    $this->load->view('templates/header', $data);
    $this->load->view('barang_kadaluarsa', $data);
    $this->load->view('templates/footer');
  }

  public function barang_kadaluarsa_result(){
    $search = $this->input->post('search');

    $id_user = $this->session->userdata('id_user');
    $where = "id_user = '$id_user' AND selisih <= 10";

    if($search != ""){
			$where = $where." AND (kode_barang LIKE '%$search%' OR nama_barang LIKE '%$search%')";
		}else{
			$where = $where;
		}

    $sql = $this->db->query("SELECT
                              kadaluarsa,
                              tanggal_sekarang,
                              id_user,
                              GREATEST(selisih, 0) AS selisih,
                              kode_barang,
                              nama_barang
                              FROM
                              (SELECT
                              	*,
                              	DATEDIFF(kadaluarsa,tanggal_sekarang) AS selisih
                              	FROM
                              		(SELECT
                              		STR_TO_DATE(a.kadaluarsa,'%d-%m-%Y') AS kadaluarsa,
                              		DATE_FORMAT(NOW(),'%Y-%m-%d') AS tanggal_sekarang,
                              		a.id_user,
                              		b.nama_barang,
                              		b.kode_barang
                              		FROM
                              		gudang a
                              		LEFT JOIN barang b ON a.id_barang = b.id
                              		)a
                              	WHERE a.kadaluarsa IS NOT NULL
                              ) b
                              WHERE $where
                              AND id_user = $id_user
                           ");

    $data = $sql->result_array();

    echo json_encode($data);
  }

  public function keluaran(){

  }
}
