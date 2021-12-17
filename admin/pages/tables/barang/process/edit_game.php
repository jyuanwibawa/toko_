<?php
    // include DB connection file
    include '../../../../../helper/connection.php';

    // mendapatkan nilai dari form
    $id_game        = $_POST['id_game'];
    $nama_game     = $_POST['nama_game'];
    $id_kategori    = $_POST['id_kategori'];
    $stok           = $_POST['stok'];
    $harga          = $_POST['harga'];
    $deskripsi      = $_POST['deskripsi'];

    $nama_folder    = "images";
    $nama_file      = $_FILES["gambar"]["name"];
    $tmp            = $_FILES["gambar"]["tmp_name"];
    $path           = "../../../../../$nama_folder/$nama_file";
    $tipe_file      = array("image/jpeg","image/png","image/jpg","image/jfif");

    $query = "UPDATE barang SET nama_game = '$nama_game', id_kategori = '$id_kategori', stok = $stok, harga = $harga, deskripsi = '$deskripsi' WHERE id_game = '$id_game'";

    // syarat upload foto
    if(!in_array($_FILES["gambar"]["type"],$tipe_file) && $nama_file != "")
    {
        $error = urldecode("Cek kembali ekstensi file anda (*.jpg,*.gif,*.png,*.jfif)");
        header("Location:../table_game.php?error=$error");
    }
    else if(in_array($_FILES["gambar"]["type"],$tipe_file) && $nama_file != "")
    {
        // jika gambar diubah
        $query_gambar = "SELECT gambar FROM barang WHERE id_game=$id_game";
        $result       = mysqli_query($connect, $query_gambar);
        $hasil        = mysqli_fetch_assoc($result);
        $gambar       = $hasil['gambar'];

        // menghapus gambar lama
        unlink('../../../../../images/'. $gambar);
        
        // upload gambar baru
        move_uploaded_file($tmp,$path);
        
        // query untuk mengupdate data + gambar
	    $query = "UPDATE barang SET nama_game = '$nama_game', stok = $stok, harga = $harga, deskripsi = '$deskripsi', gambar='$nama_file' WHERE id_game = '$id_game'";

        // menjalankan query isi data
        if (mysqli_query($con, $query))
        {
            header("Location:../table_game.php");
        }
        else
        {
            $error = urldecode("Data tidak berhasil diupdate");
            header("Location:../table_game.php?error=$error");
        }
    }
    else if($nama_file == "")
    {
	// query untuk mengupdate data
        $query = "UPDATE barang SET nama_game = '$nama_game', id_kategori = '$id_kategori', stok = $stok, harga = $harga, deskripsi = '$deskripsi' WHERE id_game = '$id_game'";

        // menjalankan query update data
        if (mysqli_query($con, $query))
        {
            header("Location:../table_barang.php");
        }
        else
        {
            $error = urldecode("Update gagal dijalankan");
            header("Location:../table_barang.php?error=$error");
        }
    }

    mysqli_close($con);
?>
