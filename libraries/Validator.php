<?php

class Validator{

    //Check required fields
    
    public function isRequired($fields_array){
        foreach($fields_array as $field){
            if($_POST[''.$field. ''] ==''){
                return false;
            }
        }

        return true;

    }

    //Validate email
    public function isValidEmail($email){
        if(filter_var($email, FILTER_VALIDATE_EMAIL)){
            return true;
        }else{
            return false;
        }
    }

    //Check Password Match
    public function passwordsMatch($pw1, $pw2){
        if($pw1 == $pw2){
            return true;
        }else{
            return false;
        }
    }



}





?>