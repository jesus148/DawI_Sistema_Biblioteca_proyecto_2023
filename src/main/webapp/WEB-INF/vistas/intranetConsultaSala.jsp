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
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%"><h4>Consulta Sala</h4></div>

<form id="id_form" >
	<div class="container" style="margin-top: 4%">
		<h4>Consulta Sala</h4>
		
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_sala">Sala</label> 
				<input class="form-control" type="text" id="id_sala"	name="paramidSala">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_estado">Estado</label> 
				<input class="form-control" type="checkbox" id="id_estado" name="paramestado" checked="checked">
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_numero">Numero</label> 
				<input class="form-control" type="number" id="id_numero" name="paramnumero" maxlength="4">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_piso">Piso</label> 
				<input class="form-control" type="text" id="id_piso"	name="parampiso">
			</div>
		</div>
        <div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_numAlumnos">Num Alumnos</label> 
				<input class="form-control" type="number" id="id_numAlumnos" name="paramnumAlumnos" maxlength="4">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_recursos">Recursos</label> 
				<input class="form-control" type="text" id="id_recursos"	name="paramrecursos">
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_tipoSala">Tipo Sala</label> 
				<select id="id_tipoSala" name="paramidTipoSala" class='form-control'>
					<option value="-1">[ Todos ]</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_Sede">Sede</label> 
				<select id="id_Sede" name="paramidSede" class='form-control'>
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
							<th style="width: 5%">ID</th>
							<th style="width: 20%">Numero</th>
							<th style="width: 10%">Piso</th>
							<th style="width: 15%">Num Alumnos</th>
							<th style="width: 15%">Recursos</th>
							<th style="width: 15%">Estado</th>
							<th style="width: 10%">Tipo Sala</th>
							<th style="width: 10%">Sede</th>
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
 $.getJSON("listaTipoSala", {}, function (data) {
            $.each(data, function (index, item) {
                $("#id_tipoSala").append("<option value=" + item.idDataCatalogo + ">" + item.descripcion + "</option>");
            });
        });

        $.getJSON("listaSede", {}, function (data) {
            $.each(data, function (index, item) {
                $("#id_Sede").append("<option value=" + item.idDataCatalogo + ">" + item.descripcion + "</option>");
            });
        });

		$.getJSON("listaEstadoSala", {}, function(data){
		$.each(data, function(i,item){
		$("#id_estado").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
		
	});
});
$("#id_btn_reporte").click(function(){
	$("#id_form").attr('action','reporteSalaPdf');
	$("#id_form").submit();
});

$("#id_btn_filtra").click(function(){
	var varidSala = $("#id_sala").val();
	var varNumero = $("#id_numero").val();
	var varPiso = $("#id_piso").val();
	var varNumAlum = $("#id_numAlumnos").val();
	var varRecur = $("#id_recursos").val();
	var varEstado = $("#id_estado").is(':checked') ? 1 : 0; 
	var varIdTipoSala = $("#id_tipoSala").val();
	var varIdSede = $("#id_Sede").val();

	console.log(">> varEstado >> " + varEstado );
	
	console.log(">> varidSala >> " + varidSala );
	console.log(">> varNumero >> " + varNumero );
	console.log(">> varPiso >> " + varPiso );
	console.log(">> varNumAlum >> " + varNumAlum );
	console.log(">> varRecur >> " + varRecur );
	console.log(">> varEstado >> " + varEstado );
	console.log(">> varIdTipoSala >> " + varIdTipoSala );
	console.log(">> varIdSede >> " + varIdSede );
	
	$.getJSON("consultaSala", {"estado": varEstado,
								"idSala":varidSala,
									"numero": varNumero,
									"piso": varPiso,
									"numAlumnos": varNumAlum,
									"recursos":varRecur,
								   "varIdTipoSala": varIdTipoSala, 
								   "idSede": varIdSede, 
								   }, function(data){
		agregarGrilla(data);
	});
});
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
				{data: "idSala"},
				{data: "numero"},
				{data: "piso"},
				{data: "numAlumnos"},
				{data: "recursos"},
				{data: function(row, type, val, meta){
					var salida = (row.estado == 1) ? 'Activo' : "Inactivo" ;
					return salida;
				},className:'text-center'},	
				{data: "tipoSala.descripcion"},
				{data: "sede.descripcion"},
				
			]                                     
	    });
}

</script>   		
</body>
</html>