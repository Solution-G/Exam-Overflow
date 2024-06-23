<?php
    include '../connection.php';
    include '../error_type.php';
    if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        if (!array_key_exists('name', $_POST)  ||!array_key_exists('email', $_POST)  || !array_key_exists("password", $_POST)){
            echo json_encode(array("error"=>[$UNSET_VARIABLE, "Set The variables"]));
            die();
        }
        $student_name = $_POST['name'];
        $student_email = $_POST['email'];
        $student_password = $_POST['password'];
        $student_grade = 11;
        if (array_key_exists("grade", $_POST)){
            $student_password = $_POST['grade'];
        }
        /**
         * 
         * The Json will have the following return
         * 
         * error: [error_id, error_messsage]
         * 
         * data: {"data_name": "data"}
         * z
         */
        if($connect->connect_error){
            echo json_encode(array("error"=>[$CONNECTION_ERROR, "Database is not connecting for " . $connect.connect_error]));
            die();
        }

        $check_email_unique = "SELECT * FROM users_table where student_email = '$student_email'";

        $result = $connect->query($check_email_unique);
        if($result){
            if ( $result->num_rows > 0 ){
                
                echo json_encode(array("error"=> [$EMAIL_EXISTS, "Email already in use"]));

            }else{
                $add_user = "INSERT INTO users_table(student_name,  student_password, student_email, student_grade) VALUES('$student_name', '$student_password', '$student_email', $student_grade)";
                $reg = $connect->query($add_user);
                if ($reg){
                    echo json_encode(array("success"=>true));
                }else{
                    echo json_encode(array("error"=>[$DATABASE_ERROR, "Database is having error". $connect->error]));
                }
            }
        }else{
            echo json_encode(array("error"=>[$DATABASE_ERROR, "Query Error" . $connect->error]));
        }
        

    }else{
        echo json_encode(array("error"=>[$NO_POST_REQUESTED, "No Post Request"]));
    }
