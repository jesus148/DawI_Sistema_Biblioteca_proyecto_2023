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
<link rel="stRegistro Pruebaylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<br>
<div class="container text-center" style="margin-top: 4%"><h4>Registro Tesis</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
<form  id="id_form" method="post"> 
<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_titulo">Título</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_titulo" name="titulo" placeholder="Ingrese el título" maxlength="100">
				</div>
			</div>
</div>
<div class="row" >
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_tema">Tema</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_tema" name="tema" placeholder="Ingrese el tema" maxlength="100">
				</div>
			</div>
</div>
<div class="row" >
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_fcrea">Fecha de Creación</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="date" id="id_fcrea" name="fechaCreacion" placeholder="Ingrese la Fecha de Creacion" maxlength="100">
				</div>
			</div>
</div>
<div class="row">
         <div class="form-group col-sm-6">
	           <div class="col-sm-4">
					<label class="control-label" for="id_alumno">Alumno</label>
				</div>
				<div class="col-sm-8">
					<select id="id_alumno" name="alumno.idAlumno" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
				</div>
			    </div>

	
</div>
        <div class="row" style="margin-top: 2%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Registrar Tesis</button>
		</div>
			</form>
</div>

<script type="text/javascript">
<!-- Agregar aquí -->
$.getJSON("listaAlumno", {}, function(data){
	$.each(data, function(index,item){
		$("#id_alumno").append("<option value=" + item.idAlumno + ">" + item.nombres +" " + item.apellidos +"</option>");
	});
});

$("#id_registrar").click(function (){ 
	var validator = $('#id_form').data('bootstrapValidator');
   validator.validate();
    
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraTesis", 
            data: $('#id_form').serialize(),
            success: function(data){
            	//console.log(data);
            	mostrarMensaje(data.MENSAJE);
            	validator.resetForm();
            	limpiarFormulario();
            },
            error: function(){
            	mostrarMensaje(MSG_ERROR);
            }
    	});
	}   
});

function limpiarFormulario(){
	$('#id_titulo').val('');
	$('#id_tema').val('');
	$('#id_fcrea').val('');
	$('#id_alumno').val('');
	
}
$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	titulo: {
    		selector : '#id_titulo',
            validators: {
                notEmpty: {
                    message: 'El título es un campo obligatorio'
                },
                stringLength :{
                	message:'El título es de 2 a 100 caracteres',
                	min : 2,
                	max : 100
                },
            }
        },
        tema: {
    		selector : '#id_tema',
            validators: {
            	notEmpty: {
                    message: 'El tema es un campo obligatorio'
                },
                stringLength :{
                	message:'El tema es de 4 a 100 caracteres',
                	min : 4,
                	max : 100
                },
            }
        
        },
        fechaCreacion: {
            selector: '#id_fcrea',
            validators: {
                notEmpty: {
                     message: 'La fecha es obligatoria'
                },
            }
        },

        alumno: {
    		selector : '#id_alumno',
            validators: {
                notEmpty: {
                    message: 'El alumno es  obligatorio'
                },
              
            }
        },
        
    	
    }   
});




</script>   		
</body>
</html>