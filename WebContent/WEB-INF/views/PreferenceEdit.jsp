<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="/style/style.jsp"/>
<title>Preferences</title>
</head>
<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
<h2>Préférences</h2>
<div class="container">
<form action="EditPreference" method="post">
<div class="form-group">
<label for="firstname">Je suis conducteur</label>oui<input type="radio" class="form-control" name="conducteur" value="oui">non<input type="radio" class="form-control" name="conducteur" value="non"></div>
<p><label for="lastname">j'écoute de la musique</label>oui<input type="radio"  class="form-control" name="music" value="oui">non<input type="radio"  class="form-control" name="music" value="non"></p>
<p><label for="lastname">je fume</label>oui<input type="radio"  class="form-control" name="fumeur" value="oui">non<input type="radio"  class="form-control" name="fumeur" value="non"></p>
<p><label for="lastname">je parle</label>beaucoup<input type="radio"  class="form-control" name="blabla" value="oui">pas du tout<input type="radio"  class="form-control" name="blabla" value="non"></p>
<p><label for="lastname">j'accepte un détour de </label><input type="number"  class="form-control" name="detour">km</p>
<p><input type="submit" class="btn btn-default" value="Update Preferences"/></p>
</form>
</div>


</body>
</html>