    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-folder-open ml-2"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Sistem Informasi</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Menu Access Query -->
        <?php
        $id_role = $this->session->userdata('id_role');
        $queryMenu = "SELECT `user_menu`.`id_menu` , `menu`
                    FROM `user_menu` JOIN `user_menu_access` 
                    ON `user_menu`.`id_menu` = `user_menu_access`.`id_menu`
                    WHERE `user_menu_access`.`id_role` = $id_role
                    ORDER BY `user_menu_access`.`id_menu` ASC
                    ";

        $menu = $this->db->query($queryMenu)->result_array();
        ?>

        <!-- Menu Looping -->
        <?php foreach ($menu as $m) : ?>
            <div class="sidebar-heading">
                <?= $m['menu']; ?>
            </div>

            <!-- Submenu Looping -->
            <?php
            $menuId = $m['id_menu'];
            $querySubmenu = "SELECT *
                            FROM `user_submenu` 
                            WHERE `id_menu` = $menuId
                            AND `is_active` = 1
                            ";

            $subMenu = $this->db->query($querySubmenu)->result_array();
            ?>

            <?php foreach ($subMenu as $sm) : ?>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url($sm['url']); ?>">
                        <i class="<?= $sm['icon']; ?>"></i>
                        <span><?= $sm['title']; ?></span></a>
                </li>
            <?php endforeach; ?>

        <?php endforeach; ?>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Nav Item - Logout -->
        <li class="nav-item">
            <a class="nav-link" href="<?= base_url('Auth/logout'); ?>">
                <i class="fas fa-fw fa-sign-out-alt"></i>
                <span>Log Out</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->