<?php
/*
 * Author : Dmitri Meili
 * Date : 28.02.2022
 * Project : PreTpi
 */
ob_start();
$title="login";

?>
    <div class="container">
        <div class="row">
            <div class="Absolute-Center is-Responsive">
                <div id="logo-container"></div>
                <div class="col-sm-12 col-md-10 col-md-offset-1 w-25 p-3 " >
                    <form action="index.php?action=tryLogin" id="loginForm" method="post">
                        <div class="form-group input-group" >
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control" type="text" name='email' placeholder="email"/>
                        </div>
                        <div class="form-group input-group ">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input class="form-control" type="password" name='password' placeholder="password"/>
                        </div>

                        <div class="form-group">
                            <input type="submit" id="submit" value="Login">
                        </div>
                        <div class="form-group text-center">
                            <a href="index.php?action=Signup">Create an account</a>
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