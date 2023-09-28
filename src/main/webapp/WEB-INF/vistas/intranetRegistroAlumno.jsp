<%@page import="com.centroinformacion.util.AppSettings"%>
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
<div class="container" style="margin-top: 4%"><h1>Registro Alumno</h1></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->

<form id="id_form">
	<div class="row">
		<div class="form-group col-md-6">
			<label class="control-label" for="id_nombre">Nombres</label>
			<input class="form-control" type="text" id="id_nombre" name="nombres" placeholder="Ingrese su nombre">
		</div>
	
		<div class="form-group col-md-6">
			<label class="control-label" for="id_apellido">Apellidos</label>
			<input class="form-control" type="text" id="id_apellido" name="apellidos" placeholder="Ingrese su apellido">
		</div>
		
		<div class="form-group col-md-3">
			<label class="control-label" for="id_telefono">Teléfono</label>
			<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese su número de teléfono">
		</div>
		
		<div class="form-group col-md-3">
			<label class="control-label" for="id_dni">Dni</label>
			<input class="form-control" type="text" id="id_dni" name="dni" placeholder="Ingrese su dni">
		</div>
		
		<div class="form-group col-md-6">
			<label class="control-label" for="id_correo">Correo</label>
			<input class="form-control" type="text" id="id_correo" name="correo" placeholder="Ingrese su correo">
		</div>
		
		<div class="form-group col-md-6">
			<label class="control-label" for="id_pais">Pais</label>
			<select class="form-control" id="id_pais" name="pais.idPais">
			<option value=" ">[Seleccione]</option>
			</select>
		</div>
		
		<div class="form-group col-md-3">
			<label class="control-label" for="id_fecnacimiento">Fecha de nacimiento</label>
			<input class="form-control" type="date" id="id_fecnacimiento" name="fechaNacimiento">
		</div>
		
		<div class="form-group col-md-3">
			<label class="control-label" for="id_modalidad">Modalidad</label>
			<select class="form-control" id="id_modalidad" name="modalidad.idDataCatalogo">
			<option value=" ">[Seleccione]</option>
			</select>
		</div>
		
		<div class="form-group col-md-12 mx-auto" align="center">
			<button id="id_registrar" type="button" class="btn btn-primary">Registra</button>
		</div>
	</div>	
</form>
</div>

<script type="text/javascript">
<!-- Agregar aquí -->

$.getJSON("listaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais+">"+item.nombre+"</option>");
	});
});

$.getJSON("listaModalidadAlumno", {}, function(data){
	$.each(data, function(index,item){
		$("#id_modalidad").append("<option value="+item.idDataCatalogo+">"+item.descripcion+"</option>");
	});
});


$("#id_registrar")

$("#id_registrar").click(function (){ 

	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();
	
	if (validator.isValid()){
		$.ajax({
	        type: "POST",
	        data: $('#id_form').serialize(),
	        url: 'registraAlumno', 
	        success: function(data){
	       		mostrarMensaje(data.MENSAJE);
	       		limpiar();
	       		validator.resetForm();
	        },
	        error: function(){
	       		mostrarMensaje(MSG_ERROR);
	        }
    	});
	}
});

function limpiar(){
	$('#id_nombre').val('');
	$('#id_apellido').val('');
	$('#id_telefono').val('');
	$('#id_dni').val('');
	$('#id_correo').val('');
	$('#id_fecnacimiento').val(' ');
	$('#id_pais').val(' ');
	$('#id_modalidad').val(' ');
}

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 2,
                            max: 40,
                            message: 'El nombre debe tener entre 2 y 40 caracteres'
                        },
                        remote: {
                            delay: 1000,
                            url: 'buscaPorAlumno',
                            message: 'El alumno ya existe'
                        }
                    }
                },
                apellido:{
                    selector: "#id_apellido",
                    validators:{
                        notEmpty: {
                             message: 'El apellido es obligatorio'
                        },
                        stringLength: {
                            min: 2,
                            max: 40,
                            message: 'El apellido debe tener entre 2 y 40 caracteres'
                        }
                    }
                },
                telefono:{
                    selector: "#id_telefono",
                    validators:{
                        notEmpty: {
                             message: 'El teléfono es obligatorio'
                        },
                        regexp: {
                        	regexp: /^[0-9]{1,9}$/,
                            message: 'El número de teléfono debe tener hasta 9 dígitos'
                        }
                    }
                },
                dni:{
                    selector: "#id_dni",
                    validators:{
                        notEmpty: {
                             message: 'El DNI es obligatorio'
                        },
                        regexp: {
                        	regexp: /^[0-9]{1,8}$/,
                            message: 'El número de DNI debe tener hasta 8 dígitos'
                        }
                    }
                },
                correo:{
                    selector: "#id_correo",
                    validators:{
                        notEmpty: {
                             message: 'El correo es obligatorio'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9._%+-]+@cibertec\.edu\.pe$/,
                            message: 'El correo debe tener el formato @cibertec.edu.pe'
                        }
                        
                    }
                },
                fecnacimiento:{
                    selector: "#id_fecnacimiento",
                    validators:{
                        notEmpty: {
                             message: 'La fecha de nacimiento es obligatorio'
                        },
                    }
                },
                pais:{
                    selector: "#id_pais",
                    validators:{
                        notEmpty: {
                             message: 'El país es obligatorio'
                        },
                    }
                },
                modalidad:{
                    selector: "#id_modalidad",
                    validators:{
                        notEmpty: {
                             message: 'La modalidad es obligatoria'
                        },
                    }
                }
        }   
    });
    
    $('#id_telefono').on('input', function() {
        if (this.value.length >= 9) {
            this.value = this.value.slice(0, 9);
        }
    });
    
    $('#id_dni').on('input', function() {
        if (this.value.length >= 8) {
            this.value = this.value.slice(0, 8);
        }
    });
    
});
</script>   		
</body>
</html>