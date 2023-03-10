<?php
session_start();
include "../koneksi.php";
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
if (!isset($_SESSION['username'])) {
    die("Anda belum login, klik <a href=\"../index.php\">disini</a> untuk login");
} else {
    $username = $_SESSION['username'];
    $nama = $_SESSION['nama'];
    $level = $_SESSION['level'];
}

$kode = $_GET['id'];
$username = $_SESSION['username'];
$nama = $_SESSION['nama'];
$jenis = $_POST['jenis'];
$deskripsi = $_POST['deskripsi'];
$file_name = $_FILES['data']['name'];
$direktori = "../pengaduan/";


if (isset($_POST['simpan'])) {
    if (empty($jenis && $deskripsi && $file_name) != true) {
        $ekstensi_boleh = array('pdf');
        $x = explode('.', $file_name);
        $ekstensi = strtolower(end($x));
        if (in_array($ekstensi, $ekstensi_boleh) === true) {
            if ($_GET['hal'] == "edit") {
                $query = "UPDATE pengaduan SET
            --  username = '$_POST[username]',
            --  nama = '$_POST[nama]',
             jenis = '$_POST[jenis]',
             deskripsi = '$_POST[deskripsi]',
             `data` = '$file_name',
             tanggal = NOW()
             WHERE pengaduan.id = '$kode'";
                $edit = mysqli_query($koneksi, $query) or die("Error in query: $query");

                if ($edit) {
                    move_uploaded_file($_FILES['data']['tmp_name'], $direktori . $file_name);
                    // $sukses = "Berhasil Menyimpan Data";
                    echo "<script>alert('Berhasil Memperbarui Pengaduan!');</script>";
                    // exit();
                    header("refresh:2;url=pengaduan.php");
                    // header("Location: pengaduan.php", true, 301);
                    // echo "<script>location.replace('pengaduan.php');</script>";
                } else {
                    echo "<script>alert('Edit Data Gagal!');</script>";
                    // $error = "Gagal Menyimpan Data";
                    header("refresh:2;url=pengaduan.php");
                    // echo "<script>location.replace('pengaduan.php');</script>";
                }
            } else {

                $sql = "INSERT INTO pengaduan (userId, nama, jenis, deskripsi, `data`, tanggal)
             values ('" . $username . "','" . $nama . "','" . $jenis . "','" . $deskripsi . "','" . $file_name . "',NOW())";
                $a = $koneksi->query($sql);
                if ($a === true) {
                    move_uploaded_file($_FILES['data']['tmp_name'], $direktori . $file_name);
                    // $sukses = "Berhasil Menyimpan Data";
                    echo "<script>alert('Berhasil Mengirim Pengaduan!');</script>";
                    header("refresh:2;url=pengaduan.php");
                } else {
                    echo "<script>alert('Gagal Mengirim Pengaduan!');</script>";
                    echo "<script>history.back();</script>";
                    // header("refresh:2;url=pengaduan.php");
                }
            }
        } else {
            echo "<script>alert('Ekstensi gambar hanya bisa pdf');</script>";
            echo "<script>history.back();</script>";
        }
    } else {
        echo "<script>alert('Ada Input yang Kosong!');</script>";
        echo "<script>location.replace('pengaduan.php?status=gagal');</script>";
    }
} else {
    //  echo "<script>alert('Gagal Mengirim Pengaduan!');</script>";
    echo "<script>location('pengaduan.php');</script>";
}

