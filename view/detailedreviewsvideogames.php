<?php
/*
 * Author : Dmitri Meili
 * Date : 07.03.2022
 * Project : PreTpi
 */
ob_start();
$title = "ReviewDetailsVideogames";

?>
<div>
    <div>
        <h1><?= $review['name'] ?></h1><br>
        <h2>Titre : <?= $review['title'] ?></h2>
    </div>
    Console : <?= $review['type'] ?><br>
    Critique : <?= $review['review'] ?><br>
    Utilisateur : <?= $review['email'] ?><br>
    Date de sortie du jeux : <?= $review['releasedate'] ?><br>
    Date de publication : <?= $review['date'] ?><br>
    Developeur : <?= $review['companyname'] ?><br>
    Genre :
    <?php foreach ($videogames as $videogame) {
        echo " " . $videogame['Genre'] . ", ";
    }; ?>

</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
