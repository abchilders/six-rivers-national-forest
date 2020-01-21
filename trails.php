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

    <!-- This is the Bootstrap CS--> 
    <!-- Bootstrap CSS-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

  </head>
 <body>

<!-- This is just hard coded code because it isnt working through the reqrire_once-->

<h1>Six Rivers National Forest</h1>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <ul class="nav nav-pills nav-justified">
  <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
  <li class="nav-item"><a class="nav-link active" href="trails.php">Trails</a></li>
  <li class="nav-item"><a class="nav-link" href="submit.php">Report</a></li>
  <li class="nav-item"><a class="nav-link" href="contact.php">Contact</a></li>
  <li class="nav-item"><a class="nav-link" href="about.php">About</a></li></ul>
  </nav>



<!-- <?php require_once("site-header.html");
?> -->

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
echo "<table border=1 >";

$stidY = oci_parse($conn,
"SELECT s.name, s.date_of_visit, r.road_condition
FROM Road_Survey r, Survey s, road
WHERE s.survey_id = r.survey_id
AND s.internal_id = road.internal_id
ORDER BY s.name ASC, s.date_of_visit DESC
");
oci_execute($stidY);

echo "<tr>
<td><b>Name</b></td>
<td><b>Condition</b></td>
<td><b>Last Updated</b></td>
</tr>";

$repeat = "";

while (oci_fetch($stidY))
{

if (oci_result($stidY,'NAME') != $repeat)
{
  echo "<tr>";
  echo "<td>",oci_result($stidY, 'NAME'), "</td>";
  echo "<td>",oci_result($stidY, 'ROAD_CONDITION'), "</td>";
  echo "<td>",oci_result($stidY, 'DATE_OF_VISIT'),"</td>";
  echo "<tr>";
}
$repeat = oci_result($stidY, 'NAME');
}

echo "</table>";

echo "<br><br>";

//List Rec Areas

echo "<h2>Rec Area:</h2>";

$stidX = oci_parse($conn,
"SELECT s.name, s.date_of_visit, s.description, r.Rec_Area_Condition, r.weather_and_temperature
FROM Rec_Area_survey r, Survey s
WHERE r.survey_id = s.survey_id
ORDER BY name ASC, s.date_of_visit DESC");

oci_execute($stidX);

$repeat = "";

while (oci_fetch($stidX))
{

if (oci_result($stidX,'NAME') != $repeat)
{
  echo "<table border=1>"; 
  echo "<tr>
  <th>Name</th>
  <th>Condition</th>
  <th>Last Updated</th>
  <th>Weather</th>
  </tr>";
  echo "<tr>";
  echo "<td><b>",oci_result($stidX, 'NAME'), "</b></td>";
  echo "<td>",oci_result($stidX, 'REC_AREA_CONDITION'),"</td>";
  echo "<td>",oci_result($stidX, 'DATE_OF_VISIT'),"</td>";
  echo "<td><i>",oci_result($stidX, 'WEATHER_AND_TEMPERATURE'),"</i></td></tr>";

  echo "<tr><td colspan='4'> <i>",oci_result($stidX, 'DESCRIPTION'),"</i></td></tr>";
  echo "</table>";
  echo "<br>";
}

$repeat = oci_result($stidX,'NAME');

}

?>
</div>

</body>

</html>
