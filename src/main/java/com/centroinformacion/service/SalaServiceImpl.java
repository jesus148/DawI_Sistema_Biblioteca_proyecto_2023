package com.centroinformacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Sala;
import com.centroinformacion.repository.SalaRepository;

@Service
public class SalaServiceImpl implements SalaService{
	
	@Autowired
	private SalaRepository repository;

	@Override
	public Sala insertaSala(Sala obj) {
		return repository.save(obj);
		
	}

}
