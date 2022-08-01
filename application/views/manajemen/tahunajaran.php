<!-- Begin Page Content -->
<div class="container-fluid">




    <div class="row">
        <div class="col-lg-8">
            <?= form_error('tahun_masuk', '<div class="alert alert-danger alert-dismissible fade show" role="alert">', '<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
          </div>'); ?>

            <div class="flash-data" data-flashdata="<?= $this->session->flashdata('message'); ?>"></div>
            <div class="col-lg-20">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary"><?= $title; ?></h6>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <a href="" class="btn btn-primary mb-3 btn-icon-split" data-toggle="modal" data-target="#tambahTahunModal"><span class="icon text-white-50">
                                <i class="fas fa-folder-plus"></i>
                            </span> <span class="text">Tambah Tahun Ajaran</span></a>

                        <table class="table table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Tahun Ajaran</th>
                                    <th scope="col">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i = 1; ?>
                                <?php foreach ($tahun as $t) : ?>

                                    <tr>
                                        <th scope="row"><?= $i; ?></th>
                                        <td><?= $t['tahun_ajaran']; ?></td>
                                        <td>
                                            <a href="<?= base_url('manajemen/hapustahunajaran/') . $t['tahun_ajaran']; ?>" class="badge badge-pill badge-danger tombol-hapus">Delete</a>
                                        </td>
                                    </tr>
                                    <?php $i++; ?>
                                <?php endforeach; ?>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Modal -->
<!-- Button trigger modal -->


<!-- Modal tambah-->
<div class="modal fade" id="tambahTahunModal" tabindex="-1" role="dialog" aria-labelledby="tambahTahunModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahTahunModalLabel">Tambah Tahun Ajaran</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- Modal Input -->
            <form action="<?= base_url('manajemen/tahunajaran'); ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="tahun_masuk" name="tahun_masuk" placeholder="Contoh : 2000-2001">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Keluar</button>
                    <button type="submit" class="btn btn-primary">Tambah</button>
                </div>
            </form>
        </div>
    </div>
</div>