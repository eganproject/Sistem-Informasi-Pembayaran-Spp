<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home_model extends CI_Model
{

    public function getJmlSis()
    {
        $query = $this->db->get_where('user', [
            'role_id' => 2,
            'is_active' => 1
        ]);
        if ($query->num_rows() > 0) {
            return $query->num_rows();
        } else {
            return 0;
        }
    }
    public function getJmlKls()
    {
        $query = $this->db->get('daftar_kelas');
        if ($query->num_rows() > 0) {
            return $query->num_rows();
        } else {
            return 0;
        }
    }
}
