<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        is_logged_in();
    }


    public function index()
    {
        //pemanggilan data yang dimasukan ke session
        $data['title'] = 'My Profile';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();


        $nis = $data['user']['nis'];
        $this->load->model('User_model');
        $data['kelas'] = $this->User_model->getKelas($nis);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('user/index', $data);
        $this->load->view('templates/footer');
    }


    public function editprofile()
    {
        //pemanggilan data yang dimasukan ke session
        $data['title'] = 'Edit Profile';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        $data['kelas'] = $this->db->get('daftar_kelas')->result_array();
        $nis = $data['user']['nis'];
        $this->load->model('User_model');
        $data['namakelas'] = $this->User_model->getKelas($nis);


        $this->form_validation->set_rules('nama', 'Nama Lengkap', 'required|trim');
        $this->form_validation->set_rules('no_telepon', 'No telepon', 'required|numeric');
        $this->form_validation->set_rules('alamat', 'Alamat', 'required|trim');
        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('user/editprofile', $data);
            $this->load->view('templates/footer');
        } else {

            $nama = $this->input->post('nama');
            $email = $this->input->post('email');
            $no_telepon = $this->input->post('no_telepon');
            $alamat = $this->input->post('alamat');
            $nama_kelas = $this->input->post('id_kelas');



            //cek jika ada gambar yang akan diupload

            $upload_image = $_FILES['image']['name'];
            if ($upload_image) {

                $config['allowed_types'] = 'gif|jpg|png';
                $config['max_size']     = '2048';
                $config['upload_path'] = './assets/img/profile/';


                $this->load->library('upload', $config);

                if ($this->upload->do_upload('image')) {
                    //menghapus file yang diganti kecuali defaultnya
                    $old_image = $data['user']['image'];
                    if ($old_image != 'default.jpg') {
                        unlink(FCPATH . 'assets/img/profile/' . $old_image);
                    }

                    $new_image = $this->upload->data('file_name');

                    $this->db->set('image', $new_image);
                } else {
                    echo $this->upload->display_errors();
                }
            }



            $this->db->set('nama', $nama);
            $this->db->set('no_telepon', $no_telepon);
            $this->db->set('id_kelas', $nama_kelas);
            $this->db->set('alamat', $alamat);
            $this->db->where('email', $email);
            $this->db->update('user');

            $this->session->set_flashdata('message', 'Profile diubah');
            redirect('user');
        }
    }

    public function ubahpassword()
    {
        $data['title'] = 'Ubah Password';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();


        $this->form_validation->set_rules('password_lama', 'Password Lama', 'required|trim');
        $this->form_validation->set_rules('password_baru1', 'Password Baru', 'required|trim|min_length[4]|matches[password_baru2]');
        $this->form_validation->set_rules('password_baru2', 'Konfirmasi Password Baru', 'required|trim|min_length[4]|matches[password_baru1]');
        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('user/ubahpassword', $data);
            $this->load->view('templates/footer');
        } else {
            $password_lama = $this->input->post('password_lama');
            $password_baru = $this->input->post('password_baru1');

            if (!password_verify($password_lama, $data['user']['password'])) {
                $this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">Password lama yang anda masukan salah !!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>');
                redirect('user/ubahpassword');
            } else {
                if ($password_lama == $password_baru) {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Password baru yang anda masukkan tidak boleh sama dengan yang lama !!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>');
                    redirect('user/ubahpassword');
                } else {
                    //password sudah oke
                    $password_hash = password_hash($password_baru, PASSWORD_DEFAULT);

                    $this->db->set('password', $password_hash);
                    $this->db->where('email', $this->session->userdata('email'));
                    $this->db->update('user');

                    $this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
                    Password telah diperbarui !!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>');
                    redirect('user/ubahpassword');
                }
            }
        }
    }

    public function infosiswa()
    {
        $data['title'] = 'Informasi';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();


        $this->load->model('Pembayaran_model');

        $thdeff = $data['user']['tahun_ajaran'];
        $nis = $data['user']['nis'];
        $data['tahunajaran'] = $this->Pembayaran_model->getTahunB($thdeff);
        $data['semester'] = $this->db->get('semester')->result_array();

        if ($this->input->post('cek3')) {
            $data['cek3'] = $this->input->post('cek3');
            $data['th_aj'] = $this->input->post('th_aj');
            $data['smstr'] = $this->input->post('smstr');
            $this->session->set_userdata('th_aj', $data['th_aj']);
            $this->session->set_userdata('smstr', $data['smstr']);
            $this->session->set_userdata('cek3', $data['cek3']);
        } else {
            $data['th_aj'] = $this->session->userdata('th_aj');
            $data['smstr'] = $this->session->userdata('smstr');
            $data['cek3'] = $this->session->userdata('cek3');
        }

        $data['tagihan_spp'] = $this->Pembayaran_model->getTagSis($data['th_aj'], $data['smstr'], $data['cek3'], $thdeff);

        $data['hitungbayar'] = $this->Pembayaran_model->hitungbayar($nis, $data['th_aj'], $data['smstr'], $data['cek3'], $thdeff);
        $data['hitungtagihan'] = $this->Pembayaran_model->hitungtagihan($data['th_aj'], $data['smstr'], $data['cek3'], $thdeff);


        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('user/infosiswa', $data);
        $this->load->view('templates/footer');
    }

    public function cetakinfo()
    {
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $data['thn_ajran'] = $this->uri->segment(3);
        $data['smsterr'] = $this->uri->segment(4);

        $this->load->view('user/cetakinfo', $data);
    }
}
