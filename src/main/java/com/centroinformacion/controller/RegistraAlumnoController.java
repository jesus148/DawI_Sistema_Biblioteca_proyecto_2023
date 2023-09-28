package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

@Controller
public class RegistraAlumnoController {
	
	@Autowired
	private AlumnoService alumnoService;

	@PostMapping("/registraAlumno")
	@ResponseBody
	public Map<?,?> registra(Alumno obj, HttpSession session){
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		HashMap<String, String> map = new HashMap<String, String>();
		Alumno objSalida = alumnoService.insertaAlumno(obj);
		
		if(objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		} else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	@GetMapping("/buscaPorAlumno")
	@ResponseBody
	public String validaNombre(String nombres){
		List<Alumno> lstAlumno = alumnoService.buscaPorNombre(nombres);
		
		if(CollectionUtils.isEmpty(lstAlumno)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
}
