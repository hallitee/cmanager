!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof exports?module.exports=e(require("jquery")):e(jQuery)}(function(e){function a(a,t,d,c,i){function s(o,r){var l=r||[{message:o}];(a.googleCalendarError||e.noop).apply(i,l),(i.opt("googleCalendarError")||e.noop).apply(i,l),n.warn.apply(null,[o].concat(r||[]))}var u,g,p=r+"/"+encodeURIComponent(a.googleCalendarId)+"/events?callback=?",m=a.googleCalendarApiKey||i.opt("googleCalendarApiKey"),f=a.success;return m?(t.hasZone()||(t=t.clone().utc().add(-1,"day")),d.hasZone()||(d=d.clone().utc().add(1,"day")),c&&"local"!=c&&(g=c.replace(" ","_")),u=e.extend({},a.data||{},{key:m,timeMin:t.format(),timeMax:d.format(),timeZone:g,singleEvents:!0,maxResults:9999}),e.extend({},a,{googleCalendarId:null,url:p,data:u,startParam:!1,endParam:!1,timezoneParam:!1,success:function(a){var r,n,t=[];if(a.error)s("Google Calendar API: "+a.error.message,a.error.errors);else if(a.items&&(e.each(a.items,function(e,a){var r=a.htmlLink||null;g&&null!==r&&(r=o(r,"ctz="+g)),t.push({id:a.id,title:a.summary,start:a.start.dateTime||a.start.date,end:a.end.dateTime||a.end.date,url:r,location:a.location,description:a.description})}),r=[t].concat(Array.prototype.slice.call(arguments,1)),n=l(f,this,r),e.isArray(n)))return n;return t}})):(s("Specify a googleCalendarApiKey. See http://fullcalendar.io/docs/google_calendar/"),{})}function o(e,a){return e.replace(/(\?.*?)?(#|$)/,function(e,o,r){return(o?o+"&":"?")+a+r})}var r="https://www.googleapis.com/calendar/v3/calendars",n=e.fullCalendar,l=n.applyAll;n.sourceNormalizers.push(function(e){var a,o=e.googleCalendarId,r=e.url;!o&&r&&(/^[^\/]+@([^\/\.]+\.)*(google|googlemail|gmail)\.com$/.test(r)?o=r:((a=/^https:\/\/www.googleapis.com\/calendar\/v3\/calendars\/([^\/]*)/.exec(r))||(a=/^https?:\/\/www.google.com\/calendar\/feeds\/([^\/]*)/.exec(r)))&&(o=decodeURIComponent(a[1])),o&&(e.googleCalendarId=o)),o&&(null==e.editable&&(e.editable=!1),e.url=o)}),n.sourceFetchers.push(function(e,o,r,n){if(e.googleCalendarId)return a(e,o,r,n,this)})});