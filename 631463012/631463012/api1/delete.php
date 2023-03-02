<?php
include 'conn.php';
header("Access-Control-Allow-Origin: ");
if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
        $idserialNo = $_GET['idSerialNO'];
        $chack = mysqli_query($conn, "SELECT * FROM serialnumber WHERE  idSerialNO = '$idserialNo' ");
        $count = mysqli_num_rows($chack);
        If($count>0){
            $result = mysqli_query($conn, "DELETE FROM serialnumber WHERE idSerialNO = '$idserialNo'");
            echo "true";
        }else {
            echo "No data";
        }
    } 
}
mysqli_close($conn);
?>