// tombol edit tabel
if (isset($_GET['hal'])) {
    if ($_GET['hal'] == "edit") {
        $b = mysqli_query($koneksi, "SELECT * FROM pengaduan where id='$_GET[id]'");
        $data = mysqli_fetch_array($b);
        if ($data) {
            $vjenis = $data['jenis'];
            $vdesk = $data['deskripsi'];
            $vdata = $data['data'];
        }
    } elseif ($_GET['hal'] == "hapus") {
        $hapus = mysqli_query($koneksi, "DELETE FROM pengaduan WHERE id='$_GET[id]'");
        if ($hapus) {
            echo "<script>alert('Hapus Data Sukses!');</script>";
            header("refresh:2;url=pengaduan.php");
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Pengaduan</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <style>
        h1 {
            margin-top: 80px;
            text-align: center;
        }

        body {
            font-family: 'Poppins', sans-serif;
        }

        .layanan:hover>.dropdown-menu {
            display: block;
        }

        button {
            background-color: #2d2d44;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #fa736b;
        }

        .navbar-brand {
            font-weight: bold;
            color: #cdc2ae;
        }

        .pengaduan {
            width: 95%;
        }

        .form-peng {
            background-color: #ECE5C7;
        }
    </style>
</head>

<body>
    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-light shadow-lg fixed-top" style="background-color: #68A7AD;">
        <div class="container-fluid">
            <a class="navbar-brand" href="../home.php">S I L P I S</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../home.php">Home</a>
                    </li>
                    <li class="nav-item layanan">
                        <a class="nav-link" href="../petugas/aturan_layanan.php" aria-current="page">Layanan</a>
                    </li>
                </ul>
                <span class="navbar-profile">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <?php $username = $_SESSION['username'];
                                echo "$username"; ?>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <li><a class="dropdown-item" href="../logout.php">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </span>
            </div>
        </div>
    </nav>
    <!-- banner -->
    <h1> Layanan Pengaduan Masyarakat</h1>
    <div class="container-fluid pengaduan">
        <div class="card-wrap mt-5">
            <div class="card pengaduan-form">
                <div class="card-header form-peng">
                    <h2 class="card-title text-center">FORM PENGADUAN</h2>
                </div>
                <div class="card-body">
                    <div class="alert alert-warning" role="alert">
                        Sebelum Mengisi Pengaduan, lihat persyaratan yang diinginkan terlebih dahulu pada <a href="../petugas/aturan_layanan.php">aturan layanan</a>
                    </div>
                    <form action="" method="POST" enctype="multipart/form-data">
                        <?php
                        $a = mysqli_query($koneksi, "select * from user where username='$_SESSION[username]'");
                        $tampil = mysqli_fetch_array($a);
                        ?>
                        <!-- <fieldset disabled> -->
                        <div class="mb-3 row">
                            <label for="disabledTextInput" class="col-sm-3 col-form-label text-start">ID Pengaduan</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" name="id" value="<?= $data['id'] ?>" placeholder="Otomatis Oleh Sistem" disabled>
                                <!-- <div class="keterangan">: </div> -->
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="disabledTextInput" class="col-sm-3 col-form-label text-start">Nama Lengkap</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" name="nama" value="<?= $tampil['nama'] ?>" disabled>
                                <!-- <div class="keterangan">: <?= $tampil['nama'] ?></div> -->
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-3 col-form-label text-start">Jenis Pengaduan</label>
                            <div class="col-sm-9">
                                <select name="jenis" class="form-control">
                                    <?php
                                    include "../koneksi.php";
                                    $a = "SELECT * FROM layanan WHERE jenis = 'Pengaduan'";
                                    $b = mysqli_query($koneksi, $a);
                                    while ($c = $b->fetch_array()) { ?>
                                        <option value="<?php echo $c['spesifikasi'] ?>">
                                            <?php echo $c['spesifikasi']; ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-3 col-form-label text-start">Deskripsi</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="deskripsi" value="<?= @$vdesk ?>" placeholder="Tulis detail pengaduanmu max 200 kata"><?= $vdesk ?></textarea>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="formFileMultiple" class="col-sm-3 col-form-label text-start">Data Pendukung</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="file" name="data" value="<?= @$vdata ?>" accept="application/pdf">
                                <label class="text-danger" style="font-size:smaller">pastikan sesuai dengan format yang diminta</label>
                            </div>
                        </div>
                        <div class="button-align text-end">
                            <button type="submit" name="simpan" class="btn btn-success">SIMPAN</button>
                            <button type="reset" name="reset" class="btn btn-danger">RESET</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="card-wrap mt-4">
            <!-- <div class="card tabel-form"> -->
            <!-- <div class="card-header"> -->
            <h3 class="card-title text-center">Datar Pengaduan</h3>
            <!-- </div> -->
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <tr class="text-center">
                        <th>No.</th>
                        <!-- <th>Tanggal Input Data</th> -->
                        <th scope="col">ID</th>
                        <th scope="col">Nama</th>
                        <th scope="col">Jenis Pengaduan</th>
                        <th scope="col">Deskripsi</th>
                        <th scope="col">Data Pendukung</th>
                        <?php if ($_SESSION['level'] == "warga" || $_SESSION['level'] == "admin") { ?>
                            <th scope="col">Aksi</th>
                        <?php } ?>
                    </tr>
                    <?php
                    $no = 1;
                    if ($_SESSION['level'] == "petugas" || $_SESSION['level'] == "admin") {
                        $a = mysqli_query($koneksi, "SELECT * FROM pengaduan");
                    } elseif ($_SESSION['level'] == "warga") {
                        $a = mysqli_query($koneksi, "SELECT * FROM pengaduan where userId='$_SESSION[username]'");
                    }
                    while ($tampil = mysqli_fetch_array($a)) : ?>
                        <tr>
                            <td><?= $no++ ?></td>
                            <td><?= $tampil['id'] ?></td>
                            <td><?= $tampil['nama'] ?></td>
                            <td><?= $tampil['jenis'] ?></td>
                            <td><?= $tampil['deskripsi'] ?></td>
                            <td><a href="downloadfile.php?peng=<?= $tampil['data']; ?>"><?php echo $tampil['data']; ?></a></td>
                            <!-- <td><?= $tampil['data'] ?></td> -->
                            <?php if ($_SESSION['level'] == "warga" || $_SESSION['level'] == "admin") { ?>
                                <td class="text-center">
                                    <a href="pengaduan.php?hal=edit&id=<?= $tampil['id'] ?>" class="btn btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                                    <a href="pengaduan.php?hal=hapus&id=<?= $tampil['id'] ?>" onclick="return confirm('Apakah yakin ingin menghapus data ini?')" class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
                                </td>
                            <?php } ?>
                        </tr>
                    <?php endwhile; ?>
                </table>
            </div>
            <!-- </div> -->
        </div>
        <!-- </div> -->
    </div>
    <br><br><br>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>