<?php
    include '../connection.php';
    include '../error_type.php';
    if ($_SERVER["REQUEST_METHOD"] === 'POST'){

            if($connect->connect_error){
                echo json_encode(array("error"=>[$CONNECTION_ERROR, "Database is not connecting for " . $connect.connect_error]));
                die();
            }
            if(array_key_exists("id", $_POST)){
                $id = $_POST['id'];
                $load_available_material = "SELECT users_table.student_name, answer.answer FROM answer LEFT JOIN users_table ON answer.user_id = users_table.user_id WHERE answer.id = $id; ";

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
                echo json_encode(array("error"=>[$NO_POST_REQUESTED, "Cannot find your id"]));
            }
            

    }else{
        echo json_encode(array("error"=>[$NO_POST_REQUESTED, "No Post Request"]));
    }
    