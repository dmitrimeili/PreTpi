<?php
/*
 * Author : Dmitri Meili
 * Date : 03.03.2022
 * Project : PreTpi
 */
ob_start();
$title="Videogames";

?>
<h1 class="bg-primary">Videogames</h1>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>