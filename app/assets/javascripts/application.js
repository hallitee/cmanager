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
//= require moment.min
//= require fullcalendar
//= require locale-all
//= require bootstrap.min
//= require_tree .




//$(document).on('load', function() {
//$(document).on('pageinit', function(){
$(document).ready( function(){

  });
$(document).on('turbolinks:load',function() {
  $room_id = $("#_r_room_id").val();
  $stat = $("#stat_label").text().toLowerCase();

  $("#request_date_3i").bind("change", function(){
    //check_date();
    $.ajax({
    type: 'POST',
    url: "/check_schedule1",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val(),
            "email": $("#email_input").val(),
            "act":'reschedule',
      "room_id":$("#request_room_id1").val(),
      "date(3i)": $("#request_date_3i").val(),
    "date(2i)": $("#request_date_2i").val(),
    "date(1i)": $("#request_date_1i").val(),
    "startd(4i)": $("#request_startd_4i").val(),
    "startd(5i)": $("#request_startd_5i").val(),    
    "endd(4i)": $("#request_endd_4i").val(),
    "endd(5i)": $("#request_endd_5i").val()},                                                                                             
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });

  });

function check_date(){

$.ajax({
    type: 'POST',
    url: "/check_crossplatform",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val(),
            "email": $("#email_input").val(),
            "act":'reschedule'},                                                                                  
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });

}
  $("#request_status option").each(function(){
     $stat = $("#stat_label").text().toLowerCase();
     $value = $(this).text();
    console.log($value);
    if( $value == 'booked'){
      $(this).remove();

    }
  });
 my_events($room_id);

 //my_events(1);
$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});
    //$room_id = $("#_r_room_id").val();
    //console.log($room_id);
$("#request_status").bind("change", function(){
  $txt=$(this).val();
  if ($txt == 'reschedule'){
  $("#request_room_id1").removeAttr('disabled');    
  $("#request_date_3i").removeAttr('disabled');//attr('disabled', 'disabled');//.siblings().removeAttr('disabled');
   $("#request_date_2i").removeAttr('disabled');//.attr('disabled', 'disabled');
   $("#request_date_1i").removeAttr('disabled');//.attr('disabled', 'disabled');
$("#request_startd_4i").removeAttr('disabled');
$("#request_startd_5i").removeAttr('disabled');
$("#request_endd_4i").removeAttr('disabled');
$("#request_endd_5i").removeAttr('disabled');
   //$("#request_room_id1").attr('disabled', 'disabled').siblings().removeAttr('disabled');

  }else{
      $("#request_room_id1").attr('disabled', 'disabled'); 
 $("#request_date_3i").attr('disabled', 'disabled');//removeAttr('disabled');//attr('disa
 $("#request_date_2i").attr('disabled', 'disabled');
  $("#request_date_1i").attr('disabled', 'disabled');
  $("#request_startd_4i").attr('disabled', 'disabled');//removeAttr('disabled');
$("#request_startd_5i").attr('disabled', 'disabled');//removeAttr('disabled');
$("#request_endd_4i").attr('disabled', 'disabled');//removeAttr('disabled');
$("#request_endd_5i").attr('disabled', 'disabled');//removeAttr('disabled');
  }
});
   $("#_r_room_id").bind("change", function(){
    $("#calendar").fullCalendar( 'destroy' ); 
    //$("#calendar").fullCalendar( 'removeEventSources');
 // $.post('/check_email?email='+$("#email_box").val(),function(data){    });
    $room_id = $(this).val();
    console.log($room_id);
$room_id = $("#_r_room_id").val();
 my_events($room_id);
/*  $("#calendar").fullCalendar( 'refetchEventSources', 
        // your event source
        {
            url: '/get_events',
            type: 'POST',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    
            data: {
                room_id: $room_id,
                custom_param2: 'somethingelse'
            },
            error: function() {
                alert('there was an error while fetching events!');
            },
            success: function(events){ 
      //data response can contain what we want here...
      console.log($room_id);
          console.log("SUCCESS, data="+ events);
    },
            color: 'yellow',   // a non-ajax option
            textColor: 'black' // a non-ajax option
        }

        // any other sources...

    ); */
    

    //$("#calendar").fullCalendar( 'refetchEvents' );
    //.my_events($room_id);

});
function my_events($id){
  $("#calendar").fullCalendar({

    header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
    },
    String, default: 'start',
    selectable:true,
   // editable:true,
    //events: "/get_events"

        // your event source
        events: {
            url: '/get_events',
            cache: false,
            lazyFetching:false,
            type: 'POST',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    
            data: {
                room_id: $id,
                custom_param2: 'somethingelse'
            },
            error: function() {
                alert('there was an error while fetching events!');
            },
            success: function(events){ 
      //data response can contain what we want here...
          console.log("SUCCESS, data="+ events);
    },    dayClick: function (date, allDay, jsEvent, view) {
        displayDayEvents(date, allDay, jsEvent, view);
    },
            color:  'red',  //'#7FFF00',   // a non-ajax option
            textColor: 'white' // a non-ajax option
        }

        // any other sources...

    

});
}

 $("#email_box").bind("change blur", function(){
 // $.post('/check_email?email='+$("#email_box").val(),function(data){    });
$.ajax({
    type: 'POST',
    url: "/check_email",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "email": $(this).val()
    },                                                                                  
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });
});

 $("#request_room_id").bind("change", function(){
 // $.post('/check_email?email='+$("#email_box").val(),function(data){    });
$.ajax({
    type: 'POST',
    url: "/check_crossplatform",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val()},                                                                                  
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });
});

 //$("#request_room_id1").bind("mouseover", function(){
