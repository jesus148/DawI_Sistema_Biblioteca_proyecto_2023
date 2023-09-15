package com.centroinformacion.controller;

import org.springframework.stereotype.Controller;
import java.util.Map;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.service.AutorService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;



/*
    @author Jesus Huaman
    202014378
*/


@Controller
public class RegistraAutorController {
	
	
	
	//recordar no subir el password
	
	
	
	

	//para registrar
	@Autowired
	private AutorService autorService;
	
	
	
	
	


	//PARA REGISTRAR
	@PostMapping("/registraAutor")
	@ResponseBody
	public Map<?, ?> registra(Autor obj) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		//le agregamos la fecha al dato obtenido desde el jsp
		//obj.setFechaRegistro(new Date());
		
		Autor objSalida = autorService.insertaAutor(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		} else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	
	
	
	
	
	

	
}
