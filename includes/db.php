<?php

  // $dbhost = "mysql-200-138.mysql.prositehosting.net";
  // $dbname = "cheshamvansdb";
  // $dbusername = "smallarray";
  // $dbpassword = "!sM@11DBee25";
  
  $dbhost = "localhost";
  $dbname = "cheshamvansdb";
  $dbusername = "root";
  $dbpassword = "";

  $conn = new PDO("mysql:host=$dbhost;dbname=$dbname",$dbusername,$dbpassword);

?>