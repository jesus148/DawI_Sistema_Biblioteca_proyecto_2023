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
<div class="container" style="margin-top: 4%"><h2>CRUD Tesis</h2></div>
<style>
    body {
background: rgb(119, 163, 122);
background: radial-gradient(circle, rgba(119, 163, 122,0.99) 30%, rgba(155,218,228,1) 125%);
			}
  </style>
<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
 <div class="col-md-23" >  

				   <div class="row" style="height: 70px">
						<div class="col-md-4" >
								<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el título" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
          
							<button type="button" data-toggle='modal'  data-target="#id_div_modal_registra"  class='btn btn-success' style="width: 150px">REGISTRA</button>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="id_table" class="table table-bordered table-hover table-condensed" >
										<thead style='background-color: #131920; color: silver;'>
											<tr>
										
												<th class="text-center" style="width: 5%">ID</th>
												<th class="text-center" style="width: 22%">Título</th>
												<th class="text-center" style="width: 18%">Tema</th>
												<th class="text-center" style="width: 15%">Fecha de Creación</th>
												<th class="text-center" style="width: 20%">Alumno</th>												                        
												<th class="text-center" style="width: 10%">Actualiza</th> 
												<th class="text-center" style="width: 10%">Elimina</th> 
											</tr>
										</thead>
											<tbody>
											</tbody>
										</table>
								</div>	
						</div>
					</div>
		  </div>
			  
<!--REGISTRAR-->
  
  	 <div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal" style="font-size: 26px;">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Tesis </h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal"   method="post"   >
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Tesis</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                     <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-text-fill" viewBox="0 0 16 16" color="#1A65AD">
  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1zm0 2h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1z"/>
</svg>
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Título</label>
		                                        <div class="col-lg-8">		                                        
													<input class="form-control" id="id_reg_titulo" name="titulo" placeholder="Ingrese el título" type="text" maxlength="100"/>

		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-text-fill" viewBox="0 0 16 16" color="#1A65AD">
  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1zm0 2h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1z"/>
</svg>
		                                        <label class="col-lg-3 control-label" for="id_reg_tema">Tema</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_tema" name="tema" placeholder="Ingrese el tema" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                   
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-calendar-date" viewBox="0 0 16 16" color="#1A65AD">
  <path d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z"/>
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
</svg>
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaCrea">Fecha de Creación</label>
		                                        
		                                     
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_reg_fechaCrea" name="fechaCreacion" placeholder="Ingrese la fecha" type="date" />
		                                        </div>
		                                    </div>		   
                                            
		                                    <div class="form-group">
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-person" viewBox="0 0 16 16" color="#1A65AD">
  <path d="M12 1a1 1 0 0 1 1 1v10.755S12 11 8 11s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z"/>
  <path d="M8 10a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg>
		                                        <label class="col-lg-3 control-label" for="id_reg_alumno">Alumno</label>
		                                        <div class="col-lg-4">
													 <select id="id_reg_alumno" name="alumno.idAlumno" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                 
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="button" class="btn btn-primary" id="id_btn_registra">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		  
<!--ACTUALIZA -->
		 <div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal" style="font-size: 26px;">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Tesis</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"   class="form-horizontal"    >
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Tesis</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-123" viewBox="0 0 16 16" color="#1A65AD">
  <path d="M2.873 11.297V4.142H1.699L0 5.379v1.137l1.64-1.18h.06v5.961h1.174Zm3.213-5.09v-.063c0-.618.44-1.169 1.196-1.169.676 0 1.174.44 1.174 1.106 0 .624-.42 1.101-.807 1.526L4.99 10.553v.744h4.78v-.99H6.643v-.069L8.41 8.252c.65-.724 1.237-1.332 1.237-2.27C9.646 4.849 8.723 4 7.308 4c-1.573 0-2.36 1.064-2.36 2.15v.057h1.138Zm6.559 1.883h.786c.823 0 1.374.481 1.379 1.179.01.707-.55 1.216-1.421 1.21-.77-.005-1.326-.419-1.379-.953h-1.095c.042 1.053.938 1.918 2.464 1.918 1.478 0 2.642-.839 2.62-2.144-.02-1.143-.922-1.651-1.551-1.714v-.063c.535-.09 1.347-.66 1.326-1.678-.026-1.053-.933-1.855-2.359-1.845-1.5.005-2.317.88-2.348 1.898h1.116c.032-.498.498-.944 1.206-.944.703 0 1.206.435 1.206 1.07.005.64-.504 1.106-1.2 1.106h-.75v.96Z"/>
