<?php

    include_once('connect_db.php');
    $conns = dbconect();

    $query = "SELECT * FROM tb_researcher";
    $exe = mysqli_query($conns, $query);

    $arr = [];

    while($row = mysqli_fetch_array($exe)){
        $arr[] = $row;
    }

    print(json_encode($arr));

?>