<?php
header('Access-Control-Allow-Origin: *');
include("conn.php");
if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
        $serialNO = $_GET['serialNO']; 
        $chack = mysqli_query($conn, "SELECT * FROM serialnumber WHERE serialNO = '$serialNO' ");
        $count = mysqli_num_rows($chack);
        if($count>0){
            echo "havedata";
        }else {
            $result = mysqli_query($conn, "INSERT INTO serialnumber(serialNO) VALUE('$serialNO')");
            if($result){
                echo "true";
            }else{
                echo "false";
            }
        }
    } 
}  
mysqli_close($conn);
?>