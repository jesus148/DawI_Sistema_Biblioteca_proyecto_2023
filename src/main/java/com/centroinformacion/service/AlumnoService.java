package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Alumno;

public interface AlumnoService {

	public abstract List<Alumno> listaTodos();
	
	//PC2
	public abstract Alumno insertaActualizaAlumno(Alumno objAlumno);
	public abstract List<Alumno> listaPorNombreApellidoLike(String filtro);
	public abstract void eliminaAlumnoPorId(int idAlumno);
	public abstract Optional<Alumno> listaAlumnoPorId(int idAlumno);
	
	//VALIDACIONES REGISTRAR
	public abstract List<Alumno> listaPorNombreApellidoIgual(String nombre, String apellido);
	
	public abstract List<Alumno> listaAlumnoPorTelefonoDiferenteSiMismo(String telefono, int idAlumno);
	public abstract List<Alumno> listaAlumnoPorDniDiferenteSiMismo(String dni, int idAlumno);
	public abstract List<Alumno> listaAlumnoPorCorreoDiferenteSiMismo(String correo, int idAlumno); 
	
	//VALIDACIONES ACTUALIZAR
	public abstract List<Alumno> listaPorNombreApellidoIgualActualiza(String nombre, String apellido, int idAlumno);
	
	//public abstract List<Alumno> listaAlumnoPorTelefonoDiferenteSiMismoActualiza(String telefono, int idAlumno);
	//public abstract List<Alumno> listaAlumnoPorDniDiferenteSiMismoActualiza(String dni, int idAlumno);
	//public abstract List<Alumno> listaAlumnoPorCorreoDiferenteSiMismoActualiza(String correo, int idAlumno);
	
	//PC1
	public abstract Alumno insertaAlumno(Alumno obj);
	
	//agregado en clase
	public abstract List<Alumno> buscaPorTelefono(String telefono);
	public abstract List<Alumno> buscaPorDni(String dni);
	
	//agregado para el crud
	public abstract Alumno actualizaAlumno(Alumno obj);
	public abstract List<Alumno> listaPorNombreLike(String nombre);
	public abstract Optional<Alumno> buscaAlumno(int idAlumno);

}
