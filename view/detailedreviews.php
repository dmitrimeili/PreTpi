<?php
/*
 * Author : Dmitri Meili
 * Date : 07.03.2022
 * Project : PreTpi
 */
ob_start();
$title="ReviewDetails";

?>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>
