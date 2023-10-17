package com.centroinformacion.service;

import com.centroinformacion.entity.Autor;
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
	
	
	
	
	
	
	
	
	
	
	
	//CRUD PC2
	
	
	
	
	public abstract Autor actualizaAutor(Autor obj);
	public abstract List<Autor> listaPorNombreLike(String nombre);
	public abstract Optional<Autor> buscaAutor(int idAutor);
	
	
	
	
}
