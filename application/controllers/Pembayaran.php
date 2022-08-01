<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pembayaran extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        is_logged_in();
    }


    public function index()
    {
        //pemanggilan data yang dimasukan ke session
        $data['title'] = 'Pembayaran Spp';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        //Ambil data keyword searching
        if ($this->input->post('cari')) {
            //unset searching option value
            unset($_SESSION['t_a'],
            $_SESSION['sem'],
            $_SESSION['cek1']);
            $data['kata_kunci'] = $this->input->post('kata_kunci');
            $this->session->set_userdata('kata_kunci', $data['kata_kunci']);
        } else {
            $data['kata_kunci'] = $this->session->userdata('kata_kunci');
        }
        $this->load->model('Pembayaran_model');
        $data['siswa'] = $this->Pembayaran_model->getNis($data['kata_kunci']);
        $th_ajaran = $data['siswa']['tahun_ajaran'];
        $nis = $data['siswa']['nis'];

        $data['testahun'] = $this->Pembayaran_model->getTahunB($th_ajaran);
        $data['smstr'] = $this->db->get('semester')->result_array();



        //form cari di card data tagihan
        if ($this->input->post('cek1')) {
            $data['cek1'] = $this->input->post('cek1');
            $data['t_a'] = $this->input->post('t_a');
            $data['sem'] = $this->input->post('sem');
            $this->session->set_userdata('t_a', $data['t_a']);
            $this->session->set_userdata('sem', $data['sem']);
            $this->session->set_userdata('cek1', $data['cek1']);
        } else {
            $data['t_a'] = $this->session->userdata('t_a');
            $data['sem'] = $this->session->userdata('sem');
            $data['cek1'] = $this->session->userdata('cek1');
        }

        $data['tagihan_spp'] = $this->Pembayaran_model->getTagSis($data['t_a'], $data['sem'], $data['cek1'], $th_ajaran);
        $data['bayar'] = $this->Pembayaran_model->getBayar($nis, $data['t_a'], $data['sem'], $data['cek1'], $th_ajaran);


        $data['hitungbayar'] = $this->Pembayaran_model->hitungbayar($nis, $data['t_a'], $data['sem'], $data['cek1'], $th_ajaran);
        $data['hitungtagihan'] = $this->Pembayaran_model->hitungtagihan($data['t_a'], $data['sem'], $data['cek1'], $th_ajaran);


        $this->form_validation->set_rules('tahun_ajaran', 'Tahun Ajaran', 'required|trim');
        $this->form_validation->set_rules('id_semester', 'Semester', 'required|trim');
        $this->form_validation->set_rules('bulan', 'Bulan', 'required|trim');

        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('pembayaran/index', $data);
            $this->load->view('templates/footer');
        } else {
            $th_a = $this->input->post('tahun_ajaran');
            $id_semss = $this->input->post('id_semester');
            $bln = $this->input->post('bulan');
            $this->db->where('id_semester', $id_semss);
            $this->db->where('tahun_ajaran', $th_a);
            $this->db->where('bulan', $bln);
            $bass = $this->db->get('tagihan_spp')->row_array();
            $ids = $bass['id'];
            $tarif = $bass['tarif'];



            $pembayaran = [
                'bulan' => $bln,
                'tahun_ajaran' => $th_a,
                'id_semester' => $id_semss,
                'nis' => $nis,
                'tanggal' => date('d-m-Y'),
                'tarif' => $tarif,
                'status' => 1,
                'id_tagihan' => $ids
            ];
            $this->db->insert('pembayaran_spp', $pembayaran);

            $this->session->set_flashdata('message', 'Dibayar');
            redirect('pembayaran/index');
        }
    }

    public function tagihanspp()
    {
        //pemanggilan data yang dimasukan ke session
        $data['title'] = 'Tagihan Spp';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        //searching option value

        $data['tahun'] = $this->db->get('tahun_masuk')->result_array();
        $data['semester'] = $this->db->get('semester')->result_array();

        $data['bulan'] = $this->db->get('bulan')->result_array();
        if ($this->input->post('ceking')) {
            $data['th_ajaran'] = $this->input->post('th_ajaran');
            $data['id_semester'] = $this->input->post('id_semester');
            $this->session->set_userdata('th_ajaran', $data['th_ajaran']);
            $this->session->set_userdata('id_semester', $data['id_semester']);
        } else {
            $data['th_ajaran'] = $this->session->userdata('th_ajaran');
            $data['id_semester'] = $this->session->userdata('id_semester');
        }
        $this->load->model('Pembayaran_model');
        $data['tagihan'] = $this->Pembayaran_model->getTahunSemester($data['th_ajaran'], $data['id_semester']);


        $this->form_validation->set_rules('tahun_ajaran', 'Tahun Ajaran', 'required|trim');
        $this->form_validation->set_rules('id_semester', 'Semester', 'required|trim');
        $this->form_validation->set_rules('bulan', 'Bulan', 'required|trim');
        $this->form_validation->set_rules('tarif', 'Tarif', 'required|numeric');

        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('pembayaran/tagihanspp', $data);
            $this->load->view('templates/footer');
        } else {
            $tahun = $this->input->post('tahun_ajaran');
            $tagihan_spp = [
                'tahun_ajaran' => $tahun,
                'bulan' => $this->input->post('bulan'),
                'id_semester' => $this->input->post('id_semester'),
                'tarif' => $this->input->post('tarif')
            ];
            $this->db->insert('tagihan_spp', $tagihan_spp);

            $this->session->set_flashdata('message', 'Tagihan ditambahkan');
            redirect('pembayaran/tagihanspp');
        }
    }

    public function edittagihanspp()
    {
        $data['title'] = 'Edit Tagihan Spp';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        $id = $this->uri->segment(3);

        $data['tahun'] = $this->db->get('tahun_masuk')->result_array();
        $data['bulan'] = $this->db->get('bulan')->result_array();
        $data['tagihanspp'] = $this->db->get_where('tagihan_spp', ['id' => $id])->row_array();

        $this->form_validation->set_rules('tahun_ajaran', 'Tahun Ajaran', 'required|trim');
        $this->form_validation->set_rules('bulan', 'Bulan', 'required|trim');
        $this->form_validation->set_rules('tarif', 'Tarif', 'required|numeric');

        if ($this->form_validation->run() == false) {

            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('pembayaran/edittagihanspp', $data);
            $this->load->view('templates/footer');
        } else {
            $id = $this->input->post('id');
            $tagihan_spp = [
                'bulan' => $this->input->post('bulan'),
                'tarif' => $this->input->post('tarif')
            ];
            $this->db->where('id', $id);
            $this->db->update('tagihan_spp', $tagihan_spp);

            $this->session->set_flashdata('message', 'Tagihan Diubah');
            redirect('pembayaran/tagihanspp');
        }
    }

    public function infokelas()
    {
        //pemanggilan data yang dimasukan ke session
        $data['title'] = 'Info Kelas';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        $this->load->model('Pembayaran_model');
        $data['kelas'] = $this->db->get('daftar_kelas')->result_array();

        if ($this->input->post('cek_kls')) {
            //unset searching option value
            unset($_SESSION['t_aj'],
            $_SESSION['sems'],
            $_SESSION['cek2']);

            $data['cek_kls'] = $this->input->post('cek_kls');
            $data['id_kls'] = $this->input->post('id_kls');
            $this->session->set_userdata('id_kls', $data['id_kls']);
            $this->session->set_userdata('cek_kls', $data['cek_kls']);
        } else {
            $data['id_kls'] = $this->session->userdata('id_kls');
            $data['cek_kls'] = $this->session->userdata('cek_kls');
        }

        $data['tes01'] = $this->db->get_where('user', ['id_kelas' => $data['id_kls']])->row_array();
        $data['tahundeff'] = $data['tes01']['tahun_ajaran'];

        $data['kls_cek'] = $this->db->get_where('daftar_kelas', ['id' => $data['id_kls']])->row_array();
        $data['testahun'] = $this->Pembayaran_model->getTahunKls($data['tahundeff']);
        $data['smstr'] = $this->db->get('semester')->result_array();

        if ($this->input->post('cek2')) {
            $data['cek2'] = $this->input->post('cek2');
            $data['t_aj'] = $this->input->post('t_aj');
            $data['sems'] = $this->input->post('sems');
            $this->session->set_userdata('cek2', $data['cek2']);
            $this->session->set_userdata('t_aj', $data['t_aj']);
            $this->session->set_userdata('sems', $data['sems']);
        } else {
            $data['cek2'] = $this->session->userdata('cek2');
            $data['t_aj'] = $this->session->userdata('t_aj');
            $data['sems'] = $this->session->userdata('sems');
        }


        $data['hitungtagihan'] = $this->Pembayaran_model->hitungtagihanKls($data['t_aj'], $data['sems'], $data['cek2'], $data['tahundeff']);

        $data['siswa'] = $this->Pembayaran_model->getInfoKls($data['id_kls']);



        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('pembayaran/infokelas', $data);
        $this->load->view('templates/footer');
    }

    public function cetakkelas()
    {
        $id = $this->uri->segment(3);
        $data['th_ajrn'] = $this->uri->segment(4);
        $data['smstrctk'] = $this->uri->segment(5);

        $data['nm_kls'] = $this->db->get_where('daftar_kelas', ['id' => $id])->row_array();
        $this->load->model('Pembayaran_model');
        $data['cetakdata'] = $this->Pembayaran_model->getInfoKls($id);

        $this->load->view('pembayaran/cetakkelas', $data);
    }

    public function cetaktagihan()
    {

        $data['nis'] = $this->uri->segment(3);
        $data['thn_ajrn'] = $this->uri->segment(4);
        $data['smster'] = $this->uri->segment(5);

        $data['siswa'] = $this->db->get_where('user', ['nis' => $data['nis']])->row_array();


        $this->load->view('pembayaran/cetaktagihan', $data);
    }
}
