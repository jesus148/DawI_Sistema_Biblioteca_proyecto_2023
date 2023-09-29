package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Libro;
import com.centroinformacion.service.LibroService;

@Controller
public class LibroCrudController {
	@Autowired
	private LibroService service;
	@GetMapping("/consultaCrudLibro")
	@ResponseBody
	public List<Libro> consulta(String filtro){
		return service.listaPorTituloLike("%" + filtro + "%");
	}
}
