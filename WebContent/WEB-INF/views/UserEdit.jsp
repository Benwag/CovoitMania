<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="/style/style.jsp"/>
<title>User Edit</title>
</head>
<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
<h2 class="container">Informations personnelles</h2>
<form action="EditUser" method="post">

<div class="container jumbotron form-group">

<p><label for="firstname">Prénom:</label><input type="text" class="form-control" name="firstname"  value="${user.getFirstname()}"></p>
<p><label for="lastname">Nom:</label> <input type="text"  class="form-control" name="lastname" value="${user.getLastname()}"></p>
<p><label for="age">Age</label> <input type="number" class="form-control"  name="age" value="${user.getAge()}"></p>
<p><label for="email">Email:</label> <input type="email" class="form-control"  name="email"  value="${user.getEmail()}"></p>
<p><label for="address">Adresse:</label> <input type="text" class="form-control"  name="address"  value="${user.getAddress()}"></p>
<p><label for="postalCode">Code postal:</label> <input type="number" class="form-control"  name="postalCode"  value="${user.getPostCode()}"></p>
<p><label for="city">Ville:</label> <input type="text" class="form-control"  name="city"  value="${user.getCity()}"></p>

<p><input type="submit" class="btn btn-success" value="Enregistrer modifications"/></p>
</div>
</form>

<div class="container">
<p class="container"><a href="EditPassword?user=${user.getId()}"><input  class="btn btn-default" value="Changer le mot de passe"/></a>
<a href="DeleteUser?user=${user.getId()}"><input class="btn btn-danger" value="Supprimer mon compte"/></a>
</p>
</div>
</body>
</html>