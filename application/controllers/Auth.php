<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('Auth_model');
	}

	public function index()
	{
		// Set Login Form Validation Rules
		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'required|trim');
		// Form Validation Check
		if ($this->form_validation->run() == false) {
			$this->load->view('templates/auth_header');
			$this->load->view('auth/login');
			$this->load->view('templates/auth_footer');
		} else {
			$this->login();
		}
	}

	private function login()
	{
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$user = $this->db->get_where('user', ['email' => $email])->row_array();

		// Email Registration Check
		if ($user) {
			// Email Activation Check
			if ($user['is_active'] == 1) {
				// Password Check
				if (password_verify($password, $user['password'])) {
					// Make Session for Konsultan Daerah
					$data = [
						'email' => $user['email'],
						'id_role' => $user['id_role']
					];
					$this->session->set_userdata($data);
					if ($user['id_role'] == 1) {
						redirect('SuperAdmin');
					} elseif ($user['id_role'] == 2) {
						redirect('KonsultanPusat');
					} else {
						redirect('KonsultanDaerah');
					}
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
					Wrong Password!</div>');
					redirect('Auth');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
				Email has not been activated!</div>');
				redirect('Auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
			Email is not registered!</div>');
			redirect('Auth');
		}
	}

	public function registration()
	{
		// Set Registration Form Validation Rules
		$this->form_validation->set_rules('name', 'Name', 'required|trim');
		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[user.email]', [
			'is_unique' => "This email has already registered!"
		]);
		$this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[8]|matches[password2]', [
			'matches' => 'Password does not match!',
			'min_length' => 'Password at least 8 characters!'
		]);
		$this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');

		// Registration Form Validation Check
		if ($this->form_validation->run() == false) {
			$this->load->view('templates/auth_header');
			$this->load->view('auth/registration');
			$this->load->view('templates/auth_footer');
		} else {
			$this->Auth_model->insertUserData();
			$this->session->set_flashdata('message', '<div class="alert alert-primary" role="alert">
			Registration Success! Please Login. </div>');
			redirect('Auth');
		}
	}

	public function logout()
	{
		$this->session->unset_userdata('email');
		$this->session->unset_userdata('id_role');

		$this->session->set_flashdata('message', '<div class="alert alert-primary" role="alert">
		You have been logged out! </div>');
		redirect('Auth');
	}
}
