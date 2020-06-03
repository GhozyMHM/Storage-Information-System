<?php

class Auth_model extends CI_Model
{
    public function insertUserData()
    {
        $data = [
            'name' => htmlspecialchars($this->input->post('name', true)),
            'email' => htmlspecialchars($this->input->post('email', true)),
            'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
            'image' => 'default.jpg',
            'id_role' => 3,
            'is_active' => 1,
            'date_created' => time()
        ];
        return $this->db->insert('user', $data);
    }
}
