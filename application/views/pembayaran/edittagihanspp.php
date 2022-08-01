<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>



    <div class="row">
        <div class="col-lg-8">
            <div class="row">
                <div class="col-lg-8">

                    <?php echo form_open_multipart('pembayaran/edittagihanspp'); ?>

                    <div class="form-group">
                        <div class="col-sm-5">
                            <label for="">Tahun Ajaran</label>
                            <input type="hidden" name="id" value="<?= $tagihanspp['id']; ?>">
                            <input type="text" class="form-control" name="tahun_ajaran" value="<?= $tagihanspp['tahun_ajaran']; ?>" readonly>
                            <?= form_error('tahun_ajaran', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <label for="">Semester</label>
                            <input type="text" class="form-control" name="id_semester" value="<?= $tagihanspp['id_semester']; ?>" readonly>
                            <?= form_error('id_semester', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <label for="">Bulan</label>
                            <select name="bulan" id="bulan" class="form-control">
                                <option value="<?= $tagihanspp['bulan']; ?>"><?= $tagihanspp['bulan']; ?></option>
                                <?php foreach ($bulan as $b) : ?>
                                    <option value="<?= $b['bulan']; ?>"><?= $b['bulan']; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?= form_error('bulan', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <label for="">Tarif</label>
                            <input type="text" class="form-control" name="tarif" value="<?= $tagihanspp['tarif']; ?>">
                            <?= form_error('tarif', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-auto">
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </div>
                    </div>
                </div>
                </form>
                </tbody>
                </table>


            </div>
        </div>


    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->