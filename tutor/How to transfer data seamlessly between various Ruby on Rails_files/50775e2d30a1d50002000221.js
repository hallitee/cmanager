window._pa = window._pa || {};
_pa.segments = [{"name":"Coderwall Visitors","id":438977,"regex":".*"},{"name":"Really Good Emails Visitor","id":1798694,"regex":".*"},{"name":"Ruby (exclusion)","id":5253027,"regex":"/.*ruby/popular.*/?([?#].*)*$"},{"name":"HTML & CSS (exclusion)","id":5253025,"regex":"/.*web/popular.*/?([?#].*)*$"},{"name":"Java","id":5253023,"regex":"/.*front\\-end/popular.*/?([?#].*)*$"},{"name":"Node JS (exclusion)","id":5253024,"regex":"/.*nodejs/popular.*/?([?#].*)*$"},{"name":"Ruby","id":5253022,"regex":"/.*ruby/popular.*/?([?#].*)*$"},{"name":"HTML & CSS","id":5253021,"regex":"/.*web/popular.*/?([?#].*)*$"},{"name":"Node JS","id":5253020,"regex":"/.*nodejs/popular.*/?([?#].*)*$"},{"name":"Java (exclusion)","id":5253028,"regex":"/.*front\\-end/popular.*/?([?#].*)*$"},{"name":"Node","id":5419153,"regex":"coderwall.com|node|hapi|express|sails"},{"name":"PHP","id":5419156,"regex":"coderwall.com|php|symfony|laravel|hiphopvm|php7"},{"name":"Java","id":5419154,"regex":"coderwall|java|scala|clojure|play|spring|boot|springcloud|gradle|grails|groovy|ratpack|jetty|tomcat|jvm|"},{"name":"Go","id":5419157,"regex":"coderwall.com|go|negroni|gin|gorilla|martini|stdlib"},{"name":"Ruby","id":5419155,"regex":"coderwall.com|ruby|sinatra|rails|unicorn|rawsocket"},{"name":"Python","id":5419158,"regex":"coderwall.com|python|django|flask|twisted|sockets|pip"},{"name":"Node RG (1)","id":6249295,"regex":"node|hapi|express|sails"},{"name":"Python RG (1)","id":6249302,"regex":"python|django|flask|twisted|sockets|pip"},{"name":"Ruby RG (1)","id":6249299,"regex":"ruby|sinatra|rails|unicorn|rawsocket"},{"name":"PHP RG (1)","id":6249300,"regex":"php|symfony|laravel|hiphopvm|php7"},{"name":"Go RG (1)","id":6249301,"regex":"go|negroni|gin|gorilla|martini|stdlib"},{"name":"Java RG (1)","id":6249298,"regex":"java|scala|clojure|play|springboot|springcloud|gradle|grails|groovy|ratpack|jetty|tomcat|jvm"}];
_pa.conversions = [];
_pa.conversionEvents = [];
_pa.segmentEvents = [];
_pa.thirdPartyTags = [];
_pa.thirdPartyTagEvents = [];
_pa.allVisitorsSegmentId = 438977;
_pa.clickThroughWindow = 30;
_pa.viewThroughWindow = 30;
_pa.rtbId = '7619';
_pa.siteId = '50775e2d30a1d50002000221';
_pa.crossDevice = true;
!function(){function e(e){if("undefined"!=typeof window.fbq&&"undefined"!=typeof _pa.facebookPixelId){var a="https://www.facebook.com/tr?id="+_pa.facebookPixelId;a+="&ev=ViewContent",a+="&cd[rtb_id]="+e.id,a+="&noscript=1",_pa.createImageTag("fb_events",e.id,a,e.name)}}function a(e,a,t){if(null==t||isNaN(t))var n=_pa.pixelHost+"seg?t=2&add="+e;else var n=_pa.pixelHost+"seg?t=2&add="+e+":"+t;_pa.createImageTag("segments",e,n,a)}function t(e){var a=_pa.paRtbHost+"seg/?add="+e;return a+="&source=js_tag",_pa.rtbId&&(a+="&a_id="+_pa.rtbId),_pa.obscureIP&&(a+="&obscure_ip=1"),a}function n(e,a){var n=t(e);g?_pa.createImageTag("paRtbSegments",e,n,a):h.push({id:e,name:a})}function r(){if(g=!0,0!==h.length){for(var e=[],a=[],n=0;n<h.length;n++){var r=h[n],o=r.id,p=r.name;e.push(o),a.push(p)}var o=e.join(","),p=a.join(","),i=t(o);_pa.createImageTag("paRtbSegments",o,i,p)}}function o(e,a,t){a=a||_pa.orderId,t=t||_pa.revenue;var n=e.id,r=e.name,o=_pa.rtbId;if(i(n,r,a,t,o),e.cofires)for(var p=0;p<e.cofires.length;p++){var c=e.cofires[p];i(c.appnexus_id,c.name,a,t,c.rtb_id)}"undefined"!=typeof window.fbq&&_pa.fireFacebookConversion(e,a,t)}function p(e,a,t){var n=_pa.paRtbHost+"px/?id="+e+t;return n+="&source=js_tag",a&&(n+="&a_id="+a),_pa.obscureIP&&(n+="&obscure_ip=1"),"number"==typeof _pa.clickThroughWindow&&(n+="&click_through_window="+_pa.clickThroughWindow),"number"==typeof _pa.viewThroughWindow&&(n+="&view_through_window="+_pa.viewThroughWindow),n}function i(e,a,t,n,r){var o="";t&&""!==t&&(t=t.toString().replace(/@.*/,"@"),o+="&order_id="+encodeURIComponent(t)),n&&""!==n&&(o+="&value="+encodeURIComponent(n)),o+="&other="+function(){for(var e="",a="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",t=0;16>t;t++){var n=Math.floor(Math.random()*a.length);e+=a.charAt(n)}return e}();var i=_pa.pixelHost+"px?t=2&id="+e+o,c=p(e,r,o);_pa.createImageTag("conversions",e,i,a),_pa.createImageTag("paRtbConversions",e,c,a)}function c(e){switch(e.type){case"image_tag":_pa.createImageTag("thirdPartyTag",void 0,e.content,e.name);break;case"script_tag":l(e.content);break;case"script_text":v(e.content)}}function d(e){for(var a=e.shift(),t=a.split("."),n=_pa,r=0;r<t.length;r++)n=n[t[r]];var o=n.apply(_pa,e);return s(a,e),o}function s(e,a){var t=_pa.callbacks[e];if("undefined"!=typeof t)for(var n=0;n<t.length;n++)t[n].apply(_pa,a)}function _(){for(var e,a=Array.prototype.slice.call(arguments,0),t=a.shift(),n=t.split("."),r=_pa,o=0;o<n.length;o++)r=r[n[o]],e=n[o];r.apply(_pa,a),s(e,a)}function f(){var e=window.navigator.userAgent;(/MSIE 7/.test(e)||/(iPod|iPhone|iPad)/.test(e)&&/AppleWebKit/.test(e))&&(_pa.skip=!0)}function u(){var e=("https:"==document.location.protocol?"https:":"http:")+"//pixel-geo.prfct.co/tagjs",a=[];_pa.rtbId&&a.push("a_id="+_pa.rtbId),_pa.obscureIP&&a.push("obscure_ip=1"),a.push("source=js_tag"),a.length>0&&(e+="?"+a.join("&")),l(e)}function l(e){var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src=e,_pa.head.appendChild(a)}function v(e){var a=document.createElement("script");a.type="text/javascript";var t=document.createTextNode(e);a.appendChild(t),_pa.head.appendChild(a)}_pa.head=document.getElementsByTagName("head")[0]||document.getElementsByTagName("body")[0];var g=!1,h=[];_pa.ready={looper:!1,onload:!1};var m=["conversions","paRtbConversions","fb_conversions"];_pa.fired={segments:[],conversions:[],fb_conversions:[],fb_events:[]},_pa.url=document.location.href,_pa.pixelHost=("https:"===document.location.protocol?"https://secure":"http://ib")+".adnxs.com/",_pa.paRtbHost=("https:"===document.location.protocol?"https://":"http://")+"pixel-geo.prfct.co/",_pa.callbacks={},f(),_pa.init=function(){u(),_pa.detect(),_pa.initQ(),r()},_pa.addFired=function(e,a){"undefined"==typeof _pa.fired[e]&&(_pa.fired[e]=[]),_pa.fired[e].push(a)},_pa.detect=function(){for(var e=0;e<_pa.segments.length;e++){var a=_pa.segments[e];void 0!==a.regex&&_pa.url.match(new RegExp(a.regex,"i"))?_("fireSegment",a):void 0!==a.query&&_pa.url.match(new RegExp(a.query,"i"))?_("fireSegment",a):void 0!==a.path&&_pa.url.match(new RegExp(a.path,"i"))&&_("fireSegment",a)}for(var e=0;e<_pa.conversions.length;e++){var t=_pa.conversions[e];_pa.url.match(new RegExp(t.regex,"i"))&&o(t)}for(var e=0;e<_pa.thirdPartyTags.length;e++){var n=_pa.thirdPartyTags[e];_pa.url.match(new RegExp(n.regex,"i"))&&c(n)}_pa.productId&&_pa.trackProduct(_pa.productId)},_pa.track=function(e,a){a="undefined"!=typeof a?a:{};var t=_pa.trackSegments(e,a),n=_pa.trackConversions(e,a),r=_pa.trackThirdPartyTags(e);return t||n||r},_pa.trackSegments=function(e,a){for(var t=!1,n=0;n<_pa.segmentEvents.length;n++){var r=_pa.segmentEvents[n];r.name===e&&(t=!0,_("fireSegment",r,a.segment_value))}return t},_pa.trackConversions=function(e,a){for(var t=!1,n=0;n<_pa.conversionEvents.length;n++){var r=_pa.conversionEvents[n];r.name===e&&(t=!0,o(r,a.orderId,a.revenue))}return t},_pa.trackThirdPartyTags=function(e){for(var a=!1,t=0;t<_pa.thirdPartyTagEvents.length;t++){var n=_pa.thirdPartyTagEvents[t];n.event===e&&(a=!0,c(n))}return a},_pa.trackProduct=function(e){if(e&&0!==encodeURIComponent(e).length&&(_pa.productId=e,_pa.allVisitorsSegmentId)){var a=_pa.allVisitorsSegmentId+":"+encodeURIComponent(_pa.productId),n=t(a);_pa.createImageTag("paRtbSegments",_pa.allVisitorsSegmentId,n,"product track")}},_pa.fireLoadEvents=function(){if("undefined"!=typeof _pa.onLoadEvent)if("function"==typeof _pa.onLoadEvent)_pa.onLoadEvent();else if("string"==typeof _pa.onLoadEvent)for(var e=_pa.onLoadEvent.split(","),a=0;a<e.length;a++){var t=e[a];_pa.track(t)}},_pa.createImageTag=function(e,a,t,n){if(!_pa.skip){for(var r=!1,o=0;o<m.length;o++)e===m[o]&&(r=!0);_pa.pixelPlacer.place(t,r),_pa.addFired(e,{id:a,name:n})}},_pa.looperReady=function(){_pa.ready.looper=!0,_pa.fireWhenReady()},_pa.fireWhenReady=function(){_pa.ready.looper&&_pa.ready.onload&&(_pa.fireLoadEvents(),_pa.pixelPlacer.activate())},_pa.fireSegment=function(t,r){a(t.id,t.name,r),n(t.id,t.name),e(t)},_pa.initQ=function(){if("undefined"!=typeof window._pq)for(var e=0;e<_pq.length;e++){var a=_pq[e];d(a)}window._pq={push:function(e){return d(e)}}},_pa.addListener=function(e,a){"undefined"==typeof _pa.callbacks[e]&&(_pa.callbacks[e]=[]),_pa.callbacks[e].push(a)},_pa.removeListener=function(e,a){for(var t=_pa.callbacks[e],n=t.length;n--;)t[n]===a&&t.splice(n,1)},_pa.pixelPlacer=function(){function e(){r=!0,t()}function a(e,a){r||a?n(e):o.push(e)}function t(){for(var e;e=o.pop();)n(e)}function n(e){var a=document.createElement("img");a.src=e,a.width=1,a.height=1,a.border=0,_pa.head.appendChild(a)}var r=!1,o=[];return{activate:e,place:a}}();var b={cd:function(){return _pa.crossDevice}};_pa.setPartners=function(e){var a,t,n=0;for(var r in e){if(a=e[r],t=!0,"object"==typeof a)for(var o;o<a.length;o++){var p=a[o];criteriaFunction=b[p],t=t&&criteriaFunction()}t&&("undefined"==typeof _pa.partnerLimit||n<_pa.partnerLimit)&&(_pa.pixelPlacer.place(_pa.paRtbHost+"cs/?partnerId="+r),n++)}},_pa.fireFacebookConversion=function(e,a,t){if("undefined"!=typeof _pa.facebookPixelId){var n="https://www.facebook.com/tr?id=",r=n+_pa.facebookPixelId;r+="&ev=CONTENT_VIEW",r+="&cd[appnexus_id]="+e.id.toString(),"undefined"!=typeof a&&(r+="&cd[content_ids]="+encodeURIComponent(a)),"undefined"!=typeof t&&(r+="&cd[value]="+encodeURIComponent(t),r+="&cd[currency]=USD"),r+="&noscript=1",_pa.createImageTag("fb_conversions",e.id,r,e.name)}}}();(function(){
	_pa.init();
	if (_pa.initAfterLoad) {
		if (window.document && window.document.readyState === "complete") {
			_pa.ready.onload = true;
			_pa.fireWhenReady();
		} else {
			function hookLoad(handler) {
				if(window.addEventListener) {
					window.addEventListener("load", handler, false);
				} else if(window.attachEvent) {
					window.attachEvent("onload", handler);
				}
			}
			hookLoad(function() {
				_pa.ready.onload = true;
				_pa.fireWhenReady();
			});
		}
	} else {
		_pa.ready.onload = true;
		_pa.fireWhenReady();
	}
})();
