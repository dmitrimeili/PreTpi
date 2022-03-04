<?php
/*
 * Author : Dmitri Meili
 * Date : 03.03.2022
 * Project : PreTpi
 */
ob_start();
$title="Films";

?>
    <h1>Films</h1>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>