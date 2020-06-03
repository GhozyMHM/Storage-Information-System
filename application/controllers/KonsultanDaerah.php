<?php
defined('BASEPATH') or exit('No direct script access allowed');

class KonsultanDaerah extends CI_Controller
{
    public function index()
    {
        // Get Session Data
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        // Set Title
        $data['title'] = "Konsultan Daerah";

        // Load Konsultan Daerah Page
        $this->load->view('templates/index_header', $data);
        $this->load->view('templates/index_sidebar', $data);
        $this->load->view('templates/index_topbar', $data);
        $this->load->view('konsultandaerah/index', $data);
        $this->load->view('templates/index_footer');
    }
}