</svg>
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-8">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idTesis" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                     <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-text-fill" viewBox="0 0 16 16" color="#1A65AD">
  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1zm0 2h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1z"/>
</svg>
		                                        <label class="col-lg-3 control-label" for="id__act_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_titulo" name="titulo" placeholder="Ingrese el titulo" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                     <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-text-fill" viewBox="0 0 16 16" color="#1A65AD">
  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1zm0 2h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1z"/>
</svg>
		                                        <label class="col-lg-3 control-label" for="id_act_tema">Tema</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_tema" name="tema" placeholder="Ingrese el tema" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                    
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-calendar-date" viewBox="0 0 16 16" color="#1A65AD">
  <path d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z"/>
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
</svg>
		                                        <label class="col-lg-3 control-label" for="id_act_fechaCrea">Fecha de Creación</label>
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_act_fechaCrea" name="fechaCreacion" placeholder="Ingrese la fecha" maxlength="100" type="date"  />
		                                        </div>
		                                    </div>		   

		                                    <div class="form-group">
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-person" viewBox="0 0 16 16" color="#1A65AD">
  <path d="M12 1a1 1 0 0 1 1 1v10.755S12 11 8 11s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z"/>
  <path d="M8 10a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg>
		                                        <label class="col-lg-3 control-label" for="id_act_alumno">Alumno</label>
		                    
		                                        <div class="col-lg-4">
													<select id="id_act_alumno" name="alumno.idAlumno" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                       
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="button" class="btn btn-primary" id="id_btn_actualiza">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
  
    
		  
	
</div>

<script type="text/javascript">
<!-- Agregar aquí -->
$.getJSON("listaAlumno", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_alumno").append("<option value="+ item.idAlumno +">"+ item.nombres + " " + item.apellidos +"</option>");
		$("#id_act_alumno").append("<option value="+ item.idAlumno +">"+ item.nombres + " " + item.apellidos +"</option>");
	});
});



$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val(); 
	$.getJSON("consultaCrudTesis",{"filtro":fil}, function (lista){
		agregarGrilla(lista);
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
			pageLength: 5,
			lengthChange: false,
			columns:[	
				{data: "idTesis"},
				{data: "titulo"},
				{data: "tema"},
				{data: "fechaCreacion"},
				{data: "alumno.nombres"},	
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="Editar(\''+row.idTesis + '\',\'' + row.titulo +'\',\'' + row.tema +'\',\'' + row.fechaCreacion + '\',\'' + row.alumno.idAlumno + '\')">Editar</button>';
					return salida;
				},className:'text-center'},					
				{data: function(row, type, val, meta){                                                                                                                                                   
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="Eliminar(\'' + row.idTesis + '\')">'+ (row.estado == 1? 'Activo':'Inactivo') +  '</button>';
					return salida;
				},className:'text-center'},													
			]                                     
	    });
}


function Eliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudTesis", 
          data: {"id":id}, 
          success: function(data){       	  
        	  agregarGrilla(data.lista);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}

$("#id_btn_registra").click(function(){	
	var validator = $('#id_form_registra').data('bootstrapValidator');
validator.validate();
	
if (validator.isValid()) {
    $.ajax({
      type: "POST",
      url: "registraCrudTesis",
      data: $('#id_form_registra').serialize(), 
      success: function(data){
    	  agregarGrilla(data.lista); 
    	  $('#id_div_modal_registra').modal("hide"); 
    	  mostrarMensaje(data.mensaje);
    	  limpiarFormulario(); 
    	  validator.resetForm();
      },
      error: function(){
    	  mostrarMensaje(MSG_ERROR);
      }
    });
    
}
});

