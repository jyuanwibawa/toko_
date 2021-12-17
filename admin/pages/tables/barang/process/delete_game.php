<?php
    // include DB connection file
    include '../../../../../helper/connection.php';

    // mendapatkan nilai dari form
    $id_game = $_GET['id_game'];

    $query = "UPDATE barang SET deleted = 1 WHERE id_game = '$id_game'";

    // menjalankan query isi data
    if (mysqli_query($con, $query))
    {
        header("Location:../table_barang.php");
    }
    else
    {
        $error = urldecode("Data tidak berhasil dihapus");
        header("Location:../table_barang.php?error=$error");
    }

    mysqli_close($con);
?>