<?php
/*
 * Author : Dmitri Meili
 * Date : 28.02.2022
 * Project : PreTpi
 */

function login_bt()// fonction pour modifiert les boutons de connexion quand on se login logout
{
    if(isset($_SESSION["firstname"])){
        return'<li><a href="index.php?action=PersonalPage"><span ></span> Bonjour ' . $_SESSION["firstname"] . '</a></li>
               <li><a href="index.php?action=Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>';
    }else{
        return '<li><a href="index.php?action=Signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="index.php?action=Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>';
    }
}
//Set a  flash message
function flashMessage()
{
    $res = "";
    if(isset($_SESSION["flashmessage"])){
        $res = "<div id='flashmessage' class='alert alert-danger'>" . $_SESSION["flashmessage"] . "</div>";
    }
    unset($_SESSION["flashmessage"]);
    return $res;
}


?>