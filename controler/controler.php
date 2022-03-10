<?php
require_once 'model/model.php';

function Home()
{
    $reviews = getAllReviews();
    require_once 'view/home.php';
}

function ReviewDetails($id)
{
    $review = getReview($id);

    require_once 'view/detailedreviews.php';
}

function Login()
{
    require_once 'view/login.php';
}

function tryLogin($email, $password)
{
    $users = getUsers();//Puts the values of the data sheet users in a table
    var_dump($_POST);
    var_dump($_GET);
    foreach ($users as $user) {
        //If the username and the password are true the user connects to the session
        if ($user["email"] == $email && password_verify($password, $user["password"])) {

            $_SESSION["firstname"] = $user["firstname"];
            $_SESSION["lastname"] = $user["lastname"];
            $_SESSION["email"] = $user["email"];
            $_SESSION["password"] = $user["password"];
            $_SESSION["Blocked"] = $user["Blocked"];
            $_SESSION["Roles_id"] = $user["Roles_id"];
            var_dump($_SESSION);
            Home(); //Return to home page
        }
    }
    //If the form is false the page show error
    if (!isset($_SESSION["firstname"])) {
        $_SESSION["flashmessage"] = "L'email ou le mot de passe est incorrecte";
        Login();
    }
}

function Signup()
{
    require_once 'view/signup.php';
}

function CreateAccount($newfirstname, $newlastname, $newemail, $newpassword, $blocked, $rolesid)
{
    $newUser = [
        "firstname" => $newfirstname,
        "lastname" => $newlastname,
        "email" => $newemail,
        "password" => $newpassword,
        "Blocked" => $blocked,
        "Roles_id" => $rolesid
    ];
    addUser($newUser); //Add user in datasheet
}

function Videogames()
{
    require_once 'view/videogames.php';
}

function Films()
{
    require_once 'view/films.php';
}

function Series()
{
    require_once 'view/series.php';
}

function Books()
{
    require_once 'view/books.php';
}




