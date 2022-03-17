<?php
/*
 * Author : Dmitri Meili
 * Date : 03.03.2022
 * Project : PreTpi
 */
ob_start();
$title="home";

?>

<div>
    <?php foreach ($reviews as $review){ //affiche les reviews?>

    <hr>
    <div >
        Titre : <?= $review["title"]?><br>
        <?= $review["review"]?>   &nbsp;&nbsp;&nbsp;&nbsp; Note : <?= $review["rating"]?>/5<br>
        <a   href="index.php?action=ReviewDetails&id=<?= $review['id'] ?>&Films_id=<?= $review['Films_id']?>&VideoGames_id=<?= $review['VideoGames_id']?>&Series_id=<?= $review['Series_id']?>&" >
            <button  class="btn-group ">Détails</button>
        </a>
    </div>

<?php } ?>
</div>


<?php
$content = ob_get_clean();
require "gabarit.php";
?>