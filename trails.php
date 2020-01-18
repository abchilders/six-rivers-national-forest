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
  <li class="nav-item"><a class="nav-link active" href="index.html">Home</a></li>
  <li class="nav-item"><a class="nav-link" href="trails.php">Trails</a></li>
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
$stid = oci_parse($conn,
"SELECT Survey.name
FROM Survey, Road_Survey
WHERE Survey.survey_id = Road_Survey.Survey_id");
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

$stid = oci_parse($conn,
"SELECT Survey.name
FROM Survey, Rec_Area_Survey
WHERE Survey.survey_id = Rec_Area_Survey.survey_id");
oci_execute($stid);

$stid2 = oci_parse($conn,
"SELECT Rec_Area_Survey.Rec_Area_Condition, Survey.date_of_visit
FROM Rec_Area_Survey, Survey
WHERE Rec_Area_Survey.survey_id = Survey.survey_id");
oci_execute($stid2);

$stid3 = oci_parse($conn,
"SELECT Rec_Area_Survey.weather_and_temperature, Survey.description
FROM Rec_Area_Survey, Survey
WHERE Rec_Area_Survey.survey_id = Survey.survey_id");
oci_execute($stid3);


while (oci_fetch($stid) && oci_fetch($stid2) && oci_fetch($stid3))
{
echo "<table border=1>"; 
echo "<tr>
<th>Name</th>
<th>Condition</th>
<th>Last Updated</th>
<th>Weather</th>
</tr>";
echo "<tr>";
echo "<td><b>",oci_result($stid, 'NAME'), "</b></td>";
echo "<td>",oci_result($stid2, 'REC_AREA_CONDITION'),"</td>";
echo "<td>",oci_result($stid2, 'DATE_OF_VISIT'),"</td>";
echo "<td><i>",oci_result($stid3, 'WEATHER_AND_TEMPERATURE'),"</i></td></tr>";

echo "<tr><td colspan='4'> <i>",oci_result($stid3, 'DESCRIPTION'),"</i></td></tr>";
echo "</table>";
echo "<br>";
}

?>
</div>

</body>

</html>
