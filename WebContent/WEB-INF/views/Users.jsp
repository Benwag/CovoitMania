<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*, com.cfranc.UserManger.model.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error.jsp" %>  

<!DOCTYPE html>

<html>
<head>
<c:import url="/style/style.jsp" />
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyBBqYxzbViJA31VFQiVNXUqQHKfSbISNZY"></script>
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
	infoWindow.open(carte, marker);
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
<title>Localisation des utilisateurs</title>
</head>
<body onload="initialiser()">

	<c:import url="/WEB-INF/views/Menu.jsp" />
	<div class="container jumbotron">
		<h2 class="container">Localisation des utilisateurs</h2>
		<div id="carte" style="width: 100%; height: 400px !important;"
			class="container jumbotron"></div>
	</div>
</body>

</html>