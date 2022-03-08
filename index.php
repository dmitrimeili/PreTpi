<?php

session_start();
require "controler/controler.php";

$page = $_GET["action"];
switch ($page){

    case"Login";
        Login();
    break;
    case"Signup";
        Signup();
    break;
    case"CreateAccount";
    $truePassword = $newpassword;//password in clear
    $newpassword = password_hash($newpassword,PASSWORD_DEFAULT);//Hashing password
    $blocked = "0";
    $rolesid = "2";
    CreateAccount($newname,$newsurname,$newemail,$newpassword,$blocked,$rolesid,$truePassword);

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
