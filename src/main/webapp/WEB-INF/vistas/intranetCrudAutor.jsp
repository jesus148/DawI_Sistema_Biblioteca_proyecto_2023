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
<div class="container" style="margin-top: 4%"><h4>CRUD Autor</h4></div>

<div class="container" style="margin-top: 1%">




 <div class="col-md-23" >  

				   <div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
                 <!-- 		ABRE EL MODAL DEL REGISTRAR -->
<!--                  data-target="#id_div_modal_registra"  : el id para mostrar el modal registra -->
							<button type="button" data-toggle='modal'  data-target="#id_div_modal_registra"  class='btn btn-success' style="width: 150px">REGISTRA</button>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
										<!-- 	MOSTRANDO LOS DATOS QUE QUEREMOS -->
												<th style="width: 5%">ID</th>
												<th style="width: 22%">Nombre</th>
												<th style="width: 23%">Apellidos</th>
												<th style="width: 15%">FechaNacimiento</th>
												<th style="width: 15%">Pais</th>
												<th style="width: 15%">Telefono</th>
                                <!-- 	BOTONES CON EVENTOS  -->
												<th style="width: 10%">Actualiza</th> <!--MODAL ACTUALIZA -->
												<th style="width: 10%">Elimina</th> <!-- CAMBIA EL ESTADO -->
											</tr>
										</thead>
											<tbody>
											</tbody>
										</table>
								</div>	
						</div>
					</div>
		  </div>
		  
		  
		  
		  
		  
  
		  
		  
<!-- 		  MODAL PARA REGISTRAR  -->
  
  	 <div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal" style="font-size: 26px;">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Autor </h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
<!-- 			id="id_form_registra"  : sirve para validar -->
						<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal"   method="post"   >
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Autor</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
<!-- 		                                     recordar que lo name debes ser igual al la tabla  , atributos -->
		                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombres" name="nombres" placeholder="Ingrese el Nombre" type="text" maxlength="30"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellidos"> Apellidos</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_apellidos" name="apellidos" placeholder="Ingrese el apellidos" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaNacimiento">Fecha de Nacimiento</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la fecha" type="date" />
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono">Teléfono</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese el telefono" type="text"  maxlength="9"/>
		                                        </div>
		                                    </div>   
		                       
		                      
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">País</label>
		                                        <div class="col-lg-3">
													 <select id="id_reg_pais" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                  <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_grado">Grado</label>
		                                        <div class="col-lg-3">
													 <select id="id_reg_grado" name="grado.idDataCatalogo" class='form-control'>
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
  
  
  
  
  
  
  
  
  
  
  
  
<!--   MODAL PARA ACTUALIZA  -->
		 <div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal" style="font-size: 26px;">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Autor</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"   class="form-horizontal"    >
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Autor</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
<!-- 		                                    el ID NO SE ACTUALIZA  -->
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-8">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idAutor" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombres">Nombre</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_nombre" name="nombres" placeholder="Ingrese el Nombre" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_num_apellidos">Apellidos</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_num_apellidos" name="apellidos" placeholder="Ingrese  apellidos" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_num_fechaNacimiento">Fecha de Nacimiento</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_num_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la fecha" maxlength="100" type="date"  />
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">Teléfono</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingrese el telefono" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>   
		                   
		                  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">País</label>
		                                        <!-- 					 "pais.idPais: se pone de acuerdo a la clase guia  , cundo registres solo eso registraras con el value
                           guiarse de las clases guias aqui en spring 
                         pais : contiene la clase Pais  , .idPais es 1 atributo(id ) de esa clase Pais(clase guia)
                          -->
		                                        <div class="col-lg-3">
													<select id="id_act_pais" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                         <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_grado">Grado</label>
		                                        <div class="col-lg-3">
		                                        <!-- 					     guiarse de las clases guias aqui en spring  -->
<!-- 					     grado : contiene la clase DataCatalogo  , .idDataCatalogo es 1 atributo(id ) de esa clase DataCatalogo(clase guia) -->
													<select id="id_act_grado" name="grado.idDataCatalogo" class='form-control'>
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


