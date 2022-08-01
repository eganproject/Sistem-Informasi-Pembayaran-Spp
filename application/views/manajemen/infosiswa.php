<div class="container-fluid">

    <!-- Page Heading -->

    <!-- <a href="<?= base_url('manajemen/index') ?>">Kembali</a> -->
    <?= form_open() ?>
    <div class="input-group ml-auto" style="width:250px">
        <div class="input-group-prepend">
            <select class="form-control" id="th_ajn" name="th_ajn">
                <?php foreach ($tahunajaran as $ta) : ?>
                    <option value="<?= $ta['tahun_ajaran'] ?>"><?= $ta['tahun_ajaran'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="input-group-prepend">
            <select class="form-control" id="smstr" name="smstr">
                <?php foreach ($semester as $sms) : ?>
                    <option value="<?= $sms['id'] ?>"><?= $sms['id'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="input-group-append">
            <input class="btn btn-primary" type="submit" name="info" value="Cek">
        </div>
    </div>
    <?= form_close() ?>


    <div class="row">
        <div class="col-lg-6 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary"><?= $title; ?></h6>
                </div>
                <div class="card-body">
                    <div class="text-center">
                        <h6 class="m-0 font-weight-bold text-primary"><?= $siswa['nama'] ?> </h6>
                        <h6 class="m-0 font-weight-bold text-primary"><?= $siswa['nis'] ?> </h6>
                        <h6 class="m-0 font-weight-bold text-primary">Data Tagihan <?php if ($info) {
                                                                                        echo $th_ajn;
                                                                                    } else {
                                                                                        echo $siswa['tahun_ajaran'];
                                                                                    } ?></h6>
                        <h6 class="m-0 font-weight-bold text-primary">Semester <?php if ($info) {
                                                                                    echo $smstr;
                                                                                } else {
                                                                                    echo 1;
                                                                                } ?></h6>

                        <?= $this->session->flashdata('message'); ?>
                        <?php if ($hitungbayar != $hitungtagihan) : ?>
                            <p class="badge badge-danger">Belum Lunas</p>
                        <?php else : ?>
                            <p class="badge badge-success">LUNAS</p>
                        <?php endif; ?>

                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">No.</th>
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
                                            $idsem = $smstr;
                                            $th_ajn = $th_ajn;
                                            $id_tag = $ts['id'];

                                            if ($info) {
                                                $this->db->where('nis', $nis);
                                                $this->db->where('id_tagihan', $id_tag);
                                                $this->db->where('tahun_ajaran', $th_ajn);
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
                    </div>
                    <h6>Catatan :</h6>
                    <h6>
                        <p class="badge badge-success badge-circle badge-sm">
                            <i class="fas fa-check"></i>
                        </p> : Sudah dibayar
                    </h6>
                    <h6>
                        <p class="badge badge-secondary badge-icon-split badge-sm">
                            <span class="icon text-white">
                                X
                            </span>
                        </p> : Belum dibayar
                    </h6>

                    <div class="ml-auto" style="width:100px">
                        <?php if ($info) {
                            $thn_ajran = $th_ajn;
                            $smester = $smstr;
                        } else {
                            $thn_ajran = $siswa['tahun_ajaran'];
                            $smester = 1;
                        } ?>
                        <a href="<?= base_url('manajemen/cetakinformasi/') . $siswa['nis'] . '/' . $thn_ajran . '/' . $smester ?>" class="btn btn-secondary">Cetak</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->