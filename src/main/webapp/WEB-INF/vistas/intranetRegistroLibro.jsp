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
<div class="container" style="margin-top: 4%"><h4>Registro Libro</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aqu� -->
	<form  id="id_form" method="post"> 
	 <div class="col-md-12" style="margin-top: 2%">
			<div class="row">
				<div class="form-group col-md-9">
					<label class="control-label" for="id_titulo">T�tulo</label>
					<input class="form-control" type="text" id="id_titulo" name="titulo" placeholder="Ingrese el t�tulo">
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_anio">A�o</label>
					<input class="form-control" type="text" id="id_anio" name="anio" placeholder="Ingrese el a�o">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-9">
					<label class="control-label" for="id_serie">Serie</label>
					<input class="form-control" type="text" id="id_serie" name="serie" placeholder="Ingrese el serie">
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_categoriaLibro">Categor�a</label>
					<select id="id_categoriaLibro" name="categoriaLibro.idDataCatalogo" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
			    </div>
			</div>
			<div class="row">
			    <div class="form-group col-md-3">
					<label class="control-label" for="id_tipoLibro">Tipo</label>
					<select id="id_tipoLibro" name="tipoLibro.idDataCatalogo" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
			    </div>
			</div>
		    <div class="row">
				<div class="form-group col-md-12" align="center">
					<button id="id_registrar" type="button" class="btn btn-primary" >Registra</button>
				</div>
			</div>
	</div>
	</form>
</div>

<script type="text/javascript">
<!-- Agregar aqu� -->
$.getJSON("listaCategoriaDeLibro", {}, function(data){
	$.each(data, function(index,item){
		$("#id_categoriaLibro").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});
$.getJSON("listaTipoLibroRevista", {}, function(data){
	$.each(data, function(index,item){
		$("#id_tipoLibro").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});


$("#id_registrar").click(function (){ 
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraLibro", 
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
	$("#id_titulo").val('');
	$("#id_anio").val('');
	$("#id_serie").val('');
	$("#id_categoriaLibro").val(' ');
	$("#id_tipoLibro").val(' ');
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
                    message: 'El t�tulo es un campo obligatorio'
                },
                stringLength :{
                	message:'El t�tulo es de 2 a 40 caracteres',
                	min : 2,
                	max : 40
                },
                
                remote:{
                	delay: 1000,
                	url:'buscaLibroPorTitulo',
                	message : 'El titulo ya existe'
                }
            }
        },
        anio: {
    		selector : '#id_anio',
            validators: {
                notEmpty: {
                    message: 'El a�o es obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{4}$/,
                    message: 'El a�o debe tener 4 d�gitos num�ricos'
                }
            }
        },
        serie: {
    		selector : '#id_serie',
            validators: {
                notEmpty: {
                    message: 'El serie es un campo obligatorio'
                },
                regexp: {
                    regexp: /^[a-zA-Z]{2}[0-9]{3}$/,
                    message: 'El a�o debe tener 2 letras seguidas de 3 n�meros'
                }
            }
        },
        categoriaLibro: {
    		selector : '#id_categoriaLibro',
            validators: {
            	notEmpty: {
                    message: 'Categoria es un campo obligatorio'
                }
            }
        },
        tipoLibro: {
    		selector : '#id_tipoLibro',
            validators: {
            	notEmpty: {
                    message: 'Tipo es un campo obligatorio'
                }
            }
        }
    }   
});
</script>   		
</body>
</html>