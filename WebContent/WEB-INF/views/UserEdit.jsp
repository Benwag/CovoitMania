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
<h2>Update User</h2>
<form action="EditUser" method="post">

<div class="form-group">

<label for="firstname">Firstname</label> <input type="text" class="form-control" name="firstname"  value="${user.getFirstname()}"></div>
<p><label for="lastname">Lastname</label> <input type="text"  class="form-control" name="lastname" value="${user.getLastname()}"></p>
<p><label for="age">Age</label> <input type="number" class="form-control"  name="age" value="${user.getAge()}"></p>
<p><label for="email">Email adress</label> <input type="email" class="form-control"  name="email"  value="${user.getEmail()}"></p>
<p><label for="address">Address</label> <input type="text" class="form-control"  name="address"  value="${user.getAddress()}"></p>
<p><label for="postalCode">Postal Code</label> <input type="number" class="form-control"  name="postalCode"  value="${user.getPostCode()}"></p>
<p><label for="city">City</label> <input type="text" class="form-control"  name="city"  value="${user.getCity()}"></p>

<p><input type="submit" class="btn btn-default" value="Update User"/></p>

</form>


<p><a href="EditPassword?user=${user.getId()}"><input  class="btn btn-default" value="Change Password"/></a></p>


</body>
</html>