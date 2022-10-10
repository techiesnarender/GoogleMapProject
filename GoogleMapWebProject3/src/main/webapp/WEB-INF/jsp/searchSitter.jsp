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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="/home">Misha Infotech</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/register">Sitter Registration<span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/search">Search</a>
      </li>
    </ul>
    
  </div>
</nav>
<p id="demo"></p>
<h4 class="text-center">Search Sitter</h4>
	<div class="container">
	<form action="/searchsitter" method="get">
		<div class="input-group">
		  <input type="search" name="address" id="map-search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" value="${address}" required="required"/>
		  <input type="hidden" name="latitude" id="lat" class="form-control lat"  readonly="readonly">
		  <input type="hidden" name="longitude" id="lng" class="form-control long"  readonly="readonly">
		  <button type="submit" class="btn btn-outline-primary">search</button>	  
		</div>
	</form>
	 <div id="floating-panel">
      <!-- <button id="drop">Drop Markers</button> -->
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
					
					<%-- <input type="hidden" name="array[]" id="dblat" value="${sitter.lat }">
					<input type="hidden" name="array2[]" id="dblng" value="${sitter.lng }"> --%>
					
			</c:forEach>	
			
		</div>
		<div class="col-sm-6">
			<!--Google map-->
			<div id="map-canvas"></div>
		</div>
	</div>
</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&libraries=places&callback=initMap&v=weekly"></script>

<!--Google map JS Code-->
<script type="text/javascript">  


/* var arr = [];
<c:forEach var="array" items="${actionBean.myArray }">
arr.push("<c:out value="${array }"></c:out>");
</c:forEach>

$(document).ready(function() {
  $("#button").click(function(){
    $("#somecontainer").html(arr.join("<br/>"));
  });
}); */

var  latElGeo = document.querySelector( '.lat' ),
	 longElGeo = document.querySelector( '.long' ),
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

/* window.onload = function getCurrentLocation(){
	let inputVal = document.getElementById("lat").value;
	//console.log(inputVal);
} */

/* var values2 = $("input[name='array2[]']")
.map(function(){return $(this).val();}).get(); */
/*
let iterator1 = values1.values();
let iterator2 = values2.values();

var neighborhoods = {};
for(let value of iterator1){
	for(let value  of iterator2){
		var neighborhoods = [
		{ lat: value, lng: value },
	];
	}
} */
/*  console.log(values);
 console.log(values2);

 let jsonArray = [];
 let jsonArray1 = [];
 
 jsonArray = values.map(i => {
	 return {lat:i};
 });
 jsonArray1 = values2.map(j => {
	 return {lng:j};
 });
 
 console.log(jsonArray);
 console.log(jsonArray1); */
 
 const neighborhoods = [
	 <c:forEach var="sitter" items="${sitter}">
	 	{ lat: <c:out value="${sitter.lat}"/>, lng: <c:out value="${sitter.lng}"/>},
	 </c:forEach>
	 ]; 
 
 
 function initMap() {
	 var bounds = new google.maps.LatLngBounds(); 
	 var mapOptions = {
	 center: new google.maps.LatLng(28.62, 77.36),
	 zoom: 4,
	 mapTypeId: google.maps.MapTypeId.ROADMAP,
	 //  marker:true
	 };
	 var infoWindow = new google.maps.InfoWindow();
	 var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	 for (i = 0; i < neighborhoods.length; i++) {
	 var data = neighborhoods[i];
	 var myLatlng = new google.maps.LatLng(data.lat, data.lng);
	 var marker = new google.maps.Marker({
	 position: myLatlng,
	 //zoom: 15,
	 map: map,
	 //title: data.address
	 });
	 bounds.extend(myLatlng);
	 (function(neighborhoods, data) {
		 
	 // Attaching a click event to the current marker
	 google.maps.event.addListener(marker, "click", function(e) {
	// infoWindow.setContent(data.address);
	 infoWindow.open(map, marker);
	 });
	 
	/*  google.maps.event.addListener(map, 'bounds_changed', function(event) {
		
		
		 this.setZoom(map.getZoom()-1);

		  if (this.getZoom() > 8) {
		    this.setZoom(8);
		  }
		});
		map.fitBounds(bounds);  */
		
	  // Automatically center the map fitting all markers on the screen
	  map.fitBounds(bounds);
	  map.panToBounds(bounds); 

		
	 })(marker, data);
	 }
	 }
 

 
 /* 
 let markers = [];
 let map;
 
 function initMap() {
	 
	 var mapOptions, searchBox,
		infoWindow = '',
		addressEl = document.querySelector( '#map-search' ),
		latEl = document.querySelector( '.lat' ),
		longEl = document.querySelector( '.long' ),
		element = document.getElementById( 'map-canvas' );
	 
	 
	 mapOptions = {
				zoom: 8,
				// Current Lat and Long position of the pin/
				center: new google.maps.LatLng( 28,64 ),
				disableDefaultUI: false, 
				scrollWheel: true, 
				draggable: true, 
			    //mapTypeId: google.maps.MapTypeId.HYBRID, // If set to HYBRID its between sat and ROADMAP, Can be set to SATELLITE as well.
			};
	 
	// Create an object map with the constructor function Map()
	 map = new google.maps.Map( element, mapOptions ); // Till this like of code it loads up the map.
	 
	/*  marker = new google.maps.Marker({
			position: mapOptions.center,
			map: map,
			// icon: 'http://pngimages.net/sites/default/files/google-maps-png-image-70164.png',
			//draggable: true
		}); */
