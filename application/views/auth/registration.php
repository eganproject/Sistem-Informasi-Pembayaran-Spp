<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5 col-lg-7 mx-auto">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">

                <div class="col-lg">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Buat Akun Siswa</h1>
                        </div>
                        <form class="user" method="post" action="<?= base_url('auth/registration'); ?>">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="nama" name="nama" placeholder="Nama Lengkap" value="<?= set_value('nama'); ?>">
                                <?= form_error('nama', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="nis" name="nis" placeholder="NIS" value="<?= set_value('nis'); ?>">
                                <?= form_error('nis', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>


                            <div class="form-group">
                                <select class="form-control-user" id="id_kelas" name="id_kelas">
                                    <option value="">Pilih Kelas</option>
                                    <?php foreach ($kelas as $k) : ?>
                                        <option value="<?= $k['id'] ?>"><?= $k['kelas']; ?>-<?= $k['nama_kelas'] ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <?= form_error('id_kelas', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>


                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="Email Address" value="<?= set_value('email'); ?>">
                                <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="no_telepon" name="no_telepon" placeholder="No Telepon / No Handphone" value="<?= set_value('no_telepon'); ?>">
                                <?= form_error('no_telepon', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>
                            <div class="form-group">
                                <textarea type="text" class="form-control form-control-user" id="alamat" name="alamat" placeholder="Alamat" value="<?= set_value('alamat'); ?>" rows="2"></textarea>
                                <?= form_error('alamat', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>
                            <div class="form-group">
                                <select class="form-control-user" id="tahun_ajaran" name="tahun_ajaran">
                                    <option value="">Tahun Masuk</option>
                                    <?php foreach ($tahun as $t) : ?>
                                        <option value="<?= $t['tahun_ajaran'] ?>"><?= $t['tahun_ajaran']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <?= form_error('tahun_ajaran', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user" id="password1" name="password1" placeholder="Password">
                                    <?= form_error('password1', '<small class="text-danger pl-3">', '</small>'); ?>
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" id="password2" name="password2" placeholder="Ulangi Password">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-user btn-block">
                                Daftar Akun
                            </button>

                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="<?= base_url('auth/forgotpassword'); ?>">Lupa Password?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="<?= base_url('/auth/index'); ?>">Sudah Punya Akun ? Login!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>