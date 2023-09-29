package com.centroinformacion.service;

import com.centroinformacion.entity.Autor;
import java.util.List;

public interface AutorService {


	
	
	//METODOS 
	
	
	
	//metodo para registrar 
	public abstract Autor insertaAutor(Autor obj);
	
	
	//metodo para buscar el nombre si ya se encuentra
//	ojo : tambien buscarPorNombre(String nombres) en el parametro se debe poner el atributo tal como esta en la clase guia
	public abstract List<Autor> buscarPorNombre(String nombres);
	
	
	
	
	
	//metodo para buscar
	public abstract List<Autor>  buscaPorNombreSegundo(String nombre);
	
}
