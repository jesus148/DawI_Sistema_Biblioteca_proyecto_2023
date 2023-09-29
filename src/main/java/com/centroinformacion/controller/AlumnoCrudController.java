package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.service.AlumnoService;

@Controller
public class AlumnoCrudController {

	@Autowired
	private AlumnoService service;
	
	@GetMapping("/consultaCrudAlumno")
	@ResponseBody
	public List<Alumno> consulta(String filtro){
		return service.listaPorNombreLike("%"+filtro+"%");
	}
	
}
