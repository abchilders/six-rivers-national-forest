// Requires the user to complete reCAPTCHA before submitting form. 

"use strict"; 

$("form").submit(function(event) {

   var recaptcha = $("#g-recaptcha-response").val();
   if (recaptcha === "") {
      event.preventDefault();
      alert("Please complete the reCAPTCHA.");
   }
});
