<?php require('core/init.php');   ?>

<?php

//Check for login

if(isset($_POST['do_login'])){
    //Get Vars
    $username = $_POST['username'];
    $password = md5($_POST['password']);

    //Create a new user object
    $user = new User;

    if($user->login($username, $password)){
        redirect('index.php', 'You have been logged in', 'success');

    }else{
        redirect('index.php', 'Login Failed', 'error'); 
    }

}else{
    redirect('index.php');
}




?>