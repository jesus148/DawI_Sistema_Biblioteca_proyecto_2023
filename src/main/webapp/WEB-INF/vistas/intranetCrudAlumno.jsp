<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<title>Intranet</title>
</head>
<body>
	<jsp:include page="intranetCabecera.jsp" />
	<div class="container" style="margin-top: 4%">
		<h4>CRUD de Alumno</h4>
	</div>

	<div class="container" style="margin-top: 1%">
		<!-- Agregar aqu� -->
		<div class="col-md-23">

			<div class="row" style="height: 70px">
				<div class="col-md-2">
					<input class="form-control" id="id_txt_filtro" name="filtro"
						placeholder="Ingrese el nombre" type="text" maxlength="30" />
				</div>
				<div class="col-md-2">
					<button type="button" class="btn btn-primary" id="id_btn_filtrar"
						style="width: 150px">FILTRA</button>
				</div>
				<div class="col-md-2">
					<button type="button" data-toggle='modal'
						data-target="#id_div_modal_registra" class='btn btn-success'
						style="width: 150px">REGISTRA</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="content">

						<table id="id_table" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th style="width: 5%">C�digo</th>
									<th style="width: 10%">Nombres</th>
									<th style="width: 10%">Apellidos</th>
									<th style="width: 10%">Tel�fono</th>
									<th style="width: 10%">DNI</th>
									<th style="width: 10%">Correo Electr�nico</th>
									<th style="width: 10%">Fecha Nacimiento</th>
									<th style="width: 10%">Pa�s</th>
									<th style="width: 5%">Modalidad</th>
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

		<!-- INICIO REGISTRAR-->
		<div class="modal fade" id="id_div_modal_registra">
			<div class="modal-dialog" style="width: 60%">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Registro de Alumno
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8"
							class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos de Alumno</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_reg_nombres"
														name="nombres" placeholder="Ingrese el nombre" type="text" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_apellidos">Apellidos</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_reg_apellidos"
														name="apellidos" placeholder="Ingrese el apellido"
														type="text" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_telefono">Tel�fono</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_reg_telefono"
														name="telefono" placeholder="Ingrese el telefono"
														type="number" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_reg_dni"
														name="dni" placeholder="Ingrese el DNI"
														type="number" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_correo">Correo electr�nico</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_reg_correo"
														name="correo" placeholder="Ingrese el correo"
														type="email" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_fecha_nacimiento">Fecha Nacimiento</label>
												<div class="col-lg-3">
													<input class="form-control" id="id_reg_fecha_nacimiento"
														name="fechaNacimiento" type="date" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_pais">Pa�s</label>
												<div class="col-lg-6">
													<select id="id_reg_pais" name="pais" class='form-control'>
														<option value=" ">[Seleccione]</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_modalidad">Modalidad</label>
												<div class="col-lg-6">
													<select id="id_reg_modalidad" name="modalidad" class='form-control'>
														<option value=" ">[Seleccione]</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="button" class="btn btn-primary"
														id="id_btn_registra">REGISTRA</button>
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
		<!-- FIN REGISTRAR -->

		<!-- INICIO ACTUALIZAR -->
		<div class="modal fade" id="id_div_modal_actualiza">
			<div class="modal-dialog" style="width: 60%">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Actualiza Alumno
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"
							class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos de Alumno</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">C�digo</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_ID" readonly="readonly"
														name="idAlumno" type="text" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_nombres">Nombres</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_act_nombres"
														name="nombres" placeholder="Ingrese el nombre" type="text" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_apellidos">Apellidos</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_act_apellidos"
														name="apellidos" placeholder="Ingrese el apellido"
														type="text" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_telefono">Tel�fono</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_act_telefono"
														name="telefono" placeholder="Ingrese el telefono"
														type="number" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_act_dni"
														name="dni" placeholder="Ingrese el DNI"
														type="number" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_correo">Correo electr�nico</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_act_correo"
														name="correo" placeholder="Ingrese el correo electr�nico"
														type="email" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_fecha_nacimiento">Fecha Nacimiento</label>
												<div class="col-lg-3">
													<input class="form-control" id="id_act_fecha_nacimiento"
														name="fechaNacimiento" type="date" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_pais">Pa�s</label>
												<div class="col-lg-6">
													<select id="id_act_pais" name="pais" class='form-control'>
														<option value=" ">[Seleccione]</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_modalidad">Modalidad</label>
												<div class="col-lg-6">
													<select id="id_act_modalidad" name="modalidad" class='form-control'>
														<option value=" ">[Seleccione]</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="button" class="btn btn-primary"
														id="id_btn_actualiza">ACTUALIZA</button>
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
		<!-- FIN ACTUALIZAR -->

	</div>

	<script type="text/javascript">
	<!-- Agregar aqu� -->
	$.getJSON("listaPais", {}, function(data){
		$.each(data, function(i,item){
			$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
			$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		});
	});
	
	$.getJSON("listaModalidadAlumno", {}, function(data){
		$.each(data, function(index,item){
			$("#id_reg_modalidad").append("<option value="+item.idDataCatalogo+">"+item.descripcion+"</option>");
			$("#id_act_modalidad").append("<option value="+item.idDataCatalogo+">"+item.descripcion+"</option>");
		});
	});

	$("#id_btn_filtrar").click(function(){
		var fil=$("#id_txt_filtro").val();
		$.getJSON("consultaCrudAlumno",{"filtro":fil}, function (lista){
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
					{data: "idAlumno"},
					{data: "nombres"},
					{data: "apellidos"},
					{data: "telefono"},
					{data: "dni"},
					{data: "correo"},
					{data: "fechaNacimiento"},
					{data: "pais.nombre"},
					{data: "modalidad.descripcion"},
					{data: function(row, type, val, meta){
						var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idAlumno + '\',\'' + row.nombres + '\',\'' + row.apellidos + '\',\'' + row.telefono + '\',\'' + row.dni + '\',\'' + row.correo + '\',\'' + row.fechaNacimiento + '\',\'' + row.pais.idPais + '\',\'' + row.modalidad.idDataCatalogo + '\')">Editar</button>';
						return salida;
					},className:'text-center'},	
					{data: function(row, type, val, meta){
					    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idAlumno + '\')">'+ (row.estado == 1? 'Activo':'Inactvo') +  '</button>';
						return salida;
					},className:'text-center'},													
				]                                     
		    }); 
	}
	
	function accionEliminar(id){	
	    $.ajax({
	          type: "POST",
	          url: "eliminaCrudAlumno", 
	          data: {"id":id},
	          success: function(data){
	        	  agregarGrilla(data.lista);
	          },
	          error: function(){
	        	  mostrarMensaje(MSG_ERROR);
	          }
	     });
	}
	
	
	function editar(id,nombres,apellidos,telefono,dni,correo,fechaNacimiento,idpais,idmodalidad){	
		$('#id_ID').val(id);
		$('#id_act_nombres').val(nombres);
		$('#id_act_apellidos').val(apellidos);
		$('#id_act_telefono').val(telefono);
		$('#id_act_dni').val(dni);
		$('#id_act_correo').val(correo);
		$('#id_act_fecha_nacimiento').val(fechaNacimiento);
		$('#id_act_pais').val(idpais);
		$('#id_act_modalidad').val(idmodalidad);
		$('#id_div_modal_actualiza').modal("show");
	}
	
	function limpiarFormulario(){	
		$('#id_reg_nombres').val('');
		$('#id_reg_apellidos').val('');
		$('#id_reg_telefono').val('');
		$('#id_reg_dni').val('');
		$('#id_reg_correo').val('');
		$('#id_reg_fecha_nacimiento').val('');
		$('#id_reg_pais').val(' ');
		$('#id_reg_modalidad').val(' ');
	}
	
	
	$("#id_btn_registra").click(function(){
		var validator = $('#id_form_registra').data('bootstrapValidator');
	    validator.validate();
	    if (validator.isValid()) {
	        $.ajax({
	          type: "POST",
	          url: "registraCrudAlumno", 
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
	          url: "actualizaCrudAlumno", 
	          data: $('#id_form_actualiza').serialize(),
	          success: function(data){
	        	  agregarGrilla(data.lista);
	        	  $('#id_div_modal_actualiza').modal("hide");
	        	  mostrarMensaje(data.mensaje);
	          },
	          error: function(){
	        	  mostrarMensaje(MSG_ERROR);
	          }
	        });
	    }
	});
	
	//validacion de registrar
	$('#id_form_registra').bootstrapValidator({
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	"nombres": {
	    		selector : '#id_reg_nombres',
	            validators: {
	                notEmpty: {
	                    message: 'El nombre es un campo obligatorio'
	                },
	                stringLength :{
	                	message:'El nombre debe tener entre 2 y 40 caracteres',
	                	min : 2,
	                	max : 40
	                }
	            }
	        },
	        "apellidos": {
	    		selector : '#id_reg_apellidos',
	            validators: {
	                notEmpty: {
	                    message: 'El apellido es un campo obligatorio'
	                },
	                stringLength :{
	                	message: 'El apellido debe tener entre 2 y 40 caracteress',
	                	min : 2,
	                	max : 40
	                }
	            }
	        },
	        "telefono": {
	    		selector : '#id_reg_telefono',
	            validators: {
	                notEmpty: {
	                    message: 'El apellido es un campo obligatorio'
	                },
	                regexp: {
                    	regexp: /^[0-9]{9}$/,
                        message: 'El n�mero de tel�fono debe tener hasta 9 d�gitos'
                    },
	            }
	        },
	        "dni": {
	    		selector : '#id_reg_dni',
	            validators: {
	                notEmpty: {
	                    message: 'El DNI es un campo obligatorio'
	                },
	                regexp: {
                    	regexp: /^[0-9]{8}$/,
                        message: 'El n�mero de DNI debe tener hasta 8 d�gitos'
                    },
	            }
	        },
	        "correo": {
	    		selector : '#id_reg_correo',
	            validators: {
	                notEmpty: {
	                    message: 'El apellido es un campo obligatorio'
	                },
	                regexp: {
                        regexp: /^[a-zA-Z0-9._%+-]+@cibertec\.edu\.pe$/,
                        message: 'El correo debe tener el formato @cibertec.edu.pe'
                    },
	            }
	        },
	        "fechaNacimiento": {
	    		selector : '#id_reg_fecha_nacimiento',
	            validators: {
	            	notEmpty: {
	                    message: 'La fecha de Nacimiento es un campo obligatorio'
	                },
	                remote :{
	                	delay   : 1000,
	                	url     : 'buscaAlumnoMayorEdad',
	                	message : 'El alumno debe ser mayor de edad'
	                }
	            }
	        },
	        "pais.idPais": {
	    		selector : '#id_reg_pais',
	            validators: {
	            	notEmpty: {
	                    message: 'El pa�s un campo obligatorio'
	                },
	            }
	        },
	        "modalidad.idModalidad": {
	    		selector : '#id_reg_modalidad',
	            validators: {
	            	notEmpty: {
	                    message: 'El pa�s un campo obligatorio'
	                },
	            }
	        },
	    	
	    }   
	});

	//validacion de actualizar
	$('#id_form_actualiza').bootstrapValidator({
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	"nombres": {
	    		selector : '#id_act_nombres',
	            validators: {
	                notEmpty: {
	                    message: 'El nombre es un campo obligatorio'
	                },
	                stringLength :{
	                	message:'El nombre debe tener entre 2 y 40 caracteres',
	                	min : 2,
	                	max : 40
	                }
	            }
	        },
	        "apellidos": {
	    		selector : '#id_act_apellidos',
	            validators: {
	                notEmpty: {
	                    message: 'El apellido es un campo obligatorio'
	                },
	                stringLength :{
	                	message: 'El apellido debe tener entre 2 y 40 caracteres',
	                	min : 2,
	                	max : 40
	                }
	            }
	        },
	        "telefono": {
	    		selector : '#id_act_telefono',
	            validators: {
	                notEmpty: {
	                    message: 'El apellido es un campo obligatorio'
	                },
	                regexp: {
                    	regexp: /^[0-9]{9}$/,
                        message: 'El n�mero de tel�fono debe tener hasta 9 d�gitos'
                    }
	            }
	        },
	        "dni": {
	    		selector : '#id_act_dni',
	            validators: {
	                notEmpty: {
	                    message: 'El DNI es obligatorio'
	                },
	                regexp: {
                    	regexp: /^[0-9]{8}$/,
                        message: 'El n�mero de DNI debe tener hasta 8 d�gitos'
                    }
	            }
	        },
	        "correo": {
	    		selector : '#id_act_correo',
	            validators: {
	                notEmpty: {
	                    message: 'El apellido es un campo obligatorio'
	                },
	                regexp: {
                        regexp: /^[a-zA-Z0-9._%+-]+@cibertec\.edu\.pe$/,
                        message: 'El correo debe tener el formato @cibertec.edu.pe'
                    }
	            }
	        },
	        "fechaNacimiento": {
	    		selector : '#id_act_fecha_nacimiento',
	            validators: {
	            	notEmpty: {
	                    message: 'La fecha de Nacimiento es un campo obligatorio'
	                },
	                remote :{
	                	delay   : 1000,
	                	url     : 'buscaAlumnoMayorEdad',
	                	message : 'El alumno debe ser mayor de edad'
	                }
	            }
	        },
	        "pais.idPais": {
	    		selector : '#id_act_pais',
	            validators: {
	            	notEmpty: {
	                    message: 'El pa�s un campo obligatorio'
	                },
	            }
	        },
	        "modalidad.idModalidad": {
	    		selector : '#id_act_modalidad',
	            validators: {
	            	notEmpty: {
	                    message: 'El pa�s un campo obligatorio'
	                },
	            }
	        },
	    	
	    }   
	});
	
	 $('#id_reg_telefono').on('input', function() {
	        if (this.value.length >= 9) {
	            this.value = this.value.slice(0, 9);
	        }
	    });
	    
	    $('#id_reg_dni').on('input', function() {
	        if (this.value.length >= 8) {
	            this.value = this.value.slice(0, 8);
	        }
	    });
		
	</script>
</body>
</html>