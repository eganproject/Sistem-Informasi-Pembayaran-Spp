<!-- Begin Page Content -->
<div class="container-fluid">



    <div class="row">
        <div class="col-lg-8">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary"><?= $title; ?></h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">

                    <?php echo form_open_multipart('user/editprofile'); ?>

                    <div class="form-group row">
                        <label for="nama" class="col-sm-2 col-form-label">Nama Lengkap</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="nama" name="nama" value="<?= $user['nama']; ?>">
                            <?= form_error('nama', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                    </div>
                    <?php
                    if ($user['role_id'] != 2) : ?>

                    <?php else : ?>



                        <div class="form-group row">
                            <label for="nis" class="col-sm-2 col-form-label">NIS</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="nis" name="nis" value="<?= $user['nis']; ?>" readonly>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="tahun_ajaran" class="col-sm-2 col-form-label">Tahun Ajaran</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="tahun_ajaran" name="tahun_ajaran" value="<?= $user['tahun_ajaran']; ?>" readonly>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="id_kelas" class="col-sm-2 col-form-label">Kelas</label>
                            <div class="col-md-2">
                                <select class="form-control" id="id_kelas" name="id_kelas">
                                    <option value="<?= $namakelas['id_kelas']; ?>"><?= $namakelas['kelas']; ?>-<?= $namakelas['nama_kelas']; ?></option>
                                    <?php foreach ($kelas as $k) : ?>
                                        <option value="<?= $k['id'] ?>"><?= $k['kelas']; ?>-<?= $k['nama_kelas']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                    <?php endif; ?>

                    <div class="form-group row">
                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="email" name="email" value="<?= $user['email']; ?>" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="no_telepon" class="col-sm-2 col-form-label">No. Telepon</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="no_telepon" name="no_telepon" value="<?= $user['no_telepon']; ?>">
                            <?= form_error('no_telepon', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="alamat" class="col-sm-2 col-form-label">Alamat</label>
                        <div class="col-sm-10">
                            <textarea type="text" class="form-control" rows="3" id="alamat" name="alamat"><?= $user['alamat']; ?></textarea>
                            <?= form_error('alamat', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">Foto</div>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-sm-3">
                                    <img src="<?= base_url('assets/img/profile/') . $user['image']; ?>" class="img-thumbnail">
                                </div>
                                <div class="col-sm-9">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="image" name="image">
                                        <label class="custom-file-label" for="image">Choose file</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row justify-content-end">
                        <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </div>
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