<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page errorPage="WEB-INF/views/error.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="/style/style.jsp" />
<title>Preferences</title>
</head>
<body>
	<c:import url="/WEB-INF/views/Menu.jsp" />
	<h2 class="container">Préférences</h2>
	<div class="container">
		<form action="EditPreference" method="post">
			<div class="form-group">
				<div class="jumbotron">
					<p>Je suis...</p>
					<input type="radio" id="conducteur"
						name="conducteur" value="oui"> <label for="conducteur">Conducteur</label><br>
					<input type="radio" id="passager"
						name="conducteur" value="non"> <label for="passager">Passager</label>
				</div>

				<div class="jumbotron">
					<p>J'écoute de la musique?</p>
					<input type="radio" id="oui" name="music"
						value="oui"> <label for="oui">Oui</label><br> <input
						type="radio" id="non" name="music"
						value="non"> <label for="non">Non</label>
				</div>


				<div class="jumbotron">
					<p>Je fume?</p>
					<input type="radio" id="fumeur" name="fumeur"
						value="oui"> <label for="fumeur">Oui</label><br> <input
						type="radio" id="nonfumeur" name="fumeur"
						value="non"> <label for="nonfumeur">Non</label>

				</div>


				<div class="jumbotron">
					<p>Bavard en covoiturage?</p>
					<input type="radio" id="bavard" name="blabla"
						value="oui"> <label for="bavard">Oui</label><br> <input
						type="radio" id="muet" name="blabla"
						value="non"> <label for="muet">Non</label>
				</div>

				<div class="jumbotron">
					<p>
						<label for="detour">j'accepte un détour de </label><input
							type="number" id="detour" class="form-control" name="detour">km
					</p>
				</div>

				<p class="jumbotron">
					<input type="submit" class="btn btn-success"
						value="Update Preferences" />
				</p>
			</div>
		</form>
	</div>


</body>
</html>