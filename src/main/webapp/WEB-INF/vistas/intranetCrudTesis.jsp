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
<div class="container" style="margin-top: 4%"><h4>CRUD Tesis</h4></div>

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
						
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
										
												<th style="width: 5%">ID</th>
												<th style="width: 22%">Título</th>
												<th style="width: 23%">Tema</th>
												<th style="width: 15%">Fecha de Creación</th>
												<th style="width: 15%">Alumno</th>
												
                          
												<th style="width: 10%">Actualiza</th> 
												<th style="width: 10%">Elimina</th> 
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
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_titulo" name="titulo" placeholder="Ingrese el título" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tema">Tema</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_tema" name="tema" placeholder="Ingrese el tema" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaCrea">Fecha de Creación</label>
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_reg_fechaCrea" name="fechaCreacion" placeholder="Ingrese la fecha" type="date" />
		                                        </div>
		                                    </div>		   

		                                    <div class="form-group">
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
		                                        <label class="col-lg-3 control-label" for="id__act_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_titulo" name="titulo" placeholder="Ingrese el titulo" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tema">Tema</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_tema" name="tema" placeholder="Ingrese el tema" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fechaCrea">Fecha de Creación</label>
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_act_fechaCrea" name="fechaCreacion" placeholder="Ingrese la fecha" maxlength="100" type="date"  />
		                                        </div>
		                                    </div>		   

		                                    <div class="form-group">
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
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idTesis + '\',\'' + row.titulo +'\',\'' + row.tema +'\',\'' + row.fechaCreacion + '\',\'' + row.alumno.idAlumno + '\')">Editar</button>';
					return salida;
				},className:'text-center'},					
				{data: function(row, type, val, meta){                                                                                                                                                   
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idTesis + '\')">'+ (row.estado == 1? 'Activo':'Inactivo') +  '</button>';
					return salida;
				},className:'text-center'},													
			]                                     
	    });
}
//METODO ELIMINAR SOLO CAMBIA EL ESTADO

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudTesis",  //URL DEL CONTROLADOR
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
      url: "registraCrudTesis", //url del controller
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
	$('#id_reg_titulo').val('');
	$('#id_reg_tema').val('');
	$('#id_reg_fechaCreacion').val('');
	$('#id_reg_alumno').val(' ');
}

//FUNCION PARA MOSTRAR EL MODAL ACTUALIZA
//recibe parametro y los pone en los inputs
function editar(idTesis,titulo,tema,fechaCreacion,idAlumno){	
	//poniendo en los inputs
	//$('#id_ID').val(idTesis); 
	$('#id_act_titulo').val(titulo);
	$('#id_act_tema').val(tema);
	$('#id_act_fechaCrea').val(fechaCreacion);
	$('#id_act_alumno').val(idAlumno);
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
      url: "actualizaCrudTesis",  //URL DEL DEL CONTROLLER
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
                        //esto es el controller pa buscar el nombre de autor
                        //delay:Retraso para mostrar y ocultar la información Si se proporciona un número, se aplica un retraso para ocultar ambos.
                        //Número de milisegundos que se deben esperar antes de mostrar un error en un campo de formulario.
                        //OJO : cuando escribas en el input escribe la palabra o el valor completo = ala bd ahi verifica si existe
                        remote:{
                    	    delay: 1000,
                    	    //1 forma buscan consulta con sql de spring
                    	 	//url: 'buscaPorAutor', //el url en controller debe ser =
                    	 		
                    	 		
                    	 	//2 forma buscar usando sql personalizado osea el sql para las clases en java	
                    	 	url: 'buscaTituloTesis', //el url en controller debe ser =
                    	 	message: 'El titulo ya existe ya existe'
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