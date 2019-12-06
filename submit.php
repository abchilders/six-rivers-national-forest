<?php
ini_set('display_errors', 1);
        error_reporting(E_ALL);

        /* include required PHP functions */
		require_once("database_conn_params.php");
        require_once("hsu_conn.php");
        require_once("create_report_dropdown.php");
        require_once("destroy_and_exit.php");
		
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
	
	// does a surveyor name exist in $_POST? 
	if( (! array_key_exists("date_of_visit", $_POST)) or
			($_POST["date_of_visit"] == "") or
			(! isset($_POST["date_of_visit"])) )
	{
			destroy_and_exit("Must input a surveyor name.");
	}

	// log in to Oracle
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
	
	if($type === 'road')
	{
		$insert_subtable = 'Road_Survey'; 
		
		// does a mode of transport exist in $_POST? 
		if( (! array_key_exists("mode_of_transportation", $_POST)) or
			($_POST["mode_of_transportation"] == "") or
			(! isset($_POST["mode_of_transportation"])) )
		{
			destroy_and_exit("Must input a mode of transportation.");
		}
		
		// does a road condition exist in $_POST? 
		if( (! array_key_exists("road_condition", $_POST)) or
			($_POST["road_condition"] == "") or
			(! isset($_POST["road_condition"])) )
		{
			destroy_and_exit("Must select a road condition.");
		}
		
		// query database to get road name 
		$name_query_str = "select name
						 from Road
						 where internal_id = " . $internal_id;
		$name_query = oci_parse($conn, $name_query_str);
		oci_execute($name_query);
		oci_fetch($name_query); 
		$name = oci_result($name_query, "NAME");
		oci_free_statement($name_query);
	}
	else if($type === 'rec_area') 
	{
		$insert_subtable = 'Rec_Area_Survey'; 
		
		// does an area condition exist in $_POST? 
		if( (! array_key_exists("rec_area_condition", $_POST)) or
			($_POST["rec_area_condition"] == "") or
			(! isset($_POST["rec_area_condition"])) )
		{
			destroy_and_exit("Must input a rec area condition.");
		}
		
		// does a water source condition exist in $_POST? 
		if( (! array_key_exists("water_source_condition", $_POST)) or
			($_POST["water_source_condition"] == "") or
			(! isset($_POST["water_source_condition"])) )
		{
			destroy_and_exit("Must input a water source condition.");
		}
		
		// query database to get road name 
		$name_query_str = "select recareanam
						 from Rec_Area
						 where internal_id = " . $_POST[internal_id];
		$name_query = oci_parse($conn, $name_query_str);
		oci_execute($name_query);
		oci_fetch($name_query); 
		$name = oci_result($name_query, "RECAREANAM");
		oci_free_statement($name_query);
	}
	else
	{
		// reports must describe either a road or a rec_area 
		destroy_and_exit("Invalid report."); 
	}
	
	// insert survey into Survey table
	// first, build the insert statement 
	$insert_str = 'insert into Survey(survey_id, name, date_of_visit, 
		surveyor_name, internal_id'; 
	$insert_values = "values(survey_id_seq.nextval, :name, 
		to_date(:date_of_visit, 'yyyy-mm-dd'), 
		:surveyor_name, :internal_id"; 
	$date_of_visit = strip_tags($_POST['date_of_visit']);
	$surveyor_name = strip_tags($_POST['surveyor_name']);
	if(array_key_exists("email", $_POST))
	{
		$email = strip_tags($_POST['email']); 
		$insert_str .= ', email'; 
		$insert_values .= ', :email';
	}
	if(array_key_exists("email", $_POST))
	{ 
		$description = strip_tags($_POST['description']); 
		$insert_str .= ', description';
		$insert_values .= ', :description'; 
	} 
	$insert_values .= ')'; 
	$insert_str .= ')' . $insert_values;
	
	// parse the insert statement 
	$insert_stmt = oci_parse($conn, $insert_str); 
	
	// bind variables and execute insertion to Survey 
	oci_bind_by_name($insert_stmt, ':name', $name); 
	oci_bind_by_name($insert_stmt, ':date_of_visit', $date_of_visit); 
	oci_bind_by_name($insert_stmt, ':surveyor_name', $surveyor_name); 
	oci_bind_by_name($insert_stmt, ':internal_id', $internal_id); 
	if(array_key_exists("email", $_POST)) 
	{
		$email = strip_tags($_POST['email']);
		oci_bind_by_name($insert_stmt, ':email', $email);
	}
	if(array_key_exists("description", $_POST))
	{
		$description = strip_tags($_POST['description']);
		oci_bind_by_name($insert_stmt, ':description', $description); 
	}
	oci_execute($insert_stmt); 
	oci_free_statement($insert_stmt); 
	
	// call add_subtable_survey to update the database (TODO: pl/sql) 
		// if type is road, insert into road with appropriate attribs 
		// if type is rec_area, " 

    $thankYou="<p>Thank you! Your report has been submitted.</p>";
}

