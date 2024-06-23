<?php

include '../connection.php';
    include '../error_type.php';
    if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        if (!array_key_exists('id', $_POST)  ||!array_key_exists('id', $_POST)  || !array_key_exists("answer", $_POST)||!array_key_exists("user_id", $_POST)){
            echo json_encode(array("error"=>[$UNSET_VARIABLE, "Set The variables"]));
            die();
        }
        $student_id = $_POST['user_id'];
        $id = $_POST['id'];
        $answer = $_POST['answer'];
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

        $submit_question = "INSERT INTO answer(user_id, question_id, answer) values($student_id, $id, '$answer')";
        $result = $connect->query($submit_question);
        if($result){
            echo json_encode(array("success" => true));
        }else{
            echo json_encode(array("error"=>[$DATABASE_ERROR, "Query Error" . $connect->error]));
        }
        

    }else{
        echo json_encode(array("error"=>[$NO_POST_REQUESTED, "No Post Request"]));
    }