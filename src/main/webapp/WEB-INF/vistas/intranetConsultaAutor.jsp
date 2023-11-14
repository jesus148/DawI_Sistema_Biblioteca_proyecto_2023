<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />


<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&family=Roboto+Condensed:ital,wght@0,400;1,600&display=swap" rel="stylesheet">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>

<style>
 h1{
font-family: 'Oswald', sans-serif;
 font-size: 50px;
 text-align: center;
 }

</style>

</head>
<body>
<jsp:include page="intranetCabecera.jsp" />





<!-- CONSULTA COMPLEJA PARA AUTOR  -->


<form id="id_form" style="margin-top: 4%"> 

	<div class="container">
	<div class="container"><h1>Consulta Autor</h1> </div>
		
		<div class="row" style="margin-top: 3%">
			<div class="col-md-6">
				<label class="control-label" for="id_nombres">Nombres y	Apellidos</label> 
<!-- 				  name="paranomApe" : recordar q no nesecario poner igual a la clase guia pq solo consultaremos y no registramos  -->
				<input class="form-control" type="text" id="id_nombres"	name="paranomApe">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_estado">Estado</label> 
				<input class="form-control" type="checkbox" id="id_estado" name="paramEstado" checked="checked">
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_desde">Fecha Nacimiento (Desde) </label> 
				<input class="form-control" type="date" id="id_desde" name="paramDesde" value="1990-01-01">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_hasta">(Hasta) </label>              <!-- valor por defecto que saldra en el jsp al inciar -->
				<input class="form-control" type="date" id="id_hasta" name="paramHasta" value="2900-01-01">
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_pais">País</label> 
				<select id="id_pais" name="paramPais" class='form-control'>
					<option value="-1">[ Todos ]</option>
				</select>
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_grado">Grado</label> 
				<select id="id_grado" name="paramGrado" class='form-control'>
					<option value="-1">[ Todos ]</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-12" align="center">
				<button type="button" class="btn btn-primary" id="id_btn_filtra">FILTRA</button>
				<button type="button" class="btn btn-primary" id="id_btn_reporte">PDF</button>
			</div>
		</div>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-12">
				<table id="id_table" class="table table-striped table-bordered">
					<thead>
						<tr>
						
						<!-- DESENVOLSANDO DATA LO QUE QEUREMOS -->
							<th style="width: 5%">ID</th>
							<th style="width: 22%">Nombre</th>
							<th style="width: 23%">Apellidos</th>
							<th style="width: 15%">Fecha Nacimiento</th>
							<th style="width: 15%">País</th>
							<th style="width: 15%">Grado</th>
							<th style="width: 15%">Estado</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</form>
	
	
	
	
	
	
	





<script type="text/javascript">
<!-- Agregar aquí -->





//CARGA COMBO CUANDO INCIA TANTO EN MODAL RGISRA Y EN EL ACTUALIZA, RECORDAR que cuando llama a un controller busca en todos controller del paquete 


// PARA CARGAR EL COMBO AL INCIAR
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){   //atributos de la clase guia
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});


$.getJSON("listaGradoAutor", {}, function(data){
	$.each(data, function(i,item){   //atributos de la clase guia
		$("#id_grado").append("<option value="+ item.idDataCatalogo  +">"+ item.descripcion +"</option>");
	});
});









//para el boton del pdf con le form limpia todo pq es un form
//el id el boton  
//recordar para el form enviamos todos los inpusts mendiante sus name
$("#id_btn_reporte").click(function(){
	                             //url del controller
	$("#id_form").attr('action','reporteAutorPdf');
	$("#id_form").submit();
	
});













//BOTON PARA FILTRAR O LISTAR
//el id del boton 
$("#id_btn_filtra").click(function(){
	
	//OBTENIENDO LA DATA
	var varEstado = $("#id_estado").is(':checked') ? 1 : 0;  //con ternario si esta marcado vale 1 y si no vale 0
	var varPais = $("#id_pais").val();  //obtiene le idpais
	var varGrado = $("#id_grado").val();  //obtiene le id_grado
	var varNomApe = $("#id_nombres").val(); //obtiene el nombre
	//obtiene la fecha si tiene data y sino obtienel  valor por defecto
	var varFecDesde = $("#id_desde").val() == '' ?'1900-01-01' : $("#id_desde").val();
	var varFecHasta = $("#id_hasta").val() == '' ?'9999-01-01' : $("#id_hasta").val();
	
	
	
	//impresion por consola
	console.log(">> varEstado >> " + varEstado );
	console.log(">> varGrado >> " + varGrado );
	console.log(">> varPais >> " + varPais );
	console.log(">> varNomApe >> " + varNomApe );
	console.log(">> varFecDesde >> " + varFecDesde );
	console.log(">> varFecHasta >> " + varFecHasta );
	
	
	//METODO GLOBAL.JS esta src/main/resorcues > js>global.js
	//METODO VERFICA Q LA FECHA DE INCIO SEA MENOR QUE LA FECHA FIN
	if (valFechaInicioMayFechaFin("#id_desde", "#id_hasta")){
		mostrarMensaje("la fecha desde debe ser menor que la fecha hasta");
		return; //destruye el proceso
	}
	
	//      URL DEL CONTROLLER      parametros = en el controller    / variables con los valores
	$.getJSON("consultaEmpleado", {"estado": varEstado, 
								   "idPais": varPais, 
								   "idGrado" :varGrado,
								   "nomApe": varNomApe, 
								   "desde": varFecDesde, 
								   "hasta": varFecHasta }, function(data){
									   //recibe la data 
		agregarGrilla(data);
	});
});












//METODO AGREGA LA GRILLA
function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: false,
			columns:[
				//DESENVOLSANDO CON ATRIBUTOS DE LA CLASE GUIA
				{data: "idAutor"},
				{data: "nombres"},
				{data: "apellidos"},
				{data: "fechaNacimiento"},
				{data: "pais.nombre"},
				{data: "grado.descripcion"},
				{data: function(row, type, val, meta){
					var salida = (row.estado == 1) ? 'Activo' : "Inactivo" ;
					return salida;
				},className:'text-center'},	
			]                                     
	    });
}









</script>   		







</body>
</html>