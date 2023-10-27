<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS">

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

    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrapValidator.css" />

    <title>Intranet</title>
</head>

<body>
    <jsp:include page="intranetCabecera.jsp" />
    <div class="container" style="margin-top: 4%">
        <h4>CRUD Sala</h4>
    </div>

    <div class="container" style="margin-top: 1%">
        <!-- Agregar aqu� -->

        <div class="col-md-23">

            <div class="row" style="height: 70px">
                <div class="col-md-4">
                    <input class="form-control" id="id_txt_filtro" name="filtro" placeholder="Ingrese numero"
                        type="text" maxlength="30" />
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="id_btn_filtrar"
                        style="width: 150px">FILTRA</button>
                </div>
                <div class="col-md-2">

                    <button type="button" data-toggle='modal' data-target="#id_div_modal_registra" class='btn btn-success' style="width: 150px">REGISTRA</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="content">

                        <table id="id_table" class="table table-bordered table-hover table-condensed">
                            <thead style='background-color: #131920; color: silver;'>
                                <tr>

                                    <th class="text-center" style="width: 5%">Id</th>
                                    <th class="text-center" style="width: 22%">Numero</th>
                                    <th class="text-center" style="width: 18%">Piso</th>
                                    <th class="text-center" style="width: 15%">Numero de Alumnos</th>
                                    <th class="text-center" style="width: 20%">Recursos</th>
                                    <th class="text-center" style="width: 20%">Tipo</th>
                                    <th class="text-center" style="width: 20%">Sede</th>
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
            <form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudLibro"
                class="form-horizontal" method="post">
                <div class="panel-group" id="steps">
                    <!-- Step 1 -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos
                                    de Libro</a></h4>
                        </div>
                        <div id="stepOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="id_reg_numero">Numero</label>
                                    <div class="col-lg-8">
                                        <input class="form-control" id="id_reg_numero" name="numero"
                                            placeholder="Ingrese el Numero" type="text" maxlength="20" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="id_reg_piso">Piso</label>
                                    <div class="col-lg-3">
                                        <input class="form-control" id="id_reg_piso" name="piso"
                                            placeholder="Ingrese el piso" type="text" maxlength="4" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="id_reg_numAlu">Numero de Alumnos</label>
                                    <div class="col-lg-3">
                                        <input class="form-control" id="id_reg_numAlu" name="numAlu"
                                            placeholder="Ingrese el numero de alumnos" type="text" maxlength="10" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="id_reg_recursos">Recursos</label>
                                    <div class="col-lg-3">
                                        <input class="form-control" id="id_reg_recursos" name="recursos"
                                            placeholder="Ingrese el recursos" type="text" maxlength="10" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="id_reg_tipo">Tipo</label>
                                    <div class="col-lg-3">
                                        <select id="id_reg_tipo" name="tipoSala" class='form-control'>
                                            <option value=" ">[Seleccione]</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="id_reg_sede">Sede</label>
                                    <div class="col-lg-3">
                                        <select id="id_reg_sede" name="tipoSede" class='form-control'>
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
    <div class="modal fade" id="id_div_modal_actualiza">
        <div class="modal-dialog" style="width: 60%">

            <div class="modal-content">
                <div class="modal-header" style="padding: 35px 50px">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Sala</h4>
                </div>
                <div class="modal-body" style="padding: 20px 10px;">
                    <form id="id_form_actualiza" accept-charset="UTF-8" action="registraActualizaCrudSala"
                        class="form-horizontal" method="post">
                        <div class="panel-group" id="steps">
                            <!-- Step 1 -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps"
                                            href="#stepOne">Datos de Sala</a></h4>
                                </div>
                                <div id="stepOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_ID">ID</label>
                                            <div class="col-lg-8">
                                                <input class="form-control" id="id_ID" readonly="readonly" name="idSala"
                                                    type="text" maxlength="8" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_act_numero">Numero</label>
                                            <div class="col-lg-3">
                                                <input class="form-control" id="id_act_numero" name="numero"
                                                    placeholder="Ingrese el Numero" type="text" maxlength="20" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_act_piso">Piso</label>
                                            <div class="col-lg-3">
                                                <input class="form-control" id="id_act_piso" name="piso"
                                                    placeholder="Ingrese el piso" type="text" maxlength="4" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_act_numAlu">Numero de
                                                Alumnos</label>
                                            <div class="col-lg-3">
                                                <input class="form-control" id="id_act_numAlu" name="numAlumnos"
                                                    placeholder="Ingrese el Numero de Alumnos" type="text" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_act_recursos">Recursos</label>
                                            <div class="col-lg-3">
                                                <input class="form-control" id="id_act_recursos" name="recursos"
                                                    placeholder="Ingrese el recurso" type="text" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_act_tipo">Tipo</label>
                                            <div class="col-lg-3">
                                                <select id="id_act_tipo" name="tipoSala.idDataCatalogo"
                                                    class='form-control'>
                                                    <option value=" ">[Seleccione]</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_act_sede">Sede</label>
                                            <div class="col-lg-3">
                                                <select id="id_act_sede" name="sede.idDataCatalogo"
                                                    class='form-control'>
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
    </div>
    <script type="text/javascript">
        <!-- Agregar aqu� -->

        $.getJSON("listaTipoSala", {}, function (data) {
            $.each(data, function (index, item) {
                $("#id_reg_tipo").append("<option value=" + item.idDataCatalogo + ">" + item.descripcion + "</option>");
                $("#id_act_tipo").append("<option   value=" + item.idDataCatalogo + ">" + item.descripcion + "</option>");
            });
        });

        $.getJSON("listaSede", {}, function (data) {
            $.each(data, function (index, item) {
                $("#id_reg_sede").append("<option value=" + item.idDataCatalogo + ">" + item.descripcion + "</option>");
                $("#id_act_sede").append("<option value=" + item.idDataCatalogo + ">" + item.descripcion + "</option>");
            });
        });

        $("#id_btn_filtrar").click(function () {
            var fil = $("#id_txt_filtro").val();
            $.getJSON("consultaCrudSala", { "filtro": fil }, function (lista) {
                agregarGrilla(lista);
            });
        });
        function agregarGrilla(lista) {
            $('#id_table').DataTable().clear();
            $('#id_table').DataTable().destroy();
            $('#id_table').DataTable({
                data: lista,
                searching: false,
                ordering: true,
                processing: true,
                pageLength: 10,
                lengthChange: false,
                columns: [
                    { data: "idSala" },
                    { data: "numero" },
                    { data: "piso" },
                    { data: "numAlumnos" },
                    { data: "recursos" },
                    { data: "tipoSala.idDataCatalogo" },
                    { data: "sede.idDataCatalogo" },
                    {
                        data: function (row, type, val, meta) {
                            var salida = '<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick = "editar(\''+row.idSala + '\',\'' + row.numero +'\',\'' + row.piso  +'\',\'' + row.numAlumnos + '\',\'' + row.recursos + '\',\'' + row.tipoSala.idDataCatalogo + '\',\'' +  row.sede.idDataCatalogo +'\')" > Editar</button > ';
                            return salida;
                        }, className: 'text-center'
                    },
                    {
                        data: function (row, type, val, meta) {
                            var salida = '<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick = "accionEliminar(\'' + row.idSala + '\')" > '+ (row.estado == 1? 'Activo':'Inactivo') + '</button > ';
                            return salida;
                        }, className: 'text-center'
                    },
                ]
            });
        }

        function accionEliminar(id) {
            $.ajax({
                type: "POST",
                url: "eliminaCrudSala",
                data: { "id": id },
                success: function (data) {
                    agregarGrilla(data.lista);
                },
                error: function () {
                    mostrarMensaje(MSG_ERROR);
                }
            });
        }
        $(document).ready(function () {
            // Limpia el validador cuando se oculta el modal de registro
            $('#id_div_modal_registra').on('hidden.bs.modal', function () {
                limpiarFormulario();
                $('#id_form_registra').bootstrapValidator('resetForm');
            });

            // Limpia el validador cuando se oculta el modal de actualizaci�n
            $('#id_div_modal_actualiza').on('hidden.bs.modal', function () {
                $('#id_form_actualiza').bootstrapValidator('resetForm');
            });

            // Limpia el validador si se oculta el modal sin importar c�mo
            $('#id_div_modal_registra, #id_div_modal_actualiza').on('hide.bs.modal', function () {
                $('#id_form_registra, #id_form_actualiza').bootstrapValidator('resetForm');
            });
        });

        $("#id_btn_registra").click(function () {
            var validator = $('#id_form_registra').data('bootstrapValidator');
            validator.validate();

            if (validator.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "registraCrudSala",
                    data: $('#id_form_registra').serialize(),
                    success: function (data) {
                        agregarGrilla(data.lista);
                        $('#id_div_modal_registra').modal("hide");
                        mostrarMensaje(data.mensaje);
                        limpiarFormulario();
                        validator.resetForm();
                    },
                    error: function () {
                        mostrarMensaje(MSG_ERROR);
                    }
                });
            }
        });

        $("#id_btn_actualiza").click(function () {
            var validator = $('#id_form_actualiza').data('bootstrapValidator');
            validator.validate();
            if (validator.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "actualizaCrudSala",
                    data: $('#id_form_actualiza').serialize(),
                    success: function (data) {
                        agregarGrilla(data.lista);
                        $('#id_div_modal_actualiza').modal("hide");
                        mostrarMensaje(data.mensaje);
                        validator.resetForm();
                    },
                    error: function () {
                        mostrarMensaje(MSG_ERROR);
                    }
                });
            }
        });
        function editar(id, numero, piso, numAlu, recursos, tipo, sede) {
            $('#id_ID').val(id);
            $('#id_act_numero').val(numero);
            $('#id_act_piso').val(piso);
            $('#id_act_numAlu').val(numAlu);
            $('#id_act_recursos').val(recursos);
            $('#id_act_tipo').val(tipo);
            $('#id_act_sede').val(sede);
            $('#id_div_modal_actualiza').modal("show");
        }
        function limpiarFormulario() {
            $("#id_reg_numero").val('');
            $("#id_reg_piso").val('');
            $("#id_reg_numAlu").val('');
            $("#id_reg_recursos").val(' ');
            $("#id_reg_tipo").val(' ');
            $("#id_reg_sede").val(' ');
        }

        $('#id_form_registra').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                numero: {
                    selector: '#id_reg_numero',
                    validators: {
                        notEmpty: {
                            message: 'El numero es un campo obligatorio'
                        },
                        stringLength: {
                            message: 'El campo NUMERO es de 3 caracteres',
                            min: 3,
                            max: 4
                        },
                        regexp: {
                            regexp: /^[A-Z]\d{3}$/,
                            message: 'El campo debe tener el formato de una letra seguida de tres digitos, por ejemplo, A003'
                        },
                        remote: {
                            delay: 1000,
                            url: 'buscaSalaPorNumero',
                            message: 'El numero ya existe'
                        }
                    }
                },
                piso: {
                    selector: '#id_reg_piso',
                    validators: {
                        notEmpty: {
                            message: 'El campo PISO es obligatorio'
                        },
                        stringLength: {
                            message: 'El tema es de 2 digitos',
                            min: 2,
                            max: 2
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'El Piso debe contener solo digitos numericos'
                        }
                    }
                },
                numAlu: {
                    selector: '#id_reg_numAlu',
                    validators: {
                        notEmpty: {
                            message: 'El campo PISO es obligatorio'
                        },
                        stringLength: {
                            message: 'El tema es de 2 digitos',
                            min: 2,
                            max: 2
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'El Numero de Alumnos debe contener solo digitos numericos'
                        }
                    }
                },
                recursos: {
                    selector: '#id_reg_recursos',
                    validators: {
                        notEmpty: {
                            message: 'Recursos es un campo obligatorio'
                        }
                    }
                },
                tipo: {
                    selector: '#id_reg_tipo',
                    validators: {
                        notEmpty: {
                            message: 'Tipo es un campo obligatorio'
                        }
                    }
                },
                "row.sede.idDataCatalogo": {
                    selector: '#id_reg_sede',
                    validators: {
                        notEmpty: {
                            message: 'Sede es un campo obligatorio'
                        }
                    }
                }
            }
        });

        $('#id_form_actualiza').bootstrapValidator({
            live: 'enabled',
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                numero: {
                    selector: '#id_reg_numero',
                    validators: {
                        notEmpty: {
                            message: 'El numero es un campo obligatorio'
                        },
                        stringLength: {
                            message: 'El campo NUMERO es de 3 caracteres',
                            min: 3,
                            max: 4
                        },
                        regexp: {
                            regexp: /^[A-Z]\d{3}$/,
                            message: 'El campo debe tener el formato de una letra seguida de tres digitos, por ejemplo, A003'
                        },
                        remote: {
                            delay: 1000,
                            url: 'buscaSalaPorNumero',
                            message: 'El Numero ya existe',
                            data: {
                                titulo: function () {
                                    return $('#id_act_titulo').val();
                                },
                                id: function () {

                                    return $('#id_ID').val();
                                }
                            }
                        }
                    }
                },
                piso: {
                    selector: '#id_reg_piso',
                    validators: {
                        notEmpty: {
                            message: 'El campo PISO es obligatorio'
                        },
                        stringLength: {
                            message: 'El tema es de 2 digitos',
                            min: 2,
                            max: 2
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'El tema debe contener solo digitos numericos'
                        }
                    }
                },
                numAlu: {
                    selector: '#id_reg_numAlu',
                    validators: {
                        notEmpty: {
                            message: 'El campo PISO es obligatorio'
                        },
                        stringLength: {
                            message: 'El tema es de 2 digitos',
                            min: 2,
                            max: 2
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'El Numero de Alumnos debe contener solo digitos numericos'
                        }
                    }
                },
                recursos: {
                    selector: '#id_reg_recursos',
                    validators: {
                        notEmpty: {
                            message: 'Recursos es un campo obligatorio'
                        }
                    }
                },
                tipo: {
                    selector: '#id_reg_tipo',
                    validators: {
                        notEmpty: {
                            message: 'Tipo es un campo obligatorio'
                        }
                    }
                },
                "row.sede.idDataCatalogo": {
                    selector: '#id_reg_sede',
                    validators: {
                        notEmpty: {
                            message: 'Sede es un campo obligatorio'
                        }
                    }
                }
            }
        });

    </script>
</body>

</html>