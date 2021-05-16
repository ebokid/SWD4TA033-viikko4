<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="styles/asiakkaat.css">
	<title>Listaa Asiakkaat</title>
</head>
<body>
<form action="haeasiakkaat" method="get">
	<table id="listaus">
		<thead>	
			<tr>
				<th colspan="5"><a href="lisaaasiakas.jsp" id="uusiAsiakas">Lisää uusi asiakas</a></th>
			</tr>	
			<tr class="tbl-filter">
				<th>Hakusana:</th>
				<th colspan="2"><input type="text" name="hakusana" id="hakusana" value="${param['hakusana']}"></th>
				<th><input type="submit" value="hae" id="hakunappi" class="pointer"></th>
			</tr>			
			<tr class="tbl-header">
				<th>Id</th>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelinnumero</th>
				<th>Sähköposti</th>
				<th/>
				<th/>							
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${asiakkaat}" var="listItem">
				<tr>
			        <td>${listItem.asiakas_id}</td>
			        <td>${listItem.etunimi}</td>
			        <td>${listItem.sukunimi}</td>
			        <td>${listItem.puhelin}</td>
			        <td>${listItem.sposti}</td>
			        <td>
			        	<a href="muutaasiakas?id=${listItem.asiakas_id}" class="pointer">Muuta</a>			        	
			        </td>
			        <td>
			        	<a onclick="varmista('${listItem.asiakas_id}')" class="pointer">Poista</a>
			        </td>
		        </tr>
		    </c:forEach>		
	</tbody>
	</table>
</form>
<script>


function varmista(asiakas_id){
	if(confirm("Haluatko varmasti poistaa asiakkaan "+ asiakas_id + "?")){
		document.location="poistaasiakas?asiakas_id="+asiakas_id;
	}
}

</script>
</body>
</html>