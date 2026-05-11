<?php
    $servername = "lnxcpanel591.itmnetworks.net";
    $database = "dsxwebco_dsxweb";
    $username = "dsxwebco_dsxweb";
    $password = "@1983uovdar";
    // Create connection
    $conn = mysqli_connect($servername, $username, $password, $database);
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
?>