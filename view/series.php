<?php
/*
 * Author : Dmitri Meili
 * Date : 03.03.2022
 * Project : PreTpi
 */
ob_start();
$title="Series";

?>
    <h1>Series</h1>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>