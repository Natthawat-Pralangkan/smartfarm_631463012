<?php
include 'conn.php';
header("Access-Control-Allow-Origin: *");
if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
        $result = mysqli_query($conn, "SELECT * FROM tb_close_crop");
        if ($result) {
            while($row=mysqli_fetch_assoc($result)){
                $output[]= array(
                    "no"=>$row['no'],
                    "docdate"=>$row['docdate'],
                    "crop_id"=>$row['crop_id'],
                    "qty"=>$row['qty'],
                    "income"=>$row['income'],
                    "cost"=>$row['cost'],
                );
            }   // while
            echo json_encode($output);
        } //if
    } else if ($_GET['isAdd'] == 'item') {
        $result = mysqli_query($conn, "SELECT * FROM tb_close_crop WHERE no = '".$_GET['no']."'");
        if ($result) {
            $res = mysqli_fetch_assoc($result);
            echo json_encode($res);
        } 
    }else echo "Welcome Master UNG";
}   // if1
mysqli_close($conn);
?>