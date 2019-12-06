<!DOCTYPE html>

<html>

  <head>
    <title>Trails</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
	#dbOut {
	  text-align: center;
	}
    </style>
  </head>
  <body>

<?php require_once("../site-header.html");
?>

  <h1>Trails</h1>


  
<div id="dbOut">
<?php

$iniFile = fopen("../../../private/db.ini","r") or die("Unable to open File");

$uname = rtrim(fgetss($iniFile));
$pwd = rtrim(fgetss($iniFile));


$conn = oci_connect($uname,$pwd,"cedar.humboldt.edu/student.humboldt.edu");


if (!$conn) {
        $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
else {
   print "Connected to Oracle!";
}

//List Roads
$stid = oci_parse($conn, "SELECT * from Road");
oci_execute($stid);

echo"<br>";
echo "<h2>Roads:</h2>";

while (oci_fetch($stid))
  {
    echo "-",oci_result($stid, 'NAME'), "<br>";
  }

//List Rec Areas
$stid = oci_parse($conn, "SELECT * from Rec_Area");
oci_execute($stid);

echo"<br>";
echo "<h2>Rec Area:</h2>";

while (oci_fetch($stid))
  {
    echo "-",oci_result($stid, 'RECAREANAM'), "<br>";
  }

?>
</div>

</body>

</html>
