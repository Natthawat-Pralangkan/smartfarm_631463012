<?php

    include_once('connect_db.php');
    $conns = dbconect();

    
    if(isset($_POST["id"])) {
        $id = $_POST["id"];
    } else {
        return;
    }

    if(isset($_POST["name"])) {
        $name = $_POST["name"];
    } else {
        return;
    }
    
    if(isset($_POST["surname"])) {
        $surname = $_POST["surname"];
    } else {
        return;
    }

    if(isset($_POST["address"])) {
        $address = $_POST["address"];
    } else {
        return;
    }

    if(isset($_POST["district"])) {
        $district = $_POST["district"];
    } else {
        return;
    }
    
    if(isset($_POST["prefecture"])) {
        $prefecture = $_POST["prefecture"];
    } else {
        return;
    }

    if(isset($_POST["province"])) {
        $province = $_POST["province"];
    } else {
        return;
    }
    
    if(isset($_POST["phone"])) {
        $phone = $_POST["phone"];
    } else {
        return;
    }

    if(isset($_POST["email"])) {
        $email = $_POST["email"];
    } else {
        return;
    }

    $query = "UPDATE tb_researcher SET name = '$name', surname = '$surname', address = '$address', district = '$district', prefecture = '$prefecture', province = '$province', phone = '$phone', email = '$email' WHERE id = $id";
    $exe = mysqli_query($conns, $query);
    $arr=[];
    
    if($exe) {
        $arr["success"] = "true";
    } else {
        $arr["success"] = "false";
    }
    print(json_encode($arr));

?>