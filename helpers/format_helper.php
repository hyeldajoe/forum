<?php

//Date Format Helper

function formatDate($date){
    $date = date("F j, Y, g:i a", strtotime($date));
    return $date;


}






//URL Format Helper
function urlFormat($str){
    //strip all white spaces
    $str = preg_replace('/\s*/', '', $str);

    //Convert the string to all lowercase
    $str = strtolower($str);
    return $str;
}


//Add Class name active to the active category

function is_active($category){
    if(isset($_GET['category'])){
        if($_GET['category'] == $category){
            return 'active';
        }else{
            return '';
        }
    }else {
        if($category == null){
            return 'active';
        }
    }


}



?>