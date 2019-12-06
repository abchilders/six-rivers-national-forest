<?php
/*	Expects a Forest Resource type, its internal ID, and a connection 
	string for the database. 
	Returns the name of the Forest Resource. 
	
	Uses: destroy_and_exit.php
*/

function get_resource_name($type, $internal_id, $conn) 
{
	if($type === 'road')
	{
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
		
		return $name; 
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
		
		return $name; 
	}
	else
	{
		// reports must describe either a road or a rec_area 
		destroy_and_exit("Invalid report."); 
	}
}

?>