package com.centroinformacion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.centroinformacion.service.LibroService;

@Controller
public class LibroConsultaController {
	@Autowired
	private LibroService libroService;

	
}