//CARGA COMBO CUANDO INCIA TANTO EN MODAL RGISRA Y EN EL ACTUALIZA, RECORDAR que cuando llama a un controller busca en todos controller del paquete 
//controller , listaPais se encuentra en el registramodalidadcontrolller
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		//id de los combos modales               atributos igual a la clase guia
		$("#id_reg_pais").append("<option value="+ item.idPais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+ item.idPais +">"+ item.nombre +"</option>");
	});
});

$.getJSON("listaGradoAutor", {}, function(data){
	$.each(data, function(i,item){
		//id de los combos modales               atributos igual a la clase guia
		$("#id_reg_grado").append("<option value="+ item.idDataCatalogo +">"+ item.descripcion +"</option>");
		$("#id_act_grado").append("<option value="+ item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});









//ESTO SIRVA PARA LISTAR TODO(caso sea vacio) y cuando escribamos listara segun eso
//id del boton filtro
$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val(); //id del input 
	//Id del controller              "filtro":fil : donde el   "filtro" parametro igual en el controller
	$.getJSON("consultaCrudAutor",{"filtro":fil}, function (lista){
		agregarGrilla(lista);
	});
});









//METODO AGREGA EN LA TABLA
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
				//MOSTRANDO LOS DATOS QUE QUEREMOS
				//atributos igual a la clase guia
				{data: "idAutor"},
				{data: "nombres"},
				{data: "apellidos"},
				{data: "fechaNacimiento"},
				{data: "pais.nombre"},
				//deporte.nombre : deporte es el nombre de la clase guia foranea , nombre lo q quiero de esa clase
				{data: "telefono"},
				//MODAL EDITAR O ACTUALIZAR , RECIBE PARAMETROS , el id .etc
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idAutor + '\',\'' + row.nombres +'\',\'' + row.apellidos  +'\',\'' + row.fechaNacimiento + '\',\'' + row.telefono + '\',\'' +  row.grado.idDataCatalogo + '\',\'' + row.pais.idPais + '\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				//SOLO CAMBIA EL ESTADO
				{data: function(row, type, val, meta){                                                                         //evento se envia el id              //dl row segun el estado para q se vea mejor                                                                           //esto solo es para mostrar activo o inativo
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idAutor + '\')">'+ (row.estado == 1? 'Activo':'Inactivo') +  '</button>';
					return salida;
				},className:'text-center'},													
			]                                     
	    });
}




//METODO ELIMINAR SOLO CAMBIA EL ESTADO

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudAutor",  //URL DEL CONTROLADOR
          data: {"id":id}, //"id" igual en el parametro del controlador metodo
          success: function(data){
        	  //lista debe ser igual al "lista" del controller
        	  agregarGrilla(data.lista);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}






//METODO REGISTRA 
//el id del boton modal registra
$("#id_btn_registra").click(function(){
	//VALIDATOR
	var validator = $('#id_form_registra').data('bootstrapValidator');
  validator.validate();
	
  if (validator.isValid()) {
      $.ajax({
        type: "POST",
        url: "registraCrudAutor", //url del controller
        data: $('#id_form_registra').serialize(), //id del formulario envia todo
        success: function(data){
      	  agregarGrilla(data.lista); //lista de la variable map = al controller
      	  $('#id_div_modal_registra').modal("hide"); //esconde el modal
      	  mostrarMensaje(data.mensaje);//mustra mensaje , mensaje es la variable map = al controller 
      	  limpiarFormulario(); //limpia el formulario
      	  validator.resetForm();
        },
        error: function(){
      	  mostrarMensaje(MSG_ERROR);
        }
      });
      
  }
});










//METODO PARA LIMPIAR INPUTS DEL MO0DAL REGISTRA
function limpiarFormulario(){	
	$('#id_reg_nombres').val('');
	$('#id_reg_apellidos').val('');
	$('#id_reg_fechaNacimiento').val('');
	$('#id_reg_telefono').val('');
	$('#id_reg_pais').val('');
	$('#id_reg_grado').val(' ');
}






//FUNCION PARA MOSTRAR EL MODAL ACTUALIZA
//recibe parametro y los pone en los inputs
function editar(idAutor,nombres,apellidos,fechaNacimiento,telefono, idDataCatalogo, idPais){	
	//poniendo en los inputs
	$('#id_ID').val(idAutor); 
	$('#id_act_nombre').val(nombres);
	$('#id_act_num_apellidos').val(apellidos);
	$('#id_act_num_fechaNacimiento').val(fechaNacimiento);
	$('#id_act_telefono').val(telefono);
	$('#id_act_pais').val(idPais);
	$('#id_act_grado').val(idDataCatalogo);
	$('#id_div_modal_actualiza').modal("show"); //MUESTRA EL MODAL
}









