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

	@Override
	public Alumno insertaAlumno(Alumno obj) {
		return repository.save(obj);
	}

	// agregado en clase
	@Override
	public List<Alumno> buscaPorTelefono(String telefono) {
		return repository.findByTelefonoIgnoreCase(telefono);
	}
	
	@Override
	public List<Alumno> buscaPorDni(String dni) {
		return repository.findByDniIgnoreCase(dni);

	}

	//agregado para el crud
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

}
