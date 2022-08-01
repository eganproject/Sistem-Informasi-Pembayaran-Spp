<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>



    <div class="row">
        <div class="col-lg-8">
            <?= form_error('kelas', '<div class="alert alert-danger alert-dismissible fade show" role="alert">', '<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
          </div>'); ?>

            <?= $this->session->flashdata('message'); ?>


            <table class="table table-borderless">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">NISN</th>
                        <th scope="col">Nama</th>
                        <th scope="col">Kelas</th>
                        <th scope="col">Status Pembayaran</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1; ?>
                    <?php foreach ($siswa as $s) : ?>

                        <tr>
                            <th scope="row"><?= $i; ?></th>
                            <td><?= $s['nis']; ?></td>
                            <td><?= $s['nama']; ?></td>
                            <td><?= $s['kelas']; ?>-<?= $s['nama_kelas']; ?></td>
                            <td>
                                <a href="<?= base_url('manajemen/infosiswa'); ?>/<?= $s['nis']; ?>" class="badge badge-pill badge-warning">Lihat</a>
                            </td>
                        </tr>
                        <?php $i++; ?>
                    <?php endforeach; ?>


                </tbody>
            </table>


        </div>
    </div>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->