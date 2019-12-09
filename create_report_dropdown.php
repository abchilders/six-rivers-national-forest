<?php
/* 	Expects a connection object, returns nothing.
	Creates a dropdown menu of Forest_Resources. 
	
	Uses: destroy_and_exit.php, hsu_conn.php 
*/

function create_report_dropdown($conn)
{
?>
        <label for="internal_id"> Select the location you visited: </label>
        <select id="internal_id" name="internal_id">
        <?php
		// query Road internal_id and name 
        $road_query_str = "select internal_id, name
                           from Road
                           order by name";
        $road_query = oci_parse($conn, $road_query_str);
        oci_execute($road_query);
        
		// populate dropdown with Road info 
        while (oci_fetch($road_query))
        {
                $curr_id = oci_result($road_query, "INTERNAL_ID");
                $curr_name = oci_result($road_query, "NAME");
                ?>
                <option value="<?= $curr_id ?>">
                        <?= $curr_name ?>
                </option>
                <?php
        }
		
		// query Rec_Area internal_id and name 
        $ra_query_str = "select internal_id, recareanam
                           from Rec_Area
                           order by recareanam";
        $ra_query = oci_parse($conn, $ra_query_str);
        oci_execute($ra_query);
        
		// populate dropdown with Rec_Area info 
        while (oci_fetch($ra_query))
        {
                $curr_id = oci_result($ra_query, "INTERNAL_ID");
                $curr_name = oci_result($ra_query, "RECAREANAM");
                ?>
                <option value="<?= $curr_id ?>">
                        <?= $curr_name ?>
                </option>
                <?php
        }
        ?>
        </select>
        <?php
        oci_free_statement($road_query);
}
?>