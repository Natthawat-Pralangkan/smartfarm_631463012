<?php
header('Access-Control-Allow-Origin: *');
include("conn.php");
if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
        $id = $_GET['plant_id']; 
        $name = $_GET['plant_name']; 
        $age = $_GET['age'];
        $ph = $_GET['ph'];
        $temp = $_GET['temp']; 
        $humid = $_GET['humid'];
        $soild_moisture = $_GET['soild_moisture'];
        
        $chack = mysqli_query($conn, "SELECT * FROM tb_plant WHERE plant_id = '$id' ");
        $count = mysqli_num_rows($chack);
        if($count>0){
            echo "havedata";
        }else {
            $result = mysqli_query($conn, "INSERT INTO tb_plant(plant_id,plant_name,age,ph,temp,humid,soild_moisture) VALUE('$id','$name','$age','$ph','$temp','$humid','$soild_moisture')");
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