//$prev_res = $(this).val(); 

//$temp = 1 ;
//console.log($prev_res);
//$("request_room_id1 option[value=" +10+ "]").attr("selected", true);
//$("#request_room_id1 option[value='"+$prev_res+"']").prop("selected", true);
//$("#request_room_id1 option[value='"+$temp+1+"']").attr("selected", true);
//});

 $("#request_room_id1").bind("change", function(){
  if ($("#request_status").val() == 'reschedule'){
    $.ajax({
    type: 'POST',
    url: "/check_crossplatform",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val(),
            "email": $("#email_input").val(),
            "act":'reschedule'},                                                                                  
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });
    console.log("true");

  }
 /* $new_val = $(this).val();
  console.log($new_val);
$res = confirm("Do you really want to change room");*/
 //if ($res){
 // $("request_room_id1 > select > option[value=" + 8 + "]").attr("selected",true);

/*$("#request_room_id1 option[value='"+$new_val+"']").attr("selected", true);
 // $("request_room_id1 select").val($new_val);
console.log("true") ;
console.log($new_val);
}
else{
  // $("request_room_id1 > select > option[value=" + 4 + "]").attr("selected",true);
$("#request_room_id1 option[value='"+$prev_res+"']").attr("selected", true);
//$("request_room_id1 select").val($prev_res);
console.log("false");
console.log($prev_res);
}
*/

 // $.post('/check_email?email='+$("#email_box").val(),function(data){    });
/*$.ajax({
    type: 'POST',
    url: "/check_crossplatform",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val()},                                                                                  
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });*/
});

 $("#request_desc").bind("focus change blur", function(){
 // $.post('/check_email?email='+$("#email_box").val(),function(data){    });
$.ajax({
    type: 'POST',
    url: "/check_schedule",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { 
      "room_id":$("#request_room_id").val(),
      "date(3i)": $("#request_date_3i").val(),
    "date(2i)": $("#request_date_2i").val(),
    "date(1i)": $("#request_date_1i").val(),
    "startd(4i)": $("#request_startd_4i").val(),
    "startd(5i)": $("#request_startd_5i").val(),    
    "endd(4i)": $("#request_endd_4i").val(),
    "endd(5i)": $("#request_endd_5i").val()
  },                                                                                  
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });
}); 

$("#request_attendees").bind("focus change blur", function(){
 // $.post('/check_email?email='+$("#email_box").val(),function(data){    });
$.ajax({
    type: 'POST',
    url: "/check_schedule",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { 
      "room_id":$("#request_room_id").val(),
      "date(3i)": $("#request_date_3i").val(),
    "date(2i)": $("#request_date_2i").val(),
    "date(1i)": $("#request_date_1i").val(),
    "startd(4i)": $("#request_startd_4i").val(),
    "startd(5i)": $("#request_startd_5i").val(),    
    "endd(4i)": $("#request_endd_4i").val(),
    "endd(5i)": $("#request_endd_5i").val()
  },                                                                                  
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });
}); 

 $("#request_attendees").on("change blur focus", function(){
 // $.post('/check_email?email='+$("#email_box").val(),function(data){    });
$.ajax({
    type: 'POST',
    url: "/check_attendees",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { 
      "attendees":$("#request_attendees").val(),
      "email": $("#request_email").val(),
    "room_id": $("#request_room_id").val(),

  },                                                                                  
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });
});       

