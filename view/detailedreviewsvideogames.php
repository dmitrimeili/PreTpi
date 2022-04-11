<?php
/*
 * Author : Dmitri Meili
 * Date : 07.03.2022
 * Project : PreTpi
 */
ob_start();
$title = "ReviewDetailsVideogames";

?>
<div class="content ">

    <h1><?= $review['name'] ?></h1><br><br>
    <div class="left" style="width: 75%">
        <h2>Titre : <?= $review['title'] ?></h2><br>
        <b> Utilisateur :</b> <?= $review['email'] ?><br><br>
        <b>Date de publication :</b> <?= $review['date'] ?><br><br>
        <b>Critique :</b><br> <?= $review['review'] ?><br>
    </div>
    <div class="right" style="width: 25%">

        <h2>Information</h2>
        <b>Console :</b> <?= $review['type'] ?><br><br>
        <b>Date de sortie du jeux :</b> <?= $review['releasedate'] ?><br><br>
        <b>Developeur :</b> <?= $review['companyname'] ?><br><br>
        <b>Genre :</b>
        <?php foreach ($videogames as $videogame) { // affiche les genre
            echo " " . $videogame['Genre'] . ", ";
        }; ?>
    </div>

</>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
