<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible content="IE=edge">
<meta http-equiv="Pragma"content="no-cache">
<meta http-equiv="Cache-Control"content="no-cache">
<meta http-equiv="Expires"content="sat,01 Dec 2001 00:00:00 GMT">
<title>MishaInfotech | Search</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet'	href='https://formden.com/static/cdn/bootstrap-iso.css' />
<style type="text/css">
#map-canvas {
  height: 500px;
  width:530px;
  border:1px solid black;
  border-radius: 4px;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<p id="demo"></p>
<h4 class="text-center">Search Sitter</h4>
	<div class="container">
	<form action="/searchsitter" method="get">
		<div class="input-group">
		  <input type="search" name="address" id="map-search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" value="${address}" required="required"/>
		  <input type="hidden" name="latitude" id="lat" class="form-control lat" >
		  <input type="hidden" name="longitude" id="lng" class="form-control lng">
		  <button type="submit" class="btn btn-outline-primary">search</button>	  
		</div>
	</form>
	 <div id="floating-panel">
    </div>
	</div>

<div class="container" style="margin-top:10px">
	<div class="row">
		<div class="col-sm-6">
			<c:forEach var="sitter" items="${sitter}">
					
					<div class="card" style="width: 33rem;">
					  <div class="card-body">
					  	<div class="row">
						  		<div class="col-sm-4">
						  			 <img src="images/${sitter.logo}" alt="Card image" style="height:100px; width:100px">
						  		</div>
						  		<div class="col-sm-8">
								    <h6 class="card-subtitle text-muted">${sitter.address}</h6>
								    <p class="card-text">Hours: <span class="text-success">Open.</span> ${sitter.opentime }</p>
								    <p class="card-text">Charge/hr : ${sitter.chargesperhour }</p>								
								</div>
							</div>
					  </div>
					</div>					
			</c:forEach>	
			
		</div>
		<div class="col-sm-6">
			<!--Google map-->
			<div id="map-canvas"></div>
		</div>
	</div>
</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&libraries=places&callback=initMap"></script>

<!--Google map JS Code-->
<script type="text/javascript">  

var  latElGeo = document.querySelector( '.lat' ),
	 longElGeo = document.querySelector( '.lng' ),
	 x =  document.getElementById("demo");
window.onload = function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showPosition(position) {
  latElGeo.value = position.coords.latitude;
  longElGeo.value = position.coords.longitude;
}
 
 //Google map marker data code started here
 
 var neighborhoods =  [
	 <c:forEach var="sitter" items="${sitter}">
	  {lat: <c:out value="${sitter.lat}"/>, lng: <c:out value="${sitter.lng}"/>, email: '<c:out value="${sitter.email}"/>', companyname: '<c:out value="${sitter.companyname}"/>', open: '<c:out value="${sitter.opentime}"/>', logo: '<c:out value="${sitter.logo}"/>'},
	 </c:forEach>
	 ]; 
	 console.log(neighborhoods);
const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
let labelIndex = 0;

 function initMap() {
	 
	 var mapOptions;
	 mapOptions = {
	 center: new google.maps.LatLng(28.62, 77.36),
	 zoom: 5,
	 mapTypeId: google.maps.MapTypeId.ROADMAP,
	 };
	 var bounds = new google.maps.LatLngBounds(); 
	 var infoWindow = new google.maps.InfoWindow();
	 var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);	
		 
	 const svgMarker = {
			    path: "M10.453 14.016l6.563-6.609-1.406-1.406-5.156 5.203-2.063-2.109-1.406 1.406zM12 2.016q2.906 0 4.945 2.039t2.039 4.945q0 1.453-0.727 3.328t-1.758 3.516-2.039 3.070-1.711 2.273l-0.75 0.797q-0.281-0.328-0.75-0.867t-1.688-2.156-2.133-3.141-1.664-3.445-0.75-3.375q0-2.906 2.039-4.945t4.945-2.039z",
			    fillColor: "blue",
			    fillOpacity: 0.6,
			    strokeWeight: 0,
			    rotation: 0,
			    scale: 2,
			    anchor: new google.maps.Point(15, 30),
			  };
	 
	 var x = navigator.geolocation;
	 x.getCurrentPosition(success);
	 
	 function success(position){
		 var myLat = position.coords.latitude;
		 var myLng = position.coords.longitude;
		 var myLatlng2 = new google.maps.LatLng(myLat, myLng);
		 
		var markerOption2 = new google.maps.Marker({
		 position: myLatlng2,
		 map: map,
		 icon: svgMarker,
		 });
		map.setCenter(myLatlng2);	
		let marker2 = new google.maps.Marker(markerOption2);
		marker2.setMap(map);
		bounds.extend(myLatlng2);

		 google.maps.event.addListener(markerOption2, "click", (e) => {
			 infoWindow.setContent("This is your current location");
			 infoWindow.open(map, markerOption2);
			 });
		 
		 // Automatically center the map fitting all markers on the screen
		  map.fitBounds(bounds);
		  map.panToBounds(bounds); 
		 
	 }
	// Adding Multiple marker on google map 
	 for (i = 0; i < neighborhoods.length; i++) {
	 var data = neighborhoods[i];
	 var myLatlng = new google.maps.LatLng(data.lat, data.lng);
	 var marker = new google.maps.Marker({
	 position: myLatlng,
	 label: labels[labelIndex++ % labels.length],
	 map: map,
	 animation: google.maps.Animation.DROP,
	 //title: data.address,
	 });
	 	 
	 bounds.extend(myLatlng);
	 (function(marker, data) {
		 
	 // Attaching a click event to the current marker
	 google.maps.event.addListener(marker, "click", (e) => {
	 infoWindow.setContent('<img src="images/'+data.logo+'" style="position: relative; width: 220px; height: 104px;">'+'<br/> <b>Company: </b>'+data.companyname+ ' <br/> <b>Email: </b>'+data.email+'<br/> <b class="text-success">Open: </b>'+data.open);
	
	 infoWindow.open(map, marker);
	 });
	 
	  // Automatically center the map fitting all markers on the screen
	  map.fitBounds(bounds);
	  map.panToBounds(bounds); 

	 })(marker, data);
	 }
 
 }
 
</script>
</body>
</html>