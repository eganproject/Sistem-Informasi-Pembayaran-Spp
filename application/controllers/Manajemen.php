<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Manajemen extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        is_logged_in();
    }


    public function index()
    {
        //pemanggilan data yang dimasukan ke session
        $data['title'] = 'Daftar Siswa';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        //PAGINATION
        $this->load->library('pagination');

        //Ambil data keyword searching
        if ($this->input->post('submit')) {
            $data['keyword'] = $this->input->post('keyword');
            $this->session->set_userdata('keyword', $data['keyword']);
        } else {
            $data['keyword'] = $this->session->userdata('keyword');
        }

        //CONFIG
        $config['base_url'] = 'http://localhost/pembayaran_spp/manajemen/index';
        $this->db->like('nama', $data['keyword']);
        $this->db->or_like('email', $data['keyword']);
        $this->db->or_like('nis', $data['keyword']);
        $this->db->from('user');
        $config['total_rows'] = $this->db->count_all_results();
        $config['per_page'] = 5;

        //initialize
        $this->pagination->initialize($config);

        $data['total_rows'] = $config['total_rows'];
        $data['start'] = $this->uri->segment(3);
        $this->load->model('Manajemen_model');
        $data['namakelas'] = $this->Manajemen_model->getDaftarSiswa($config['per_page'], $data['start'], $data['keyword']);
        $data['jumlahsiswa'] = $this->Manajemen_model->jumlahSiswa();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('manajemen/index', $data);
        $this->load->view('templates/footer');
    }

    public function daftarkelas()
    {

        $data['title'] = 'Daftar Kelas';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();




        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('manajemen/daftarkelas', $data);
        $this->load->view('templates/footer');
    }

    public function kelas()
    {

        $x = $this->uri->segment(3);
        $data['title'] = 'Kelas ' . $x . '';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();


        $this->db->order_by('id', 'ASC');
        $data['kelas'] = $this->db->get_where('daftar_kelas', ['kelas' => $x])->result_array();

        $this->form_validation->set_rules('kelas', 'Kelas', 'required');
        $this->form_validation->set_rules('nama_kelas', 'Nama Kelas', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('manajemen/kelas', $data);
            $this->load->view('templates/footer');
        } else {
            $this->db->insert('daftar_kelas', [
                'kelas' => $this->input->post('kelas'),
                'nama_kelas' => $this->input->post('nama_kelas')
            ]);
            $this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>SUCCESS!</strong> Kelas Ditambahkan <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>');
            redirect('manajemen/kelas/' . $this->input->post('kelas'));
        }
    }

    // public function hapus_kelas($id)
    // {

    //     $data['kelas'] = $this->db->get('daftar_kelas')->result_array();

    //     // $this->db->where('id', $id);
    //     $this->db->delete('daftar_kelas', ['id' => $id]);

    //     $this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
    //     <strong>SUCCESS!</strong> Kelas Berhasil dihapus ! <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    //       <span aria-hidden="true">&times;</span>
    //     </button>
    //   </div>');
    //     redirect('manajemen/daftarkelas');
    // }


    public function siswakelas()
    {
        $data['title'] = 'Siswa Kelas';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        $id = $this->uri->segment(3);
        $this->load->model('User_model');
        $data['siswa'] = $this->User_model->getSiswa($id);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('manajemen/siswakelas', $data);
        $this->load->view('templates/footer');
    }

    public function tahunajaran()
    {

        $data['title'] = 'Tahun Ajaran';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();


        $data['tahun'] = $this->db->get('tahun_masuk')->result_array();

        $this->form_validation->set_rules('tahun_masuk', 'Tahun Masuk', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('manajemen/tahunajaran', $data);
            $this->load->view('templates/footer');
        } else {
            $this->db->insert('tahun_masuk', [
                'tahun_ajaran' => $this->input->post('tahun_masuk')
            ]);
            $this->session->set_flashdata('message', 'Tahun Ajaran ditambahkan');
            redirect('manajemen/tahunajaran');
        }
    }

    public function hapustahunajaran()
    {
        $th = $this->uri->segment(3);

        $this->db->delete('tahun_masuk', ['tahun_ajaran' => $th]);
        $this->db->delete('user', ['tahun_ajaran' => $th]);
        $this->db->delete('tagihan_spp', ['tahun_ajaran' => $th]);
        $this->db->delete('pembayaran_spp', ['tahun_ajaran' => $th]);
        $this->session->set_flashdata('message', 'Tahun Ajaran dihapus');

        redirect('manajemen/tahunajaran');
    }

    public function infosiswa()
    {
        $data['title'] = 'Informasi Siswa';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        unset($_SESSION['th_ajn'],
        $_SESSION['smstr'],
        $_SESSION['info']);
        $data['nis'] = $this->uri->segment(3);

        $data['siswa'] = $this->db->get_where('user', ['nis' => $data['nis']])->row_array();
        $this->load->model('Pembayaran_model');
        $thdeff = $data['siswa']['tahun_ajaran'];
        $data['tahunajaran'] = $this->Pembayaran_model->getTahunB($thdeff);
        $data['semester'] = $this->db->get('semester')->result_array();

        if ($this->input->post('info')) {
            $data['info'] = $this->input->post('info');
            $data['th_ajn'] = $this->input->post('th_ajn');
            $data['smstr'] = $this->input->post('smstr');
            $this->session->set_userdata('th_ajn', $data['th_ajn']);
            $this->session->set_userdata('smstr', $data['smstr']);
            $this->session->set_userdata('info', $data['info']);
        } else {
            $data['th_ajn'] = $this->session->userdata('th_ajn');
            $data['smstr'] = $this->session->userdata('smstr');
            $data['info'] = $this->session->userdata('info');
        }

        $data['tagihan_spp'] = $this->Pembayaran_model->getTagSis($data['th_ajn'], $data['smstr'], $data['info'], $thdeff);
        $data['hitungbayar'] = $this->Pembayaran_model->hitungbayar($data['siswa']['nis'], $data['th_ajn'], $data['smstr'], $data['info'], $thdeff);
        $data['hitungtagihan'] = $this->Pembayaran_model->hitungtagihan($data['th_ajn'], $data['smstr'], $data['info'], $thdeff);


        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('manajemen/infosiswa', $data);
        $this->load->view('templates/footer');
    }


    public function cetakinformasi()
    {
        $nis = $this->uri->segment(3);
        $data['user'] = $this->db->get_where('user', ['nis' => $nis])->row_array();
        $data['thn_ajran'] = $this->uri->segment(4);
        $data['smsterr'] = $this->uri->segment(5);

        $this->load->view('user/cetakinfo', $data);
    }
}