/* 	 document.getElementById("drop").addEventListener("click", drop);
	
		
	searchBox = new google.maps.places.SearchBox(addressEl);
		
	 google.maps.event.addListener( searchBox, 'places_changed', function () {
		 clearMarkers();

		  for (let i = 0; i < neighborhoods.length; i++) {
		    addMarkerWithTimeout(neighborhoods[i], i * 200);
		  } 
		  
			var places = searchBox.getPlaces(),
				bounds = new google.maps.LatLngBounds(),
				i, place, lat, long,
				addresss = places[0].formatted_address;

			for( i = 0; place = places[i]; i++ ) {
				bounds.extend( place.geometry.location );
				markers.setPosition( place.geometry.location );  // Set marker position new.
			}

			map.fitBounds( bounds );  // Fit to the bound
			map.setZoom( 15 ); // This function sets the zoom to 15, meaning zooms to level 15.
			// console.log( map.getZoom() );


			// Closes the previous info window if it already exists
			if ( infoWindow ) {
				infoWindow.close();
			}
			/**
			 * Creates the info Window at the top of the marker
			 */
			/* infoWindow = new google.maps.InfoWindow({
				content: addresss
			});

			infoWindow.open( map, marker );
		} );
	 
 } */ 
 
 /* function drop() {
	  clearMarkers();

	  for (let i = 0; i < neighborhoods.length; i++) {
	    addMarkerWithTimeout(neighborhoods[i], i * 200);
	  } 
	} */
 
 /* function addMarkerWithTimeout(position, timeout) {
	  window.setTimeout(() => {
	    markers.push(
	      new google.maps.Marker({
	        position: position,
	        map,
	        animation: google.maps.Animation.DROP,
	      })
	    );
	  }, timeout);
	}
 
 function clearMarkers() {
	  for (let i = 0; i < markers.length; i++) {
	    markers[i].setMap(null);
	  }

	  markers = [];
	}
 
 window.initMap = initMap;
 
 
  */
 
 
 
 
/*  const neighborhoods = [
	 <c:forEach var="sitter" items="${sitter}">
	 	{ lat: <c:out value="${sitter.lat}"/>, lng: <c:out value="${sitter.lng}"/> },
	 </c:forEach>
	 ]; 

 console.log(neighborhoods);
	let markers = [];
	let map;
	

	function initMap() {
	  map = new google.maps.Map(document.getElementById("map-canvas"), {
	    zoom: 12,
	    center: { lat: 28.6260606, lng: 77.3668853 },
	  });
	  document.getElementById("drop").addEventListener("click", drop);
	}

	function drop() {
	  clearMarkers();

	  for (let i = 0; i < neighborhoods.length; i++) {
	    addMarkerWithTimeout(neighborhoods[i], i * 200);
	  }
	}

	function addMarkerWithTimeout(position, timeout) {
	  window.setTimeout(() => {
	    markers.push(
	      new google.maps.Marker({
	        position: position,
	        map,
	        animation: google.maps.Animation.DROP,
	      })
	    );
	  }, timeout);
	}

	function clearMarkers() {
	  for (let i = 0; i < markers.length; i++) {
	    markers[i].setMap(null);
	  }

	  markers = [];
	}

	window.initMap = initMap;
 */
</script>

</body>
</html>