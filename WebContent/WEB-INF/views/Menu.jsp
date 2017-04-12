<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:useBean id="loggedUser" scope="session" class="com.cfranc.UserManger.model.Utilisateur"/>
<div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">

          <c:choose>
    		<c:when test="${not empty loggedUser.getId() && loggedUser.getId()!= 0}">
        		<c:set var="varClass1" value="show"/>
        		<c:set var="varClass2" value="hidden"/>
    		</c:when>
    		<c:otherwise>
        	<c:set var="varClass1" value="hidden"/>
        	<c:set var="varClass2" value="show"/>
    		</c:otherwise>
			</c:choose>
            <li role="presentation" class="active visible"><a href="index.jsp">Accueil</a></li>
            <li role="presentation"class="visible"><a href="<c:url value="/AllUsers"/>">Carte</a></li>
            <li class="${varClass2}" role="presentation"><a href="<c:url value="/AddUser"/>">Inscription</a></li>
			<li class="${varClass2}" role="presentation"><a href="<c:url value="/Login"/>">Connexion</a></li>
			<li class="${varClass1}" role="presentation"><a href="<c:url value="/AfficherRoutes"/>">Recherche</a></li>
			<li class="${varClass1}" role="presentation"><a href="<c:url value="/Messagerie"/>">Messagerie</a></li>
			<li class="${varClass1}" role="presentation"><a href="<c:url value="/EditUser?user=${loggedUser.getId()}"/>">Mon compte</a></li>
			<li class="${varClass1}" role="presentation" onclick="logout()"><a href="<c:url value="/Logout"/>">Déconnexion</a></li>

            

          </ul>
        </nav>
        <h3 class="text-muted">CovoitMania</h3>	
      </div>
</div>