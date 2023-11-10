package com.centroinformacion.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Libro;
import com.centroinformacion.service.LibroService;

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
public class LibroConsultaController {
	@Autowired
	private LibroService libroService;

	@GetMapping("/consultaLibro")
	@ResponseBody
	public List<Libro> consulta (int estado, 
			int idCategoria, 
			int idTipo, 
			int idEstadoLibro, 
			String titulo, 
			String serie,  
			String anio){
		int anioNumero;
		if (anio==""){
			anioNumero = -1;
		}
		else {
			anioNumero = Integer.parseInt(anio);
		}
		List<Libro> lstSalida = libroService.listaConsultaLibro(estado, idCategoria, idTipo, idEstadoLibro,"%"+titulo+"%","%"+serie+"%",anioNumero);
		
		return lstSalida;
	}

	
	@GetMapping("/reporteLibroPdf")
	@ResponseBody
	public void report(HttpServletRequest request, HttpServletResponse response,
			boolean paramEstado,
			int paramCategoria, 
			int paramTipo, 
			int paramEstadoPrestamo, 
			String paramTitulo,
			String paramSerie,
			String paramAnio) {
		try {
			int anioNumero;
			if (paramAnio==""){
				anioNumero = -1;
			}
			else {
				anioNumero = Integer.parseInt(paramAnio);
			}

			//PASO 1: Obtener el dataSource que va generar el reporte
			List<Libro> lstSalida = libroService.listaConsultaLibro(paramEstado?1:0, 
																		paramCategoria, 
																		paramTipo, 
																		paramEstadoPrestamo, 
																			 "%"+paramTitulo+"%",
																			 "%"+paramSerie+"%", 
																			 anioNumero);
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lstSalida);
																				
			//PASO 2: Obtener el archivo que contiene el diseño del reporte
			String fileDirectory = request.getServletContext().getRealPath("/WEB-INF/reportes/ReporteLibros.jasper");		
			log.info(">> FILE >>" + fileDirectory);
			FileInputStream stream   = new FileInputStream(new File(fileDirectory));
			//PASO 3: Parámetros adicionales
			
			String fileLogo = request.getServletContext().getRealPath("/WEB-INF/img/LogoLibro.png");
			HashMap<String,Object> params = new HashMap<String,Object>();
			params.put("LOGO", fileLogo);
			
			//PASO 4: Enviamos dataSource, diseño y parámetros para generar el PDF
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(stream);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
			
			//PASO 5: Enviar el PDF generado
			response.setContentType("application/x-pdf");
		    response.addHeader("Content-disposition", "attachment; filename=ReporteEmpleados.pdf");
		    
		    OutputStream outStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		}
}
