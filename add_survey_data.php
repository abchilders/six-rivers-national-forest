<?php
/* 	Expects a Forest Resource's internal ID, its name, and a connection string to 
	the database. 
	Returns the survey_id of the resulting row. 
	
	Adds any information that is filled out for all surveys (whether for a Road 
	or Rec Area) to the Survey table in the database. 
*/

function add_survey_data($internal_id, $name, $conn)
{
	// first, build the insert statement 
	$insert_str = 'insert into Survey(survey_id, name, date_of_visit, 
		surveyor_name, internal_id'; 
	$insert_values = "values(:survey_id, :name, 
		to_date(:date_of_visit, 'yyyy-mm-dd'), 
		:surveyor_name, :internal_id"; 
		
	// generate survey_id from survey_id_seq.nextval and save it 
	// so we can return it at the end 
	$survey_id_str = 	"select survey_id_seq.nextval 
						from dual"; 
	$survey_id_query = oci_parse($conn, $survey_id_str); 
	oci_execute($survey_id_query); 
	oci_fetch($survey_id_query); 
	$survey_id = oci_result($survey_id_query, "NEXTVAL"); 
	oci_free_statement($survey_id_query); 

	// retrieve the rest of the submitted data from $_POST 
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
	oci_bind_by_name($insert_stmt, ':survey_id', $survey_id); 
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
	
	// free statement when done 
	oci_free_statement($insert_stmt); 
	
	return $survey_id; 
}

?>