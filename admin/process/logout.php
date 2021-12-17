<?php

session_start();

if($_SESSION['id_pembeli'] == "")
{
    session_destroy();

    header('location:../index.php');
}
else
{
    session_destroy();

    header('location:../../index.php');
}


?>