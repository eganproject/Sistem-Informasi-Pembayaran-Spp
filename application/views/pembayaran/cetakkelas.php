<html lang="en">

<head>
    <style>
        table,
        td,
        th {
            border: 1px solid black;
        }

        table {
            border-collapse: collapse;
            width: 80%;
        }

        th {
            height: 35px;
        }
    </style>
    <title>Document</title>
</head>

<body>
    <h6 class="text-center">Kelas <?= $nm_kls['kelas'] . '-' . $nm_kls['nama_kelas']; ?></h6>
    <h6 class="text-center">Tahun Ajaran <?= $th_ajrn; ?></h6>
    <h6 class="text-center">Semester <?= $smstrctk ?></h6>

    <table class="width:100%">
        <thead>
            <tr>
                <th scope="col">No.</th>
                <th scope="col">NISN</th>
                <th scope="col">Nama</th>
                <th scope="col">Kelas</th>
                <th scope="col">Tagihan</th>
                <th scope="col">Bayar</th>
                <th scope="col">Status</th>
            </tr>
        </thead>

        <tbody>
            <?php $i = 1; ?>
            <?php foreach ($cetakdata as $s) : ?>
                <tr>
                    <td><?= $i++; ?></td>
                    <td><?= $s['nis'] ?></td>
                    <td><?= $s['nama'] ?></td>
                    <td><?php echo $s['kelas'] . '-' . $s['nama_kelas'] ?></td>
                    <td><?php
                        $this->db->select_sum('tarif');
                        $this->db->where('tahun_ajaran', $th_ajrn);
                        $this->db->where('id_semester', $smstrctk);
                        echo $query1 = $this->db->get('tagihan_spp')->row()->tarif;
                        ?></td>
                    <td><?php
                        $this->db->select_sum('tarif');
                        $this->db->where('nis', $s['nis']);
                        $this->db->where('tahun_ajaran', $th_ajrn);
                        $this->db->where('id_semester', $smstrctk);
                        $query2 = $this->db->get('pembayaran_spp')->row()->tarif;
                        echo $query2; ?>
                    </td>
                    <?php
                    if ($query1 == $query2) : ?>
                        <th>Lunas</th>
                    <?php else : ?>
                        <td><em>Belum</em></td>
                    <?php endif; ?>




                </tr>
            <?php endforeach; ?>
        </tbody>
        <tr>
            <th></th>
            <th></th>
            <th>Jumlah</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
    </table>
    <script type="text/javascript">
        window.print();
    </script>
</body>

</html>