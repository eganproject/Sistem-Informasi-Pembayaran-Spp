<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Manajemen_model extends CI_Model
{

    public function getDaftarSiswa($limit, $start, $keyword = null)
    {

        if ($keyword) {
            $this->db->like('nama', $keyword);
            $this->db->or_like('email', $keyword);
            $this->db->or_like('nis', $keyword);
        }
        $this->db->join('daftar_kelas', 'user.id_kelas = daftar_kelas.id');
        $this->db->order_by('daftar_kelas.id', 'ASC');
        $query = $this->db->get_where('user', ['is_active' => 1], $limit, $start);
        return $query->result_array();
    }


    public function jumlahSiswa()
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
}
