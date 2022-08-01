<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>

    <?= form_open() ?>
    <div class="input-group">
        <div class="input-group-prepend">
            <select class="form-control" id="th_ajaran" name="th_ajaran" autofocus>
                <option value="">Tahun Ajaran</option>
                <?php foreach ($tahun as $tt) : ?>
                    <option value="<?= $tt['tahun_ajaran'] ?>"><?= $tt['tahun_ajaran'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="input-group-prepend">
            <select class="form-control" id="id_semester" name="id_semester">
                <option value="">Semester</option>
                <?php foreach ($semester as $sm) : ?>
                    <option value="<?= $sm['id'] ?>"><?= $sm['id'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="input-group-append">
            <input class="btn btn-primary" type="submit" name="ceking" value="Cek">
        </div>
    </div>
    <?= form_close() ?>
    <br>


    <div class="row">
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Tahun Ajaran <?= $th_ajaran ?></h6>
                    <h6 class="m-0 font-weight-bold text-primary">Semester <?= $id_semester ?></h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <a href="" class="btn btn-primary mb-3 btn-icon-split" data-toggle="modal" data-target="#tambahTagihanSppModal"><span class="icon text-white-50">
                            <i class="fas fa-folder-plus"></i>
                        </span> <span class="text">Tambah Tagihan SPP</span>
                    </a>

                    <div class="flash-data" data-flashdata="<?= $this->session->flashdata('message'); ?>"></div>
                    <div class="chart-area">
                        <table class="table table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Bulan</th>
                                    <td scope="col">Tarif</td>
                                    <th scope="col">Opsi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i = 1; ?>
                                <?php foreach ($tagihan as $ta) : ?>

                                    <tr>
                                        <th scope="row"><?= $i; ?></th>
                                        <td><?= $ta['bulan']; ?></td>
                                        <td><?= $ta['tarif']; ?></td>
                                        <td>
                                            <a href="<?= base_url('pembayaran/edittagihanspp/') . $ta['id'] ?>" class="badge badge-pill badge-primary">Edit</a>
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
<!-- Modal tambah-->
<div class="modal fade" id="tambahTagihanSppModal" tabindex="-1" role="dialog" aria-labelledby="tambahTagihanSppModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahTagihanSppModalLabel">Tambah Tagihan Spp</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- Modal Input -->
            <form action="<?= base_url('pembayaran/tagihanspp'); ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <input name="tahun_ajaran" id="tahun_ajaran" class="form-control" value="<?= $th_ajaran ?>" readonly>
                    </div>
                    <div class="form-group">
                        <input name="id_semester" id="id_semester" class="form-control" value="<?= $id_semester ?>" readonly>
                    </div>
                    <div class="form-group">
                        <select name="bulan" id="bulan" class="form-control">
                            <option value="">Select Bulan</option>
                            <?php foreach ($bulan as $b) : ?>
                                <option value="<?= $b['bulan']; ?>"><?= $b['bulan']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">Rp. </div>
                            <input type="text" class="form-control" id="tarif" name="tarif" placeholder="Tarif">
                        </div>
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