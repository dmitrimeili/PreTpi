<?php
require_once 'model/model.php';

function home(){
    $reviews = getAllReviews();
    require_once 'view/home.php';
}
function ReviewDetails($id)
{
    $review = getReview($id);

    require_once 'view/detailedreviews.php';
}
function Login(){
    require_once 'view/login.php';
}
function Signup(){
    require_once 'view/signup.php';
}
function CreateAccount($newname,$newsurname,$newemail,$newpassword,$blocked,$rolesid,$truePassword)
{
    $newUser = [
        "name" => $newname,
        "surname" => $newsurname,
        "email" => $newemail,
        "password" => $newpassword,
        "Blocked" => $blocked,
        "Roles_id" => $rolesid
    ];
    addUser($newUser); //Add user in datasheet
}
function Videogames(){
    require_once 'view/videogames.php';
}
function Films(){
    require_once 'view/films.php';
}
function Series(){
    require_once 'view/series.php';
}
function Books(){
    require_once 'view/books.php';
}




