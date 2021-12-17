<?php
    // include DB connection file
    include '../../../../../helper/connection.php';

    // mendapatkan nilai dari form
    $id_pembeli = $_GET['id_pembeli'];

    $query = "UPDATE user SET deleted = 1 WHERE id_pembeli = '$id_pembeli'";

    // menjalankan query isi data
    if (mysqli_query($con, $query))
    {
        header("Location:../table_user.php");
    }
    else
    {
        $error = urldecode("Data tidak berhasil dihapus");
        header("Location:../table_user.php?error=$error");
    }

    mysqli_close($con);
?>