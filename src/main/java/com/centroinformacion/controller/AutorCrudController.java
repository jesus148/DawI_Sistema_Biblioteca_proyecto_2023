package com.centroinformacion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.service.AutorService;
import com.centroinformacion.util.AppSettings;


import jakarta.servlet.http.HttpSession;

import com.centroinformacion.entity.Usuario;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import lombok.extern.apachecommons.CommonsLog;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.web.bind.annotation.ResponseBody;


//@CommonsLog : para imprimier por consola

@CommonsLog
@Controller
public class AutorCrudController {
	
	

	
	//ESTE CONTROLLER ES PARA EL CRUD AUTOR 
	
	//SERIVCIO
	@Autowired
	private AutorService autorService;
	
	
	
	
	
	
	
	
	
	// 2 PARA LOS COMBOS ESTAN EN EL UTILCONTROLLER
	
	
	
	
	
	
	
	
	
	

	
	//3
	@PostMapping("/registraCrudAutor")
	@ResponseBody
	public Map<?, ?> registra(Autor obj, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		//obtiene de la sesion activa del usuario trae objUsuario todo de ese usuario logueado
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		
		//DATOS QUE AGREGAMOS AL OBJ RECIBIDO DEL FORM
		obj.setEstado(AppSettings.ACTIVO);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());  
		//le enviamos todo el objeto(usuario) spring se encarga de mandarle solo el id o la columna de la tabla guia , osea la q nesecita en la bd
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		
		
		//ESTO PARA QUE NO RGISTRE UN AUTOR MISMO NOMBRE Y APELLIDO SALDRA UN ALERT AL BUSCAR 
		//METODO PARA NO PERMITIR REGISTRAR EMPLEADO Q TENGAN EL MISMO NOMBRE O APELLIDO
		List<Autor> lstSalida = autorService.listaPorNombreApellidoIgual(obj.getNombres(), obj.getApellidos());
		//CollectionUtils.isEmpty : dara true si esta vacio y false si esta lleno
		if (!CollectionUtils.isEmpty(lstSalida)) {
			map.put("mensaje", "El Autor " + obj.getNombres() + " " + obj.getApellidos() + " ya existe");
			
			
			
			//IGUAL SI N0 LO ENCUENTRA LO VUELVE A LISTAR s
             List<Autor> lista = autorService.listaPorNombresLike("%%");
 			//es para listar 
 			map.put("lista", lista);


			return map; //FINALIZA EL PROCESO
		}
		
		
		
	
		
