package com.centroinformacion.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.repository.AutorRepository;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class AutorServiceImpl implements AutorService {

	
	
	
	@Autowired
	private AutorRepository repository;
	
	
	@Override
	public Autor insertaAutor(Autor obj) {
		
		return repository.save(obj);
	}

	@Override
	public List<Autor> buscarPorNombre(String nombre) {
		
		
		return repository.findByNombresIgnoreCase(nombre);
	}
	
	
	
	
	

}
