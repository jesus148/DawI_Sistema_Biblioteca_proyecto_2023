package com.centroinformacion.controller;

/**
 * @author Willian Villanueva Fabian
 * 202112276
 */
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Sala;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.SalaService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

@Controller
public class SalaRegistroController {

	@Autowired
	private SalaService salaService;
	
	@PostMapping("/registraSala")
	@ResponseBody
	public Map<?, ?> registra(Sala obj, HttpSession session){
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		HashMap<String, String> map = new HashMap<String, String>();
		Sala objSala = salaService.insertaSala(obj);
		if(objSala == null) {
			map.put("MENSAJE", "ERROR EN EL REGISTRO");
		}else {
			map.put("MENSAJE", "REGISTRO EXITOSO");
		}
		return map;
		
	}
	
	
	
	
}
