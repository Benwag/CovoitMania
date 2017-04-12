<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="WEB-INF/views/error.jsp" %> 


<!DOCTYPE html>
<html>
<head>
<c:import url="/style/style.jsp" />
<title>User Details</title>
</head>

<body>
	<c:import url="/WEB-INF/views/Menu.jsp" />
	<div class="container">
		<ul class="list-group">
			<li class="list-group-item">Prénom : ${user.getFirstname()}</li>
			<li class="list-group-item">Nom : ${user.getLastname()}</li>
			<li class="list-group-item">Age : ${user.getAge()}</li>
			<li class="list-group-item">Email : ${user.getEmail()}</li>
			<li class="list-group-item">Adresse: ${user.getAddress()}</li>
			<li class="list-group-item">Code postal: ${user.getPostCode()}</li>
			<li class="list-group-item">Ville: ${user.getCity()}</li>
			<li class="list-group-item">Conducteur:
				${user.getPreferences().getConducteur()}</li>
			<li class="list-group-item">j'écoute de la musique:
				${user.getPreferences().getMusic()}</li>
			<li class="list-group-item">Je fume:
				${user.getPreferences().getFumeur()}</li>
			<li class="list-group-item">Je parle:
				${user.getPreferences().getBlabla()}</li>
			<li class="list-group-item">Je peux me déplacer d'environ <b>${user.getPreferences().getDetour()}
					km</b> par rapport à ma route / mon point de départ
			</li>

		</ul>
	</div>
	<div class="container">
		<form action="DetailUser" method="post">
			<div class="form-group">
				<input type="hidden" name="user" value="${user.getId()}" /> <label
					for="Message">Envoyer un message à ${user.getFirstname()}</label>
				<textarea class="form-control" rows="4" cols="50" name="Message">Bonjour, je souhaiterais vous proposer un covoiturage.</textarea>
			</div>


			<p>
				<input type="submit" class="btn btn-primary" value="envoyer" />
			</p>
		</form>
	</div>

</body>

</html>