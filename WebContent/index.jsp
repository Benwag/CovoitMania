<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<c:import url="/style/style.jsp"/>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyBBqYxzbViJA31VFQiVNXUqQHKfSbISNZY"></script>
<script type="text/javascript">
function initialiser() {
	var latlng = new google.maps.LatLng(48.578480, 7.751519);
	var options = {
			center: latlng,
			zoom: 16,
			mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var carte = new google.maps.Map(document.getElementById("carte"), options);
	
	var usersFields = {
		    <c:forEach var="user" items="${users}">
		    '${user.value.getCoord()[0]}': '${user.value.getCoord()[1]}',
		    </c:forEach>
		};
	
	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(48.578480, 7.751519),
		map: carte,
		title: "JAVASBOURG",
		draggable: false
	});
	
	var contentMarker = "JAVASBOURG";
	
	var infoWindow = new google.maps.InfoWindow({
		content: contentMarker,
		position: latlng
	});
	
	google.maps.event.addListener(marker, 'click', function() {
		infoWindow.open(carte, marker);
	});


for (var user in usersFields) {
		
		var latlng = new google.maps.LatLng(user, usersFields[user]);
		
		var userMarker = new google.maps.Marker({
			position: latlng,
			map: carte,
			title: "Utilisateur",
			draggable: false
		});
		
	}

}
</script>
<title>CovoitMania</title>
</head>
<body onload="initialiser()">
<c:import url="/WEB-INF/views/Menu.jsp" />
<div id="carte container" style="width:100%; height: 75%"></div>
<div class="jumbotron container">
        <h1>Covoiturez malin!</h1>
        <p class="texte">Avec CovoitMania, organisez et optimisez vos déplacements quotidiens jusqu'à votre lieu de travail en covoiturant avec vos collègues.</p>
        <p class="texte"> Sélectionnez vos préférences: musique, blabla, fumeur, renseignez votre adresse et hop! CovoitMania vous trouve le covoiturage parfait! </p>
        <p><a class="btn btn-lg btn-success" href="<c:url value="/AddUser"/>" role="button">S'inscrire</a></p>
</div>

</body>
</html>