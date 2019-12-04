<!DOCTYPE html>

<!-- Creates a form for users to submit reports. --> 
<!-- Uses: database_conn_params.php, destroy_and_exit.php, hsu_conn.php, 
	create_report_dropdown.php --> 

<html>

  <head>
    <title>Report</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
	
	<?php
        ini_set('display_errors', 1);
        error_reporting(E_ALL);

        /* include required PHP functions */
		require_once("database_conn_params.php");
        require_once("hsu_conn.php");
        require_once("create_report_dropdown.php");
        require_once("destroy_and_exit.php");
    ?>

  </head>
  <body>
  <h1>Leave a Report</h1>

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
	</form>

  </body>

</html>
