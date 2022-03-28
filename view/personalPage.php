<?php
/*
 * Author : Dmitri Meili
 * Date : 28.03.2022
 * Project : PreTpi
 */
ob_start();
$title = "Personal Page";
?>
<h1>Page de <?= $_SESSION['firstname'] ?></h1>

<div>

    <?php if ($_SESSION['Roles_id'] == 2) {
        foreach ($reviews as $review) { //affiche les reviews
            if ($_SESSION['id'] == $review['Users_id']) {
                ?>

                <hr>
                <div>
                    Titre : <?= $review["title"] ?><br>
                    <?= $review["review"] ?> &nbsp;&nbsp;&nbsp;&nbsp; Note : <?= $review["rating"] ?>/5<br>
                    <a href="index.php?action=ReviewDetails&id=<?= $review['id'] ?>&Films_id=<?= $review['Films_id'] ?>&VideoGames_id=<?= $review['VideoGames_id'] ?>&Series_id=<?= $review['Series_id'] ?>&Books_id<?= $review["Books_id"] ?>">
                        <button class="btn-group ">Détails</button>
                    </a>
                </div>

            <?php }
        }
    } elseif ($_SESSION['Roles_id'] == 1) {
        ?>
        <div class="left"><?php
        foreach ($notApprouvedreviews as $notApprouvedreview) { //affiche les reviews

            var_dump($notApprouvedreview['id']); ?>

            <hr>
            <div>
                Titre : <?= $notApprouvedreview["title"] ?><br>
                <?= $notApprouvedreview["review"] ?> &nbsp;&nbsp;&nbsp;&nbsp; Note
                : <?= $notApprouvedreview["rating"] ?>/5<br>
                <a href="index.php?action=ReviewDetails&id=<?= $notApprouvedreview['id'] ?>&Films_id=<?= $notApprouvedreview['Films_id'] ?>&VideoGames_id=<?= $notApprouvedreview['VideoGames_id'] ?>&Series_id=<?= $notApprouvedreview['Series_id'] ?>&Books_id<?= $notApprouvedreview["Books_id"] ?>">
                    <button class="btn-group ">Détails</button>
                </a>
                <a href="index.php?action=ApprouveReview&id=<?= $notApprouvedreview['id'] ?>&title=<?= $notApprouvedreview['title'] ?>">
                    <button class="btn-group ">Valider</button>
                </a>
            </div>

        <?php } ?>
        </div>
        <div class="right">
            <div class="left">
            <h3>Utilisateur pas bloqué</h3>
            <?php foreach ($users as $user) {
                if ($user['Blocked'] == 0){?>
                <hr>
                <div>
                    Prénom : <?= $user['firstname'] ?> <br>
                    Nom : <?= $user['lastname'] ?> <br>
                    Email : <?= $user['email'] ?><br>
                    <a href="index.php?action=BlockUser&id=<?= $user['id'] ?>">
                        <button class="btn-group ">Bloquer</button>
                    </a>
                </div>

            <?php } }?>
            </div>
            <div class="right">
                <h3>Utilisateur bloqué</h3>
                <?php foreach ($users as $user) {
                    if ($user['Blocked'] == 1){?>
                        <hr>
                        <div>
                            Prénom : <?= $user['firstname'] ?> <br>
                            Nom : <?= $user['lastname'] ?> <br>
                            Email : <?= $user['email'] ?><br>
                            <a href="index.php?action=UnBlockUser&id=<?= $user['id'] ?>">
                                <button class="btn-group ">Débloquer</button>
                            </a>
                        </div>

                    <?php } }?>
            </div>
        </div>
    <?php }
    ?>
</div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>
