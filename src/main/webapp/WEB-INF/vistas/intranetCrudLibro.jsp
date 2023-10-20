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
<div class="container" style="margin-top: 4%"><h4>CRUD Libro</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
	<h3>Crud de Libro</h3>
		 <div class="col-md-23" >  

				   <div class="row" style="height: 70px">
						<div class="col-md-2" >
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
												<th style="width: 5%" >ID</th>
												<th style="width: 25%">Título</th>
												<th style="width: 8%">Año</th>
												<th style="width: 8%">Serie</th>
												<th style="width: 8%">Categoría</th>
												<th style="width: 8%">Tipo</th>
												<th style="width: 8%">Estado Préstamo</th>
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
		  <div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de modalidad</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudLibro" class="form-horizontal"  method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_titulo" name="titulo" placeholder="Ingrese el Título" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_anio">Año</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_anio" name="anio" placeholder="Ingrese el año" type="text" maxlength="4"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_serie">Serie</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_serie" name="serie" placeholder="Ingrese el serie" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoriaLibro">Categoría</label>
		                                        <div class="col-lg-3">
													<select id="id_reg_categoriaLibro" name="categoriaLibro" class='form-control'>
														<option value=" ">[Seleccione]</option>    
													</select>
												</div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipoLibro">Tipo</label>
		                                        <div class="col-lg-3">
													 <select id="id_reg_tipoLibro" name="tipoLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estadoPrestamo" style="display: none;" >Estado préstado</label>
		                                        <div class="col-lg-3">
													 <select id="id_reg_estadoPrestamo" name="estadoPrestamo" class='form-control' style="display: none;">
							                            	<option value="27" selected>Disponible</option>    
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
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudLibro" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-8">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idLibro" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">Título</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_titulo" name="titulo" placeholder="Ingrese el título" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_anio">Año</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_anio" name="anio" placeholder="Ingrese el año" type="text" maxlength="4"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_serie">Serie</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_serie" name="serie" placeholder="Ingrese el serie" type="text"/>
		                                        </div>
		                                    </div>		   
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categoriaLibro">Categoría</label>
		                                        <div class="col-lg-3">
													<select id="id_act_categoriaLibro" name="categoriaLibro.idDataCatalogo" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tipoLibro">Tipo</label>
		                                        <div class="col-lg-3">
													<select id="id_act_tipoLibro" name="tipoLibro.idDataCatalogo" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estadoPrestamo">Estado Préstamo</label>
		                                        <div class="col-lg-3">
													<select id="id_act_estadoPrestamo" name="estadoPrestamo.idDataCatalogo" class='form-control'>
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
$.getJSON("listaCategoriaDeLibro", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_categoriaLibro").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
		$("#id_act_categoriaLibro").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});

$.getJSON("listaTipoLibroRevista", {}, function(data){
	$.each(data, function(index,item){
		$("#id_reg_tipoLibro").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
		$("#id_act_tipoLibro").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});

$.getJSON("listaEstadoLibro", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_estadoPrestamo").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
		$("#id_act_estadoPrestamo").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
		//$("#id_act_deporte").append("<option value="+item.idDeporte +">"+ item.nombre +"</option>");
	});
});

$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudLibro",{"filtro":fil}, function (lista){
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
			pageLength: 10,
			lengthChange: false,
			columns:[
				{data: "idLibro"},
				{data: "titulo"},
				{data: "anio"},
				{data: "serie"},
				{data: "categoriaLibro.descripcion"},
				{data: "tipoLibro.descripcion"},
				{data: "estadoPrestamo.descripcion"},
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idLibro + '\',\'' + row.titulo +'\',\'' + row.anio  +'\',\'' + row.serie + '\',\'' + row.categoriaLibro.idDataCatalogo + '\',\'' +  row.tipoLibro.idDataCatalogo + '\',\'' + row.estadoPrestamo.idDataCatalogo +'\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idLibro + '\')">'+ (row.estado == 1? 'Activo':'Inactivo') +  '</button>';
					return salida;
				},className:'text-center'},													
			]                                     
	    });
}

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudLibro", 
          data: {"id":id},
          success: function(data){
        	  agregarGrilla(data.lista);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}
$(document).ready(function() {
    // Limpia el validador cuando se oculta el modal de registro
    $('#id_div_modal_registra').on('hidden.bs.modal', function() {
        $('#id_form_registra').bootstrapValidator('resetForm');
    });

    // Limpia el validador cuando se oculta el modal de actualización
    $('#id_div_modal_actualiza').on('hidden.bs.modal', function() {
        $('#id_form_actualiza').bootstrapValidator('resetForm');
    });

    // Limpia el validador si se oculta el modal sin importar cómo
    $('#id_div_modal_registra, #id_div_modal_actualiza').on('hide.bs.modal', function() {
        $('#id_form_registra, #id_form_actualiza').bootstrapValidator('resetForm');
    });
});

