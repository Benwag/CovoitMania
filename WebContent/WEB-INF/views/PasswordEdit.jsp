<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="/style/style.jsp"/>
<title>Modifier le mot de passe</title>
</head>
<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
<h2 class="container">Changer le mot de passe</h2>
<div class="container jumbotron form-group">
<form action="EditPassword" onsubmit="return myFunction()" method="post">




<p><label for="PreviousPassword">Précédent mot de passe:</label> <input type="password" class="form-control" name="previousPassword"  value=""></p>
<p><label for="NewPassword">Nouveau mot de passe:</label> <input id = "pass1" type="password"  class="form-control" name="newPassword" value=""></p>
<p><label for="ConfirmPassword">Confirmer le nouveau mot de passe:</label> <input id="pass2" type="password" class="form-control"  name="confirmPassword" value=""></p>


<p><input type="submit" class="btn btn-success" value="Enregistrer modification"/></p>

</form>
<a class="btn btn-default" href="UserAccount?user=${loggedUser.getId()}">Retour</a>
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