<?php

session_start();
require "controler/controler.php";

if(isset($_POST["email"])){
    extract($_POST);
}

$page = $_GET["action"];
switch ($page){

    case"Login";
        Login();
    break;
    case"tryLogin";
        $email = $_POST['email'];
        $password = $_POST['password'];

        tryLogin($email,$password);
    break;
    case"Signup";
        Signup();
    break;
    case"CreateAccount";
        var_dump($_POST);
        $newfirstname = $_POST['firstname'];
        $newlastname = $_POST['lastname'];
        $newemail = $_POST['email'];
        $truePassword = $_POST['password'];
        $truePassword = $newpassword;//password in clear
        $newpassword = password_hash('test',PASSWORD_DEFAULT);//Hashing password
        $blocked = "0";
        $rolesid = "2";
        CreateAccount($newfirstname,$newlastname,$newemail,$newpassword,$blocked,$rolesid);
    break;
    case"Videogames";
        Videogames();
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
        ReviewDetails($reviewid);
    break;
    default:
        Home();
    break;

}
