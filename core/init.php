<?php
//Start Session
session_start();

require_once('config/config.php');

require_once('helpers/system_helper.php');
require_once('helpers/format_helper.php');
require_once('helpers/db_helper.php');


spl_autoload_register(function($class_name) {
    include 'libraries/'.$class_name . '.php';
});












?>