<?php
include 'conn.php';
header("Access-Control-Allow-Origin: *");
$idserialNo = $_GET['idserialNo'];
if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
        $chack = mysqli_query($conn, "SELECT *  FROM serialnumber WHERE  idserialNo = '$idserialNo' ");
        $count = mysqli_num_rows($chack);
        If($count>0){
            $result = mysqli_query($conn, "DELETE FROM serialnumber WHERE idserialNo = '$idserialNo'");
            echo "true";
        }else {           
            echo "No data";
        }
    } 
}  // if2// if1
mysqli_close($conn);
?>
