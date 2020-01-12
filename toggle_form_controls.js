// Hides form controls related to rec areas when a road is selected in the 
// dropdown, and vice versa. 

"use strict"; 

$(document).ready( function() {
	$("#internal_id").change(function() {
	// use ajax to GET from PHP file, which returns the location type of 
	// the chosen location
		var ajax_url = "get_type.php?internal_id=" + $('#internal_id').val();  
		$.ajax({
			url: ajax_url, 
			type: "GET",
			datatype: "html",
			success: function(result){
					if (result == "road") {
						// hide rec area questions
						$('#rec_area_survey').hide(); 
						$('#good_rec_area').removeAttr('required');
						$('#good_rec_area').removeAttr('data-error');
						$('#water_source_condition').removeAttr('required');
						$('#water_source_condition').removeAttr('data-error');
						
						// show road questions
						$('#road_survey').show();
						$('#mode_of_transportation').attr('required', '');
						$('#mode_of_transportation').attr('data-error', 'This field is required.');
						$('#good_road').attr('required', '');
						$('#good_road').attr('data-error', 'This field is required.');
					} 
					else {
						// hide road questions
						$('#road_survey').hide(); 
						$('#mode_of_transportation').removeAttr('required');
						$('#mode_of_transportation').removeAttr('data-error');
						$('#good_road').removeAttr('required');
						$('#good_road').removeAttr('data-error');
						
						// show rec area questions
						$('#rec_area_survey').show();
						$('#good_rec_area').attr('required', '');
						$('#good_rec_area').attr('data-error', 'This field is required.');
						$('#water_source_condition').attr('required', '');
						$('#water_source_condition').attr('data-error', 'This field is required.');
					}
		}});
	});
	$("#internal_id").trigger("change"); 
});
