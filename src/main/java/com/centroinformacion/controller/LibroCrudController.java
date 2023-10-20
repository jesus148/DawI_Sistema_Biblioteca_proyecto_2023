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

import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.LibroService;
import com.centroinformacion.util.AppSettings;

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

	@PostMapping("/registraCrudLibro")
	@ResponseBody
	public Map<?, ?> registra(Libro obj, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		// DataCatalogo objDataCatalogo = new DataCatalogo();
		// objDataCatalogo.setIdDataCatalogo(27);
		// objDataCatalogo.setDescripcion("Disponible");
		// obj.setEstadoPrestamo(objDataCatalogo);
		HashMap<String, Object> map = new HashMap<String, Object>();

		Libro objSalida = service.insertaLibro(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			List<Libro> lista = service.listaPorTituloLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Registro exitoso");
		}
		return map;
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
	
	@GetMapping("/buscaLibroPorTituloConIdLibro")
	@ResponseBody
	public String validaTituloConIdLibro(String titulo, String id) {
		int idLibro = Integer.parseInt(id);
		List<Libro> lstLibro = service.buscaPorIdyTitulo(titulo, idLibro);
		if (CollectionUtils.isEmpty(lstLibro)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
}
