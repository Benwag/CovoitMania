<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="/error.jsp" %> 
<!DOCTYPE html>
<html>
	<head>
		<c:import url="/style/style.jsp"/>
		<title>User Delete</title>
		<style type="text/css">
			.warning {
				color: red;
			}
		</style>
	</head>
	
	<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
<h1 class="container warning">Etes-vous sûr de vouloir supprimer votre compte?</h1>
<div class="container jumbotron">
		
		<ul>
			<li>Prénom : ${user.getFirstname()}</li>
			<li>Nom : ${user.getLastname()}</li>
			<li>Age : ${user.getAge()}</li>
			<li>Email : ${user.getEmail()}</li> 
		</ul>
		<form action="DeleteUser" method="post" onsubmit="return verifyDelete();">
			<input class="btn btn-danger" type="submit" value="Oui" class="warning"/>
			<input type="hidden" name="user" value="${user.getId()}" />
		</form>
		
		<a class="btn btn-default" href="UserAccount?user=${loggedUser.getId()}">Retour</a>
</div>		
		<script type="text/javascript">
			function verifyDelete() {
				return confirm("Are you REALLY sure?");
			}
		</script>
	</body>
	
</html>