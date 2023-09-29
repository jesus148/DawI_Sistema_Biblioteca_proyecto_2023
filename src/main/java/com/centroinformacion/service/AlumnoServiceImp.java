package com.centroinformacion.service;

import java.util.List;

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

}