$("#request_date_2i").bind("change", function(){
    //check_date();
    $.ajax({
    type: 'POST',
    url: "/check_schedule1",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val(),
            "email": $("#email_input").val(),
            "act":'reschedule',
      "room_id":$("#request_room_id1").val(),
      "date(3i)": $("#request_date_3i").val(),
    "date(2i)": $("#request_date_2i").val(),
    "date(1i)": $("#request_date_1i").val(),
    "startd(4i)": $("#request_startd_4i").val(),
    "startd(5i)": $("#request_startd_5i").val(),    
    "endd(4i)": $("#request_endd_4i").val(),
    "endd(5i)": $("#request_endd_5i").val()},                                                                                             
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });

  });


$("#request_date_1i").bind("change", function(){
    //check_date();
    $.ajax({
    type: 'POST',
    url: "/check_schedule1",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val(),
            "email": $("#email_input").val(),
            "act":'reschedule',
      "room_id":$("#request_room_id1").val(),
      "date(3i)": $("#request_date_3i").val(),
    "date(2i)": $("#request_date_2i").val(),
    "date(1i)": $("#request_date_1i").val(),
    "startd(4i)": $("#request_startd_4i").val(),
    "startd(5i)": $("#request_startd_5i").val(),    
    "endd(4i)": $("#request_endd_4i").val(),
    "endd(5i)": $("#request_endd_5i").val()},                                                                                             
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });

  });


$("#request_startd_4i").bind("change", function(){
    //check_date();
    $.ajax({
    type: 'POST',
    url: "/check_schedule1",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val(),
            "email": $("#email_input").val(),
            "act":'reschedule',
      "room_id":$("#request_room_id1").val(),
      "date(3i)": $("#request_date_3i").val(),
    "date(2i)": $("#request_date_2i").val(),
    "date(1i)": $("#request_date_1i").val(),
    "startd(4i)": $("#request_startd_4i").val(),
    "startd(5i)": $("#request_startd_5i").val(),    
    "endd(4i)": $("#request_endd_4i").val(),
    "endd(5i)": $("#request_endd_5i").val()},                                                                                             
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });

  });


$("#request_startd_5i").bind("change", function(){
    //check_date();
    $.ajax({
    type: 'POST',
    url: "/check_schedule1",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val(),
            "email": $("#email_input").val(),
            "act":'reschedule',
      "room_id":$("#request_room_id1").val(),
      "date(3i)": $("#request_date_3i").val(),
    "date(2i)": $("#request_date_2i").val(),
    "date(1i)": $("#request_date_1i").val(),
    "startd(4i)": $("#request_startd_4i").val(),
    "startd(5i)": $("#request_startd_5i").val(),    
    "endd(4i)": $("#request_endd_4i").val(),
    "endd(5i)": $("#request_endd_5i").val()},                                                                                             
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });

  });



$("#request_endd_4i").bind("change", function(){
    //check_date();
    $.ajax({
    type: 'POST',
    url: "/check_schedule1",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val(),
            "email": $("#email_input").val(),
            "act":'reschedule',
      "room_id":$("#request_room_id1").val(),
      "date(3i)": $("#request_date_3i").val(),
    "date(2i)": $("#request_date_2i").val(),
    "date(1i)": $("#request_date_1i").val(),
    "startd(4i)": $("#request_startd_4i").val(),
    "startd(5i)": $("#request_startd_5i").val(),    
    "endd(4i)": $("#request_endd_4i").val(),
    "endd(5i)": $("#request_endd_5i").val()},                                                                                             
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });

  });




$("#request_endd_5i").bind("change", function(){
    //check_date();
    $.ajax({
    type: 'POST',
    url: "/check_schedule1",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { "room": $(this).val(),
            "email": $("#email_input").val(),
            "act":'reschedule',
      "room_id":$("#request_room_id1").val(),
      "date(3i)": $("#request_date_3i").val(),
    "date(2i)": $("#request_date_2i").val(),
    "date(1i)": $("#request_date_1i").val(),
    "startd(4i)": $("#request_startd_4i").val(),
    "startd(5i)": $("#request_startd_5i").val(),    
    "endd(4i)": $("#request_endd_4i").val(),
    "endd(5i)": $("#request_endd_5i").val()},                                                                                             
    error: function( xhr ){ 
     // alert("ERROR ON SUBMIT");
      console.log("error");
    },
    success: function( data ){ 
      //data response can contain what we want here...
      console.log("SUCCESS, data="+data);
    }
  });

  });

         }) //end document ready function


 

    //}; //function page load
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