<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        is_logged_in();
    }


    public function index()
    {
        //pemanggilan data yang dimasukan ke session
        $data['title'] = 'Dashboard';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        $this->load->model('Home_model');
        $data['jml_sis'] = $this->Home_model->getJmlSis();
        $data['jml_kls'] = $this->Home_model->getJmlKls();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('home/index', $data);
        $this->load->view('templates/footer');
    }
}