//METODO Q ACTUALIZARA
//este es el id del boton 
$("#id_btn_actualiza").click(function(){
	//el id del form actualiza , pa validar 
	var validator = $('#id_form_actualiza').data('bootstrapValidator');
  validator.validate();
  
  
  if (validator.isValid()) {
      $.ajax({
        type: "POST",
        url: "actualizaCrudAutor",  //URL DEL DEL CONTROLLER
        data: $('#id_form_actualiza').serialize(), //ENVIO TODO EL FORM
        success: function(data){
      	  agregarGrilla(data.lista); //OBTIEN LA LISTA DEL MAP
      	  $('#id_div_modal_actualiza').modal("hide");
      	  mostrarMensaje(data.mensaje);//OBITENE MENSAJE DEL MAP
        },
        error: function(){
      	  mostrarMensaje(MSG_ERROR);
        }
      });
  }
});


</script> 











<!-- VALIDACIONES MODAL REGISTRA -->
<script type="text/javascript">

//el id del form modal registra

	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	//name de los inputs, igual a la clase guia
        	 	//nombre: es el name del input = a la clase guia 
        		"nombres":{
                    selector: "#id_reg_nombres",
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
                    	    //1 forma buscan consulta con sql de spring
                    	 	//url: 'buscaPorAutor', //el url en controller debe ser =
                    	 		
                    	 		
                    	 	//2 forma buscar usando sql personalizado osea el sql para las clases en java	
                    	 	url: 'buscaTituloAutor', //el url en controller debe ser =
                    	 	message: 'El autor ya existe ya existe'
                     	}
                    }
                },
                "apellidos":{
                    selector: "#id_reg_apellidos",
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
                
                "fechaNacimiento":{
                    selector: "#id_reg_fechaNacimiento",
                    validators:{
                        notEmpty: {
                             message: 'La fecha es obligatorio'
                        },
                        //ACA BUSCAREMOS Q EL EMPLEADO SEA MAYOR DE EDAD
                        remote:{
                        	delay:1000,
                        	url:	'buscaEmpleadoMayorEdad', //URL DE CONTROLLER
                        	message:	'el autor debe ser mayor de edad' //mensaje en caso se cumpla
                        	
                        	
                        }
                    }
                },
                
                
                 "telefono":{
                    selector: "#id_reg_telefono",
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
                
                
                "pais.idPais": {
            		selector : '#id_reg_pais',
                    validators: {
                        notEmpty: {
                            message: 'el pais es  obligatorio'
                        },
                      
                    }
                },
                
                
     
                
                
              "grado": {
        		selector : '#id_reg_grado',
                validators: {
                    notEmpty: {
                        message: 'el grado es obligatorio'
                    },
                  
                }
            }
            
            
            
            
        }   
    });
</script>





<!-- VALIDACIONES PARA EL MODAL ACTUALIZA -->
<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	//name de los inputs, igual a la clase guia
    	 	//nombre: es el name del input = a la clase guia 
    		"nombres":{
                selector: "#id_act_nombre",
                validators:{
                    notEmpty: {
                         message: 'El nombre es obligatorio'
                    },
                    stringLength: {
                        min: 2,
                        max: 40,
                        message: 'El nombre es de 3 a 40 caracteres'
                    }
                }
            },

            "apellidos":{
                selector: "#id_act_num_apellidos",
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
            
            "fechaNacimiento":{
                selector: "#id_act_num_fechaNacimiento",
                validators:{
                    notEmpty: {
                         message: 'La fecha es obligatorio'
                    }
                }
            },
            
       
            "telefono":{
                selector: "#id_act_telefono",
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
            

    
            
            "pais": {
        		selector : '#id_act_pais',
                validators: {
                    notEmpty: {
                        message: 'el pais es  obligatorio'
                    },
                  
                }
            },
            
            
 
            
            
          "grado": {
    		selector : '#id_act_grado',
            validators: {
                notEmpty: {
                    message: 'el grado es obligatorio'
                },
              
            }
        }
        
          
        }   
    });
</script>




  		
</body>
</html>