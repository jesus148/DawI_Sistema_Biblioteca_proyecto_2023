package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Alumno;

public interface AlumnoRepository extends JpaRepository<Alumno, Integer> {

	public abstract List<Alumno> findByOrderByApellidosAsc();

	// @Query("select e from Alumno e where e.nombres like ?1 or e.apellidos like ?1 or e.dni like ?")
	@Query("select e from Alumno e where (e.nombres like ?1 or e.apellidos like ?1) or (LENGTH(e.dni) = 8 and e.dni like ?1)")
	public List<Alumno> listaAlumnoNombreApellidoLike(String filtro);
	
	//VALIDACIONES PARA REGISTRAR
	@Query("select e from Alumno e where e.nombres = ?1 and e.apellidos = ?2")
	public List<Alumno> listaAlumnoNombreApellidoIgual(String nombre, String apellido);
	
	@Query("select e from Alumno e where e.telefono = ?1 and e.idAlumno <> ?2")
	public List<Alumno> listaPorTelefonoDiferenteSiMismo(String telefono, int idCliente);
	
	@Query("select e from Alumno e where e.dni = ?1 and e.idAlumno <> ?2")
	public List<Alumno> listaPorDniDiferenteSiMismo(String dni, int idCliente);

	@Query("select e from Alumno e where e.correo = ?1 and e.idAlumno <> ?2")
	public List<Alumno> listaPorCorreoDiferenteSiMismo(String correo, int idCliente);
	
	
	//VALIDACIONES PARA ACTUALIZAR
	@Query("select e from Alumno e where e.nombres = ?1 and e.apellidos = ?2 and e.idAlumno != ?3")
	public List<Alumno> listaAlumnoNombreApellidoIgualActualiza(String nombre, String apellido, int idAlumno);
	
	@Query("select e from Alumno e where e.telefono = ?1 and e.idAlumno <> ?2 and e.idAlumno != ?3")
	public List<Alumno> listaPorTelefonoDiferenteSiMismoActualiza(String telefono, int idCliente);
	
	@Query("select e from Alumno e where e.dni = ?1 and e.idAlumno <> ?2 and e.idAlumno != ?3")
	public List<Alumno> listaPorDniDiferenteSiMismoActualiza(String dni, int idCliente);
	
	@Query("select e from Alumno e where e.correo = ?1 and e.idAlumno <> ?2 and e.idAlumno != ?3")
	public List<Alumno> listaPorCorreoDiferenteSiMismoActualiza(String correo, int idCliente);
	
	// agregado en clase
	public abstract List<Alumno> findByTelefonoIgnoreCase(String telefono);

	public abstract List<Alumno> findByDniIgnoreCase(String dni);

	// agregado para el crud con JPQL
	@Query("select x from Alumno x where x.nombres like ?1")
	public abstract List<Alumno> listaPorNombreLike(String filtro);

}
