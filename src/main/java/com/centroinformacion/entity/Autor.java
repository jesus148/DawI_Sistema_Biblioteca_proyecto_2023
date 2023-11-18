package com.centroinformacion.entity;

import java.text.SimpleDateFormat;
import java.util.Date;



import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;







import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;





import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "autor")
@AllArgsConstructor
@NoArgsConstructor
public class Autor {
  
	
	//join column : especifica la columna
		//@ManyToOne : indicar la relacion
	//PARA USAR EN EL REPORTE DEBE SER IGUAL LOS ATRIBUTOS Y SUS TIPOS DE DATOS EN LOS FIELDS , ADEMAS LOS METODOS GET DEBE SER IGUAL 

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idAutor;
	
	private String nombres;
	private String apellidos;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd" , timezone = "America/Lima")
	private Date fechaNacimiento;
	
	private String telefono;
	
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
	private Date fechaRegistro;

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
	private Date fechaActualizacion;
	
	private int estado;

	
//	PARA LOS COMBOS 
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idPais")  //idPais es la columna = a la bd
	private Pais pais;  //la clase Pais se almacena en pais

	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idGrado")//idGrado es la columna = a la bd
	private DataCatalogo grado;//la clase guia DataCatalogo se almacena en grado
	
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idUsuarioRegistro")
	private Usuario usuarioRegistro;
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idUsuarioActualiza")
	private Usuario usuarioActualiza;
	
	
	
	
	
	//ATRIBUTOS IGUAL EN EL JASPER REPÓRT EN LOS FIELDS / recorsar sin el get y la primera en minuscula
	//estos metodos devuelven tipo de dato string , por lo tanto en los fields debe ser string tambien 	
	public String getReporteEstado() {
		return estado == 1? "Activo" : "Inactivo";
		
	}
	
	
	
	public String getReportePais() {
		return pais.getIdPais() + "- "+  pais.getNombre();
		
	}
	
	
	
	
	public String getReporteGrado() {
		return grado.getIdDataCatalogo() + "- "+  grado.getDescripcion();
		
	}
	
	
	public String getReporteFechaNacimiento() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(fechaNacimiento);
		
	}
	
	
	
	
	
}
