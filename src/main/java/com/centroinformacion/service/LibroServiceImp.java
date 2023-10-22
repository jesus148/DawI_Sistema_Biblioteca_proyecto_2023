package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

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
	@Override
	public List<Libro> buscaPorTitulo(String libro) {
		
		return repository.findByTituloIgnoreCase(libro);
		}
	@Override
	public Optional<Libro> buscaLibro(int idLibro) {
		// TODO Auto-generated method stub
		return repository.findById(idLibro);
	}
	@Override
	public List<Libro> listaPorTituloLike(String filtro) {
		// TODO Auto-generated method stub
		return repository.listaPorTituloLike(filtro);
	}
	@Override
	public Libro actualizaLibro(Libro obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}
	@Override
	public List<Libro> buscaPorIdyTitulo(String libro, int idLibro) {
		// TODO Auto-generated method stub
		return repository.buscaPorTituloyIdLibro(libro, idLibro);
	}
	@Override
	public List<Libro> buscaPorSerie(String serie) {
		// TODO Auto-generated method stub
		return repository.findBySerieIgnoreCase(serie);
	}
	@Override
	public List<Libro> buscaPorIdySerie(String serie, int idLibro) {
		// TODO Auto-generated method stub
		return repository.buscaPorSerieyIdLibro(serie, idLibro);
	}
}
