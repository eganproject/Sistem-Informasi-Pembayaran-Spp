<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User_model extends CI_Model
{
    //model ini digunakan di controller manajemen, user dan auth

    public function namaKelas()
    {
        $this->db->select('*');
        $this->db->from('user');
        $this->db->join('daftar_kelas', 'user.id_kelas = daftar_kelas.id');
        $this->db->order_by('daftar_kelas.id', 'ASC');
        $query = $this->db->get();
        return $query->result_array();
    }

    public function getKelas($nis)
    {

        $this->db->select('user.*, daftar_kelas.kelas, daftar_kelas.nama_kelas');
        $this->db->from('user');
        $this->db->join('daftar_kelas', 'user.id_kelas = daftar_kelas.id');

        if ($nis != null) {
            $this->db->where('user.nis', $nis);
        }

        $query = $this->db->get();
        return $query->row_array();
    }

    public function getSiswa($id)
    {
        $this->db->select('user.*, daftar_kelas.kelas, daftar_kelas.nama_kelas');
        $this->db->from('user');
        $this->db->join('daftar_kelas', 'user.id_kelas = daftar_kelas.id');

        if ($id != null) {
            $this->db->where('user.id_kelas', $id);
        }

        $query = $this->db->get();
        return $query->result_array();
    }

    public function getManusia($limit, $start, $keyword = null)
    {
        if ($keyword) {
            $this->db->like('nama', $keyword);
            $this->db->or_like('email', $keyword);
        }
        return $this->db->get('manusia', $limit, $start)->result_array();
    }
}
