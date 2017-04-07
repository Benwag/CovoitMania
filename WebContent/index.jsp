<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<%-- <link rel="stylesheet" href='<c:url value="WEB-INF/css/custom.css" />' /> --%>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyBBqYxzbViJA31VFQiVNXUqQHKfSbISNZY"></script>
<title>CovoitMania</title>
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/Menu.jsp" />
</div>
<div class="jumbotron">
        <h1>Covoiturez malin!</h1>
        <p class="texte">Avec CovoitMania, organisez et optimisez vos déplacements quotidiens jusqu'à votre lieu de travail en covoiturant avec vos collègues.</p>
        <p class="texte"> Sélectionnez vos préférences: musique, blabla, fumeur, renseignez votre adresse et hop! CovoitMania vous trouve le covoiturage parfait! </p>
        <p><a class="btn btn-lg btn-success" href="<c:url value="/AddUser"/>" role="button">S'inscrire</a></p>
      </div>

</body>
</html>