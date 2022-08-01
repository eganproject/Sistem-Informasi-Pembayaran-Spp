<!-- Begin Page Content -->
<div class="container-fluid">






    <div class="row">
        <div class="col-lg-8">
            <?= form_error('kelas', '<div class="alert alert-danger alert-dismissible fade show" role="alert">', '<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span></button></div>'); ?>

            <?= $this->session->flashdata('message'); ?>


            <?= form_open() ?>
            <div class="input-group">
                <input type="text" class="form-control bg-light border-3 col-sm-6" placeholder="Search for..." name="keyword" autofocus autocomplete="off">
                <div class="input-group-append">
                    <input class="btn btn-primary" type="submit" name="submit" value="Cari">

                </div>
            </div>
            <?= form_close() ?>

            <br>

            <div class="col-lg-20">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary"><?= $title; ?></h6>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">

                        <table class="table table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">NISN</th>
                                    <th scope="col">Nama</th>
                                    <th scope="col">Kelas</th>
                                    <th scope="col">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (empty($namakelas)) : ?>
                                    <tr>
                                        <td colspan="4">
                                            <div class="alert alert-danger" role="alert">
                                                Data pencarian tidak ada.
                                            </div>
                                        </td>
                                    </tr>
                                <?php endif; ?>

                                <?php foreach ($namakelas as $s) : ?>
                                    <tr>
                                        <th scope="row"><?= ++$start; ?></th>
                                        <td><?= $s['nis']; ?></td>
                                        <td><?= $s['nama']; ?></td>
                                        <td><?= $s['kelas']; ?>-<?= $s['nama_kelas']; ?></td>
                                        <td>
                                            <a href="<?= base_url('manajemen/infosiswa/') . $s['nis']; ?>" class="badge badge-pill badge-warning">Lihat</a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                        <?php echo $this->pagination->create_links(); ?>
                        <p>Jumlah User/Pencarian : <?= $total_rows ?></p>
                        <p>Jumlah Siswa : <?= $jumlahsiswa; ?></p>

                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->