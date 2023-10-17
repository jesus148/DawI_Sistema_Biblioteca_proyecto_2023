package com.centroinformacion.controller;

import org.springframework.stereotype.Controller;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.service.AutorService;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AutorCrudController {
	
	
	
	@Autowired
	private AutorService autorService;
	
	
	
	
	
	@GetMapping("/consultaCrudAutor")
	@ResponseBody
	public List<Autor> consulta(String filtro) {
		return autorService.listaPorNombreLike("%"+filtro+"%");
	}

	
	
	
	
	
	
	

}
