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
		<form id="tiedot">
			<table>
				<thead>	
					<tr>
						<th colspan="5" class="oikealle"><span id="takaisin" class="pointer"><< Takaisin listaukseen</span></th>
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
						<td><input type="text" name="etunimi" id="etunimi"></td>
						<td><input type="text" name="sukunimi" id="sukunimi"></td>
						<td><input type="text" name="puhelin" id="puhelin"></td>
						<td><input type="email" name="sposti" id="sposti"></td> 
						<td><input type="submit" id="tallenna" class="pointer" value="Hyväksy"></td>
					</tr>
				</tbody>
			</table>
				<input type="hidden" name="asiakas_id" id="asiakas_id">	
				<div class="ilmo"><span id="ilmo"></span></div>
		</form>
	</body>
<script>


$(document).ready(function(){
	$("#takaisin").click(function(){
		document.location="listaaasiakkaat.jsp";
	});
	var id = requestURLParam("id");	
	$.ajax({url:"asiakkaat/haeyksi/"+id, type:"GET", dataType:"json", success:function(result){	
		$("#asiakas_id").val(result.asiakas_id);	
		$("#etunimi").val(result.etunimi);	
		$("#sukunimi").val(result.sukunimi);
		$("#puhelin").val(result.puhelin);
		$("#sposti").val(result.sposti);			
    }});
	$("#tiedot").validate({						
		rules: {
			asiakas_id:  {
				required: true			
			},	
			etunimi:  {
				required: true,
				minlength: 2				
			},	
			sukunimi:  {
				required: true,
				minlength: 2				
			},
			puhelin:  {
				required: true,
				minlength: 6
			},	
			sposti:  {
				required: true,
				minlength: 5,
			}	
		},
		messages: {
			etunimi: {     
				required: "Puuttuu",
				minlength: "Liian lyhyt"			
			},
			sukunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			puhelin: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			sposti: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
			}
		},			
		submitHandler: function(form) {	
			paivitaTiedot();
		}		
	}); 	
});



function paivitaTiedot(){	
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray());
	$.ajax({url:"asiakkaat", data:formJsonStr, type:"PUT", dataType:"json", success:function(result) { //result on joko {"response:1"} tai {"response:0"}       
		if(result.response==0){
      	$("#ilmo").html("Asiakkaan päivittäminen epäonnistui.");
      }else if(result.response==1){			
      	$("#ilmo").html("Asiakkaan päivittäminen onnistui.");
      	$("#etunimi", "#sukunimi", "#puhelin", "#sposti").val("");
		}
  }});	
}

</script>
</body>
</html>