// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap.min
/*function myFunc() {
	$id = prompt("Enter request number");
	if(!$id.match(/^\d+/)) {
		alert("Only numbers allowed !");
	}
	else{
   	




 var form = $('<form></form>');

    	form.attr("method", "get");
    	form.attr("action", "/requests/status/");
		var field = $('<input></input>');

        field.attr("type", "hidden");
        field.attr("name", 'id');
        field.attr("value", 1);

        form.append(field);
        $(document.body).append(form);
    	form.submit();
	
	}

//var $email = prompt("Enter request Email");
//validateEmail($email);
}

 function validateEmail($email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( $email );
  if( !validateEmail($email)) {
alert("Email not valid!");
 /* do stuff here */ 
/*
}
 else
 {

post('/requests/show', {email: $email});

 }
}

function post(path, parameters) {
    var form = $('<form></form>');

    form.attr("method", "get");
    form.attr("action", path);

    $.each(parameters, function(key, value) {
        var field = $('<input></input>');

        field.attr("type", "hidden");
        field.attr("name", key);
        field.attr("value", value);

        form.append(field);
    });

    // The form needs to be a part of the document in
    // order for us to be able to submit it.
    $(document.body).append(form);
    form.submit();
}
*/