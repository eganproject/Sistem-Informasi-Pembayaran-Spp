<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
        <div class="sidebar-brand-icon">
            <img src="<?= base_url('assets/img/logo/') . 'smanic.png';  ?>" class="img-circle" width="50" height="50">
        </div>
        <div class="sidebar-brand-text mx-3">SMAN 1 Ciawi</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider ">



    <!-- QUERY MENU Menurut role_id (Status User)-->
    <?php
    $role_id = $this->session->userdata('role_id');
    $queryMenu = "SELECT user_menu.id, menu
                       FROM user_menu JOIN user_access_menu
                        ON user_menu.id = user_access_menu.menu_id
                       WHERE user_access_menu.role_id = $role_id 
                    ORDER BY user_access_menu.menu_id ASC
                   ";
    $menu = $this->db->query($queryMenu)->result_array();
    ?>



    <!-- LOOPING -->
    <?php foreach ($menu as $m) : ?>
        <div class="sidebar-heading">
            <!-- <a href="#<?= $m['menu'] ?>" data-toggle="collapse" class="text-white"><?= $m['menu']; ?></a> -->
            <?= $m['menu']; ?>
        </div>

        <!-- SIAPKAN SUB MENU SESUAI MENU_ID -->

        <?php
        $menuId = $m['id'];
        $querySubMenu = "SELECT *
                        FROM user_sub_menu JOIN user_menu
                        ON user_sub_menu.menu_id = user_menu.id
                        WHERE user_sub_menu.menu_id = $menuId
                        AND user_sub_menu.is_active = 1 
                        ";
        $subMenu = $this->db->query($querySubMenu)->result_array();
        ?>

        <?php foreach ($subMenu as $sm) : ?>
            <!-- Nav Item Active -->
            <!-- <div class="collapse" id="<?= $m['menu'] ?>"> -->
            <?php if ($title == $sm['title']) : ?>
                <li class="nav-item active">
                <?php else : ?>
                <li class="nav-item">
                <?php endif; ?>
                <a class="nav-link pb-0" href="<?= base_url($sm['url']); ?>">
                    <i class="<?= $sm['icon']; ?>"></i>
                    <span><?= $sm['title']; ?></span></a>
                </li>
                <!-- </div> -->



            <?php endforeach; ?>


            <!-- Divider -->
            <hr class="sidebar-divider mt-3">

        <?php endforeach; ?>



        <!-- Nav Item - Logout -->
        <li class="nav-item">
            <a class="nav-link text-white" href="<?= base_url('auth/logout'); ?>">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                <span>Logout</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

</ul>
<!-- End of Sidebar -->