<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:useBean id="loggedUser" scope="session" class="com.cfranc.UserManger.model.Utilisateur"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/custom.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  function logControl() {
	  if()
  };	

  
  function show() {
		$(".connected").show();
		$("vanilla").hide();
	};
	function hide() {
		$(".connected").hide();
		$("vanilla").show();
	};
  
  
  </script>
<title>Insert title here</title>
</head>
<body>
<%-- <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CovoitMania</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Accueil</a></li>
      <li><a href="<c:url value="/AllUsers"/>">Afficher tous les utilisateurs</a></li>
      <li><a href="<c:url value="/AddUser"/>">Ajouter un utilisateur</a></li>
      <li><a href="<c:url value="/Login"/>">Connexion</a></li>
    </ul>
  </div>
</nav> --%>
<div class="container" onload="logControl()">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="index.jsp">Accueil</a></li>
            <li role="presentation"><a href="<c:url value="/AllUsers"/>">Carte</a></li>
            <li class="vanilla" role="presentation"><a href="<c:url value="/AddUser"/>">Inscription</a></li>
			<li class="vanilla" role="presentation"><a href="<c:url value="/Login"/>">Connexion</a></li>
			<li class="connected" role="presentation"><a href="<c:url value="/EditUser?user=${user.key}"/>">Mon compte</a></li>
			<li class="connected" role="presentation"><a href="<c:url value="/Logout"/>">D�connexion</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">CovoitMania</h3>	
      </div>
</div>     



</body>
</html>