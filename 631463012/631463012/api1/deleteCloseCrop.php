<?php
include 'conn.php';
header("Access-Control-Allow-Origin: *");
$no = $_GET['no'];
if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
        $chack = mysqli_query($conn, "SELECT *  FROM tb_close_crop WHERE  no = '$no' ");
        $count = mysqli_num_rows($chack);
        If($count>0){
            $result = mysqli_query($conn, "DELETE FROM tb_close_crop WHERE no = '$no'");
            echo "true";
        }else {           
            echo "No data";
        }
    } 
}  // if2// if1
mysqli_close($conn);
?>
