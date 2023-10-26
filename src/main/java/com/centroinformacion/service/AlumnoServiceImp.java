package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.repository.AlumnoRepository;

@Service
public class AlumnoServiceImp implements AlumnoService {

	@Autowired
	private AlumnoRepository repository;

	@Override
	public List<Alumno> listaTodos() {
		return repository.findByOrderByApellidosAsc();
	}

	// agregado en clase
	@Override
	public Alumno insertaAlumno(Alumno obj) {
		return repository.save(obj);
	}

	public List<Alumno> buscaPorDni(String dni) {
		return repository.findByDniIgnoreCase(dni);
	}

	@Override
	public List<Alumno> buscaPorTelefono(String telefono) {
		return repository.findByTelefonoIgnoreCase(telefono);
	}

	@Override
	public Alumno actualizaAlumno(Alumno obj) {
		return repository.save(obj);
	}

	@Override
	public List<Alumno> listaPorNombreLike(String nombre) {
		return repository.listaPorNombreLike(nombre);
	}

	@Override
	public Optional<Alumno> buscaAlumno(int idAlumno) {
		return repository.findById(idAlumno);
	}

	// CRUD
	@Override
	public List<Alumno> listaPorNombreApellidoLike(String filtro) {
		return repository.listaAlumnoNombreApellidoLike(filtro);
	}

	@Override
	public Alumno insertaActualizaAlumno(Alumno objAlumno) {
		return repository.save(objAlumno);
	}

	@Override
	public void eliminaAlumnoPorId(int idAlumno) {
		repository.deleteById(idAlumno);
	}

	@Override
	public Optional<Alumno> listaAlumnoPorId(int idAlumno) {
		return repository.findById(idAlumno);
	}

	// INICIO VALIDACION REGISTRAR
	@Override
	public List<Alumno> listaPorNombreApellidoIgual(String nombre, String apellido) {
		return repository.listaAlumnoNombreApellidoIgual(nombre, apellido);
	}

	@Override
	public List<Alumno> listaAlumnoPorTelefonoDiferenteSiMismo(String telefono, int idAlumno) {
		return repository.listaPorTelefonoDiferenteSiMismo(telefono, idAlumno);
	}

	@Override
	public List<Alumno> listaAlumnoPorDniDiferenteSiMismo(String dni, int idAlumno) {
		return repository.listaPorDniDiferenteSiMismo(dni, idAlumno);
	}

	@Override
	public List<Alumno> listaAlumnoPorCorreoDiferenteSiMismo(String correo, int idAlumno) {
		return repository.listaPorCorreoDiferenteSiMismo(correo, idAlumno);
	}

	// INICIO VALIDACION ACTUALIZA
	@Override
	public List<Alumno> listaPorNombreApellidoIgualActualiza(String nombre, String apellido, int idAlumno) {
		return repository.listaAlumnoNombreApellidoIgualActualiza(nombre, apellido, idAlumno);
	}

	/*
	@Override
	public List<Alumno> listaAlumnoPorDniDiferenteSiMismoActualiza(String dni, int idAlumno) {
		return repository.listaPorDniDiferenteSiMismoActualiza(dni, idAlumno);
	}

	@Override
	public List<Alumno> listaAlumnoPorTelefonoDiferenteSiMismoActualiza(String telefono, int idAlumno) {
		return repository.listaPorTelefonoDiferenteSiMismoActualiza(telefono, idAlumno);
	}

	@Override
	public List<Alumno> listaAlumnoPorCorreoDiferenteSiMismoActualiza(String correo, int idAlumno) {
		return repository.listaPorCorreoDiferenteSiMismoActualiza(correo, idAlumno);
	}
	*/

}
