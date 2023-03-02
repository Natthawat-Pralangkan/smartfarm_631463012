<?php
header('Access-Control-Allow-Origin: *');
include("conn.php");
    if (isset($_GET)) {
        if ($_GET['isAdd'] == 'true') {
            $docdate = $_GET['docdate']; 
            $crop_id = $_GET['crop_id'];
            $qty = $_GET['qty'];
            $income = $_GET['income'];
            $cost = $_GET['cost'];
            $no=1;
            //=== คำนวณหาเลขที่ ID ล่าสุด ===
            $sql ="SELECT MAX(no) AS MAX_ID FROM tb_close_crop ";

            $objQuery = mysqli_query($conn,$sql)or die(mysqli_error($conn,$sql));
            while($row1 = mysqli_fetch_array($objQuery))
            {
                if ($row1["MAX_ID"]!="")
                {
                    $no = $row1["MAX_ID"]+1;
                    $no = substr($row1["MAX_ID"],0,3)+1;
                }
            }
            $newno = "0000".(string)$no;
            $newno = substr($newno,-3);
            $newuserid = $newno;

            $sql = "insert into tb_close_crop(no,crop_id,docdate,qty,income,cost) 
            values('$newuserid','$crop_id','$docdate','$qty','$income','$cost')";

            mysqli_query($conn,$sql);
            echo"<script language='javascript'>alert('ทำการบันทึกข้อมูลสำเร็จแล้ว'); </script>";
        } 
    }  
?>