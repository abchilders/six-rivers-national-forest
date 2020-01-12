<?php
/* 	Expects the key 'internal_id' to be set in $_REQUEST.
	
	Echoes the resource_type associated with the Forest Resource 
		identified by $_GET['internal_id'].
		
	Uses: hsu_conn.php, database_conn_params.php
*/

require_once("database_conn_params.php");
require_once('hsu_conn.php'); 

$conn = hsu_conn($user, $pass); 
$internal_id = strip_tags($_REQUEST['internal_id']); 

$fr_query_str = "select resource_type
				 from Forest_Resource
				 where internal_id = " . $internal_id;
$fr_query = oci_parse($conn, $fr_query_str);
oci_execute($fr_query);
oci_fetch($fr_query); 
$type = oci_result($fr_query, "RESOURCE_TYPE"); 
oci_free_statement($fr_query);

echo $type; 
?>