		//DEL SERIVCE INSERTA CON EL METODO
		Autor objSalida = autorService.insertaAutor(obj);
		
		
		//DATOS DE RETORNO Y LISTA NUEVAMENTE
		if (objSalida == null) {
			//"mensaje" : mensaje debe ser igual en el jsp
			map.put("mensaje", "Error en el registro");
		} else {
			
			List<Autor> lista = autorService.listaPorNombresLike("%%");
			

			
			int nombre=lista.get( lista.size() -1).getPais().getIdPais();
			
			log.info(">> nombre pais >> " + nombre);
			//es para listar 
			map.put("lista", lista);
			//esto es el mensaje
			map.put("mensaje", "Registro exitoso");
		}
		return map;
	}


	
	
	
	
	
	
	
	
	
	

	
	//4
	@PostMapping("/actualizaCrudAutor")
	@ResponseBody
	public Map<?, ?> actualiza(Autor obj) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		  
		//BUSCA EL OBJETO MODALIDAD                                         atraves de su id de ese obj recibido del jsp
		Optional<Autor> optAutor= autorService.buscaAutor(obj.getIdAutor());
		
		//MODIFICAMOS CIERTOS CAMPOS y LO AGREGAMOS AL NUEVO OBJ DEL JSP
		obj.setFechaRegistro(optAutor.get().getFechaRegistro());//mismo fcha registro
	obj.setEstado(optAutor.get().getEstado());
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioActualiza(optAutor.get().getUsuarioActualiza());
		obj.setUsuarioRegistro(optAutor.get().getUsuarioRegistro());
		
	
		
		
		
	
		
		
		
		
		
		
		//ACTUALIZAMOS MODALIDAD
		Autor objSalida = autorService.actualizaAutor(obj);
		
		
		//DATOS DE REGRESO
	   if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			//LISTA OTRA VEZ
			List<Autor> lista = autorService.listaPorNombreLike("%%");
			map.put("lista", lista);
			map.put("mensaje", "Actualización exitosa");
			
		}
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//5
		@ResponseBody
		@PostMapping("/eliminaCrudAutor")
		public Map<?, ?> elimina(int id) { //recibe el id la fila del objeto
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			//busca el objeto Autor , optional pq puede o no encontrarlo
			Autor objAutor= autorService.buscaAutor(id).get();
			
			//luego de econtrarlo modificar el estado y fec actualizacion 
			objAutor.setFechaActualizacion(new Date());  
			objAutor.setEstado( objAutor.getEstado() == 1 ? 0 : 1);
			
			//luego ya modificado lo actualizamos 
			Autor objSalida = autorService.actualizaAutor(objAutor);
			
			//DATOS DE REGRESO
			if (objSalida == null) {
				map.put("mensaje", "Error en actualizar");
			} else {
				//lista de nuevo 
				List<Autor> lista = autorService.listaPorNombreLike("%%");
				//"lista" variable se almacena todo List<Modalidad> lista
				map.put("lista", lista);
			}
			return map;
		}

	
		
		
		
		
		
		
		
		
		
		
	
    //6
		
	@GetMapping("/consultaCrudAutor")
	@ResponseBody
	public List<Autor> consulta(String filtro) {
		return autorService.listaPorNombreLike("%"+filtro+"%");
	}

	
	
	
	
	

	
	//7
	@GetMapping("/buscaEmpleadoMayorEdad")
	@ResponseBody
	public String validaFecha(String fechaNacimiento) {
		log.info(">> validaFecha >> " + fechaNacimiento);
		
		
		//CONVIRTIENDO DE STRING A DATE
		//Convierte de String a Date con 1 formato segun la bd, del jsp recibe como string  x eso
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date fechaIngresada = null;
		//recordar cuando convertimos de string a date recomendable usar try catch
		try {
			fechaIngresada =  sdf.parse(fechaNacimiento);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		
		
//		Java Calendar getInstance()
//		El método getInstance() de la clase java.util.Calendar es un método estático. Este método se utiliza con el objeto de calendario
//		para obtener la instancia del calendario de acuerdo con la zona horaria actual establecida por el entorno de ejecución de Java.
//		Obtiene una instancia de un calendario, bien sea la instancia por defecto si no le especificamos anda o bien la instancia que se asocie 
//		a la TimeZone o el Locale que le pasemos como parámetro.
		
		
		//Se obtiene la fecha limite del mayor de edad
		 //esto obtiene la fecha actual(saldra en este formato mycal1 :Mon Oct 16 16:59:01 IST 2023 ) , segun tu zona horaria
		Calendar cal = Calendar.getInstance();
		int anioActual = cal.get(Calendar.YEAR); // de cal fecha actual quiero solo el año de esa fecha
//		El método set(int calndr_field , int new_val ) en la clase Calendar se usa para establecer el valor de calndr_field en new_val. 
//		El campo anterior de este calendario será reemplazado por un campo nuevo.
//		Parámetros: el método toma dos parámetros:
//
//			(Calendar.YEAR : Este es de tipo Calendario y se refiere al campo del calendario que se va a modificar.
//			anioActual - 18 : Esto se refiere al nuevo valor con el que se reemplazará.(2023- 18)
		cal.set(Calendar.YEAR, anioActual - 18);
		Date fechaMayorEdadLimite = cal.getTime(); //16/10/2005
		
		//VERIFICA SI ES MAYOR DE EDAD
		if(fechaIngresada.before(fechaMayorEdadLimite)) {
			return "{\"valid\":true}";//SI LA fecha ingresa es antes del  //5/10/2005 entonces es mayor y registra
		}else {
			return "{\"valid\":false}"; // y sino no lo registra
		}
	}
	
	
	
	
	
	
	
	
	
     //8
	//METODO BUSCA POR DNI Y NOMBRE
	//METODO NO PERMITE REGISTRAR EMPLEADOS CON EL MISMO TELEFONO
	@GetMapping("/listaEmpleadoPorNombreTelefonoIgual")
	@ResponseBody
	public String listaEmpleadoPorNombreTelefonoIgual(String nombres, String telefono) {
		
		List<Autor> lstSalida = autorService.listaEmpleadoPorNombreTelefonoIgual(
				nombres, 
				telefono);
		
		if(lstSalida.isEmpty()) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
