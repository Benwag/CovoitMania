<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*, com.cfranc.UserManger.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<!-- <link rel="stylesheet" href="WEB-INF/styles/style.css"> -->

<title>Users List</title>
</head>
<body onload="init();">
	<div>
		<table>
			<p>Entrez le detour maximal que vous pourriez faire:
			<input type="number" value="1" id="detours">km</p>
			Rechercher des covoiturages � Proximit�:
			<input type="button" value="Rechercher" onclick="rechercher()">
			</td>
			</tr>
		</table>
	</div>
	<div id="divMap" style="align: center; width: 800px; height: 800px"></div>
	<div id="divCandidates" > 
	
    </div>
	<br />
</body>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBBqYxzbViJA31VFQiVNXUqQHKfSbISNZY"></script>
<script type="text/javascript">

	var directionsService = new google.maps.DirectionsService();
	var users;
	 var users = {
		    <c:forEach var="user" items="${users}">
		    "${user.key}":{prenom:"${user.value.getFirstname()}", 
		    				nom:"${user.value.getLastname()}",
		    				age:"${user.value.getAge()}",
		    				email:"${user.value.getEmail()}",
		    				id:"${user.value.getId()}",
		    				password:"${user.value.getPassword()}",
		    				adresse:"${user.value.getAddress()}",
		    				city:"${user.value.getCity()}",
		    				postcode:"${user.value.getPostCode()}",
		    				score:"${user.value.getScore()}",
		    				lat:"${user.value.getCoord()[0]}",
		    				lng:"${user.value.getCoord()[1]}"
		    				
		    },
		    </c:forEach>} 
	var user=users["1"];
	var adresseEntreprise="18 rue D'upsal 6700 Strasbourg";
	var adresseEmploye=user.adresse+" "+user.postcode+" "+user.city;
	var listParcours;
	const RADIUS=6371;
	users;

	
	var map,geocoder, marker, marker2; 
	var markers=[];
	var depart,arrivee,ptCheck; 
	
	/*initialise google MAP V3*/
	 function init() {
		
	 /*gestion des routes*/
	 directionsDisplay = new google.maps.DirectionsRenderer();
	 
	 /*emplacement par d�faut de la carte (Toulouse)*/
	 
	 var maison = new google.maps.LatLng(user.lat, user.lng);
	 /*option par d�faut de la carte*/
	 
	 var myOptions = {zoom:16,mapTypeId: google.maps.MapTypeId.ROADMAP,center: maison
	 
	 }
	 
	 /*creation de la map*/
	 
	 map = new google.maps.Map(document.getElementById("divMap"), myOptions);
	 
	 /*connexion de la map + le panneau de l'itin�raire*/
	 
	 directionsDisplay.setMap(map);
	 
	 directionsDisplay.setPanel(document.getElementById("divRoute"));
	 
	 /*intialise le geocoder pour localiser les adresses */
	 geocoder = new google.maps.Geocoder();
	 
	 }
	
	 function trouveRoute() {
		  /*test si les variables sont bien initialis�s*/
		  if (depart && arrivee){
			  var maison = new google.maps.LatLng(43.6042600, 1.4436700);
			  var request = { origin:depart,destination:arrivee,travelMode: google.maps.DirectionsTravelMode["DRIVING"]};
		  
			  /*appel � l'API pour tracer l'itin�raire*/
			  
		   directionsService.route(request, function(response, status) {
		   
			   if (status == google.maps.DirectionsStatus.OK) {
		   
				   directionsDisplay.setDirections(response); 
					 var monTrajet=response.routes[0].overview_path; 
					 var listeTrajet=new Array();
					 for (var index=0; index<monTrajet.length;index++){
						 var point=monTrajet[index];
						 var coordonees=new Array(point.lat(),point.lng());
						 listeTrajet.push(coordonees);
					 }
					 listParcours=listeTrajet;
					 getCandidate();
					 
}
		   });
		   }
		  }
	 function rechercher(){
		 var src2= adresseEntreprise;
		 var src=adresseEmploye;
		  // ptCheck = code; /*adresse de d�part ou arriv�e ? */
		  if (geocoder) {geocoder.geocode( { 'address': src},function(results, status) {
		  if (status == google.maps.GeocoderStatus.OK) {
		  /*ajoute un marqueur � l'adresse choisie*/
		  map.setCenter(results[0].geometry.location);
		  if (marker) { marker.setMap(null);}
		  marker = new google.maps.Marker({
		  map: map,
		  position: results[0].geometry.location
		  });
		  /*on remplace l'adresse par celle fournie du geocoder*/
		  depart = results[0].formatted_address;
		  /*trace la route*/
		  }
		  });
		  geocoder.geocode( { 'address': src2},
		 function(results, status) {
		  if (status == google.maps.GeocoderStatus.OK) {
		  /*ajoute un marqueur � l'adresse choisie*/
		  if (marker2) { marker2.setMap(null);}
		  marker2 = new google.maps.Marker({
		  map: map,
		  position: results[0].geometry.location
		  });
		  /*on remplace l'adresse par celle fournie du geocoder*/
		  arrivee = results[0].formatted_address;
		  /*trace la route*/
		  }
		  trouveRoute();
		  });
		  }
		  }
			
			function calculDistanceEntreDeuxCoordonnees(latA,longA, latB, longB){
				var resultat=RADIUS*Math.acos(Math.sin(latA*2*Math.PI/360)*Math.sin(latB*2*Math.PI/360)+Math.cos(latA*2*Math.PI/360)*Math.cos(latB*2*Math.PI/360)*Math.cos(longA*2*Math.PI/360-longB*2*Math.PI/360));
				return resultat;
			}
		 
		
		  function getCandidate(){
			  var candidatsValides=new Array();
			 for(var marks of markers){marks.setMap(null);}
			 markers=new Array;
			  var detour=document.getElementById("detours").value;
			  for( var key in users){
				  utilisateur=users[key];
				  if (utilisateur!=user){
					  var latCandidate=utilisateur.lat;
				  	  var lngCandidate=utilisateur.lng;
				  	  //var diam=user.detourMaximum+utilisateur.distanceParcourableMax:
				  	  var diam=detour;
				  	  for (var point of listParcours){
				  		  if (calculDistanceEntreDeuxCoordonnees(latCandidate,lngCandidate,point[0],point[1])<diam){
				  			  candidatsValides.push(utilisateur);
				  			  var latLng = new google.maps.LatLng(utilisateur.lat, utilisateur.lng);
				  			  markers.push(new google.maps.Marker({
				  			  map: map,
				  			  position: latLng
				  			  }))
				  			  break;
				  		  }
				  	  }
				    }
			  }
			  var myNode = document.getElementById("divCandidates");
			  myNode.innerHTML = '';
			  var resultats=document.createElement('h1');
			  var resTitre=document.createTextNode("Contactez les covoitureurs pr�s de chez vous!!:");
			  var resEchec=document.createTextNode("Aucun resultat ne correspond a votre recherche");
			  if (candidatsValides.length!=0)
			  resultats.appendChild(resTitre);
			  else resultats.appendChild(resEchec);
			  document.getElementById('divCandidates').appendChild(resultats);
			  var list = document.createElement('ul');

			    for( var key in candidatsValides) {
			    	var vCandidats=candidatsValides[key];
			        // Create the list item:
 			        var item = document.createElement('li'); 

			        // Set its contents:
 			       

			        var createA = document.createElement('a');
			        var createAText = document.createTextNode(vCandidats.prenom);
			        createA.appendChild(createAText);
			        createA.setAttribute('href', "DetailUser?user="+vCandidats.id);
			        item.appendChild(createA);

			        // Add it to the list:
			        list.appendChild(item);
			    }

			    // Finally, return the constructed list:
			     list;


			// Add the contents of options[0] to #foo:
			document.getElementById('divCandidates').appendChild(list);
		  		return candidatsValides;
			  
		  }

</script>


</html>