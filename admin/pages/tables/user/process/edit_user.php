<?php
    // include DB connection file
    include '../../../../../helper/connection.php';

    // mendapatkan nilai dari form
    $id_pembeli   = $_POST['id_pembeli'];
    $username      = $_POST['username'];
    $password      = $_POST['password'];

    $query = "UPDATE user SET username = '$username', password = '$password' WHERE id_pembeli = '$id_pembeli'";

    // menjalankan query isi data
    if (mysqli_query($con, $query))
    {
        header("Location:../table_user.php");
    }
    else
    {
        $error = urldecode("Data tidak berhasil diupdate");
        header("Location:../table_user.php?error=$error");
    }

    mysqli_close($con);
?>