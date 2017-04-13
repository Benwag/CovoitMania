<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<c:import url="/style/style.jsp"/>
<title>User Add</title>
</head>
<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
<h2 class="container">Inscription</h2>
<c:if test="${error != null}">${error}</c:if>
<div class="jumbotron container">
<form action="AddUser" onsubmit="return myFunction()" method="post">
<div class="form-group">
<p class="texte"><label for="firstname">Pr�nom:</label> <input type="text" class="form-control" name="firstname" placeholder="pr�nom"></p>
<p class="texte"><label for="lastname">Nom:</label> <input type="text"  class="form-control" name="lastname" placeholder="nom"></p>
<p class="texte"><label for="age">Age:</label> <input type="number" class="form-control"  name="age" placeholder="age"></p>
<p class="texte"><label for="email">Email:</label> <input type="email" class="form-control"  name="email" placeholder="email"></p>
<p class="texte"><label for="address">Adresse:</label> <input type="text" class="form-control"  name="address" placeholder="adresse"></p>
<p class="texte"><label for="PostalCode">Code postal:</label> <input type="number" class="form-control"  name="postalCode" placeholder="Code postal"></p>
<p class="texte"><label for="city">Ville:</label> <input type="text" class="form-control"  name="city" placeholder="Ville"></p>
<p class="texte"><label for="password">Mot de passe:</label> <input id="pass1" type="password" class="form-control"  name="password" placeholder="mot de passe"></p>
<p class="texte"><label for="password2">Saisir � nouveau le mot de passe:</label> <input id="pass2" type="password" class="form-control"  name="password2" placeholder="mot de passe"></p>
<input type="submit" class="btn btn-lg btn-success" value="S'inscrire"/></div>
</form>
</div>
<script>
function myFunction() {
    var pass1 = document.getElementById("pass1").value;
    var pass2 = document.getElementById("pass2").value;
    if (pass1 != pass2 || pass1 == "" || pass2 == "") {
        //alert("Passwords Do not match");
        document.getElementById("pass1").style.borderColor = "#E34234";
        document.getElementById("pass2").style.borderColor = "#E34234";
       return false;
    }
   
    return true;
}
</script>
</body>
</html>