function limpiarFormulario(){	
	$('#id_reg_titulo').val('');
	$('#id_reg_tema').val('');
	$('#id_reg_fechaCreacion').val('');
	$('#id_reg_alumno').val(' ');
}


function Editar(idTesis,titulo,tema,fechaCreacion,idAlumno){		
	$('#id_ID').val(idTesis); 
	$('#id_act_titulo').val(titulo);
	$('#id_act_tema').val(tema);
	$('#id_act_fechaCrea').val(fechaCreacion);
	$('#id_act_alumno').val(idAlumno);
	$('#id_div_modal_actualiza').modal("show"); 
}


$("#id_btn_actualiza").click(function(){
	var validator = $('#id_form_actualiza').data('bootstrapValidator');
validator.validate();


if (validator.isValid()) {
    $.ajax({
      type: "POST",
      url: "actualizaCrudTesis", 
      data: $('#id_form_actualiza').serialize(), 
      success: function(data){
    	  agregarGrilla(data.lista); 
    	  $('#id_div_modal_actualiza').modal("hide");
    	  mostrarMensaje(data.mensaje);
    	  validator.resetForm();
      },
      error: function(){
    	  mostrarMensaje(MSG_ERROR);
      }
    });
}
});
</script> 

<!-- VALIDACIONES DEL REGISTRA -->
<script type="text/javascript">



	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		"titulo":{
                    selector: "#id_reg_titulo",
                    validators:{
                        notEmpty: {
                             message: 'El titulo es obligatorio'
                        },
                        stringLength: {
                            min: 2,
                            max: 100,
                            message: 'El titulo es de 3 a 100 caracteres'
                        },
                   
                        remote:{
                    	    delay: 1000,                
                    	 	url: 'buscaTesisPorTitulo', 
                    	 	message: 'El titulo ya existe'
                     	}
                    }
                },
                "tema":{
                    selector: "#id_reg_tema",
                    validators:{
                        notEmpty: {
                             message: 'El tema es obligatorio'
                        },
                        stringLength: {
                            min: 2,
                            max: 100,
                            message: 'El tema es de 3 a 100 caracteres'
                        }
                    }
                },
                
                "fechaCreacion":{
                    selector: "#id_reg_fechaCrea",
                    validators:{
                        notEmpty: {
                             message: 'La fecha es obligatoria'
                        },
                       
                    }
                },
   
                "alumno.idAlumno": {
            		selector : '#id_reg_alumno',
                    validators: {
                        notEmpty: {
                            message: 'El Alumno es  obligatorio'
                        },
                      
                    }
                },

        }   
    });

</script>   	

<!-- VALIDACIONES DEL ACTUALIZA -->
<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok', 
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: { 
    		"titulo":{
                selector: "#id_act_titulo",
                validators:{
                    notEmpty: {
                         message: 'El titulo es obligatorio'
                    },
                    stringLength: {
                        min: 2,
                        max: 40,
                        message: 'El titulo es de 3 a 40 caracteres'
                    },
                    remote:{
                	    delay: 1000,                
                	 	url: 'buscaTesisPorTituloActualiza', 
                	 	message: 'El titulo ya existe',
                	 	data: {
        		             titulo: function() {
        		                  return $('#id_act_titulo').val();
        		              },
        		              idTesis: function() {
        		                    return $('#id_ID').val();
        		               }
                	 	}
                 	}
                }
            },

            "tema":{
                selector: "#id_act_tema",
                validators:{
                    notEmpty: {
                         message: 'El tema son obligatorios'
                    },
                    stringLength: {
                        min: 2,
                        max: 40,
                        message: 'El tema es de 3 a 40 caracteres'
                    }
                }
            },
            
            "fechaCreacion":{
                selector: "#id_act_fechaCrea",
                validators:{
                    notEmpty: {
                         message: 'La fecha es obligatorio'
                    }
                }
            },

            "alumno": {
        		selector : '#id_act_alumno',
                validators: {
                    notEmpty: {
                        message: 'El Alumno es obligatorio'
                    },
                  
                }
            },
  
        }   
    });
</script>	
</body>
</html>