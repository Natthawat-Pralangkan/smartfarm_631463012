<?php
 include 'conn.php';
 header("Access-Control-Allow-Origin: *");

if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {

        $id = $_GET['plant_id']; 
        $name = $_GET['plant_name']; 
        $age = $_GET['age'];
        $ph = $_GET['ph'];
        $temp = $_GET['temp']; 
        $humid = $_GET['humid'];
        $soild_moisture = $_GET['soild_moisture'];

        $sql = "UPDATE tb_plant SET plant_name = '$name', age = '$age', ph = '$ph',temp ='$temp',humid ='$humid' ,soild_moisture = '$soild_moisture' WHERE plant_id = '$id'";
        $result = mysqli_query($conn, $sql);
        if ($result) {
            echo "true";
        } else {
            echo "false";
        }
    } else echo "Welcome Master UNG";
}
 mysqli_close($conn);
?>

