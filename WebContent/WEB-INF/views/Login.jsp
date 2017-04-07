<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Identification</title>
</head>
<body>
<c:import url="/WEB-INF/views/Menu.jsp" />
	<div class="container">
  <h2>Identification</h2>
<form method="post" action="Login">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Email">
    </div>
    <div class="form-group">
      <label for="pwd">Mot de passe:</label>
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