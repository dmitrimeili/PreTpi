<?php
/*
 * Author : Dmitri Meili
 * Date : 15.03.2022
 * Project : PreTpi
 */
ob_start();
$title="ReviewDetailsVideogames";

?>

<div>
    Titre : <?= $review['title'] ?><br>
    Creator : <?= $review['name'] ?> <?= $review['surname'] ?>
</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>

