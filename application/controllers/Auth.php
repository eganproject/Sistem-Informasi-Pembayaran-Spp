<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
	}

	public function index()
	{
		if ($this->session->userdata('email')) {
			redirect('user');
		}


		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[4]', [
			'min_length' => 'Password to Short !!'
		]);

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Login';
			$this->load->view('templates/auth_header', $data);
			$this->load->view('auth/login');
			$this->load->view('templates/auth_footer');
		} else {
			$this->_login();
		}
	}

	private function _login()
	{
		$email = $this->input->post('email');
		$password = $this->input->post('password');

		$user = $this->db->get_where('user', ['email' => $email])->row_array();

		if ($user) {
			//usernya aktif
			if ($user['is_active'] == 1) {
				//cek password
				if (password_verify($password, $user['password'])) {
					$data = [

						'email' => $user['email'],
						'role_id' => $user['role_id']
					];
					//simpan data yang ada pada $data diatas ke SESSION
					$this->session->set_userdata($data);

					if ($user['role_id'] == 1) {
						redirect('home');
					} else {
						redirect('home');
					}
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
			Password Anda Salah :(
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>');
					redirect('auth');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
			Email anda belum diaktivasi !!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>');
				redirect('auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
			<strong>GAGAL!</strong>Silahkan Periksa kembali email dan password anda !!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>');
			redirect('auth');
		}
	}



	public function registration()
	{


		if ($this->session->userdata('email')) {
			redirect('user');
		}


		$this->form_validation->set_rules('nama', 'Nama', 'required|trim');
		$this->form_validation->set_rules('nis', 'Nis', 'required|trim|is_unique[user.nis]', [
			'is_unique' => 'This NIS has already used !!'
		]);
		$this->form_validation->set_rules('id_kelas', 'Kelas', 'required|trim');
		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[user.email]', [
			'is_unique' => 'This email has already used !!'
		]);
		$this->form_validation->set_rules('no_telepon', 'No telepon', 'required|numeric|trim|is_unique[user.no_telepon]', [
			'is_unique' => 'This Number has already used !!'
		]);
		$this->form_validation->set_rules('alamat', 'Alamat', 'required|trim');
		$this->form_validation->set_rules('tahun_ajaran', 'Tahun ajaran', 'required|trim');
		$this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[4]|matches[password2]', [
			'matches' => 'Password not matches !!',
			'min_length' => 'Password to short !!'
		]);
		$this->form_validation->set_rules('password2', 'Password', 'required|trim|min_length[4]|matches[password1]');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Register Account';

			$data['kelas'] = $this->db->get('daftar_kelas')->result_array();
			$data['tahun'] = $this->db->get('tahun_masuk')->result_array();

			$this->load->view('templates/auth_header', $data);
			$this->load->view('auth/registration', $data);
			$this->load->view('templates/auth_footer');
		} else {
			$email = $this->input->post('email');
			$nis = $this->input->post('nis');
			$tahun_ajaran = $this->input->post('tahun_ajaran');
			$id_kelas = $this->input->post('id_kelas');
			$data = [
				'nama' => htmlspecialchars($this->input->post('nama', true)),
				'nis' => htmlspecialchars($nis),
				'email' => htmlspecialchars($email),
				'no_telepon' => htmlspecialchars($this->input->post('no_telepon', true)),
				'alamat' => htmlspecialchars($this->input->post('alamat', true)),
				'tahun_ajaran' => htmlspecialchars($tahun_ajaran),
				'id_kelas' => htmlspecialchars($id_kelas),
				'image' => 'default.jpg',
				'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
				'role_id' => 2,
				'is_active' => 0,
				'date_created' => time()
			];

			//siapkan token
			$token = base64_encode(random_bytes(32));
			$user_token = [
				'email' => $email,
				'token' => $token,
				'date_created' => time()

			];


			$this->db->insert('user', $data);
			$this->db->insert('user_token', $user_token);


			$this->_sendEmail($token, 'verify');


			$this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
			<strong>Akun anda sudah terdaftar</strong>Silahkan aktifkan dengan melakukan Verifikasi diemail akun anda !!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>');

			redirect('auth');
		}
	}

	private function _sendEmail($token, $type)
	{
		// $config = [
		// 	'protocol' => 'smtp',
		// 	'smtp_host' => 'ssl://smtp.googlemail.com',
		// 	'smtp_user' => 'trisnawahanaid@gmail.com',
		// 	'smtp_pass' => 'nawa12345',
		// 	'smtp_port' => 465,
		// 	'mailtype' => 'html',
		// 	'charset' => 'utf-8',
		// 	'newline' => "/r/n"
		// ];

		$this->load->library('email');

		$config = array();
		$config['protocol'] = 'smtp';
		$config['smtp_host'] = 'ssl://smtp.googlemail.com';
		$config['smtp_user'] = 'trisnawahanaid@gmail.com';
		$config['smtp_pass'] = 'nawa12345';
		$config['smtp_port'] = 465;
		$config['mailtype'] = 'html';
		$config['charset'] = 'utf-8';
		$this->email->initialize($config);

		$this->email->set_newline("\r\n");



		// $this->load->library('email', $config);
		// $this->email->initialize($config);

		$this->email->from('trisnawahanaid@gmail.com', 'SMAN 1 Ciawi');
		$this->email->to($this->input->post('email'));

		if ($type == 'verify') {
			$this->email->subject('Akun Verifikasi');
			$this->email->message('Klik Link ini untuk Verifikasi : <a href="' . base_url() . 'auth/verify?email=' . $this->input->post('email') . '&token=' . urlencode($token) . '" class="badge badge-pill badge-success">Aktifkan</a>');
		} elseif ($type == 'forgot') {
			$this->email->subject('Reset Password');
			$this->email->message('Klik Link ini untuk Reset Password Anda : <a href="' . base_url() . 'auth/resetpassword?email=' . $this->input->post('email') . '&token=' . urlencode($token) . '" class="badge badge-pill badge-success">Reset Password</a>');
		}

		if ($this->email->send()) {
			return true;
		} else {
			echo $this->email->print_debugger();
			die;
		}
	}

	public function verify()
	{
		$email = $this->input->get('email');
		$token = $this->input->get('token');

		$user = $this->db->get_where('user', ['email' => $email])->row_array();

		if ($user) {
			$user_token = $this->db->get_where('user_token', ['token' => $token])->row_array();
			if ($user_token) {
				if (time() - $user_token['date_created'] < (60 * 60 * 24)) {
					$this->db->set('is_active', 1);
					$this->db->where('email', $email);
					$this->db->update('user');

					$this->db->delete('user_token', ['email' => $email]);

					$this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">' . $email . ' sekarang sudah aktif. Silahkan login !!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
					</div>');
					redirect('auth');
				} else {
					$this->db->delete('user', ['email' => $email]);
					$this->db->delete('user_token', ['email' => $email]);

					$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
					Aktivasi akun gagal !! Token Expired
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
					</div>');
					redirect('auth');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
				Aktivasi akun gagal !! Token Salah
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				</div>');
				redirect('auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
			Aktivasi akun gagal !! Email Salah
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>');
			redirect('auth');
		}
	}

	public function logout()
	{
		$this->session->unset_userdata('email');
		$this->session->unset_userdata('role_id');
		$this->session->sess_destroy();

		$this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
			Kamu telah Logout !!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>');
		redirect('auth');
	}


	public function blocked()
	{
		$data['title'] = 'Access Blocked';
		$this->load->view('templates/header', $data);
		$this->load->view('auth/blocked');
		$this->load->view('templates/footer');
	}

	public function forgotPassword()
	{

		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Forgot Password';
			$this->load->view('templates/auth_header', $data);
			$this->load->view('auth/forgotpassword');
			$this->load->view('templates/auth_footer');
		} else {
			$email = $this->input->post('email');

			//cek email
			$user = $this->db->get_where('user', ['email' => $email, 'is_active' => 1])->row_array();

			if ($user) {
				$token = base64_encode(random_bytes(32));
				$user_token = [
					'email' => $email,
					'token' => $token,
					'date_created' => time()
				];

				$this->db->insert('user_token', $user_token);
				$this->_sendEmail($token, 'forgot');

				$this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
				Cek email anda untuk mereset password anda !!
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				</div>');
				redirect('auth');
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
				Email belum terdaftar atau belum diaktivasi!!
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				</div>');
				redirect('auth/forgotpassword');
			}
		}
	}

	public function resetPassword()
	{
		$email = $this->input->get('email');
		$token = $this->input->get('token');

		$user = $this->db->get_where('user', ['email' => $email])->row_array();

		if ($user) {
			$user_token = $this->db->get_where('user_token', ['token' => $token])->row_array();

			if ($user_token) {
				if (time() - $user_token['date_created'] < (60 * 60 * 24)) {
					$this->session->set_userdata('reset_email', $email);

					$this->db->where('email', $email);
					$this->changePassword();
				} else {
					$this->db->delete('user', ['email' => $email]);
					$this->db->delete('user_token', ['email' => $email]);

					$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
					Aktivasi akun gagal !! Token Expired
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
					</div>');
					redirect('auth');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
				Reset Password gagal ! Token Salah !!
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				</div>');
				redirect('auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
				Reset Password gagal ! Email Salah !!
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				</div>');
			redirect('auth');
		}
	}

	public function changePassword()
	{
		if (!$this->session->userdata('reset_email')) {
			redirect('auth');
		}

		$this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[4]|matches[password2]');
		$this->form_validation->set_rules('password2', 'Ulangi Password', 'required|trim|min_length[4]|matches[password1]');

		if ($this->form_validation->run() == false) {

			$data['title'] = 'Ubah Password';
			$this->load->view('templates/auth_header', $data);
			$this->load->view('auth/changepassword');
			$this->load->view('templates/auth_footer');
		} else {
			$password = password_hash($this->input->post('password1'), PASSWORD_DEFAULT);
			$email = $this->session->userdata('reset_email');

			$this->db->set('password', $password);
			$this->db->where('email', $email);
			$this->db->update('user');

			$this->session->unset_userdata('reset_email');

			$this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
				Reset Password Berhasil ! Silahkan Login !
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				</div>');
			redirect('auth');
		}
	}
}