?>

<!DOCTYPE html>

<!-- Creates a form for users to submit reports. --> 
<!-- Uses: database_conn_params.php, destroy_and_exit.php, hsu_conn.php, 
	create_report_dropdown.php --> 

<html>

  <head>
    <title>Report</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">

  </head>
  <body>
  <h1>Leave a Report</h1>
  
   <?php
   if(isset($insert_str))
   {
	   ?> <?= $insert_str ?> <?= $date_of_visit ?> <?php
   }
   ?>

	<form action="<?= htmlentities($_SERVER['PHP_SELF'], ENT_QUOTES) ?>"
     method="post">
		<fieldset>
			<!-- form fields standard to all reports -->
			<?php
			// connect to Oracle 
			 
			$conn = hsu_conn($user, $pass); 
			
			// create dropdown with all Forest Resource names 
			create_report_dropdown($conn); 
			?>
			<br />
			
			<label for="surveyor_name"> Name: </label>
			<input type="text" id="surveyor_name" name="surveyor_name" 
			required="required" value="Anonymous Surveyor" />
			
			<label for="date_of_visit"> Date of visit: </label> 
			<input type="date" id="date_of_visit" name="date_of_visit" 
			required="required"/>

			<label for="email"> Email: </label> 
			<input type="email" id="email" name="email" />
			
			<!-- form fields specifically for Road reports --> 
			<div id="road_survey">
				<label for="mode_of_transportation"> Mode of transportation: 
				</label>
				<input type="text" id="mode_of_transportation" 
				name="mode_of_transportation" required="required" /> 
				
				<fieldset>
					<legend> Road condition: </legend>
					
					<input type="radio" name="road_condition" id="good_road"
					value="Good shape and easy to follow" required="required"/> 
					<label for="good_road"> Good shape and easy to follow </label> 
					
					<input type="radio" name="road_condition" id="ok_road"
					value="Needs some work" /> 
					<label for="ok_road"> Needs some work </label>
					
					<input type="radio" name="road_condition" id="bad_road"
					value="Hard to follow" /> 
					<label for="bad_road"> Hard to follow </label>
					
					<input type="radio" name="road_condition" id="fubar_road"
					value="Non-existent" /> 
					<label for="fubar_road"> Non-existent </label>
				</fieldset>
			</div>
			
			<div id="rec_area_survey">
				<fieldset>
					<legend> Condition of the area: </legend>
					
					<input type="radio" name="rec_area_condition" 
					id="good_rec_area" value="Good" required="required"/>
					<label for="good_rec_area"> Good </label> 
					
					<input type="radio" name="rec_area_condition" 
					id="ok_rec_area" value="Needs some work" />
					<label for="ok_rec_area"> Needs some work </label> 
					
					<input type="radio" name="rec_area_condition" 
					id="bad_rec_area" value="Bad" />
					<label for="bad_rec_area"> Bad </label> 
					
					<input type="radio" name="rec_area_condition" 
					id="fubar_rec_area" value="Non-existent" />
					<label for="fubar_rec_area"> Non-existent </label> 
					
				</fieldset>
				
				<fieldset> 
					<legend> Water source: </legend> 
					
					<input type="radio" name="water_source_condition" id="dry" 
					value="Dry" required="required" /> 
					<label for="dry"> Dry </label> 
					
					<input type="radio" name="water_source_condition" id="stagnant" 
					value="Stagnant" /> 
					<label for="stagnant"> Stagnant </label> 

					<input type="radio" name="water_source_condition" id="trickle" 
					value="Trickle" /> 
					<label for="trickle"> Trickle </label>
					
					<input type="radio" name="water_source_condition" id="flowing" 
					value="Flowing" /> 
					<label for="flowing"> Flowing </label>
					
					<input type="radio" name="water_source_condition" id="N/A" 
					value="N/A" />
					<label for="N/A"> Not applicable </label> 
					
				</fieldset> 
				
				<label for="water_source_details"> Please give any additional
				details you can provide on water depth, quality, and flow rate:
				</label> 
				<textarea rows="5" cols="20" id="water_source_details" 
				name="water_source_details"></textarea>
				
				<label for="weather_and_temperature"> Weather and Temperature
				</label> 
				<textarea rows="5" cols="20" id="weather_and_temperature" 
				name="weather_and_temperature"></textarea>
				
			</div>
			
			<label for="description"> Description, comments, adventures, stories,
			or observations: </label> 
			<textarea rows="5" cols="20" id="description" name="description"></textarea>
			
		</fieldset>
		<input type="submit" name="submit" />
	</form>

  </body>

</html>
