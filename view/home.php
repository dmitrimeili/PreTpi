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
        <span class="fw-bold">Titre : <?= $review["title"]?><br></span>
        <span><?= $review["review"]?>   &nbsp;&nbsp;&nbsp;&nbsp; Note : <?= $review["rating"]?>/5</span> :
        <a href="index.php?action=ReviewDetails&id=<?= $review['id'] ?>" class="btn">Détails</a>
    </div>

<?php } ?>
</div>


<?php
$content = ob_get_clean();
require "gabarit.php";
?>