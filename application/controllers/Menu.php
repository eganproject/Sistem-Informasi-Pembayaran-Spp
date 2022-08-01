<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Menu extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();

    is_logged_in();
  }
  public function index()
  {
    //pemanggilan data yang dimasukan ke session
    $data['title'] = 'Menu Manajemen';
    $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

    $data['menu'] = $this->db->get('user_menu')->result_array();

    $this->form_validation->set_rules('menu', 'Menu', 'required');

    if ($this->form_validation->run() == false) {
      $this->load->view('templates/header', $data);
      $this->load->view('templates/sidebar', $data);
      $this->load->view('templates/topbar', $data);
      $this->load->view('menu/index', $data);
      $this->load->view('templates/footer');
    } else {
      $this->db->insert('user_menu', ['menu' => $this->input->post('menu')]);
      $this->session->set_flashdata('message', 'Menu ditambahkan');
      redirect('menu');
    }
  }

  public function editdatamenu()
  {
    $data['title'] = 'Edit Data Menu';
    $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

    $id = $this->uri->segment(3);

    $data['menu'] = $this->db->get_where('user_menu', ['id' => $id])->row_array();



    $this->form_validation->set_rules('menu', 'Menu', 'required');

    if ($this->form_validation->run() == false) {

      $this->load->view('templates/header', $data);
      $this->load->view('templates/sidebar', $data);
      $this->load->view('templates/topbar', $data);
      $this->load->view('menu/editdatamenu', $data);
      $this->load->view('templates/footer');
    } else {
      $namaMenu = $this->input->post('menu');
      $menuId = $this->input->post('id');

      $this->db->set('menu', $namaMenu);
      $this->db->set('id', $menuId);
      $this->db->where('id', $menuId);
      $this->db->update('user_menu');

      $this->session->set_flashdata('message', 'Menu diubah');
      redirect('menu/index');
    }
  }



  public function hapusdatamenu($id)
  {

    $data['menu'] = $this->db->get('user_menu')->result_array();

    // $this->db->where('id', $id);
    $this->db->delete('user_menu', ['id' => $id]);

    $this->session->set_flashdata('message', 'Menu dihapus');
    redirect('menu');
  }

  public function submenu()
  {

    $data['title'] = 'Submenu Manajemen';
    $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

    $this->load->model('Menu_model', 'menu');

    $data['subMenu'] = $this->menu->getSubMenu();

    $data['menu'] = $this->db->get('user_menu')->result_array();

    $this->form_validation->set_rules('title', 'Title', 'required');
    $this->form_validation->set_rules('menu_id', 'Menu', 'required');
    $this->form_validation->set_rules('url', 'URL', 'required');
    $this->form_validation->set_rules('icon', 'icon', 'required');

    if ($this->form_validation->run() == false) {

      $this->load->view('templates/header', $data);
      $this->load->view('templates/sidebar', $data);
      $this->load->view('templates/topbar', $data);
      $this->load->view('menu/submenu', $data);
      $this->load->view('templates/footer');
    } else {
      $data = [
        'title' => $this->input->post('title'),
        'menu_id' => $this->input->post('menu_id'),
        'url' => $this->input->post('url'),
        'icon' => $this->input->post('icon'),
        'is_active' => $this->input->post('is_active')
      ];
      $this->db->insert('user_sub_menu', $data);
      $this->session->set_flashdata('message', 'Submenu ditambahkan');
      redirect('menu/submenu');
    }
  }

  public function editdatasubmenu()
  {
    $data['title'] = 'Edit Data Submenu';
    $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();



    $data['menu'] = $this->db->get('user_menu')->result_array();

    $id = $this->uri->segment(3);
    $this->load->model('Menu_model');

    $data['submenu'] = $this->Menu_model->geteditSubMenu($id);


    $this->form_validation->set_rules('title', 'Title', 'required');
    $this->form_validation->set_rules('menu_id', 'Menu', 'required');
    $this->form_validation->set_rules('url', 'URL', 'required');
    $this->form_validation->set_rules('icon', 'icon', 'required');

    if ($this->form_validation->run() == false) {

      $this->load->view('templates/header', $data);
      $this->load->view('templates/sidebar', $data);
      $this->load->view('templates/topbar', $data);
      $this->load->view('menu/editdatasubmenu', $data);
      $this->load->view('templates/footer');
    } else {
      $title1 = $this->input->post('title');
      $id = $this->input->post('id');
      $menu_id_ = $this->input->post('menu_id');
      $url = $this->input->post('url');
      $icon = $this->input->post('icon');
      $is_active = $this->input->post('is_active');

      $data = [
        'id' => $id,
        'title' => $title1,
        'menu_id' => $menu_id_,
        'url' => $url,
        'icon' => $icon,
        'is_active' => $is_active
      ];

      // $this->db->set('title', $title1);
      // $this->db->set('menu_id', $menu_id_);
      // $this->db->set('url', $url);
      // $this->db->set('icon', $icon);
      // $this->db->set('is_active', $is_active);
      $this->db->where('id', $id);
      $this->db->update('user_sub_menu', $data);

      $this->session->set_flashdata('message', 'Submenu diubah');
      redirect('menu/submenu');
    }
  }


  public function hapusdatasubmenu($id)
  {

    $data['subMenu'] = $this->db->get('user_sub_menu')->result_array();

    // $this->db->where('id', $id);
    $this->db->delete('user_sub_menu', ['id' => $id]);

    $this->session->set_flashdata('message', 'Submenu dihapus');
    redirect('menu/submenu');
  }


  public function role()
  {
    //pemanggilan data yang dimasukan ke session
    $data['title'] = 'User Access';
    $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

    $data['role'] = $this->db->get('user_role')->result_array();

    $this->form_validation->set_rules('role', 'Role', 'required');

    if ($this->form_validation->run() == false) {
      $this->load->view('templates/header', $data);
      $this->load->view('templates/sidebar', $data);
      $this->load->view('templates/topbar', $data);
      $this->load->view('menu/role', $data);
      $this->load->view('templates/footer');
    } else {
      $this->db->insert('user_role', ['role' => $this->input->post('role')]);
      $this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
                  <strong>SUCCESS!</strong> Role Ditambahkan <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </>');
      redirect('menu/role');
    }
  }

  public function roleAccess($role_id)
  {
    //pemanggilan data yang dimasukan ke session
    $data['title'] = 'Role Access';
    $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

    $data['role'] = $this->db->get_where('user_role', ['id' => $role_id])->row_array();
    $this->db->where('id !=', 3);

    $data['menu'] = $this->db->get('user_menu')->result_array();

    $this->load->view('templates/header', $data);
    $this->load->view('templates/sidebar', $data);
    $this->load->view('templates/topbar', $data);
    $this->load->view('menu/roleaccess', $data);
    $this->load->view('templates/footer');
  }
 
  public function changeAccess()
  {
    // data post('menuId') diambil dari ajax yang ada difooter yang diinputkan di roleacces
    $menu_id = $this->input->post('menuId');
    $role_id = $this->input->post('roleId');

    $data = [
      'role_id' => $role_id,
      'menu_id' => $menu_id
    ];

    $result = $this->db->get_where('user_access_menu', $data);

    if ($result->num_rows() < 1) {
      $this->db->insert('user_access_menu', $data);
    } else {
      $this->db->delete('user_access_menu', $data);
    }
    $this->session->set_flashdata('message', 'Akses Diubah');
  }

  public function roleedit()
  {
    $data['title'] = 'Edit Nama Role';
    $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

    $id = $this->uri->segment(3);

    $data['role'] = $this->db->get_where('user_role', ['id' => $id])->row_array();



    $this->form_validation->set_rules('role', 'Role', 'required');

    if ($this->form_validation->run() == false) {

      $this->load->view('templates/header', $data);
      $this->load->view('templates/sidebar', $data);
      $this->load->view('templates/topbar', $data);
      $this->load->view('menu/roleedit', $data);
      $this->load->view('templates/footer');
    } else {
      $rolenama = $this->input->post('role');
      $roleid = $this->input->post('id');

      $this->db->set('role', $rolenama);
      $this->db->set('id', $roleid);
      $this->db->where('id', $roleid);
      $this->db->update('user_role');

      $this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
            Role berhasil DIrubah !!
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>');
      redirect('menu/role');
    }
  }

  public function hapusdatarole($id)
  {

    $data['role'] = $this->db->get('user_role')->result_array();

    // $this->db->where('id', $id);
    $this->db->delete('user_role', ['id' => $id]);

    $this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>SUCCESS!</strong> Data Berhasil dihapus ! <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>');
    redirect('menu/role');
  }
}
