<?php /*<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.css">
    <title>PreTpi</title>
</head>
<body>
<div class="p-3 bg-primary">
<?php echo $content ?>
</div>
</body>
</html>
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

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.php?action=default">Home</a>
        </div>
        <ul class="nav navbar-nav">

            <li><a href="index.php?action=SendMail">Send Mail</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <?= login_bt();?>
        </ul>
    </div>
</nav>

<div class="btn-group" style="width:100%; text-align: center ">
    <a href="index.php?action=Videogames"> <button style="width:24%" >Jeux Video</button></a>
    <a href="index.php?action=Series"><button style="width:24%">Série</button></a>
    <a href="index.php?action=Films"> <button style="width:24%">Film</button></a>
    <a href="index.php?action=Books"><button style="width:24%">Livre</button></a>
</div>
<?= flashMessage(); ?>
<div>
    <?= $content;?>
</div>


</body>
</html>

