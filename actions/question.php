<?php

include '../connection.php';
    include '../error_type.php';
    if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        if (!array_key_exists('id', $_POST)  ||!array_key_exists('topic', $_POST)  || !array_key_exists("subject", $_POST)||!array_key_exists("question", $_POST)){
            echo json_encode(array("error"=>[$UNSET_VARIABLE, "Set The variables"]));
            die();
        }
        $student_id = $_POST['id'];
        $topic = $_POST['topic'];
        $subject = $_POST['subject'];
        $question = $_POST['question'];
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

        $submit_question = "INSERT INTO questions(user_id, topic, subject, question) values($student_id, '$topic', '$subject', '$question')";
        $result = $connect->query($submit_question);
        if($result){
            echo json_encode(array("success" => true));
        }else{
            echo json_encode(array("error"=>[$DATABASE_ERROR, "Query Error" . $connect->error]));
        }
        

    }else{
        echo json_encode(array("error"=>[$NO_POST_REQUESTED, "No Post Request"]));
    }