$("#id_btn_registra").click(function (){ 
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
    
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraCrudLibro", 
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

$("#id_btn_actualiza").click(function(){
	var validator = $('#id_form_actualiza').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "actualizaCrudLibro", 
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
function editar(id,titulo,anio,serie,categoriaLibro,tipoLibro,estadoPrestamo){	
	$('#id_ID').val(id);
	$('#id_act_titulo').val(titulo);
	$('#id_act_anio').val(anio);
	$('#id_act_serie').val(serie);
	$('#id_act_categoriaLibro').val(categoriaLibro);
	$('#id_act_tipoLibro').val(tipoLibro);
	$('#id_act_estadoPrestamo').val(estadoPrestamo);
	$('#id_div_modal_actualiza').modal("show");
}
function limpiarFormulario(){
	$("#id_reg_titulo").val('');
	$("#id_reg_anio").val('');
	$("#id_reg_serie").val('');
	$("#id_reg_categoriaLibro").val(' ');
	$("#id_reg_tipoLibro").val(' ');
}

$('#id_form_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	titulo: {
    		selector : '#id_reg_titulo',
            validators: {
                notEmpty: {
                    message: 'El título es un campo obligatorio'
                },
                stringLength :{
                	message:'El título es de 2 a 40 caracteres',
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
    		selector : '#id_reg_anio',
            validators: {
                notEmpty: {
                    message: 'El año es obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{4}$/,
                    message: 'El año debe tener 4 dígitos numéricos'
                }
            }
        },
        serie: {
    		selector : '#id_reg_serie',
            validators: {
                notEmpty: {
                    message: 'El serie es un campo obligatorio'
                },
                regexp: {
                    regexp: /^[a-zA-Z]{2}[0-9]{3}$/,
                    message: 'La serie debe tener 2 letras seguidas de 3 números'
                }
            }
        },
        categoriaLibro: {
    		selector : '#id_reg_categoriaLibro',
            validators: {
            	notEmpty: {
                    message: 'Categoria es un campo obligatorio'
                }
            }
        },
        tipoLibro: {
    		selector : '#id_reg_tipoLibro',
            validators: {
            	notEmpty: {
                    message: 'Tipo es un campo obligatorio'
                }
            }
        },
        estadoPrestamo: {
    		selector : '#id_reg_estadoPrestamo',
            validators: {
            	notEmpty: {
                    message: 'El estado del préstamo es un campo obligatorio'
                }
            }
        }
    }   
});
/*
$('#id_div_modal_actualiza').on('shown.bs.modal', function() {
    $('#id_form_actualiza').bootstrapValidator('validate');
}); */
$('#id_form_actualiza').bootstrapValidator({
    live: 'enabled',
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	titulo: {
    		selector : '#id_act_titulo',
            validators: {
                notEmpty: {
                    message: 'El título es un campo obligatorio'
                },
                stringLength :{
                	message:'El título es de 2 a 40 caracteres',
                	min : 2,
                	max : 40
                },
                remote:{
                	delay: 1000,
                	url:'buscaLibroPorTituloConIdLibro',
                	message : 'El titulo ya existe',
                	data: {
		                titulo: function() {
		                    // Obtén el valor del correo electrónico desde donde lo tengas en tu formulario
		                    return $('#id_act_titulo').val();
		                },
		                id: function() {
		                    // Obtén el valor del ID desde donde lo tengas en tu formulario
		                    return $('#id_ID').val();
		                }
		            },
                    onSuccess: function (e, data) {
                        if (data.result === true) {
                            // The title is valid, proceed with form submission
                        	$('#id_form_actualiza').bootstrapValidator('updateStatus', 'titulo', 'INVALID', 'remote');
                        } else {
                            // The title already exists, show an error message
                            //$('#id_form_registra').bootstrapValidator('updateStatus', 'titulo', 'INVALID', 'remote');
                        }
                    }
                }
            }
        },
        anio: {
    		selector : '#id_act_anio',
            validators: {
                notEmpty: {
                    message: 'El año es obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{4}$/,
                    message: 'El año debe tener 4 dígitos numéricos'
                }
            }
        },
        serie: {
    		selector : '#id_act_serie',
            validators: {
                notEmpty: {
                    message: 'El serie es un campo obligatorio'
                },
                regexp: {
                    regexp: /^[a-zA-Z]{2}[0-9]{3}$/,
                    message: 'El año debe tener 2 letras seguidas de 3 números'
                }
            }
        },
        categoriaLibro: {
    		selector : '#id_act_categoriaLibro',
            validators: {
            	notEmpty: {
                    message: 'Categoria es un campo obligatorio'
                }
            }
        },
        tipoLibro: {
    		selector : '#id_act_tipoLibro',
            validators: {
            	notEmpty: {
                    message: 'Tipo es un campo obligatorio'
                }
            }
        }
        ,
        estadoPrestamo: {
    		selector : '#id_act_estadoPrestamo',
            validators: {
            	notEmpty: {
                    message: 'El estado del préstamo es un campo obligatorio'
                }
            }
        }
    }   
});
</script>   		
</body>
</html>