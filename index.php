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

    default:
        Home();
    break;

}
