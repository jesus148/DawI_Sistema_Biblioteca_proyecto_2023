package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Libro;

public interface LibroRepository extends JpaRepository<Libro, Integer> {
	
	public abstract List<Libro> findByTituloIgnoreCase(String titulo);
	@Query("select x from Libro x where x.titulo like ?1")
	public abstract List<Libro> listaPorTituloLike(String filtro);
	@Query("select x from Libro x where x.titulo like ?1 and x.idLibro != ?2")
	public abstract List<Libro> bucaPorTituloyIdLibro(String filtro, int id);
	
	
}
