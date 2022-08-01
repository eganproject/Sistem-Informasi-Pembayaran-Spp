<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->

    <div class="row">
        <div class="col-lg-6">
            <?= $this->session->flashdata('message'); ?>
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary"><?= $title; ?></h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <form action="<?= base_url('user/ubahpassword'); ?>" method="post">
                        <div class="form-group">
                            <label for="password_lama" name="password_lama">Password Lama</label>
                            <input type="password" class="form-control" id="password_lama" name="password_lama">
                            <?= form_error('password_lama', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                        <div class="form-group">
                            <label for="password_baru1" name="password_baru1">Password Baru</label>
                            <input type="password" class="form-control" id="password_baru1" name="password_baru1">
                            <?= form_error('password_baru1', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                        <div class="form-group">
                            <label for="password_baru2" name="password_baru2">Ulangi Password Baru</label>
                            <input type="password" class="form-control" id="password_baru2" name="password_baru2">
                            <?= form_error('password_baru2', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Ubah Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>



</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->