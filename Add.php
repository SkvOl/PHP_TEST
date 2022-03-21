<?php

$discipline = isset($_POST["discipline"]) ? $_POST["discipline"] : "gg";
$date = isset($_POST["date"]) ? $_POST["date"]: "gg";
$time = isset($_POST["time"]) ? $_POST["time"]: "gg";


$date .= " " . $time;

$mysql = new mysqli('sql111.epizy.com', 'epiz_31326209', 'MIWpFHj53616OIj', 'epiz_31326209_main');
$mysql->set_charset('utf8');

//$mysql2 = mysqli_query($mysql, "INSERT INTO `Subjects1` (`title`) VALUES ('$discipline')");

$id_sub = mysqli_query($mysql, "SELECT * FROM `Subjects1` WHERE `title`='$discipline'");
$id1 = $id_sub->fetch_assoc();

$mysql2 = mysqli_query($mysql, "INSERT INTO `Schedule1` (`id_subject`, `date_time`) VALUES ('{$id1['id']}','$date')");

$mysql->close();
header('Location: /');

?>
