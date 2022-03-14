<?php
/*
 * Author : Dmitri Meili
 * Date : 03.03.2022
 * Project : PreTpi
 */
ob_start();
$title="Videogames";

?>
<h1 >Videogames</h1>
    <div>
        <?php
        foreach ($reviews as $review) { //affiche les reviews
            if ($review["VideoGames_id"] != "") {
                ?>

                <hr>
                <div>
                    Titre : <?= $review["title"] ?><br>
                    <?= $review["review"] ?> &nbsp;&nbsp;&nbsp;&nbsp; Note : <?= $review["rating"] ?>/5<br>
                    <a href="index.php?action=ReviewDetails&id=<?= $review['id'] ?>">
                        <button class="btn-group ">Détails</button>
                    </a>
                </div>

            <?php }
        } ?>
    </div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>