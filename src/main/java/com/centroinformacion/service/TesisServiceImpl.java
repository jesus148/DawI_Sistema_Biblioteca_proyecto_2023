package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Tesis;
import com.centroinformacion.repository.TesisRepository;

@Service
public class TesisServiceImpl implements TesisService{

	@Autowired
	private TesisRepository repository;
	
	@Override
	public Tesis insertaTesis(Tesis obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

	@Override
	public List<Tesis> buscaPorTitulo(String titulo) {
		// TODO Auto-generated method stub
		return repository.buscaPorTitulo(titulo);
	}

	//los ultimos 3 metodos creado del crud 
	@Override
	public Tesis actualizaTesis(Tesis obj) {		
		return repository.save(obj);
	}

	@Override
	public List<Tesis> listaPorTituloLike(String filtro) {
		
		return repository.listaPorTituloLike(filtro);
	}

	@Override
	public Optional<Tesis> buscaTesis(int idTesis) {
		
		return repository.findById(idTesis);
	}

	@Override
	public List<Tesis> buscaPorTituloActualiza(String titulo, int idTesis) {

		return repository.buscaPorTituloActualiza(titulo, idTesis);
	}

	


}
