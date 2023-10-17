package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Alumno;

public interface AlumnoRepository extends JpaRepository<Alumno, Integer>{
	
	public abstract List<Alumno> findByOrderByApellidosAsc();
	
	//agregado en clase
	public abstract List<Alumno> findByTelefonoIgnoreCase(String telefono);
	public abstract List<Alumno> findByDniIgnoreCase(String dni);
	
	//agregado para el crud con JPQL
	@Query("select x from Alumno x where x.nombres like ?1")
	public abstract List<Alumno> listaPorNombreLike(String filtro);

}
