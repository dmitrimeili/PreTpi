<?php
/*
 * Author : Dmitri Meili
 * Date : 03.03.2022
 * Project : PreTpi
 */
ob_start();
$title="home";

?>

        <div class="btn-group" style="width:100%; text-align: center ">
            <button style="width:24%" >Jeux Video</button>
            <button style="width:24%">Série</button>
            <button style="width:24%">Film</button>
            <button style="width:24%">Livre</button>
        </div>


<?php
$content = ob_get_clean();
require "gabarit.php";
?>