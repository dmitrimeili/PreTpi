<?php
/*
 * Author : Dmitri Meili
 * Date : 28.02.2022
 * Project : PreTpi
 */
ob_start();
$title="signup";

?>
    <div class="container">
        <div class="row">
            <div class="Absolute-Center is-Responsive">
                <img src="images">
                <div id="logo-container"></div>
                <div class="col-sm-12 col-md-10 col-md-offset-1 w-25 p-3 " >
                    <form action="" id="signupForm">
                        <div class="form-group ">
                            <input class="form-control" type="text" name='name' placeholder="name"/>
                        </div>
                        <div class="form-group ">
                            <input class="form-control" type="text" name='surname' placeholder="surname"/>
                        </div>
                        <div class="form-group " >
                            <input class="form-control" type="text" name='username' placeholder="username"/>
                        </div>
                        <div class="form-group  ">
                            <input class="form-control" type="password" name='password' placeholder="password"/>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-def btn-block">Sign up</button>
                        </div>
                        <div class="form-group text-center">
                            <a href="index.php?action=Login">Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>
