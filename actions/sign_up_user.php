<?php
    include '../connection.php';
    include '../error_type.php';
    if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        if (!array_key_exists('student_grade', $_POST)  ||!array_key_exists('student_name', $_POST)  || !array_key_exists("student_email", $_POST) || !array_key_exists("student_password", $_POST)){
            echo json_encode(array("error"=>[$UNSET_VARIABLE, "Set The variables"]));
            die();
        }
        $student_name = $_POST['student_name'];
        $student_email = $_POST['student_email'];
        $student_password = $_POST['student_password'];
        $student_grade = $_POST['student_grade'];
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

        $check_email_unique = "SELECT * FROM user_table where student_email = $student_email";

        $result = $connect->query($check_existance_of_student_sql);
        if($result){
            if ( $result->num_rows > 0 ){
                echo json_encode(array("error"=> [$EMAIL_EXISTS, "Email already in use"]));

            }else{
                $add_user = "INSERT INTO user_table(student_name, student_grade, student_password, student_email) VALUES('$student_name', '$student_grade', $student_password', '$student_email')";
            }
        }else{
            echo json_encode(array("error"=>[$DATABASE_ERROR, "Query Error" . $connect->error]));
        }
        

    }else{
        echo json_encode(array("error"=>[$NO_POST_REQUESTED, "No Post Request"]));
    }
