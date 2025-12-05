<?php
// filepath: c:\xampp\htdocs\techsolutions\admin_logout.php
session_start();
$_SESSION = [];
session_destroy();
header('Location: TS.php');
exit;
?>