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

    <h6 class="text-center">Nama <?= $user['nama'] ?></h6>
    <h6 class="text-center">Nis <?= $user['nis'] ?></h6>
    <h6 class="text-center">Tahun Ajaran <?= $thn_ajran; ?></h6>
    <h6 class="text-center">Semester <?= $smsterr ?></h6>

    <table class="width:100%">
        <thead class="thead-dark">
            <tr>
                <th scope="col">No</th>
                <th scope="col">Bulan</th>
                <th scope="col">Tarif</th>
                <th scope="col">Status</th>

            </tr>
        </thead>
        </tbody>
        <?php
        $this->db->where('tahun_ajaran', $thn_ajran);
        $this->db->where('id_semester', $smsterr);
        $this->db->order_by('id', 'ASC');
        $tagihan = $this->db->get('tagihan_spp')->result_array();
        ?>
        <?php $i = 1; ?>
        <?php foreach ($tagihan as $ts) : ?>
            <tr>
                <td><?= $i++; ?></td>
                <td><?= $ts['bulan']; ?></td>
                <td><?= $ts['tarif']; ?></td>
                <td>
                    <?php
                    $id_tag = $ts['id'];

                    $this->db->where('nis', $user['nis']);
                    $this->db->where('id_tagihan', $id_tag);
                    $this->db->where('tahun_ajaran', $thn_ajran);
                    $this->db->where('id_semester', $smsterr);
                    $this->db->order_by('id', 'ASC');
                    $query = $this->db->get('pembayaran_spp')->row_array();
                    ?>

                    <?php if ($query) { ?>
                        <p>
                            Lunas
                        </p>
                    <?php } else { ?>
                        <p>
                            Belum
                        </p>
                    <?php } ?>
                </td>

            </tr>
        <?php endforeach; ?>
        <tr>
            <th></th>
            <th>Total Tagihan</th>
            <?php
            $this->db->select_sum('tarif');
            $this->db->where('tahun_ajaran', $thn_ajran);
            $this->db->where('id_semester', $smsterr);
            $hitungtag = $this->db->get('tagihan_spp')->row()->tarif;
            ?>
            <th><?= $hitungtag ?></th>
            <th></th>
        </tr>
        <?php
        $this->db->select_sum('tarif');
        $this->db->where('nis', $user['nis']);
        $this->db->where('tahun_ajaran', $thn_ajran);
        $this->db->where('id_semester', $smsterr);
        $hitungbay = $this->db->get('pembayaran_spp')->row()->tarif;
        ?>
        <tr>
            <th></th>
            <th>Total Bayar</th>
            <th></th>
            <th><?= $hitungbay ?></th>
        </tr>
        <tr>
            <th></th>
            <th>Sisa Tagihan</th>
            <th><?php $sisa = $hitungtag - $hitungbay;
                echo $sisa ?></th>
            <th></th>
        </tr>
        </tbody>
    </table>
    <script type="text/javascript">
        window.print();
    </script>
</body>

</html>