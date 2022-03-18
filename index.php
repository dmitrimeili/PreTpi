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
        var_dump($_POST);
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
        $reviewfilm = $_GET['Films_id'];
        $reviewVideogames = $_GET['VideoGames_id'];
        if($reviewfilm != ""){
            ReviewDetailsFilms($reviewid);
        }else if($reviewVideogames != ""){
            ReviewDetailsGames($reviewid);
        }
        break;
    case "Logout";
        Logout();
        break;
    default:
        Home();
        break;

}
