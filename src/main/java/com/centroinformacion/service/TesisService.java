package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.Tesis;

public interface TesisService {
	
	public abstract Tesis insertaTesis(Tesis obj);
	public  List<Tesis> buscaPorTitulo(String titulo);
	

}
