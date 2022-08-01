<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <?= form_open() ?>
    <div class="input-group col-lg-3 mt-3">
        <div class="input-group-prepend">
            <select class="form-control" id="id_kls" name="id_kls" autofocus>
                <option value=""><?php if ($cek_kls) {
                                        echo $kls_cek['kelas'] . '-' . $kls_cek['nama_kelas'];
                                    } else {
                                        echo 'Kelas';
                                    } ?></option>
                <?php foreach ($kelas as $kls) : ?>
                    <option value="<?= $kls['id'] ?>"><?= $kls['kelas'] ?>-<?= $kls['nama_kelas'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>


        <div class="input-group-append">
            <input class="btn btn-primary" type="submit" name="cek_kls" value="Cari">
        </div>
    </div>
    <?= form_close() ?>



    <?= form_open() ?>
    <div class="input-group ml-auto" style="width:250px">
        <div class="input-group-prepend">
            <select class="form-control" id="t_aj" name="t_aj">
                <?php foreach ($testahun as $tt) : ?>
                    <option value="<?= $tt['tahun_ajaran'] ?>"><?= $tt['tahun_ajaran'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="input-group-prepend">
            <select class="form-control" id="sems" name="sems">
                <?php foreach ($smstr as $sms) : ?>
                    <option value="<?= $sms['id'] ?>"><?= $sms['id'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="input-group-append">
            <input class="btn btn-primary" type="submit" name="cek2" value="Cek">
        </div>
    </div>
    <?= form_close() ?>


    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h5 class="m-0 font-weight-bold text-primary"><?= $title; ?></h5>
        </div>
        <div class="card-body">

            <h6 class="text-center font-weight-bold">Kelas <?php if ($cek_kls) {
                                                                echo $kls_cek['kelas'] . '-' . $kls_cek['nama_kelas'];
                                                            } else {
                                                                echo '-';
                                                            } ?></h6>
            <h6 class="text-center font-weight-bold">Tahun Ajaran <?php if ($cek2) {
                                                                        echo $t_aj;
                                                                    } else {
                                                                        echo $tahundeff;
                                                                    }  ?></h6>
            <h6 class="text-center font-weight-bold">Semester <?php if ($cek2) {
                                                                    echo $sems;
                                                                } else {
                                                                    echo 1;
                                                                } ?></h6>
            <hr>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">NISN</th>
                            <th scope="col">Nama</th>
                            <th scope="col">Kelas</th>
                            <th scope="col">Tagihan</th>
                            <th scope="col">Bayar</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <th></th>
                        <th></th>
                        <th>Jumlah</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <?php
                        if ($cek2) {
                            $th_cetak = $t_aj;
                            $smstr_ctk = $sems;
                        } else {
                            $th_cetak = $tahundeff;
                            $smstr_ctk = 1;
                        } ?>
                        <th> <a href="<?= base_url('pembayaran/cetakkelas/') . $id_kls . '/' . $th_cetak . '/' . $smstr_ctk; ?>" class="btn btn-secondary">Cetak</a></th>
                    </tfoot>
                    <tbody>
                        <?php $i = 1; ?>
                        <?php foreach ($siswa as $s) : ?>
                            <tr>
                                <td><?= $i++; ?></td>
                                <td><?= $s['nis'] ?></td>
                                <td><?= $s['nama'] ?></td>
                                <td><?php echo $s['kelas'] . '-' . $s['nama_kelas'] ?></td>
                                <td><?= $hitungtagihan ?></td>

                                <!-- HITUNG BAYAR -->
                                <?php
                                $nis = $s['nis'];
                                $th_ajaran = $t_aj;
                                $smstr = $sems;



                                ?>
                                <td>
                                    <?php
                                    if ($cek2) {

                                        $this->db->select_sum('tarif');
                                        $this->db->where('nis', $nis);
                                        $this->db->where('tahun_ajaran', $th_ajaran);
                                        $this->db->where('id_semester', $smstr);
                                        $query = $this->db->get('pembayaran_spp')->row()->tarif;
                                        echo $query;
                                    } else {
                                        $this->db->select_sum('tarif');
                                        $this->db->where('nis', $nis);
                                        $this->db->where('tahun_ajaran', $tahundeff);
                                        $this->db->where('id_semester', 1);
                                        $query = $this->db->get('pembayaran_spp')->row()->tarif;
                                        echo $query;
                                    }

                                    ?>
                                </td>
                                <!-- Sampai Sini Hitung Bayar -->
                                <td>
                                    <?php if ($query == $hitungtagihan) : ?>
                                        <a href="" class="badge badge-pill badge-success">Lunas</a>
                                    <?php else : ?>
                                        <a href="" class="badge badge-pill badge-warning">Belum</a>
                                    <?php endif; ?>
                                </td>


                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>



            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->