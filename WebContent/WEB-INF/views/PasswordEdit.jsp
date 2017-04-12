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
<h2>Update password</h2>
<form action="EditPassword" onsubmit="return myFunction()" method="post">

<div class="form-group">

<label for="PreviousPassword">Previous Password</label> <input type="password" class="form-control" name="previousPassword"  value=""></div>
<p><label for="NewPassword">New Password</label> <input id = "pass1" type="password"  class="form-control" name="newPassword" value=""></p>
<p><label for="ConfirmPassword">Confirm new password</label> <input id="pass2" type="password" class="form-control"  name="confirmPassword" value=""></p>

<p><input type="submit" class="btn btn-default" value="Change Password"/></p>

</form>

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