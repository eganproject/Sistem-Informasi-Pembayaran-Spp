<!-- Begin Page Content -->
<div class="container-fluid">


    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>

    <?= form_open() ?>
    <div class="input-group">
        <input type="text" class="form-control bg-light border-3 col-sm-6" placeholder="Masukkan NIS" name="kata_kunci" autofocus autocomplete="off">
        <div class="input-group-append">
            <input class="btn btn-primary" type="submit" name="cari" value="Cari">
        </div>
    </div>
    <?= form_close() ?>


    <br>
    <?php if ($kata_kunci != $siswa['nis']) : ?>

        <div class="alert alert-danger" role="alert">
            Data tidak ada
        </div>
    <?php elseif ($kata_kunci = $siswa['nis']) : ?>



        <!-- Content Row -->
        <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Detail Siswa</h6>
                    </div>
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="<?= base_url('assets/img/profile/') . $siswa['image']; ?>" class="img-circle" height="200" width="200">
                        </div>
                        <div class="col-md-8 pl-5">
                            <div class="card-body">
                                <p class="card-text">Nama : <?= $siswa['nama']; ?></p>
                                <p class="card-text">NIS : <?= $siswa['nis']; ?></p>
                                <p class="card-text">Kelas : <?= $siswa['kelas']; ?>-<?= $siswa['nama_kelas'] ?></p>
                                <p class="card-text">Tahun Masuk : <?= $siswa['tahun_ajaran']; ?></p>
                                <p class="card-text">No. Telepon : <?= $siswa['no_telepon']; ?></p>
                                <p class="card-text">Alamat : <?= $siswa['alamat']; ?></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Data Pembayaran</h6>
                    </div>
                    <div class="card-body">
                        <div class="text-center">
                            <!-- <?php if ($hitungbayar != $hitungtagihan) : ?>
                                <p class="badge badge-danger">Belum Lunas</p>
                            <?php else : ?>
                                <p class="badge badge-success">LUNAS</p>
                            <?php endif; ?> -->
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Bulan</th>
                                        <th scope="col">Jumlah</th>
                                        <th scope="col">Tanggal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1; ?>
                                    <?php foreach ($bayar as $b) : ?>
                                        <tr>
                                            <th scope="row"><?= $i++; ?></th>
                                            <td><?= $b['bulan']; ?></td>
                                            <td><?= $b['tarif']; ?></td>
                                            <td><?= $b['tanggal'] ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                    <tr>
                                        <th></th>
                                        <th>Total Bayar</th>
                                        <th><?= $hitungbayar; ?></th>
                                        <th></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-lg-6 mb-4">

                <?= form_open() ?>
                <div class="input-group ml-auto" style="width:250px">
                    <div class="input-group-prepend">
                        <select class="form-control" id="t_a" name="t_a">
                            <?php foreach ($testahun as $tt) : ?>
                                <option value="<?= $tt['tahun_ajaran'] ?>"><?= $tt['tahun_ajaran'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="input-group-prepend">
                        <select class="form-control" id="sem" name="sem">
                            <?php foreach ($smstr as $sms) : ?>
                                <option value="<?= $sms['id'] ?>"><?= $sms['id'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="input-group-append">
                        <input class="btn btn-primary" type="submit" name="cek1" value="Cek">
                    </div>
                </div>
                <?= form_close() ?>

                <div class="card shadow mb-4">
                    <div class="card-header py-3 text-center">
                        <h6 class="m-0 font-weight-bold text-primary">Data Tagihan <?php if ($cek1) {
                                                                                        echo $t_a;
                                                                                    } else {
                                                                                        echo $siswa['tahun_ajaran'];
                                                                                    } ?></h6>
                        <h6 class="m-0 font-weight-bold text-primary">Semester <?php if ($cek1) {
                                                                                    echo $sem;
                                                                                } else {
                                                                                    echo 1;
                                                                                } ?></h6>
                    </div>
                    <div class="card-body">
                        <div class="text-center">

                            <div class="flash-data" data-flashdata="<?= $this->session->flashdata('message'); ?>"></div>
                            <?php if ($hitungbayar != $hitungtagihan) : ?>
                                <p class="badge badge-danger">Belum Lunas</p>
                            <?php else : ?>
                                <p class="badge badge-success">LUNAS</p>
                            <?php endif; ?>

                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Bulan</th>
                                        <th scope="col">Tarif</th>
                                        <th scope="col">Status</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1; ?>
                                    <?php foreach ($tagihan_spp as $ts) : ?>
                                        <tr>
                                            <th scope="row"><?= $i++; ?></th>
                                            <td><?= $ts['bulan']; ?></td>
                                            <td><?= $ts['tarif']; ?></td>
                                            <td>
                                                <?php
                                                $nis = $siswa['nis'];
                                                $thdeff = $siswa['tahun_ajaran'];
                                                $idsem = $sem;
                                                $th_aj = $t_a;
                                                $id_tag = $ts['id'];

                                                if ($cek1) {
                                                    $this->db->where('nis', $nis);
                                                    $this->db->where('id_tagihan', $id_tag);
                                                    $this->db->where('tahun_ajaran', $th_aj);
                                                    $this->db->where('id_semester', $idsem);
                                                    $this->db->order_by('id', 'ASC');
                                                    $query = $this->db->get('pembayaran_spp')->row_array();
                                                ?>

                                                    <?php if ($query) { ?>
                                                        <p class="badge badge-success badge-circle badge-sm">
                                                            <i class="fas fa-check"></i>
                                                        </p>
                                                    <?php } else { ?>
                                                        <p class="badge badge-secondary badge-icon-split badge-sm">
                                                            <span class="icon text-white-50">
                                                                X
                                                            </span>
                                                        </p>
                                                    <?php } ?>
                                                <?php } else {
                                                    $this->db->where('nis', $nis);
                                                    $this->db->where('id_tagihan', $id_tag);
                                                    $this->db->where('tahun_ajaran', $thdeff);
                                                    $this->db->where('id_semester', 1);
                                                    $this->db->order_by('id', 'ASC');
                                                    $query = $this->db->get('pembayaran_spp')->row_array();
                                                ?>

                                                    <?php if ($query) { ?>
                                                        <p class="badge badge-success badge-circle badge-sm">
                                                            <i class="fas fa-check"></i>
                                                        </p>
                                                    <?php } else { ?>
                                                        <p class="badge badge-secondary badge-icon-split badge-sm">
                                                            <span class="icon text-white-50">
                                                                X
                                                            </span>
                                                        </p>
                                                    <?php } ?>
                                                <?php } ?>

                                            </td>

                                        </tr>
                                    <?php endforeach; ?>
                                    <tr>
                                        <th></th>
                                        <th>Total Tagihan</th>
                                        <th><?= $hitungtagihan ?></th>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <th>Sisa Tagihan</th>
                                        <th><?php $sisa = $hitungtagihan - $hitungbayar;
                                            echo $sisa ?></th>
                                    </tr>
                                </tbody>
                            </table>
                            <?php
                            if ($cek1) {
                                $th_cetak = $t_a;
                                $smstr_ctk = $sem;
                            } else {
                                $th_cetak = $siswa['tahun_ajaran'];
                                $smstr_ctk = 1;
                            } ?>
                            <div class="ml-auto" style="width: 200px">
                                <a href="<?= base_url('pembayaran/cetaktagihan/') . $siswa['nis'] . '/' . $th_cetak . '/' . $smstr_ctk ?>" class="btn btn-secondary btn-icon-split"><span class="icon text-white">Cetak</a>
                                <a class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#bayarSppModal"><span class="icon text-white">
                                        <i class="fas fa-receipt"></i> Bayar
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php endif; ?>





</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Modal tambah-->
<div class="modal fade" id="bayarSppModal" tabindex="-1" role="dialog" aria-labelledby="bayarSppModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="bayarSppModalLabel">Bayar SPP</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- Modal Input -->
            <form action="<?= base_url('pembayaran/index'); ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="hidden" id="tahun_ajaran" name="tahun_ajaran" id="tahun_ajaran" class="form-control" value="<?php if ($cek1) {
                                                                                                                                        echo $t_a;
                                                                                                                                    } else {
                                                                                                                                        echo $siswa['tahun_ajaran'];
                                                                                                                                    } ?>">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="id_semester" id="id_semester" class="form-control" value="<?php if ($cek1) {
                                                                                                                    echo $sem;
                                                                                                                } else {
                                                                                                                    echo 1;
                                                                                                                } ?>">
                    </div>
                    <div class="form-group">
                        <select name="bulan" id="bulan" class="form-control" id="bulan">
                            <option value="">Select Bulan</option>
                            <?php foreach ($tagihan_spp as $b) : ?>

                                <?php
                                $nis = $siswa['nis'];
                                $thdeff = $siswa['tahun_ajaran'];
                                $idsem = $sem;
                                $th_aj = $t_a;
                                $id_tag = $b['id'];

                                if ($cek1) {
                                    $this->db->where('nis', $nis);
                                    $this->db->where('id_tagihan', $id_tag);
                                    $this->db->where('tahun_ajaran', $th_aj);
                                    $this->db->where('id_semester', $idsem);
                                    $this->db->order_by('id', 'ASC');
                                    $query1 = $this->db->get('pembayaran_spp')->row_array();
                                ?>

                                    <?php if ($query1) { ?>

                                    <?php } else { ?>

                                        <option value="<?= $b['bulan']; ?>"><?= $b['bulan']; ?></option>
                                    <?php } ?>
                                <?php } else {
                                    $this->db->where('nis', $nis);
                                    $this->db->where('id_tagihan', $id_tag);
                                    $this->db->where('tahun_ajaran', $thdeff);
                                    $this->db->where('id_semester', 1);
                                    $this->db->order_by('id', 'ASC');
                                    $query1 = $this->db->get('pembayaran_spp')->row_array();
                                ?>

                                    <?php if ($query1) { ?>

                                    <?php } else { ?>

                                        <option value="<?= $b['bulan']; ?>"><?= $b['bulan']; ?></option>
                                    <?php } ?>
                                <?php } ?>
                            <?php endforeach; ?>
                        </select>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Keluar</button>
                    <button type="submit" class="btn btn-primary tambah-bayar">Tambah</button>
                </div>
            </form>
        </div>
    </div>
</div>