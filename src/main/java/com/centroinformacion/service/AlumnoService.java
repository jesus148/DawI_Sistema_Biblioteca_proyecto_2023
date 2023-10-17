package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Alumno;

public interface AlumnoService {

	public abstract List<Alumno> listaTodos();
	public abstract Alumno insertaAlumno(Alumno obj);
	
	//agregado en clase
	public abstract List<Alumno> buscaPorTelefono(String telefono);
	public abstract List<Alumno> buscaPorDni(String dni);
	
	//agregado para el crud
	public abstract Alumno actualizaAlumno(Alumno obj);
	public abstract List<Alumno> listaPorNombreLike(String nombre);
	public abstract Optional<Alumno> buscaAlumno(int idAlumno);
}
