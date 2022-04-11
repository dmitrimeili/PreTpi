<?php
/*
 * Author : Dmitri Meili
 * Date : 03.03.2022
 * Project : PreTpi
 */
ob_start();
$title = "home";

?>

    <div class="content">
        <?php foreach ($reviews as $review) { //affiche les review ?>

            <hr>
            <div class=" w3-hover-shadow rounded">
                <br>
                <header class="w3-container "><h2> Titre : <?= $review["title"] ?></h2></header>
                <br>
                &nbsp;&nbsp;&nbsp;<?= $review["review"] ?> <br><br>
                &nbsp;&nbsp;&nbsp;Note : <?= $review["rating"] ?>/5
                <div class="right w3-container">
                    <a href="index.php?action=ReviewDetails&id=<?= $review['id'] ?>&Films_id=<?= $review['Films_id'] ?>&VideoGames_id=<?= $review['VideoGames_id'] ?>&Series_id=<?= $review['Series_id'] ?>&Books_id<?= $review["Books_id"] ?>">
                        <button class="btn-group btn  " type="button"  style="width: 35%">Détails</button>
                    </a>
                </div>
                <br><br>
            </div>

        <?php } ?>
    </div>


<?php
$content = ob_get_clean();
require "gabarit.php";
?>