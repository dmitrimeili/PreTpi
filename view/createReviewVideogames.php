<?php
/*
 * Author : Dmitri Meili
 * Date : 21.03.2022
 * Project : PreTpi
 */
ob_start();
$title = "CreateReviewVideogames";

?>
<h1>Ajouter une critique pour un jeux video</h1>
<div class="center">
    <form action="index.php?action=CreateReviewVideogames" method="post">
    <span><?php /*<select name="type">
        <?php
        foreach ($platforms as $platform) { //affiche les platforme?>
            <option value=<?= $platform['id'] ?>><?= $platform['type'] ?></option>
        <?php } ?>
    </select>
        <select name="type">
        <?php
        foreach ($categories as $category) { //affiche les categories?>
            <option value=<?= $category['id'] ?>><?= $category['Genre'] ?></option>
        <?php } ?>
    </select> */ ?>
         <select name="videogame">
        <?php
        foreach ($videogames as $videogame) { //affiche les categories?>
            <option value=<?= $videogame['id'] ?>><?= $videogame['name'] ?></option>
        <?php }
        ?>
    </select>
        <select name="type">
            <?php
            foreach ($platforms as $platform) { //affiche les reviews
                ?>

                <option value=<?=$platform['id']?>><?=$platform['type']?></option>
            <?php } ?>
        </select>
        </span>
        <br><br>
        <label>Titre :</label>
        <input name='title' type="text">
        <br>
        Critique
        <br>
        <textarea name="review" rows="5" cols="50"></textarea>
        <br>
        <div class="rate">
            <input type="radio" id="star5" name="rate" value="5"/>
            <label for="star5" title="text">5 stars</label>
            <input type="radio" id="star4" name="rate" value="4"/>
            <label for="star4" title="text">4 stars</label>
            <input type="radio" id="star3" name="rate" value="3"/>
            <label for="star3" title="text">3 stars</label>
            <input type="radio" id="star2" name="rate" value="2"/>
            <label for="star2" title="text">2 stars</label>
            <input type="radio" id="star1" name="rate" value="1"/>
            <label for="star1" title="text">1 star</label>
        </div>
        <br><br><br>
        <input type="submit" value="Submit">
    </form>
</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
