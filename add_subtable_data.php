<?php
/*	Expects the Forest Resource type that this survey refers to (road or rec 
	area), the survey's ID, and a connection string to the database. 
	Returns nothing. 
*/

function add_subtable_data($type, $survey_id, $conn)
{
	// add remaining, road- or rec area-specific survey info into 
	// database 
	if($type === 'road')
	{
		// start building the insert statement 
		$road_insert_str = 'insert into Road_Survey(survey_id, 
			mode_of_transportation'; 
		$road_insert_values = 'values (:survey_id, :mode_of_transportation'; 
		
		// retrieve values from $_POST 
		$mode_of_transportation = strip_tags($_POST['mode_of_transportation']); 
		
		if(array_key_exists("road_condition", $_POST))
		{
		$road_condition = strip_tags($_POST['road_condition']); 
		$road_insert_str .= ', road_condition'; 
		$road_insert_values .= ', :road_condition';
		}
		
		// close insert statement 
		$road_insert_values .= ')'; 
		$road_insert_str .= ') ' . $road_insert_values; 
		
		// parse the insert statement 
		$road_insert_stmt = oci_parse($conn, $road_insert_str); 
		
		// bind variables and execute insertion to Survey 
		oci_bind_by_name($road_insert_stmt, ':survey_id', $survey_id); 
		oci_bind_by_name($road_insert_stmt, ':mode_of_transportation', 
			$mode_of_transportation);  
		if(array_key_exists("road_condition", $_POST)) 
		{
			$road_condition = strip_tags($_POST['road_condition']);
			oci_bind_by_name($road_insert_stmt, ':road_condition', $road_condition);
		}
		
		oci_execute($road_insert_stmt); 
		
		// free statement when done 
		oci_free_statement($road_insert_stmt); 
	}
	else // type === 'rec_area'
	{
			// start building the insert statement 
		$ra_insert_str = 'insert into Rec_Area_Survey(survey_id, 
			rec_area_condition, water_source_condition'; 
		$ra_insert_values = 'values (:survey_id, :rec_area_condition, 
			:water_source_condition'; 
		
		// retrieve values from $_POST 
		$rec_area_condition = strip_tags($_POST['rec_area_condition']); 
		$water_source_condition = strip_tags($_POST['water_source_condition']); 
		
		if(array_key_exists("water_source_details", $_POST))
		{
		$water_source_details = strip_tags($_POST['water_source_details']); 
		$ra_insert_str .= ', water_source_details'; 
		$ra_insert_values .= ', :water_source_details';
		}
		
		if(array_key_exists("weather_and_temperature", $_POST))
		{
		$weather_and_temperature = strip_tags($_POST['weather_and_temperature']); 
		$ra_insert_str .= ', weather_and_temperature'; 
		$ra_insert_values .= ', :weather_and_temperature';
		}
		
		// close insert statement 
		$ra_insert_values .= ')'; 
		$ra_insert_str .= ') ' . $ra_insert_values; 
		
		// parse the insert statement 
		$ra_insert_stmt = oci_parse($conn, $ra_insert_str); 
		
		// bind variables and execute insertion to Survey 
		oci_bind_by_name($ra_insert_stmt, ':survey_id', $survey_id); 
		oci_bind_by_name($ra_insert_stmt, ':rec_area_condition', 
			$rec_area_condition); 
		oci_bind_by_name($ra_insert_stmt, ':water_source_condition', 
			$water_source_condition); 
		if(array_key_exists("water_source_details", $_POST)) 
		{
			$water_source_details = strip_tags($_POST['water_source_details']);
			oci_bind_by_name($ra_insert_stmt, ':water_source_details', 
				$water_source_details);
		}
		if(array_key_exists("weather_and_temperature", $_POST)) 
		{
			$weather_and_temperature = strip_tags($_POST['weather_and_temperature']);
			oci_bind_by_name($ra_insert_stmt, ':weather_and_temperature', 
				$weather_and_temperature);
		}
		
		oci_execute($ra_insert_stmt); 
		
		// free statement when done 
		oci_free_statement($ra_insert_stmt); 
	}
}

?>