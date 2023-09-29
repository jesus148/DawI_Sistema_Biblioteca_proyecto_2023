package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Tesis;

public interface TesisRepository extends JpaRepository<Tesis, Integer> {

	
	@Query("select x from Tesis x where x.titulo = ?1")
	public  List<Tesis> buscaPorTitulo(String titulo);
	//1 alude al primer parametro, orden de los parametros  
	//?2 aludiria al segundo parametro 
	@Query("select x from Tesis x where x.titulo like ?1")
	public List<Tesis> listaPorTituloLike(String filtro);
}
