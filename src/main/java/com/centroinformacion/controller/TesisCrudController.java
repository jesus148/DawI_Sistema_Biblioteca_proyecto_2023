package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Tesis;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.TesisService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

@Controller
public class TesisCrudController {
	
	@Autowired
	private TesisService service;
	
	@GetMapping("/consultaCrudTesis")
	@ResponseBody
	public List<Tesis> consulta(String filtro){
		return service.listaPorTituloLike("%"+filtro+"%");
	}
		
	@PostMapping("/registraCrudTesis")
	@ResponseBody
	public Map<?, ?> registra(Tesis obj, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		Tesis objSalida = service.insertaTesis(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			List<Tesis> lista = service.listaPorTituloLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Registro exitoso");
		}
		return map;
	}
	
	@PostMapping("/actualizaCrudTesis")
	@ResponseBody
	public Map<?, ?> actualiza(Tesis obj, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>();

		Optional<Tesis> opt = service.buscaTesis(obj.getIdTesis());
		obj.setFechaRegistro(opt.get().getFechaRegistro());
		obj.setEstado(opt.get().getEstado());
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioActualiza(objUsuario);
		obj.setUsuarioRegistro(opt.get().getUsuarioRegistro());
		Tesis objSalida = service.actualizaTesis(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Tesis> lista = service.listaPorTituloLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Actualización exitosa");
		}
		return map;
	}

	@ResponseBody
	@PostMapping("/eliminaCrudTesis")
	public Map<?, ?> elimina(int id, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>();

		Tesis objTesis = service.buscaTesis(id).get();
		objTesis.setFechaActualizacion(new Date());
		objTesis.setEstado(objTesis.getEstado() == 1 ? 0 : 1);
		objTesis.setUsuarioActualiza(objUsuario);
		Tesis objSalida = service.actualizaTesis(objTesis);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Tesis> lista = service.listaPorTituloLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	
	@GetMapping("/buscaTesisPorTituloActualiza")
	@ResponseBody
	public String validaTitulo(String titulo, int idTesis){
		List<Tesis> lstTesis = service.buscaPorTituloActualiza(titulo,  idTesis);
		
		if(CollectionUtils.isEmpty(lstTesis)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
}
