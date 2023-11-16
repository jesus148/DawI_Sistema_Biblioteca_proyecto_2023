package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Sala;

public interface SalaRepository extends JpaRepository<Sala, Integer> {

	@Query("select x from Sala x where x.numero = ?1")
	public List<Sala> findByNumero(String numero);
	
	@Query("select x from Sala x where x.numero like ?1")
	public List<Sala> listaPorNumeroLike(String filtro);
	
	@Query("select x from Sala x where x.numero like %?1%")
	public abstract List<Sala> buscaIdNumero(String numero);

	
	/*@Query("select s from Libro s where "
			+ "( s.estado = ?1)  and "
			+ "( s.idSala = ?2 ) and "
			+ "( s.numero = ?3)  and "
			+ "( s.piso =   ?4)  and "
			+ "( s.numAlumnos = ?5) and "
			+ "( s.recursos = ?6  ) and "
			+ "( ?7 = -1  or s.tipoSala.idDataCatalogo = ?7 ) and "
			+ "( ?8 = -1  or s.idSede.idDataCatalogo = ?8 ) and") 
	public abstract List<Sala> listaConsultaSala(int estado,int idSala,String numero, int piso, int numAlumnos,String recursos,int idTipoSala, int idSede );
	*/
}
