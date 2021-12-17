<?php
    // include DB connection file
    include '../../../../../helper/connection.php';

    // mendapatkan nilai dari form
    $id_pembeli     = $_POST['id_pembeli'];
    $nama_pembeli    = $_POST['nama_pembeli'];
    $email_pembeli    = $_POST['email_pembeli'];
    $telp_pembeli    = $_POST['telp_pembeli'];

    $query = "UPDATE pembeli SET nama_pembeli = '$nama_pembeli', email_pembeli = '$email_pembeli', telp_pembeli = '$telp_pembeli' WHERE id_pembeli = '$id_pembeli'";

    // menjalankan query isi data
    if (mysqli_query($con, $query))
    {
        header("Location:../table_pembeli.php");
    }
    else
    {
        $error = urldecode("Data tidak berhasil diupdate");
        header("Location:../table_pembeli.php?error=$error");
    }

    mysqli_close($con);
?>