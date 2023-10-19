package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.LibroService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LibroCrudController {
	@Autowired
	private LibroService service;

	@GetMapping("/consultaCrudLibro")
	@ResponseBody
	public List<Libro> consulta(String filtro) {
		return service.listaPorTituloLike("%" + filtro + "%");
	}

	@PostMapping("/actualizaCrudLibro")
	@ResponseBody
	public Map<?, ?> actualiza(Libro obj, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>();

		Optional<Libro> optLibro = service.buscaLibro(obj.getIdLibro());
		obj.setFechaRegistro(optLibro.get().getFechaRegistro());
		obj.setEstado(optLibro.get().getEstado());
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioActualiza(objUsuario);
		obj.setUsuarioRegistro(optLibro.get().getUsuarioRegistro());
		Libro objSalida = service.actualizaLibro(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Libro> lista = service.listaPorTituloLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Actualización exitosa");
		}
		return map;
	}

	@ResponseBody
	@PostMapping("/eliminaCrudLibro")
	public Map<?, ?> elimina(int id, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Libro objLibro = service.buscaLibro(id).get();
		objLibro.setFechaActualizacion(new Date());
		objLibro.setEstado(objLibro.getEstado() == 1 ? 0 : 1);
		objLibro.setUsuarioActualiza(objUsuario);
		Libro objSalida = service.actualizaLibro(objLibro);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Libro> lista = service.listaPorTituloLike("%");
			map.put("lista", lista);
		}
		return map;
	}
}
