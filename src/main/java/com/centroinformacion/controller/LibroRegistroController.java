package com.centroinformacion.controller;
/**
 * @author Esteffany Huamanraime Maquin
 * 14092023
 */
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.DataCatalogo;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.LibroService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

@Controller
public class LibroRegistroController {

	@Autowired
	private LibroService libroService;
	
	@PostMapping("/registraLibro")
	@ResponseBody
	public Map<?, ?> registra(Libro obj, HttpSession session){
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		DataCatalogo objDataCatalogo = new DataCatalogo();
		objDataCatalogo.setIdDataCatalogo(27);
		obj.setEstadoPrestamo(objDataCatalogo);
		
		HashMap<String, String> map = new HashMap<String, String>();
		Libro objSalida = libroService.insertaLibro(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	@GetMapping("/buscaLibroPorTitulo")
	@ResponseBody
	public String validaTitulo(String titulo){
		List<Libro> lstLibro = libroService.buscaPorTitulo(titulo);
		if(CollectionUtils.isEmpty(lstLibro)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
}
