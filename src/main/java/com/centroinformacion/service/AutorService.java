package com.centroinformacion.service;

import com.centroinformacion.entity.Autor;


import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface AutorService {


	
	
	//METODOS 
	
	
	
	//metodo para registrar 
	public abstract Autor insertaAutor(Autor obj);
	
	
	
	
	
	
	
	
	//ESTOS 2 SON LO MISMO
	//metodo para buscar el nombre si ya se encuentra SQL DE SPRING 
//	ojo : tambien buscarPorNombre(String nombres) en el parametro se debe poner el atributo tal como esta en la clase guia
	public abstract List<Autor> buscarPorNombre(String nombres);
	//metodo para buscar CON SQL PARA LAS CLASES 
	public abstract List<Autor>  buscaPorNombreSegundo(String nombre);
	
	
	
	
	
	
	
	
	
	
	
	//CRUD PC2=================
	
	
	
	
	//METODO SIRVA PARA ACUTALIZAR
	public abstract Autor actualizaAutor(Autor obj);
	
	
	//METODO PARA LISTAR ALL EN LA TABLA
	public abstract List<Autor> listaPorNombreLike(String nombres);
	
	
	//OTRA FORMA DE LISTA CON METODOS DE SPRING
	public abstract List<Autor> listaPorNombresLike(String nombres);
	
	
	//METODO PARA BUSCAR MODALIDAD SEGUN EL ID
		/*
		 * Proporciona una forma clara y explícita de transmitir el mensaje de que puede
		 * que no haya un valor, sin utilizar null . Al obtener un tipo de devolución
		 * Opcional , es probable que verifiquemos si falta el valor, lo que genera
		 * menos NullPointerException en las aplicaciones. Sin embargo, el tipo Opcional
		 * no es adecuado en todos los lugares.
		 */
	
	public abstract Optional<Autor> buscaAutor(int idAutor);
	
	
	
	//METODO PARA NO PERMITIR REGISTRAR AUTOR Q TENGAN EL MISMO NOMBRE O APELLIDO
	public abstract List<Autor> listaPorNombreApellidoIgual(String nombres, String apellidos); 
	
	
	
	
	//METODO BUSCA POR DNI Y NOMBRE
	//METODO NO PERMITE REGISTRAR EMPLEADOS CON EL MISMO TELEFONO
	public abstract List<Autor> listaEmpleadoPorNombreTelefonoIgual(String nombres, String telefono);
	
	
	
	
	
	
	//CONSULTA PARA EL REPORTE CON EL JASPER PDF
	//CONSULTA COMPLEJA EMPLEADO SEMANA 12
	public abstract List<Autor> listaConsultaAutorCompleja(int estado, int idPais,int idGrado , String nomApe, Date fecDesde, Date fecHasta);
	
	
	
	
}
