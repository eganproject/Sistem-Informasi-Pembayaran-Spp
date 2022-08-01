<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>



    <div class="row">
        <div class="col-lg-8">

            <div class="row">
                <div class="col-lg-8">

                    <?php echo form_open_multipart('menu/editdatasubmenu'); ?>


                    <div class="form-group">
                        <input type="hidden" id="id" name="id" value="<?= $submenu['id']; ?>">
                        <input type="text" class="form-control" id="title" name="title" value="<?= $submenu['title']; ?>">
                        <?= form_error('title', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <select name="menu_id" id="menu_id" class="form-control">
                            <option value="<?= $submenu['menu_id']; ?>"><?= $submenu['menu']; ?></option>
                            <?php foreach ($menu as $m) : ?>
                                <option value="<?= $m['id']; ?>"><?= $m['menu']; ?></option>
                            <?php endforeach; ?>
                            <?= form_error('menu_id', '<small class="text-danger pl-3">', '</small>'); ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="url" name="url" value="<?= $submenu['url']; ?>">
                        <?= form_error('url', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="icon" name="icon" value="<?= $submenu['icon']; ?>">
                        <?= form_error('icon', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" name="is_active" id="is_active" checked>
                            <label class="form-check-label" for="is_active">
                                Active ?
                            </label>
                        </div>
                    </div>
                    <div class="form-group">

                        <button type="submit" class="btn btn-primary">Edit</button>

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