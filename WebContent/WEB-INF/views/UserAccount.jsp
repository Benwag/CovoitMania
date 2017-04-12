<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ page errorPage="/error.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="/style/style.jsp"/>
<title>Mon Compte</title>
</head>
<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
<div class="container">

</div>
<div class="container jumbotron">
<h2>Bienvenue, ${loggedUser.getFirstname()} ${loggedUser.getLastname()}</h2>
<ul>
<li><a class="btn btn-primary btnlist" href="DetailUser?user=${loggedUser.getId()}">Voir mon profil</a></li>
<li><a class="btn btn-primary btnlist" href="Messagerie">Consulter mes messages</a></li>
<li><a class="btn btn-primary btnlist" href="EditUser?user=${loggedUser.getId()}">Modifier mes informations générales</a></li>
<li><a class="btn btn-primary btnlist" href="EditPreference?user=${loggedUser.getId()}">Modifier mes préférences de trajet</a></li>
<li><a href="EditPassword?user=${loggedUser.getId()}" class="btn btn-primary btnlist">Modifier mon mot de passe</a></li>
<li><a href="DeleteUser?user=${loggedUser.getId()}" class="btn btn-danger btnlist">Supprimer mon compte</a></li>
</ul>

</div>
</body>
</html>