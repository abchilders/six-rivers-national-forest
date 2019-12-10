<!DOCTYPE html>
<html>
<body>

<?php

$uname= $_POST['name'];
$pwd = $_POST['pwd'];

$conn = oci_connect("$uname","$pwd","cedar.humboldt.edu/student.humboldt.edu");


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
echo "<h2>Rec Areas:</h2>";
while (oci_fetch($stid))
  {
    echo "-",oci_result($stid, 'RECAREANAM'), "<br>";
  }


oci_close($conn);
?>


</body>
</html>
