<?php

    define("localhost","localhost");
    define("username","root");
    define("password","");
    define("db_name","db_researcher");

    function dbconect() {

        $conn = mysqli_connect(localhost, username, password, db_name);
        return $conn;

    }

?>