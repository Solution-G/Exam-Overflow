<?php
    include '../connection.php';
    include '../error_type.php';
    if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        if (array_key_exists("student_email", $_POST) && array_key_exists("student_password", $_POST)){
            
            $student_email = $_POST['student_email'];
            $student_password = $_POST['student_password'];
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
                echo json_encode(array("error"=>[$CONNECTION_ERROR, "Database is not connecting for " . $connect.connect_error]));
                die();
            }

            $check_existance_of_student_sql = "SELECT user_id, student_email, student_password, student_grade FROM users_table WHERE student_email = '$student_email' AND student_password = '$student_password'";

            $result = $connect->query($check_existance_of_student_sql);
            if($result){
                if ( $result->num_rows > 0 ){
                    $data = $result->fetch_assoc();
                    echo json_encode(array("data"=> $data));
                }else{
                    echo json_encode(array("error"=>[$STUDENT_NOT_FOUND_ERROR, "No Such student"]));
                }
            }else{
                echo json_encode(array("error"=>[$DATABASE_ERROR, "Query Error" . $connect->error]));
            }
        }else  if (array_key_exists("id", $_POST)){
            $id = $_POST["id"];
            if($connect->connect_error){
                echo json_encode(array("error"=>[$CONNECTION_ERROR, "Database is not connecting for " . $connect.connect_error]));
                die();
            }

            $check_existance_of_student_sql = "SELECT student_email, student_name FROM users_table WHERE user_id = $user_id";

            $result = $connect->query($check_existance_of_student_sql);
            if($result){
                if ( $result->num_rows > 0 ){
                    $data = $result->fetch_assoc();
                    echo json_encode(array("data"=> $data));
                }else{
                    echo json_encode(array("error"=>[$STUDENT_NOT_FOUND_ERROR, "No Such student"]));
                }
            }else{
                echo json_encode(array("error"=>[$DATABASE_ERROR, "Query Error" . $connect->error]));
            }


        }else{
            echo json_encode(array("error"=>[$UNSET_VARIABLE, "Set The variables"]));
            die();
        }
        

    }else{
        echo json_encode(array("error"=>[$NO_POST_REQUESTED, "No Post Request"]));
    }

