<!DOCTYPE html>

<html>

  <head>
    <title>Trails</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">


    <link href="site-style.css" type="text/css" rel="stylesheet" />

    <style>
	#dbOut {
	}
    </style>
  </head>
  <body>

<?php require_once("site-header.html");
?>

  <h1>Trails</h1>


  
<div id="dbOut">
<?php

$iniFile = fopen("../../private/db.ini","r") or die("Unable to open File");

$uname = rtrim(fgetss($iniFile));
$pwd = rtrim(fgetss($iniFile));


$conn = oci_connect($uname,$pwd,"cedar.humboldt.edu/student.humboldt.edu");


if (!$conn) {
        $m = oci_error();
   echo $m['message'], "\n";
   exit;
}

//List Roads

echo "<h2>Roads:</h2>";
echo "<table border=1>";
$stid = oci_parse($conn, "SELECT * from Survey");
oci_execute($stid);
$stid2 = oci_parse($conn,
"SELECT Road_Survey.road_condition, Survey.date_of_visit
FROM Road_Survey, Survey, road
WHERE Road_Survey.survey_id = Survey.survey_id
AND Survey.internal_id = road.internal_id"); 
oci_execute($stid2);

echo "<tr>

<td><b>Name</b></td>
<td><b>Condition</b></td>
<td><b>Last Updated</b></td>
</tr>";

while (oci_fetch($stid) && oci_fetch($stid2))
  {
    echo "<tr>";
    echo "<td>",oci_result($stid, 'NAME'), "</td>";
    echo "<td>",oci_result($stid2, 'ROAD_CONDITION'), "</td>";
    echo "<td>",oci_result($stid2, 'DATE_OF_VISIT'),"</td>";
    echo "<tr>";
  }

echo "</table>";

//List Rec Areas

echo "<h2>Rec Area:</h2>";
$stid = oci_parse($conn, "SELECT * from Rec_Area");
oci_execute($stid);

$stid2 = oci_parse($conn,
"SELECT Rec_area_Survey.rec_area_condition, Survey.date_of_visit
FROM Rec_area_Survey, Rec_Area, Survey
WHERE Rec_area_Survey.survey_id = Survey.survey_id
AND Rec_area.internal_id = Survey.internal_id"); 
oci_execute($stid2);

echo "<table border=1>";
echo "<tr>
<td><b>Name</b></td>
<td><b>Condition</b></td>
<td><b>Last Updated</b></td>
</tr>";

while (oci_fetch($stid) && oci_fetch($stid2))
  {
    echo "<tr>";
    echo "<td>",oci_result($stid, 'RECAREANAM'), "</td>";
    echo "<td>",oci_result($stid2, 'REC_AREA_CONDITION'),"</td>";
    echo "<td>",oci_result($stid2, 'DATE_OF_VISIT'),"</td>";
    echo "<tr>";
  }
echo "</table>";

?>
</div>

</body>

</html>
