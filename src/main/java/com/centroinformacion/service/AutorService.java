package com.centroinformacion.service;

import com.centroinformacion.entity.Autor;
import java.util.List;

public interface AutorService {

	
	
	public abstract Autor insertaAutor(Autor obj);
	
	public abstract List<Autor> buscarPorNombre(String nombre);
	
	
	
}
