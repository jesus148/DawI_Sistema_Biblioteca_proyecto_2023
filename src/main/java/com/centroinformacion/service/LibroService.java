package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Libro;

public interface LibroService {
	public abstract Libro insertaLibro(Libro obj);
	public abstract List<Libro> buscaPorTitulo (String libro);
	public abstract List<Libro> listaPorTituloLike (String filtro);
	public abstract Libro actualizaLibro(Libro obj);
	public abstract Optional<Libro> buscaLibro(int idLibro);

}