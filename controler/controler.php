<?php
require_once 'model/model.php';

function home(){
    $reviews = getAllReviews();
    require_once 'view/home.php';
}
function Login(){
    require_once 'view/login.php';
}
function Signup(){
    require_once 'view/signup.php';
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
function ReviewDetails(){
    require_once 'view/detailedreviews.php';
}



