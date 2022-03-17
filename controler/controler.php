<?php
require_once 'model/model.php';

function Home()
{
    $reviews = getAllReviews();
    require_once 'view/home.php';
}
function ReviewDetailsFilms($id)
{
    $review = getReviewFilms($id);
    require_once 'view/detailedreviewsfilms.php';
}
function ReviewDetailsGames($id)
{
    $review = getReviewGames($id);

    require_once 'view/detailedreviewsvideogames.php';
}

function Login()
{
    require_once 'view/login.php';
}

function tryLogin($email, $password)
{
    $users = getUsers();//Puts the values of the data sheet users in a table

    foreach ($users as $user) {
        //If the username and the password are true the user connects to the session
        if ($user["email"] == $email && password_verify($password, $user["password"])) {

            $_SESSION["firstname"] = $user["firstname"];
            $_SESSION["lastname"] = $user["lastname"];
            $_SESSION["email"] = $user["email"];
            $_SESSION["password"] = $user["password"];
            $_SESSION["Blocked"] = $user["Blocked"];
            $_SESSION["Roles_id"] = $user["Roles_id"];
            Home(); //Return to home page
        }
    }
    //If the form is false the page show error
    if (!isset($_SESSION["firstname"])) {
        $_SESSION["flashmessage"] = "L'email ou le mot de passe est incorrecte";
        Login();
    }
}

function Logout()
{
    session_unset();
    session_destroy();
    $_SESSION["flashmessage"] = "Vous êtes déconnecté";
    Home();

}

function Signup()
{
    require_once 'view/signup.php';
}

function CreateAccount($newfirstname, $newlastname, $newemail, $newpassword, $blocked, $rolesid, $truePassword)
{
    $users = getUsers();

    foreach ($users as $user) {
        //Check if email already exist in db
        if ($user["email"] == $newemail) {
            $_SESSION["flashmessage"] = "l'email est déja utilisé";
            $login = false;
            Signup();
        }
    }
    if (!isset($login)) {
        $newUser = [
            "firstname" => $newfirstname,
            "lastname" => $newlastname,
            "email" => $newemail,
            "password" => $newpassword,
            "Blocked" => $blocked,
            "Roles_id" => $rolesid
        ];
        addUser($newUser); //Add user in datasheet
        tryLogin($newemail, $truePassword);
    }

}

function Videogames()
{
    $reviews = getAllReviews();
    require_once 'view/videogames.php';
}

function Films()
{
    $reviews = getAllReviews();
    require_once 'view/films.php';
}

function Series()
{
    $reviews = getAllReviews();
    require_once 'view/series.php';
}

function Books()
{
    $reviews = getAllReviews();
    require_once 'view/books.php';
}




