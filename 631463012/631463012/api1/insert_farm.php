<?php
header('Access-Control-Allow-Origin: *');
include("conn.php");
if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
        $id = $_GET['farm_id']; 
        $name = $_GET['farm_name']; 
        $lat = $_GET['lat'];
        $lng = $_GET['lng'];
        $chack = mysqli_query($conn, "SELECT * FROM tb_farm WHERE farm_id = '$id' ");
        $count = mysqli_num_rows($chack);
        if($count>0){
            echo "havedata";
        }else {
            $result = mysqli_query($conn, "INSERT INTO tb_farm(farm_id,farm_name,lat,lng) VALUE('$id','$name','$lat','$lng')");
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