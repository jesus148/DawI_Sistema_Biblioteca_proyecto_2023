package com.centroinformacion.controller;

import org.springframework.stereotype.Controller;
import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;

import com.centroinformacion.entity.Autor;

import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AutorService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

import java.util.List;
import org.springframework.util.CollectionUtils;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;



/*
    @author Jesus Huaman
    202014378
*/


@Controller
public class RegistraAutorController {
	
	
	
	//recordar no subir el password
	
	
	
	

	//para registrar , AutorService se almacena en autorService
	@Autowired
	private AutorService autorService;
	
	
	
	
	


	//PARA REGISTRAR
	@PostMapping("/registrarAutor")
	@ResponseBody
	public Map<?, ?> registra(Autor obj, HttpSession session){
		
		//obtiene de la sesion activa del usuario trae objUsuario todo de ese usuario logueado
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		
		
	
		//de esa data del jsp le agregamos + datos  a la 
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setEstado(AppSettings.ACTIVO);
//le enviamos todo el objeto(usuario) spring se encarga de mandarle solo el id o la columna de la tabla guia , osea la q nesecita en la bd
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		HashMap<String, String> map = new HashMap<String, String>();
		//inserta
		Autor objAutor = autorService.insertaAutor(obj);
		//datos de regreso
		if (objAutor == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	//PARA BUSCAR Y VERIFICAR QUE NO SE REPITAN LOS NOMBRE DE los autores 
//	ojo : tambien alidaNombre(String nombres) en el parametro se debe poner el atributo tal como esta en la clase guia
	@GetMapping("/buscaPorAutor")
	@ResponseBody
	public String validaNombre(String nombres) {
		//pregunta si lo encuentra
		List<Autor> lstAutor = autorService.buscarPorNombre(nombres);
		
		//si esta vacio y no lo encuentra ese nombre then sale true ,esta listo pa registrar
		if (CollectionUtils.isEmpty(lstAutor)) {
			return "{\"valid\" : true }";  //retorna true listo para registrar
		} else {
			return "{\"valid\" : false }"; //retorna false ya se encuentra
		}
	}
	
	
	
	
	
	
	

	
}
