<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*, com.cfranc.UserManger.model.*,javax.servlet.jsp.PageContext"
%>
<%@ page errorPage="WEB-INF/views/error.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
	<head>
<c:import url="/style/style.jsp"/>	
		<title>Ma Messagerie</title>
	</head>
	<body>
	
	<c:import url="/WEB-INF/views/Menu.jsp" />

	<div class="container jumbotron">
  <h2>Liste des Messages</h2>
  <p>Voici la liste des ${listeMessage.size()} messages dans votre boite au lettres</p>            

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