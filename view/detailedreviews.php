<?php
/*
 * Author : Dmitri Meili
 * Date : 07.03.2022
 * Project : PreTpi
 */
ob_start();
$title="ReviewDetails";

?>
<div>
    Titre : <?= $review['title'] ?><br>
    Jeux : <?= $review['name'] ?>
</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
