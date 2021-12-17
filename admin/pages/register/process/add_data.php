<?php
    include('../../../../helper/connection.php');

    $id_pembeli        = $_POST['id_pembeli'];
    $nama_pembeli      = $_POST['nama_pembeli'];
    $email_pembeli      = $_POST['email_pembeli'];
    $telp_pembeli      = $_POST['telp_pembeli'];

    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "INSERT INTO pembeli VALUES ('$id_pembeli','$nama_pembeli','$email_pembeli','$telp_pembeli',0)";
    $query2 = "INSERT INTO user VALUES ('$username','$password','Pembeli','$id_pembeli',0)";

    // menjalankan query isi data
    if (mysqli_query($con, $query) && mysqli_query($con, $query2))
    {
        header("Location:../../../index.php");
    }
    else
    {
        echo "<script type='text/javascript'>
	    alert('Login Gagal!')
	    </script>";
        header("Location:../index.php");
    }

    mysqli_close($con);

?>