<?php
header('Access-Control-Allow-Origin: *');
include("conn.php");
    if (isset($_GET)) {
        if ($_GET['isAdd'] == 'true') {
            $plant_id = $_REQUEST['plant_id'];
			$gh_id 	= $_REQUEST['gh_id'];
			$crop_date = $_REQUEST['crop_date'];
            $no=1;
            //=== คำนวณหาเลขที่ ID ล่าสุด ===
            $sql ="SELECT MAX(crop_id) AS MAX_ID FROM tb_crop ";

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

            $sql = "insert into tb_crop(crop_id,plant_id,crop_date,gh_id) 
            values('$newuserid','$plant_id','$crop_date','$gh_id')";

            mysqli_query($conn,$sql);
            echo"<script language='javascript'>alert('ทำการบันทึกข้อมูลสำเร็จแล้ว'); </script>";
        } 
    }  
?>