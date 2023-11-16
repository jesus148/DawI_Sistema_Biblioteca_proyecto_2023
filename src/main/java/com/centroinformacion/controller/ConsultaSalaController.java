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

import com.centroinformacion.entity.Sala;
import com.centroinformacion.service.SalaService;

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
public class ConsultaSalaController {
	@Autowired
	private SalaService service;

	@GetMapping("/consultaSala")
	@ResponseBody
	public List<Sala> consulta (int idSala,String numero, int piso, int numAlumnos,String recursos, int estado,int idTipoSala, int idSede ){
		List<Sala> lstSalida = service.listaConsultaSala( idSala, "%"+numero+"%", piso, numAlumnos, "%"+ recursos+"%", estado, idTipoSala, idSede );
		return lstSalida;
	}

	
	@GetMapping("/reporteSalaPdf")
	@ResponseBody
	public void report(HttpServletRequest request, HttpServletResponse response,
			int paramidSala, 
			String paramnumero, 
			int parampiso, 
			int paramnumAlumnos,
			String paramrecursos,
			boolean paramestado,
			int paramidTipoSala,
			int paramidSede) {
		try {
	
			List<Sala> lstSalida = service.listaConsultaSala(
															    paramidSala, 
																"%"+paramnumero+"%", 
																parampiso, 
																paramnumAlumnos,
																paramrecursos,
																paramestado?1:0,
																paramidTipoSala,		
																paramidSede);
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lstSalida);
																				
			//PASO 2: Obtener el archivo que contiene el diseño del reporte
			String fileDirectory = request.getServletContext().getRealPath("/WEB-INF/reportes/reporteSede.jasper");		
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
