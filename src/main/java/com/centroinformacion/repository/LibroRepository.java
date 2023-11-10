package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Libro;

public interface LibroRepository extends JpaRepository<Libro, Integer> {
	
	public abstract List<Libro> findByTituloIgnoreCase(String titulo);
	@Query("select x from Libro x where x.titulo like ?1")
	public abstract List<Libro> listaPorTituloLike(String filtro);
	@Query("select x from Libro x where x.titulo = ?1 and x.idLibro != ?2")
	public abstract List<Libro> buscaPorTituloyIdLibro(String filtro, int id);
	
	public abstract List<Libro> findBySerieIgnoreCase(String serie);
	@Query("select x from Libro x where x.serie like ?1 and x.idLibro != ?2")
	public abstract List<Libro> buscaPorSerieyIdLibro(String serie, int id);
	
	
	//Consulta
		@Query("select l from Libro l where "
				+ "( l.estado = ?1)  and "
				+ "( ?2 = -1  or l.categoriaLibro.idDataCatalogo = ?2 ) and "
				+ "( ?3 = -1  or l.tipoLibro.idDataCatalogo = ?3 ) and "
				+ "( ?4 = -1  or l.estadoPrestamo.idDataCatalogo = ?4 ) and "
				+ "( l.titulo like ?5) and"
				+ "( l.serie like ?6 ) and"
				+ "( ?7 = -1  or l.anio = ?7 )") 
		public abstract List<Libro> listaConsultaLibro(int estado, int idCategoriaLibro, int idTipoLibro, int idEstadoPrestamo, String titulo, String serie,  int anio);
}
