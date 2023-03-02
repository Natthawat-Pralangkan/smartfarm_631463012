<?php

    include_once('connect_db.php');
    $conns = dbconect();

    if (isset($_POST["id"])) {
        $id = $_POST["id"];
    }
    else return;

    $query = "DELETE FROM tb_researcher WHERE id = $id";
    $exe = mysqli_query($conns, $query);
    $arr=[];
    
    if($exe) {
        $arr["success"] = "true";
    } else {
        $arr["success"] = "false";
    }
    print(json_encode($arr));

?>