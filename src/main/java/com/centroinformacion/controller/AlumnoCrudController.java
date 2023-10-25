package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.util.AppSettings;
import com.centroinformacion.util.FunctionUtil;

import jakarta.servlet.http.HttpSession;

@Controller
public class AlumnoCrudController {

	@Autowired
	AlumnoService alumnoService;

	@GetMapping("/consultaCrudAlumno")
	@ResponseBody
	public List<Alumno> listaAlumnos(String filtro) {
		List<Alumno> listSalida = alumnoService.listaPorNombreApellidoLike("%" + filtro + "%");
		return listSalida;
	}

	@PostMapping("/registraCrudAlumno")
	@ResponseBody
	public Map<?, ?> registra(Alumno obj, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);

		// Validacion de nombre y apellido
		List<Alumno> lstNombre = alumnoService.listaPorNombreApellidoIgual(obj.getNombres(), obj.getApellidos());
		if (!CollectionUtils.isEmpty(lstNombre)) {
			map.put("mensaje", "El alumno " + obj.getNombres() + " " + obj.getApellidos() + " ya existe");
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			return map;
		}

		// Validacion de Correo
		List<Alumno> lstCorreo = alumnoService.listaAlumnoPorCorreoDiferenteSiMismo(obj.getCorreo(), obj.getIdAlumno());
		if (!CollectionUtils.isEmpty(lstCorreo)) {
			map.put("mensaje", "Ya existe un alumno con el correo " + obj.getCorreo());
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			return map;
		}

		// Validacion de Telefono
		List<Alumno> lstTelefono = alumnoService.listaAlumnoPorTelefonoDiferenteSiMismo(obj.getTelefono(),
				obj.getIdAlumno());
		if (!CollectionUtils.isEmpty(lstTelefono)) {
			map.put("mensaje", "El alumno con telefono " + obj.getTelefono() + " ya existe");
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			return map;
		}

		// Validacion de DNI
		List<Alumno> lstSalida = alumnoService.listaAlumnoPorDniDiferenteSiMismo(obj.getDni(), obj.getIdAlumno());
		if (!CollectionUtils.isEmpty(lstSalida)) {
			map.put("mensaje", "El alumno con DNI " + obj.getDni() + " ya existe");
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			return map;
		}

		Alumno objSalida = alumnoService.insertaActualizaAlumno(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			map.put("mensaje", "Registro Exitoso");
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
		}
		return map;
	}

	@GetMapping("/buscaAlumnoMayorEdad")
	@ResponseBody
	public String validaMayorEdad(String fechaNacimiento) {
		if (FunctionUtil.isMayorEdad(fechaNacimiento)) {
			return "{\"valid\":true}";
		} else {
			return "{\"valid\":false}";
		}
	}

	@PostMapping("/actualizaCrudAlumno")
	@ResponseBody
	public Map<?, ?> actualiza(Alumno objAlumno, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		Optional<Alumno> optAlumno = alumnoService.listaAlumnoPorId(objAlumno.getIdAlumno());

		// Validaciones por nombre y apellido
		List<Alumno> lstNombre = alumnoService.listaPorNombreApellidoIgualActualiza(
				objAlumno.getNombres(),objAlumno.getApellidos(), optAlumno.get().getIdAlumno());
		
		if (!CollectionUtils.isEmpty(lstNombre)) {
			map.put("mensaje", "Ya existe un alumno con el nombre " + objAlumno.getNombres() + " y el apellido " + objAlumno.getApellidos());
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			return map;
		}
		
		// Validacion por Correo
		List<Alumno> lstCorreo = alumnoService.listaAlumnoPorCorreoDiferenteSiMismo(
				objAlumno.getCorreo(), optAlumno.get().getIdAlumno());
		
		if (!CollectionUtils.isEmpty(lstCorreo)) {
			map.put("mensaje", "Ya existe un alumno con el correo " + objAlumno.getCorreo());
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			return map;
		}

		// Validacion de Telefono
		List<Alumno> lstTelefono = alumnoService.listaAlumnoPorTelefonoDiferenteSiMismo(
				objAlumno.getTelefono(), optAlumno.get().getIdAlumno());
		
		if (!CollectionUtils.isEmpty(lstTelefono)) {
			map.put("mensaje", "Ya existe un alumno con el telefono " + objAlumno.getTelefono());
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			return map;
		}
		
		// Validacion de DNI
		List<Alumno> lstSalida = alumnoService.listaAlumnoPorDniDiferenteSiMismo(
				objAlumno.getDni(), optAlumno.get().getIdAlumno());
		
		if (!CollectionUtils.isEmpty(lstSalida)) {
			map.put("mensaje", "Ya existe un alumno con el dni " + objAlumno.getDni());
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			return map;
		}

		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		objAlumno.setFechaRegistro(optAlumno.get().getFechaRegistro());
		objAlumno.setEstado(optAlumno.get().getEstado());
		objAlumno.setFechaActualizacion(new Date());
		objAlumno.setUsuarioActualiza(objUsuario);
		objAlumno.setUsuarioRegistro(optAlumno.get().getUsuarioRegistro());

		Alumno objSalida = alumnoService.insertaActualizaAlumno(objAlumno);
		if (objSalida == null) {
			map.put("mensaje", "Error al actualizar");
		} else {
			map.put("mensaje", "Actualizacion exitosa");
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
		}
		return map;
	}

	@PostMapping("/eliminaCrudAlumno")
	@ResponseBody
	public Map<?, ?> elimina(int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		Alumno objAlumno = alumnoService.listaAlumnoPorId(id).get();
		objAlumno.setFechaActualizacion(new Date());
		objAlumno.setEstado(objAlumno.getEstado() == 1 ? 0 : 1);
		Alumno objSalida = alumnoService.insertaActualizaAlumno(objAlumno);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
		}
		return map;
	}
}