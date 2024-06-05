<?php
    include '../connection.php';
    include '../error_type.php';
    if ($_SERVER["REQUEST_METHOD"] === 'POST'){
        if (array_key_exists("grade", $_POST)){
            $grade = $_POST['grade'];
            $query = "SELECT * FROM exams WHERE grade = '$grade'";
            $result = $connect->query($query);
            $list = array();
            if ($query){
                while ($row = mysqli_fetch_assoc($result)){
                    $list[] = $row;
                }
                echo json_encode($list);
            }else{
                echo json_encode(array("error"=>[$DATABASE_ERROR, "Query Error" . $connect->error]));
            }
        }else{
            echo json_encode(array("error"=>[$UNSET_VARIABLE, "Problem with loading your grade"]));
        }
    }else{
        echo json_encode(array("error"=>[$NO_POST_REQUESTED, "No Post Request"]));
    }
    