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
<div class="container" style="margin-top: 4%"><h4>Registro Sala</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aqu� -->
    <form id="id_form" method="post">
        <div class="col-md-10" style="margin-top: 2%;">
            <div class="row">
                <div class="form-group col-md-3"> 
                    <label class="control-label" for="id_numero">Numero</label>
                    <input class="form-control" type="text" id="id_numero" name="Numero" placeholder="Ingrese numero">
                </div>
                <div class="form-group col-md-3"> 
                    <label class="control-label" for="id_piso">Piso</label>
                    <input class="form-control" type="text" id="id_piso" name="Piso" placeholder="Ingrese piso">
                </div>
              </div>
        
                <div class="row">
                    <div class="form-group col-md-3"> 
                        <label class="control-label" for="id_numAlumnos">N. Alumnos</label>
                        <input class="form-control" type="text" id="id_numAlumnos" name="Alumnos" placeholder="Ingrese numero de Alumnos">
                    </div>
                    <div class="form-group col-md-6"> 
                        <label class="control-label" for="id_recursos">Recursos</label>
                        <input class="form-control" type="text" id="id_recursos" name="Recursos" placeholder="Ingrese recursos">
                    </div>
                </div>

                <div class="row">
			    <div class="form-group col-md-3">
					<label class="control-label" for="id_tipoSala">Tipo</label>
					<select id="id_tipoSala" name="tipoSala.idDataCatalogo" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
			    </div>

                <div class="row">
                    <div class="form-group col-md-3">
                        <label class="control-label" for="id_sede">Sede</label>
                        <select id="id_sede" name="sede.idDataCatalogo" class='form-control'>
                            <option value=" ">[Seleccione]</option>    
                        </select>
                    </div>
			    </div>

                
             </div>
        
             <div  class="row">
                <div class="form-group col-md-3">
                   <button id="id_registrar" type="button" class="btn btn-primary">Registrar</button>
                </div>
             </div>
        
        </div>
    </form>
	
</div>

<script type="text/javascript">
<!-- Agregar aqu� -->
$.getJSON("listaTipoSala", {}, function(data){
	$.each(data, function(index,item){
		$("#id_tipoSala").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});
$.getJSON("listaSede", {}, function(data){
	$.each(data, function(index,item){
		$("#id_sede").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});

$("#id_registrar").click(function (){ 
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraSala", 
            data: $('#id_form').serialize(),
            success: function(data){
            	console.log(data);
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
	$("#id_numero").val('');
	$("#id_piso").val('');
	$("#id_numAlumnos").val('');
	$("#id_recursos").val(' ');
	$("#id_tipoSala").val(' ');
    $("#id_tipoSede").val(' ');
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
    		selector : '#id_numero',
            validators: {
                notEmpty: {
                    message: 'El campo NUMERO es obligatorio'
                },
                stringLength :{
                	message:'El campo NUMERO es de 3 caracteres',
                	min : 3,
                	max : 4
                },
                regexp: {
                regexp: /^[A-Z]\d{3}$/, 
                message: 'El campo debe tener el formato de una letra seguida de tres digitos, por ejemplo, A003'
            }

            }
        },
        piso: {
    		selector : '#id_piso',
            validators: {
            	notEmpty: {
                    message: 'El campo PISO es obligatorio'
                },
                stringLength :{
                	message:'El tema es de 2 digitos',
                	min : 2,
                	max : 2
                },
                regexp: {
                regexp: /^[0-9]+$/, 
                message: 'El tema debe contener solo digitos numericos'
                }
            }

        
        },
        numAlumnos: {
            selector: '#id_numAlumnos',
            validators: {
                notEmpty: {
                    message: 'El campo PISO es obligatorio'
                },
                stringLength :{
                	message:'El tema es de 2 digitos',
                	min : 2,
                	max : 2
                },
                regexp: {
                regexp: /^[0-9]+$/, 
                message: 'El Numero de Alumno debe contener solo digitos numericos'
                }
            }
        },

        recursos: {
    		selector : '#id_recursos',
            validators: {
                notEmpty: {
                    message: 'El campo RECURSOS es obligatorio'
                },
                stringLength :{
                	message:'El campo RECURSOS es de 2 a 40 caracteres',
                	min : 2,
                	max : 40
                }
            }
        },
        
    	
    }   
});





</script>   		
</body>
</html>