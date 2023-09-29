package com.centroinformacion.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.repository.AutorRepository;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class AutorServiceImpl implements AutorService {

	
	
	 //CONEXION AL REPOSITORIO
	@Autowired
	private AutorRepository repository;
	//METODOS DE LA INTERFACE
	
	
	//metodo para insertar y del repo elige el metodo y retorna 1 objeto 
	@Override
	public Autor insertaAutor(Autor obj) {
		
		return repository.save(obj);
	}
	
	
	
	
	//metodo para buscar y no repetir proveedor
//	ojo : tambien buscarPorNombre(String nombres) en el parametro se debe poner el atributo tal como esta en la clase guia osea nombres
	@Override
	public List<Autor> buscarPorNombre(String nombres) {
		
		
		return repository.findByNombresIgnoreCase(nombres);
	}



	
	//metodo para buscar manera personalizda

	@Override
	public List<Autor> buscaPorNombreSegundo(String nombre) {
	
		return repository.buscaPorNombre(nombre);
	}
	
	
	
	
	

}
