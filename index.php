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
        ReviewDetails();
    break;
    default:
        Home();
    break;

}
