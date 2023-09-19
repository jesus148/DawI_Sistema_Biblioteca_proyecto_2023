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
<div class="container" style="margin-top: 4%"><h4>Registro Autor</h4></div>

<div class="container" style="margin-top: 1%">



<form id="id_form" > 




		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_nombres">Nombres</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_nombres" name="nombres" placeholder="Ingrese el nombres" maxlength="40">
				</div>
			</div>
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_apellidos">Apellidos</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_apellidos" name="apellidos" placeholder="Ingrese el apellidos"   maxlength="40">
		 		</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		<div class="row" style="margin-top: 0%">
			
<!-- 		recordar que para los campos foraneos como los combos , primero ingresa a la clase guia q lo contiene luego al atributo
   tanto para registrar como , para llenar el combo -->
		    <div class="form-group col-sm-6">
		  <div class="col-sm-4">
					<label class="control-label" for="id_fecha">Fecha de Nacimiento</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="date" id="id_fecha" name="fechaNacimiento" placeholder="Ingrese la fecha" maxlength="100">
		 		</div>
			    </div>
	        <div class="form-group col-sm-6">
		    <div class="col-sm-4">
					<label class="control-label" for="id_tipo">Teléfono</label>
					</div>	
					 <div class="col-sm-8">
				<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese el telefono" maxlength="9" >
						</div>	
			    </div>
			    
		      </div>
		      
		
		
		
		
		
		
		
		      
		      		<div class="row" style="margin-top: 0%">
<!-- 		combo pais  , recordar q se registra para la tabla autor -->
		 <div class="form-group col-sm-6">
		    <div class="col-sm-4">
					<label class="control-label" for="id_Pais">País</label>
					</div>	
					 <div class="col-sm-8">
<!-- 					 "pais.idPais: se pone de acuerdo a la clase guia  , cundo registres solo eso registraras con el value
                           guiarse de las clases guias aqui en spring 
                         pais : contiene la clase Pais  , .idPais es 1 atributo(id ) de esa clase Pais(clase guia)
                          -->
					<select id="id_Pais" name="pais.idPais" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>	
						</div>	
			    </div>
			    
			    
			    
<!-- 			    combo grado , recordar q se registra para la tabla autor-->
			     <div class="form-group col-sm-6">
		    <div class="col-sm-4">
					<label class="control-label" for="id_Grado">Grado</label>
					</div>	
					 <div class="col-sm-8">
<!-- 					     guiarse de las clases guias aqui en spring  -->
<!-- 					     grado : contiene la clase DataCatalogo  , .idDataCatalogo es 1 atributo(id ) de esa clase DataCatalogo(clase guia) -->
					<select id="id_grado" name="grado.idDataCatalogo" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>	
						</div>	
			    </div>
		
	
		
		
		      </div>
		      
		      
		      
		     
		     
		     
		     
		     
		     
		
		<div class="row" style="margin-top: 2%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Registrar Autor</button>
		</div>	
	</form>




	
</div>





<script type="text/javascript">
<!-- Agregar aquí -->

//RECORDAR Q PARA TODOS LOS CONTROLLER LO BUSCA EN EL PAQUETE CONTROLLER EN CADA CONTROLLER 
// ================================
//COMBO GRADO
//eso se carga automaticamente al inciar el jsp o al entrar aqui 
$.getJSON("listaGradoAutor", {}, function(data){
	$.each(data, function(index,item){
		$("#id_grado").append("<option value="+ item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});



//COMBO PAIS
//eso se carga automaticamente al inciar el jsp o al entrar aqui 
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_Pais").append("<option value=" + item.idPais + ">" + item.nombre +"</option>");
	});
});





//================================
//cuando das click en el boton
$("#id_registrar").click(function (){ 

	//Lanza la validacion
	var validator = $('#id_form').data('bootstrapValidator');
  validator.validate();
  
  
  
  
  
  //Pregunta si es valido el formulario(Si no tiene errores)
	if (validator.isValid()){
		$.ajax({
  		type: "POST",
          url: "registrarAutor", 
          data: $('#id_form').serialize(),
          success: function(data){
          	//obtiene la data del controller de regreso
          	mostrarMensaje(data.MENSAJE);
          	validator.resetForm();
          	//limpiarFormulario();
          },
          error: function(){
             mostrarMensaje(data.MSG_ERROR);
          }
  	});
	}   
  	
	
});






// ================================
//limpiar las cajas
function limpiarFormulario(){
	$('#id_nombres').val('');
	$('#id_apellidos').val('');
	$('#id_fecha').val('');
	$('#id_telefono').val('');
	$('#id_Pais').val('');
	$('#id_Grado').val('');
}







//================================
//VALIDACIONES

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	
        	//nombre: es el name del input = a la clase guia 
        		nombres:{
                    selector: "#id_nombres",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 2,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                        //esto es el controller pa buscar el nombre de autor
                        //delay:Retraso para mostrar y ocultar la información Si se proporciona un número, se aplica un retraso para ocultar ambos.
                        //Número de milisegundos que se deben esperar antes de mostrar un error en un campo de formulario.
                        //OJO : cuando escribas en el input escribe la palabra o el valor completo = ala bd ahi verifica si existe
                        remote:{
                    	    delay: 1000,
                    	 	url: 'buscaPorAutor', //el url en controller debe ser =
                    	 	message: 'El autor ya existe ya existe'
                     	}
                    }
                },
                
                
                apellidos:{
                    selector: "#id_apellidos",
                    validators:{
                        notEmpty: {
                             message: 'los apellidos son obligatorios'
                        },
                        stringLength: {
                            min: 2,
                            max: 40,
                            message: 'apellidos es de 3 a 40 caracteres'
                        }
                    }
                },
                
                
                
                
                fechaNacimiento:{
                    selector: "#id_fecha",
                    validators:{
                        notEmpty: {
                             message: 'La fecha es obligatorio'
                        }
                    }
                },
                
                
                
                telefono:{
                    selector: "#id_telefono",
                    validators:{
                        notEmpty: {
                             message: 'El telefono es obligatorio'
                        },
                        regexp: {
                            regexp: /^[0-9]{9}$/,
                            message: 'el telefono es 9 dígitos'
                        }
                    }
                },
                
                
                  
             
               
                pais: {
            		selector : '#id_Pais',
                    validators: {
                        notEmpty: {
                            message: 'el pais es  obligatorio'
                        },
                      
                    }
                },
                
            
                
                grado: {
            		selector : '#id_Grado',
                    validators: {
                        notEmpty: {
                            message: 'el grado es obligatorio'
                        },
                      
                    }
                }
                
                
                
                
                
                
        }   
    });

    
});

















</script>   		






</body>
</html>