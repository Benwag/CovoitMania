<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*, com.cfranc.UserManger.model.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
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
		<title>Localisation des utilisateurs</title>
	</head>
	<body onload="initialiser()">
	
	<c:import url="/WEB-INF/views/Menu.jsp" />
	<h2 class="container">Localisation des utilisateurs</h2>
	<div class="container" id="carte" style="width:100%; height: 75%"></div>
	<div class="container">
	
	
  <h2>Liste des utilisateurs</h2>
  <p>Voici la liste des ${users.size()} utilisateurs actuellement inscrits</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Lastname</th>
        <th>Firstname</th>
        <!-- <th>Email</th> -->
        <th>Details</th>
        <!-- <th>Edit</th>
        <th>Delete</th> -->
      </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}" varStatus="stat">
      <tr>
        <td>${user.value.getLastname()} </td>
        <td>${user.value.getFirstname()} </td>
        <%-- <td>${user.value.getEmail()}</td> --%>
        <td><a href="DetailUser?user=${user.key}">Details</a></td>
        <%-- <td><a href="EditUser?user=${user.key}">Edit</a></td>
        <td><a href="DeleteUser?user=${user.key}">Delete</a></td> --%>        
      </tr>
    </c:forEach>
     
    </tbody>
  </table>
</div>
		<c:if test="${error != null}">${error}</c:if>
		<c:if test="${sucess != null}">${sucess}</c:if>
 		
		
		
		
	</body>
	
</html>