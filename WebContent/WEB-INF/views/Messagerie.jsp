<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*, com.cfranc.UserManger.model.*,javax.servlet.jsp.PageContext"
%>
<%@ page errorPage="WEB-INF/views/error.jsp" %> 
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
	<body>
	
	<c:import url="/WEB-INF/views/Menu.jsp" />
	<div class="container">
  <h2>Liste des Messages</h2>    
       
  <table class="table">
    <thead>
      <tr>
      	<th>repondre</th>
        <th>Expediteur</th>
        <<th>Destinataire</th> 
        <th>Content</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="message" items="${listeMessage}" varStatus="stat">
   <c:if test="${message.value.getExpediteurID() == loggedUser.getId()}">
      <tr>
      	<td><a href="DetailUser?user=${message.value.getDestinataireID()}">Relancer</a></td>
        <td>${message.value.getExpediteurFirstname()} </td>
        <td>${message.value.getDestinataireFirstname()} </td>
        <td>${message.value.getMessageContent()} </td>    
      </tr>
      </c:if>
    </c:forEach>
    <c:forEach var="message" items="${listeMessage}" varStatus="stat"> 
   <c:if test="${message.value.getDestinataireID() == loggedUser.getId()}">
      <tr>
      <td><a href="DetailUser?user=${message.value.getExpediteurID()}">Repondre</a></td>
		<td>${message.value.getExpediteurFirstname()} </td>
        <td>${message.value.getDestinataireFirstname()} </td>
        <td>${message.value.getMessageContent()} </td>     
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