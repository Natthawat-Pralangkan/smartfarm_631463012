<?php
 include 'conn.php';
 header("Access-Control-Allow-Origin: *");

if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {

        $id = $_GET['gh_id']; 
        $name = $_GET['gh_name']; 

        $sql = "UPDATE tb_greenhouse SET gh_name = '$name' WHERE gh_id = '$id'";
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

