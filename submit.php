<?php
/* 	Creates and handles the form that allows users to submit reports about 
	roads and recreation areas. 
*/

ini_set('display_errors', 1);
        error_reporting(E_ALL);

        /* include required PHP functions */
	//require_once("database_conn_params.php");
        require_once("hsu_conn.php");
        require_once("create_report_dropdown.php");
        require_once("destroy_and_exit.php");
		require_once("get_resource_name.php"); 
		require_once("add_survey_data.php"); 
		require_once("add_subtable_data.php"); 
		
if(array_key_exists("submit", $_POST))
{
    // does an internal_id exist in $_POST?
	if( (! array_key_exists("internal_id", $_POST)) or
			($_POST["internal_id"] == "") or
			(! isset($_POST["internal_id"])) )
	{
			destroy_and_exit("Must select a location.");
	}
	
	// does a surveyor name exist in $_POST? 
	if( (! array_key_exists("surveyor_name", $_POST)) or
			($_POST["surveyor_name"] == "") or
			(! isset($_POST["surveyor_name"])) )
	{
			destroy_and_exit("Must input a surveyor name.");
	}
	
	// does a date of visit exist in $_POST? 
	if( (! array_key_exists("date_of_visit", $_POST)) or
			($_POST["date_of_visit"] == "") or
			(! isset($_POST["date_of_visit"])) )
	{
			destroy_and_exit("Must input a surveyor name.");
	}

	// log in to Oracle

	
	//Johns dumb method for dealing with DB auth
	// ------------------------------------
	//
	$iniFile = fopen("../../private/db.ini","r") or die("Unable to open File");
	$user = rtrim(fgetss($iniFile));
        $pass = rtrim(fgetss($iniFile));
	// ------------------------------------

	$conn = hsu_conn($user, $pass);

	// if we've reached here, we have successfully connected.
	$internal_id = strip_tags($_POST['internal_id']); 
	
	// query database to determine if submitted report is for a Road or Rec Area
	$fr_query_str = "select resource_type
                     from Forest_Resource
					 where internal_id = " . $internal_id;
	$fr_query = oci_parse($conn, $fr_query_str);
	oci_execute($fr_query);
	oci_fetch($fr_query); 
	$type = oci_result($fr_query, "RESOURCE_TYPE"); 
	oci_free_statement($fr_query);
	
	$name = get_resource_name($type, $internal_id, $conn); 
	
	// insert basic survey into Survey table
	$survey_id = add_survey_data($internal_id, $name, $conn); 
	
	// insert additional data depending on whether survey is for a road or rec 
	// area 
	add_subtable_data($type, $survey_id, $conn); 

	// message lets users know that the survey's been submitted 
    $thank_you="<p>Thank you! Your report has been submitted.</p>";
	
	oci_close($conn); 
}

?>

<!DOCTYPE html>

<!-- Creates a form for users to submit reports. --> 

<html>

  <head>
    <title>Report</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
	
	<link href="http://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />

    <link href="site-style.css" type="text/css" rel="stylesheet" />
	
	<link href="submit.css" type="text/css" rel="stylesheet" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
		defer="defer"> </script>
	
	<script src="toggle_form_controls.js" type="text/javascript" defer="defer">
    </script>

   <!-- Bootstrap CSS-->
   <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

   <h1> Six Rivers National Forest </h1>
  </head>
  <body>

  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <ul class="nav nav-pills nav-justified">
  <li class="nav-item"><a class="nav-link active" href="index.html">Home</a></li>
  <li class="nav-item"><a class="nav-link" href="trails.php">Trails</a></li>
  <li class="nav-item"><a class="nav-link" href="submit.php">Report</a></li>
  <li class="nav-item"><a class="nav-link" href="contact.php">Contact</a></li>
  <li class="nav-item"><a class="nav-link" href="about.php">About</a></li></ul>
  </nav>

  <h1>Leave a Report</h1>
  
