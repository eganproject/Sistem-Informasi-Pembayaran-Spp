<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pembayaran_model extends CI_Model
{


    public function getBulan()
    {

        $this->db->select('*');
        $this->db->from('tahun_masuk');
        $this->db->join('tagihan_spp', 'tahun_masuk.tahun_ajaran = tagihan_spp.tahun_ajaran');

        $query = $this->db->get();
        return $query->result_array();
    }
    public function hitungTarif()
    {
        $tahun = $this->uri->segment(3);
        $this->db->select_sum('tarif');
        $query = $this->db->get_where('tagihan_spp', ['tahun_ajaran' => $tahun]);
        if ($query->num_rows() > 0) {
            return $query->row()->tarif;
        } else {
            return 0;
        }
    }

    public function getNis($kata_kunci = null)
    {
        if ($kata_kunci) {
            $this->db->where('is_active', 1);
            $this->db->where('nis', $kata_kunci);
            $this->db->join('daftar_kelas', 'user.id_kelas = daftar_kelas.id');
            $this->db->order_by('daftar_kelas.id', 'ASC');
            $query = $this->db->get('user');
            return $query->row_array();
        }
    }

    // public function getStatus($nis = null)
    // {
    //     if ($nis) {
    //         $query = "SELECT * 
    //                 FROM pembayaran_spp
    //                 WHERE pembayaran_spp.nis = $nis 
    //                 ";
    //         return $this->db->query($query)->result_array();
    //     }
    // }

    public function getTahunSemester($th_ajaran, $id_semester)
    {
        $this->db->where('tahun_ajaran', $th_ajaran);
        $this->db->where('id_semester', $id_semester);
        $query = $this->db->get('tagihan_spp');
        return $query->result_array();
    }

    public function getTagSis($th, $idsem, $cek1, $th_deff)
    {
        if ($cek1) {

            $this->db->where('tahun_ajaran', $th);
            $this->db->where('id_semester', $idsem);
            $this->db->order_by('id', 'ASC');
            $query = $this->db->get('tagihan_spp');
            return $query->result_array();
        } else {
            $this->db->where('tahun_ajaran', $th_deff);
            $this->db->where('id_semester', 1);
            $this->db->order_by('id', 'ASC');
            $query = $this->db->get('tagihan_spp');
            return $query->result_array();
        }
    }

    public function getBayar($nis, $th, $idsem, $cek1, $th_deff)
    {
        if ($cek1) {
            $this->db->where('nis', $nis);
            $this->db->where('tahun_ajaran', $th);
            $this->db->where('id_semester', $idsem);
            $this->db->order_by('id', 'ASC');
            $query = $this->db->get('pembayaran_spp');
            return $query->result_array();
        } else {
            $this->db->where('nis', $nis);
            $this->db->where('tahun_ajaran', $th_deff);
            $this->db->where('id_semester', 1);
            $this->db->order_by('id', 'ASC');
            $query = $this->db->get('pembayaran_spp');
            return $query->result_array();
        }
    }



    public function hitungBayar($nis, $th, $id, $cek, $th_deff)
    {
        if ($cek) {
            $this->db->select_sum('tarif');
            $this->db->where('nis', $nis);
            $this->db->where('tahun_ajaran', $th);
            $this->db->where('id_semester', $id);
            $query = $this->db->get('pembayaran_spp');
            if ($query->num_rows() > 0) {
                return $query->row()->tarif;
            } else {
                return 0;
            }
        } else {
            $this->db->select_sum('tarif');
            $this->db->where('nis', $nis);
            $this->db->where('tahun_ajaran', $th_deff);
            $this->db->where('id_semester', 1);
            $query = $this->db->get('pembayaran_spp');
            if ($query->num_rows() > 0) {
                return $query->row()->tarif;
            } else {
                return 0;
            }
        }
    }

    public function hitungTagihan($th_ajaran, $id, $cek, $th_deff)
    {
        if ($cek) {
            $this->db->select_sum('tarif');
            $this->db->where('tahun_ajaran', $th_ajaran);
            $this->db->where('id_semester', $id);
            $query = $this->db->get('tagihan_spp');
            if ($query->num_rows() > 0) {
                return $query->row()->tarif;
            } else {
                return 0;
            }
        } else {
            $this->db->select_sum('tarif');
            $this->db->where('tahun_ajaran', $th_deff);
            $this->db->where('id_semester', 1);
            $query = $this->db->get('tagihan_spp');
            if ($query->num_rows() > 0) {
                return $query->row()->tarif;
            } else {
                return 0;
            }
        }
    }

    public function getTahunB($th_ajaran = null)
    {
        $x = $this->db->get_where('tahun_masuk', ['tahun_ajaran' => $th_ajaran])->row_array();
        $id = $x['id'];
        $xs = $x['id'] + 2;
        if ($th_ajaran) {
            $this->db->where("id BETWEEN $id AND $xs");
            $query = $this->db->get('tahun_masuk');
            return $query->result_array();
        }
    }

    public function getInfoKls($id)
    {
        $this->db->where('id_kelas', $id);
        $this->db->where('role_id', 2);
        $this->db->where('is_active', 1);
        $this->db->join('daftar_kelas', 'user.id_kelas = daftar_kelas.id');
        $this->db->order_by('nama', 'ASC');
        $query = $this->db->get('user');
        return $query->result_array();
    }

    public function getTahunKls($th_ajaran = null)
    {
        $x = $this->db->get_where('tahun_masuk', ['tahun_ajaran' => $th_ajaran])->row_array();
        $id = $x['id'];
        $xs = $x['id'] + 2;
        if ($th_ajaran) {
            $this->db->where("id BETWEEN $id AND $xs");
            $query = $this->db->get('tahun_masuk');
            return $query->result_array();
        }
    }

    public function hitungTagihanKls($th_ajaran, $id, $cek2, $thdeff)
    {

        if ($cek2) {


            $this->db->select_sum('tarif');
            $this->db->where('tahun_ajaran', $th_ajaran);
            $this->db->where('id_semester', $id);
            $query = $this->db->get('tagihan_spp');
            if ($query->num_rows() > 0) {
                return $query->row()->tarif;
            } else {
                return 0;
            }
        } else {
            $this->db->select_sum('tarif');
            $this->db->where('tahun_ajaran', $thdeff);
            $this->db->where('id_semester', 1);
            $query = $this->db->get('tagihan_spp');
            if ($query->num_rows() > 0) {
                return $query->row()->tarif;
            } else {
                return 0;
            }
        }
    }
}
