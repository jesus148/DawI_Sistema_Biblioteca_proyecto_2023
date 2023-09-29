package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Tesis;

public interface TesisService {
	
	public abstract Tesis insertaTesis(Tesis obj);
	public  List<Tesis> buscaPorTitulo(String titulo);
	//agregamos metodos para el crud 
	public abstract Tesis actualizaTesis(Tesis obj);
	public abstract List<Tesis> listaPorTituloLike(String filtro);
	public abstract Optional<Tesis> buscaTesis(int idTesis);
	
	

}
