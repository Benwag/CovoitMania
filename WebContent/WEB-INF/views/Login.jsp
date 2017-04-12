<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ page errorPage="WEB-INF/views/error.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="/style/style.jsp"/>
<title>Identification</title>
</head>
<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
	<div class="jumbotron container">
  <h2>Identification</h2>
<form method="post" action="Login">
    <div class="form-group">
      <p class="texte"><label for="email">Email:</label></p>
      <input type="email" class="form-control" id="email" name="email" placeholder="Email">
    </div>
    <div class="form-group">
      <p class="texte"><label class="texte" for="pwd">Mot de passe:</label></p>
      <input type="password" class="form-control" name="password" id="pwd" placeholder="Mot de passe">
    </div>
    <div class="checkbox">
      <label><input type="checkbox">Se rappeler de moi</label>
    </div>
    <button type="submit" class="btn btn-primary">Connexion</button>
  </form>
</div>

	</form>
</body>
</html>