<!-- what is this -->    
<?php
   if(isset($thank_you))
   {
	   ?> <?= $thank_you ?> <?php
   }
   ?>

	<form action="<?= htmlentities($_SERVER['PHP_SELF'], ENT_QUOTES) ?>"
     method="post">
		<fieldset>
			<div id="submit_form"> 
				<!-- form fields standard to all reports -->
				
				<div id="location" class="grid-elem">
					<?php
					// connect to Oracle 
	
				        //Johns dumb method for dealing with DB auth
        				// ------------------------------------
        				//
        				$iniFile = fopen("../../private/db.ini","r") or die("Unable to open File");
        				$user = rtrim(fgetss($iniFile));
        				$pass = rtrim(fgetss($iniFile));
        				// ------------------------------------
				 
					$conn = hsu_conn($user, $pass); 
					
					// create dropdown with all Forest Resource names 
					create_report_dropdown($conn); 
					?>
				</div> 
				
				<div id="name" class="grid-elem">
					<label for="surveyor_name" class="lead"> Name: </label> <br/>
					<input type="text" id="surveyor_name" name="surveyor_name" 
					required="required" value="Anonymous Surveyor" />
				</div> 
				
				<div id="date" class="grid-elem"> 
					<label for="date_of_visit" class="lead"> Date of visit: </label> <br/>
					<input type="date" id="date_of_visit" name="date_of_visit" 
					required="required"/>
				</div> 

				<div id="email_addr" class="grid-elem">
					<label for="email" class="lead"> Email: </label> <br/>
					<input type="email" id="email" name="email" />
				</div> 
				
				<div id="desc" class="grid-elem"> 
					<label for="description" class="lead"> Description, comments, adventures, stories,
					or observations: </label> <br/>
					<textarea rows="5" cols="50" id="description" name="description"></textarea>
				</div> 
				
				<!-- form fields specifically for Road reports --> 
				<div id="road_survey">
					<div id="transport" class="grid-elem"> 
						<label for="mode_of_transportation" class="lead"> Mode of transportation: 
						</label> <br/>
						<input type="text" id="mode_of_transportation" 
						name="mode_of_transportation" required="required" /> 
					</div> 
					
					<div id="road_cond" class="grid-elem">
						<fieldset>
							<legend> Road condition: </legend>
								<input type="radio" name="road_condition" id="good_road"
								value="Good shape and easy to follow" required="required"/> 
								<label for="good_road"> Good shape and easy to follow </label> 
								<br />
								
								<input type="radio" name="road_condition" id="ok_road"
								value="Needs some work" /> 
								<label for="ok_road"> Needs some work </label>
								<br />
								
								<input type="radio" name="road_condition" id="bad_road"
								value="Hard to follow" /> 
								<label for="bad_road"> Hard to follow </label>
								<br />
								
								<input type="radio" name="road_condition" id="fubar_road"
								value="Non-existent" /> 
								<label for="fubar_road"> Non-existent </label> 
								<br />
						</fieldset>
					</div>
				</div>
				
				<!-- form fields specifically for Rec Area reports --> 
				<div id="rec_area_survey">
					<div id="rec_area_cond" class="grid-elem">
						<fieldset>
							<legend> Condition of the area: </legend>
								<input type="radio" name="rec_area_condition" 
								id="good_rec_area" value="Good" required="required"/>
								<label for="good_rec_area"> Good </label> 
								<br />
								
								<input type="radio" name="rec_area_condition" 
								id="ok_rec_area" value="Needs some work" />
								<label for="ok_rec_area"> Needs some work </label>
								<br />								
								
								<input type="radio" name="rec_area_condition" 
								id="bad_rec_area" value="Bad" />
								<label for="bad_rec_area"> Bad </label> 
								<br />
								
								<input type="radio" name="rec_area_condition" 
								id="fubar_rec_area" value="Non-existent" />
								<label for="fubar_rec_area"> Non-existent </label> 
								<br />
						</fieldset>
					</div>
					
					<div id="water_source" class="grid-elem">
						<fieldset> 
							<legend> Water source: </legend> 
								<input type="radio" name="water_source_condition" id="dry" 
								value="Dry" /> 
								<label for="dry"> Dry </label> 
								<br />
								
								<input type="radio" name="water_source_condition" id="stagnant" 
								value="Stagnant" /> 
								<label for="stagnant"> Stagnant </label> 
								<br />

								<input type="radio" name="water_source_condition" id="trickle" 
								value="Trickle" /> 
								<label for="trickle"> Trickle </label>
								<br />
								
								<input type="radio" name="water_source_condition" id="flowing" 
								value="Flowing" /> 
								<label for="flowing"> Flowing </label>
								<br />
								
								<input type="radio" name="water_source_condition" id="N/A" 
								value="N/A" />
								<label for="N/A"> Not applicable </label>
								<br />
						</fieldset> 
					</div>
					
					<div id="water_details" class="grid-elem">
						<label for="water_source_details"> Please give any additional
						details you can provide on water depth, quality, and flow rate:
						</label> <br/>
						<textarea rows="5" cols="50" id="water_source_details" 
						name="water_source_details"></textarea>
					</div> 
					
					<div id="weather" class="grid-elem">
						<label for="weather_and_temperature"> Weather and temperature:
						</label> <br/>
						<textarea rows="5" cols="50" id="weather_and_temperature" 
						name="weather_and_temperature"></textarea>
					</div> 
				</div>
			</div>
		</fieldset>
		<input type="submit" name="submit" />
	</form>

  </body>

</html>

