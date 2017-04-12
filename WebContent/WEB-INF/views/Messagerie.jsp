<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*, com.cfranc.UserManger.model.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<!-- <link rel="stylesheet" href="WEB-INF/styles/style.css"> -->
		<title>Liste des messages</title>
	</head>
	<body onload="initialiser()">
	
	<c:import url="/WEB-INF/views/Menu.jsp" />
	<div class="container">
  <h2>Liste des Messages</h2>
  <p>Voici la liste des ${listeMessage.size()} messages dans votre boite au lettres</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Expediteur</th>
        <<th>Destinataire</th> 
        <th>Content</th>
        <!-- <th>Edit</th>
        <th>Delete</th> -->
      </tr>
    </thead>
    <tbody>
    <br>Messages reçus<br>
    <c:forEach var="message" items="${listeMessage}" varStatus="stat">
   <c:if test="${message.value.getExpediteurID() == 1}">
      <tr>
        <td>${message.value.getExpediteurID()} </td>
        <td>${message.value.getDestinataireID()} </td>
        <td>${message.value.getMessageContent()} </td>
        <%-- <td>${user.value.getEmail()}</td> 
        <td><a href="DetailUser?user=${user.key}">Details</a></td>
         <td><a href="EditUser?user=${user.key}">Edit</a></td>
        <td><a href="DeleteUser?user=${user.key}">Delete</a></td> --%>        
      </tr>
      </c:if>
    </c:forEach><br>Messages envoyés<br>
    <c:forEach var="message" items="${listeMessage}" varStatus="stat">
   <c:if test="${message.value.getDestinataireID() == 1}">
      <tr>
        <td>${message.value.getExpediteurID()} </td>
        <td>${message.value.getDestinataireID()} </td>
        <td>${message.value.getMessageContent()} </td>
        <%-- <td>${user.value.getEmail()}</td> 
        <td><a href="DetailUser?user=${user.key}">Details</a></td>
         <td><a href="EditUser?user=${user.key}">Edit</a></td>
        <td><a href="DeleteUser?user=${user.key}">Delete</a></td> --%>        
      </tr>
      </c:if>
    </c:forEach>
     
    </tbody>
  </table>
</div>
		<c:if test="${error != null}">${error}</c:if>
		<c:if test="${sucess != null}">${sucess}</c:if>
 		
		
		
		
	</body>
	
</html>