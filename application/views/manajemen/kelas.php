<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"></h1>



    <div class="row">
        <div class="col-lg-8">
            <?= $this->session->flashdata('message'); ?>

            <div class="col-lg-20">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary"><?= $title; ?></h6>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">

                        <a href="" class="btn btn-primary mb-1 btn-icon-split" data-toggle="modal" data-target="#tambahMenuModal"><span class="icon text-white-50">
                                <i class="fas fa-folder-plus"></i>
                            </span> <span class="text">Tambah Kelas</span></a>

                        <table class="table table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Kelas</th>
                                    <th scope="col">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i = 1; ?>
                                <?php foreach ($kelas as $k) : ?>
                                    <tr>
                                        <th scope="row"><?= $i++; ?></th>
                                        <td><?= $k['kelas']; ?>-<?= $k['nama_kelas']; ?></td>
                                        <td>
                                            <a href="<?= base_url('manajemen/siswakelas/') . $k['id']; ?>" class="badge badge-success"><i class="far fa-eye"> Lihat</i></a>
                                            <!-- <a href="<?= base_url('manajemen/hapus_kelas/') . $k['id']; ?>" class="badge badge-danger" onclick="return confirm('Yakin ?')"><i class="far fa-eye"> Delete</i></a> -->
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>

                        <a href="<?= base_url('manajemen/daftarkelas') ?>" class="btn btn-dark"><i class="fas fa-caret-left"></i> Kembali</a>

                    </div>
                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
    </div>
</div>
<!-- End of Main Content -->

<!-- Modal -->
<!-- Button trigger modal -->



<!-- Modal tambah-->
<div class="modal fade" id="tambahMenuModal" tabindex="-1" role="dialog" aria-labelledby="tambahMenuModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahMenuModalLabel">Tambah Kelas</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- Modal Input -->
            <form action="<?= base_url('manajemen/kelas'); ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="kelas">Kelas</label>
                        <select class="form-control" id="kelas" name="kelas">
                            <option value="X">X</option>
                            <option value="XI">XI</option>
                            <option value="XII">XII</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="nama_kelas">Nama Kelas</label>
                        <input type="text" class="form-control" id="nama_kelas" name="nama_kelas" placeholder="contoh : IPS-4">
                    </div>
                </div>
                <div class=" modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Keluar</button>
                    <button type="submit" class="btn btn-primary">Tambah</button>
                </div>
            </form>
        </div>
    </div>
</div>