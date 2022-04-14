<?php

session_start();
require "controler/controler.php";

if (isset($_POST["email"])) {
    extract($_POST);
}

$page = $_GET["action"];
switch ($page) {

    case"Login";
        Login();
        break;
    case"tryLogin";
        $email = $_POST['email'];
        $password = $_POST['password'];
        tryLogin($email, $password);
        break;
    case"Signup";
        Signup();
        break;
    case"CreateAccount";
        $newfirstname = $_POST['firstname'];
        $newlastname = $_POST['lastname'];
        $newemail = $_POST['email'];
        $truePassword = $_POST['password'];
        $newpassword = $truePassword;//password in clear
        $newpassword = password_hash($newpassword, PASSWORD_DEFAULT);//Hashing password
        $blocked = "0";
        $rolesid = "2";
        CreateAccount($newfirstname, $newlastname, $newemail, $newpassword, $blocked, $rolesid, $truePassword);
        break;
    case"Videogames";
        Videogames($_POST);
        break;
    case"CreateReviewVideogamesPage";
        CreateReviewVideogamesPage();
        break;
    case"CreateReviewVideogames";
        $videogame = $_POST['videogame'];
        $title = htmlspecialchars($_POST['title']); //utilise la fonction htmlspecialchars pour omettre les ' quand on execute l'sql
        $review = htmlspecialchars($_POST['review']);//utilise la fonction htmlspecialchars pour omettre les ' quand on execute l'sql
        $email = $_SESSION['email'];
        $rating = $_POST['rate'];
        CreateReviewVideogames($videogame, $title, $review, $rating);
        break;
    case"Films";
        Films();
        break;
    case"Series";
        Series();
        break;
    case"Books";
        Books();
        break;
    case"ReviewDetails";
        $reviewid = $_GET['id'];
        $reviewfilm = $_GET['Films_id'] ?? '';
        $reviewVideogames = $_GET['VideoGames_id'];

        if ($reviewfilm != "") {  // condition pour afficher le critique par rapport au jeux video, film etc
            ReviewDetailsFilms($reviewid);
        } else if ($reviewVideogames != "") {
            ReviewDetailsGames($reviewid,$reviewVideogames);
        }
        break;
    case "Logout";
        Logout();
        break;
    case "PersonalPage";
        PersonalPage();
        break;
    case "ApprouveReview";
        $reviewid = $_GET['id'];
        $reviewTitle = $_GET['title'];
        ApprouveReview($reviewid, $reviewTitle);
        break;
    case "BlockUser";
        $userId = $_GET['id'];
        BlockUser($userId);
        break;
        case "UnBlockUser";
        $userId = $_GET['id'];
        UnBlockUser($userId);
        break;
        case "SendMail";
        SendMail();
        break;
    default:
        Home();
        break;

}
