<?php

    /*-----
		File courtesy of Sharon Tuttle. 
		
        function: hsu_conn: string string -> connection
        purpose: expects an Oracle username and password,
            and has the side-effect of trying to connect to
            HSU's Oracle student database with the given
            username and password;
            returns the resulting connection object if
            successful, and... CAN this end document and exit calling 
            PHP if NOT successful?!
    -----*/

    function hsu_conn($usr, $pwd)
    {
        // set up db connection string

        $db_conn_str = 
            "(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)
                                       (HOST = cedar.humboldt.edu)
                                       (PORT = 1521))
                            (CONNECT_DATA = (SID = STUDENT)))";

        // let's try to log on using this string!

        $connctn = oci_connect($usr, $pwd, $db_conn_str);
  
        // CAN I complain and exit from HERE if fails?

        if (! $connctn)
        {
        ?>
            <p> Could not log into Oracle, sorry. </p>

            <?php
            exit;        
        }

        return $connctn;
    }
?>