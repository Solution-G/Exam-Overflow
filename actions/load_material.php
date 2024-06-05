<?php
    include '../connection.php';
    include '../error_type.php';
    if ($_SERVER["REQUEST_METHOD"] === 'POST'){

            if($connect->connect_error){
                echo json_encode(array("error"=>[$CONNECTION_ERROR, "Database is not connecting for " . $connect.connect_error]));
                die();
            }

            $load_available_material = "SELECT subject, grade,  link FROM material";

            $result = $connect->query($load_available_material);
            $list = array();
            if($result){
                while ($row=mysqli_fetch_assoc($result)){
                    $list[] = $row;
                }
                echo json_encode($list);
            }else{
                echo json_encode(array("error"=>[$DATABASE_ERROR, "Query Error" . $connect->error]));
            }

    }else{
        echo json_encode(array("error"=>[$NO_POST_REQUESTED, "No Post Request"]));
    }
    