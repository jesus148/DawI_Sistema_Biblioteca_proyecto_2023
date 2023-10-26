package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Sala;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.SalaService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

@Controller
public class SalaCrudController {
	
	@Autowired
	private SalaService service;
	
	@GetMapping("/consultaCrudSala")
	@ResponseBody
	public List <Sala> consulta(String filtro){
		return service.listaPorNumeroLike("%"+filtro+"%");
	}
	
	@PostMapping("registraCrudSala")
	@ResponseBody
	public Map <?,?> registrar(Sala obj, HttpSession session){
		
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		Sala objSalida = service.insertaSala(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			List<Sala> lista = service.listaPorNumeroLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Registro exitoso");
		}
		return map;
		
	}
	
	@PostMapping("/actualizaCrudSala")
	@ResponseBody
	public Map<?,?> actualizar(Sala obj, HttpSession session){
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>();

		Optional<Sala> opt = service.buscaSala(obj.getIdSala());
		obj.setFechaRegistro(opt.get().getFechaRegistro());
		obj.setEstado(opt.get().getEstado());
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioActualiza(objUsuario);
		obj.setUsuarioRegistro(opt.get().getUsuarioRegistro());
		Sala objSalida = service.actualizarSala(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Sala> lista = service.listaPorNumeroLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Actualización exitosa");
		}
		return map;
		
	}
	
	@ResponseBody
	@PostMapping("/eliminaCrudSala")
	public Map<?, ?> eliminar(int id, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>();

		Sala objSala = service.buscaSala(id).get();
		objSala.setFechaActualizacion(new Date());
		objSala.setEstado(objSala.getEstado() == 1 ? 0 : 1);
		objSala.setUsuarioActualiza(objUsuario);
		Sala objSalida = service.actualizarSala(objSala);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Sala> lista = service.listaPorNumeroLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@GetMapping("/buscaSalaPorNumero")
	@ResponseBody
	public String validaSala(String numero) {
		List<Sala> lstSala = service.buscaIdNumero(numero);
		if (CollectionUtils.isEmpty(lstSala)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
	

}
