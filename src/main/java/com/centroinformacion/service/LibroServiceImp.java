package com.centroinformacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Libro;
import com.centroinformacion.repository.LibroRepository;

@Service
public class LibroServiceImp implements LibroService{

	@Autowired	
	private LibroRepository repository;
	@Override
	public Libro insertaLibro(Libro obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}
}
