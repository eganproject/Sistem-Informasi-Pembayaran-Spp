<!-- Begin Page Content -->
<div class="container-fluid">




    <div class="row">
        <div class="col-lg-6">
            <?= form_error('kelas', '<div class="alert alert-danger alert-dismissible fade show" role="alert">', '<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
          </div>'); ?>

            <?= $this->session->flashdata('message'); ?>

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
                                    <th scope="col">Kelas</th>
                                    <th scope="col">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>X</td>
                                    <td><a href="<?= base_url('manajemen/kelas/') . 'X'; ?>" class="badge badge-success"><i class="far fa-eye"> Lihat</i></a></td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>XI</td>
                                    <td><a href="<?= base_url('manajemen/kelas/') . 'XI'; ?>" class="badge badge-success"><i class="far fa-eye"> Lihat</i></a></td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>XII</td>
                                    <td><a href="<?= base_url('manajemen/kelas/') . 'XII'; ?>" class="badge badge-success"><i class="far fa-eye"> Lihat</i></a></td>
                                </tr>

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