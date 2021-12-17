<?php
include '../helper/connection.php';
session_start();

if($_SESSION['id_pembeli'] == '')
{
    header('location:../admin/index.php');
}
else
{
    $tampilkan_isi = "select count(id_transaksi) as jumlah from transaksi";
    $tampilkan_isi_sql = mysqli_query($con,$tampilkan_isi);
    $no = 1;
    while ($isi = mysqli_fetch_array($tampilkan_isi_sql))
    {
        $no=$no+$isi['jumlah'];
    }

    foreach ($_SESSION["keranjang"] as $id_barang => $jumlah) 
    {
        $ambil = $con->query("SELECT * FROM barang WHERE id_barang='$id_barang'");
        $pecah = $ambil->fetch_assoc();
        $id_barang = $pecah["id_barang"];
        $subharga = $pecah["harga"]*$jumlah;
        $id_pembeli = $_SESSION['id_pembeli'];

        $query = $con->query("INSERT INTO transaksi (id_transaksi, id_pembeli, id_barang, tgl_transaksi, jumlah, total) VALUES ('TR-$no', '$id_pembeli','$id_barang',now(), $jumlah, $subharga)");
        
        if($query)
        {
            $newqty = $pecah['stok'] - $jumlah;
            $con->query("UPDATE barang SET stok = $newqty WHERE id_barang = '$id_barang'");
        }
        else
        {
            echo "<script>alert('tranksaksi gagal!');</script>";
        }

        $no++;
    }

    unset($_SESSION['keranjang']);
    unset($_SESSION['nomor']);
    header('location:../order.php');
}
?>