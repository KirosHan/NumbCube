/*!
 * SelectNav.js (v. 0.1)
 * Converts your <ul>/<ol> navigation into a dropdown list for small screens
 */window.selectnav=function(){"use strict";var a=function(a,b){function l(a){var b;a||(a=window.event),a.target?b=a.target:a.srcElement&&(b=a.srcElement),b.nodeType===3&&(b=b.parentNode),b.value&&(window.location.href=b.value)}function m(a){var b=a.nodeName.toLowerCase();return b==="ul"||b==="ol"}function n(a){for(var b=1;document.getElementById("selectnav"+b);b++);return a?"selectnav"+b:"selectnav"+(b-1)}function o(a){i++;var b=a.children.length,c="",k="",l=i-1;if(!b)return;if(l){while(l--)k+=g;k+=" "}for(var p=0;p<b;p++){var q=a.children[p].children[0],r=q.innerText||q.textContent,s="";d&&(s=q.className.search(d)!==-1||q.parentElement.className.search(d)!==-1?j:""),e&&!s&&(s=q.href===document.URL?j:""),c+='<option value="'+q.href+'" '+s+">"+k+r+"</option>";if(f){var t=a.children[p].children[1];t&&m(t)&&(c+=o(t))}}return i===1&&h&&(c='<option value="">'+h+"</option>"+c),i===1&&(c='<select class="selectnav" id="'+n(!0)+'">'+c+"</select>"),i--,c}a=document.getElementById(a);if(!a)return;if(!m(a))return;document.documentElement.className+=" js";var c=b||{},d=c.activeclass||"active",e=typeof c.autoselect=="boolean"?c.autoselect:!0,f=typeof c.nested=="boolean"?c.nested:!0,g=c.indent||"→",h=c.label||"- Navigation -",i=0,j=" selected ";a.insertAdjacentHTML("afterend",o(a));var k=document.getElementById(n());return k.addEventListener&&k.addEventListener("change",l),k.attachEvent&&k.attachEvent("onchange",l),k};return function(b,c){a(b,c)}}();
 
 
 /*-----------------------------------------------------------------------------------*/
/*	SELECTNAV
/*-----------------------------------------------------------------------------------*/
window.$ = jQuery;
$(document).ready(function() {
	selectnav('tiny', {
		label: '--- Navigation --- ',
		indent: '-'
	});
});