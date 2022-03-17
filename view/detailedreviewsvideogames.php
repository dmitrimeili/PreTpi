<?php
/*
 * Author : Dmitri Meili
 * Date : 07.03.2022
 * Project : PreTpi
 */
ob_start();
$title="ReviewDetailsVideogames";

?>
<div>
    Titre : <?= $review['title'] ?><br>
    Jeux : <?= $review['name'] ?><br>
    Console : <?=$review['type']?>

</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
