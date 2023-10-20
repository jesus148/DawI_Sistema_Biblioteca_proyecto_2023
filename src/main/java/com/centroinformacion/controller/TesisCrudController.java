package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Tesis;
import com.centroinformacion.service.TesisService;

@Controller
public class TesisCrudController {
	
	@Autowired
	private TesisService service;
	
	@GetMapping("/consultaCrudTesis")
	@ResponseBody
	public List<Tesis> consulta(String filtro){
		return service.listaPorTituloLike("%"+filtro+"%");
	}
		

}
