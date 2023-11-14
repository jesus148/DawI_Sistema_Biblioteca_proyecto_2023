package com.centroinformacion.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.service.AutorService;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.apachecommons.CommonsLog;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
@CommonsLog
public class AutorConsultaController {

	
	//SERIVCIO
	@Autowired
	private AutorService autorService;
	
	

	
	
	
	// 2 PARA LOS COMBOS ESTAN EN EL UTILCONTROLLER
	
	
	
	
	
	
	
	
	

	
	
	//METODO PARA CONSULTRAR O FILTRAR SEGUN SEA LOS PARAMETRO DEL JSPM , ESTO ES PARA LISTAR EN LA TABLA
	@GetMapping("/consultaEmpleado")
	@ResponseBody                   //parametro iguales en el jsp
	public List<Autor> consulta (int estado, 
									int idPais, 
									 int idGrado  ,
									String nomApe, 
									//DE LA DATA DEL JSP convertimos en date
									@DateTimeFormat(pattern = "yyyy-MM-dd") Date desde,
									@DateTimeFormat(pattern = "yyyy-MM-dd") Date hasta){
		//metodo lista y lo guarda en un list
		List<Autor> lstSalida = autorService.listaConsultaAutorCompleja(estado, idPais,idGrado, "%"+nomApe+"%", desde, hasta);
		
		return lstSalida;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	//METODO PARA LISTAR EN EL JSP DEL REPORT
	//request es la peticion del usuario , response es la respuesta
	@GetMapping("/reporteAutorPdf")      //name de los inputs del jsp deben ser igual
	public void reporte(HttpServletRequest request, HttpServletResponse response, boolean paramEstado, int paramPais ,int paramGrado ,
			String paranomApe,
			//esos date del jsp le damos un formato segun la bd
			 @DateTimeFormat(pattern ="yyyy-MM-dd") Date paramDesde ,  @DateTimeFormat(pattern ="yyyy-MM-dd") Date paramHasta ) {
		
		try {
			
			
			//PASO 1 OBTENER DATA SOURCE q va genera el reporte 
			//OSEA UN LISTADO EN EL REPORT DEL JSP PARA EL PDF PERO SEGUN LOS PARAMETROS DEL JSP , OSEA LOS RESULTADOS DE ESA CONSULTA
			List<Autor> lstSalida = autorService.listaConsultaAutorCompleja(
					//paramEstado es bool si esta marcado vale 1 y si no 0
					paramEstado?1:0, paramPais,paramGrado , "%"+paranomApe+"%", paramDesde,paramHasta);
			
			
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lstSalida);
			
			//PASO 2: Obtener el archivo que contiene el diseño del reporte
			///ReporteEmpleados.jasper NOMBRE DEL JASPER REPORT EN > reportes el paquete
			//ruta src> webapp> reportes 
			String fileDirectory = request.getServletContext().getRealPath("/WEB-INF/reportes/ReporteAutores.jasper");
			log.info(">>> " + fileDirectory);//imprimiendo la ruta
			FileInputStream stream   = new FileInputStream(new File(fileDirectory));//convierte en 
			
			
			
			//PARA LA FOTO CON EL PARAMETRRO EN EL JASPEREPORT DEBE SER IGUAL EN EL PARAMETRO
			//poner la ruta de la foto debe ser igual 
			String  fileLogo = request.getServletContext().getRealPath("/WEB-INF/img/Logo.jpg");
			//PASO 3: Parámetros adicionales , hasmap de javautil
			Map<String,Object> params = new HashMap<String,Object>();
			//NOMBRE DEL PARAMETRO CREATE EN EL PARAMETER EN TU JASPER REPORT DEBE SER IGUAL 
			params.put("LOGO", fileLogo);
		
			
			
			
			//PASO 4: Enviamos dataSource, diseño y parámetros para generar el PDF
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(stream);
			//lo une todo el diseño , parametros extras(foto), ya la data
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);//crea el reporte
			
			
			//PASO 5: Enviar el PDF generado
			response.setContentType("application/x-pdf");
		    response.addHeader("Content-disposition", "attachment; filename=ReporteAutores.pdf"); //pdf
			

			OutputStream outStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
