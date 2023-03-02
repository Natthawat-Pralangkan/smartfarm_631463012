<?php
 include 'conn.php';
 header("Access-Control-Allow-Origin: *");
if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
        $idserialNo = $_GET['idSerialNO']; 
        $serialNo = $_GET['serialNO']; 
        $chack = mysqli_query($conn, "SELECT * FROM serialnumber WHERE serialNO = '$serialNo' ");
        $count = mysqli_num_rows($chack);
        If($count>0){
            echo "havedata";
        }else {
            $sql = "UPDATE serialnumber SET serialNO = '$serialNo' WHERE idSerialNO = '$idserialNo'";
            $result = mysqli_query($conn, $sql);
            if ($result) {
                echo "true";
            } else {
                echo "false";
            }
        }
    } else echo "Welcome Master UNG";
}
 mysqli_close($conn);
?>