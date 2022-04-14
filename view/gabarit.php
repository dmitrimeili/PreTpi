<?php
/*
 * Author : Dmitri Meili
 * Date : 28.03.2022
 * Project : PreTpi
 */
require_once "helpers/helpers.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title><?=$title?></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.php?action=default">Home</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <?= login_bt();?>
        </ul>
    </div>
</nav>

<div class="btn-group " style="width:100%; text-align: center ">
    <a href="index.php?action=Videogames"> <button style="width:24%" class="rounded w3-hover-shadow" >Jeux Video</button></a>
    <a href="index.php?action=Series"><button style="width:24%" class="rounded w3-hover-shadow">Série</button></a>
    <a href="index.php?action=Films"> <button style="width:24%" class="rounded w3-hover-shadow">Film</button></a>
    <a href="index.php?action=Books"><button style="width:24%" class="rounded w3-hover-shadow">Livre</button></a>
</div>
<?= flashMessage(); ?>
<div>
    <?= $content;?>
</div>


</body>
</html>

