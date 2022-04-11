<?php
/*
 * Author : Dmitri Meili
 * Date : 03.03.2022
 * Project : PreTpi
 */
ob_start();
$title = "Videogames";

?>

    <h1>Videogames</h1>
<?php if (isset($_SESSION["firstname"]) && $_SESSION['Blocked'] == 0) { ?>
    <div class="btn-group " style="width:100%; text-align: right ">
        <a href="index.php?action=CreateReviewVideogamesPage">
            <button style="width:24%" class="rounded w3-hover-shadow">Ajouter une critique</button>
        </a>
    </div>
<?php } ?>
    <div>
        <form action="index.php?action=Videogames" method="post">
            <select name="type">
                <?php
                foreach ($platforms as $platform) { //affiche les Console?>
                    <option value=<?= $platform['id'] ?>><?= $platform['type'] ?></option>
                <?php } ?>
            </select>
            <input type="submit" value="Submit">
        </form>
        <div class="content  ">
            <?php
            foreach ($reviews as $review) { //affiche les reviews
                if (isset($review['VideoGames_id'])) {
                    ?>

                    <hr>
                    <div class="rounded w3-hover-shadow"><br>
                        <header class="w3-container "><h2> Titre : <?= $review["title"] ?><br></h2></header>
                        &nbsp;&nbsp;&nbsp;<?= $review["review"] ?><br>
                        &nbsp;&nbsp;&nbsp;Note : <?= $review["rating"] ?>/5
                        <div class="right w3-container">
                            <a href="index.php?action=ReviewDetails&id=<?= $review['id'] ?>&VideoGames_id=<?= $review['VideoGames_id'] ?>">
                                <button class="btn-group btn  " type="button" style="width: 35%">Détails</button>
                            </a>
                        </div>
                        <br>
                        <br>
                    </div>

                <?php }
            } ?>
        </div>
    </div>

    <br><br>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>