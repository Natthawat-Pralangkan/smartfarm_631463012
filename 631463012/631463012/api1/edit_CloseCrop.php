<?php
 include 'conn.php';
 header("Access-Control-Allow-Origin: *");

if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {

        $no = $_GET['no']; 
        $docdate = $_GET['docdate']; 
        $crop_id = $_GET['crop_id'];
        $qty = $_GET['qty'];
        $income = $_GET['income'];
        $cost = $_GET['cost'];

        $sql = "UPDATE tb_close_crop SET docdate = '$docdate',crop_id = '$crop_id' , qty = '$qty', income = '$income', cost = '$cost' WHERE no = '$no'";
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
