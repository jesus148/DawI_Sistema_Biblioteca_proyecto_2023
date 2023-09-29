package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.Alumno;

public interface AlumnoService {

	public abstract List<Alumno> listaTodos();
	
	public abstract Alumno insertaAlumno(Alumno obj);
	
	//agregado en clase
	public abstract List<Alumno> buscaPorTelefono(String telefono);
	public abstract List<Alumno> buscaPorDni(String dni);

}
