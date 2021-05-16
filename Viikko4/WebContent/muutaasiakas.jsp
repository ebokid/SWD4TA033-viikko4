<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles/asiakkaat.css">
<link rel="stylesheet" type="text/css" href="styles/lisays.css">
<title>Muuta Asiakas</title>
</head>
	<body>
		<form id="tiedot" action="muutaasiakas" method="post">
			<table>
				<thead>	
					<tr>
						<th colspan="5" class="oikealle"><a href="listaaasiakkaat.jsp" id="takaisin" class="pointer"><< Takaisin listaukseen</a></th>
					</tr>		
					<tr>
						<th>Etunimi</th>
						<th>Sukunimi</th>
						<th>Puhelinnumero</th>
						<th>Sähköposti</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="etunimi" id="etunimi" value="${asiakas.etunimi}"></td>
						<td><input type="text" name="sukunimi" id="sukunimi" value="${asiakas.sukunimi}"></td>
						<td><input type="text" name="puhelin" id="puhelin" value="${asiakas.puhelin}"></td>
						<td><input type="email" name="sposti" id="sposti" value="${asiakas.sposti}"></td> 
						<td><input type="submit" id="tallenna" class="pointer" value="Hyväksy" onclick="tarkasta()"></td>
					</tr>
				</tbody>
			</table>
				<input type="hidden" name="asiakas_id" id="asiakas_id" value="${asiakas.asiakas_id}">	
		</form>
						<div class="ilmo"><span id="ilmo"></span></div>
	</body>
<script>

function tarkasta(){
	var d = new Date();
	if(document.getElementById("etunimi").value.length<2){
		document.getElementById("ilmo").innerHTML="Etunimessä tulee olla vähintään kaksi kirjainta";
		return;
	}else if(document.getElementById("sukunimi").value.length<2){
		document.getElementById("ilmo").innerHTML="Sukunimessä tulee olla vähintään kaksi kirjainta";
		return;
	}else if(document.getElementById("puhelin").value.length<6){
		document.getElementById("ilmo").innerHTML="Puhelinnumerossa tulee olla vähintään 6 merkkiä";
		return;
	}else if(document.getElementById("sposti").value.length<5){
		document.getElementById("ilmo").innerHTML="Sähköpostissa tulaa olla vähintään 5 merkkiä";
		return;
	}
	document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value);
	document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
	document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
	document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);
	document.forms["tiedot"].submit();
}

function siivoa(teksti){
	teksti=teksti.replace("<","");
	teksti=teksti.replace(";","");
	teksti=teksti.replace("'","''");
	return teksti;
}

</script>
</body>
</html>