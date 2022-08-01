<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->

    <div class="row">
        <div class="col-lg-6">
            <div class="flash-data" data-flashdata="<?= $this->session->flashdata('message'); ?>"></div>



            <div class="card shadow mb-3" style="max-width: 540px;">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary"><?= $title; ?></h6>
                </div>
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="<?= base_url('assets/img/profile/') . $user['image']; ?>" class="img-circle" height="200" width="200">
                    </div>
                    <div class="col-md-8 pl-5">
                        <div class="card-body">
                            <h5 class="card-title"><?= $user['nama']; ?></h5>
                            <?php
                            if ($user['role_id'] != 2) : ?>
                            <?php else : ?>

                                <p class="card-text"> <?= $user['nis']; ?> </p>
                                <p class="card-text"> <?= $user['tahun_ajaran']; ?></p>
                                <p class="card-text"> <?= $kelas['kelas']; ?>-<?= $kelas['nama_kelas']; ?></p>

                            <?php endif;  ?>
                            <p class="card-text"><?= $user['email']; ?></p>
                            <p class="card-text"><?= $user['no_telepon']; ?></p>
                            <p class="card-text"><?= $user['alamat']; ?></p>
                            <hr>
                            <p class="card-text"><small class="text-muted">Akun ini dibuat pada tanggal <?= date('d F Y', $user['date_created']); ?></small></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->