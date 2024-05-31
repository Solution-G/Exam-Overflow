<?php
    include '../connection.php';
    include '../error_type.php';

    $user_email = $_POST['user_email'];
    $user_name = $_POST['password'];
    /**
     * 
     * The Json will have the following return
     * 
     * error: [error_id, error_messsage]
     * 
     * data: {"data_name": "data"}
     * 
     */
    if($connect->connect_error){
        echo json_encode(array("error"=> );
        die();
    }

    $check_existance_of_user_sql = "SELECT user_email, user_password WHERE user_email = '$user_name'";

    $result = $connect->query($check_existance_of_user_sql);
    if ($result->num_rows > 0){

    }else{
        echo json_encode(array("no"=>))
    }

