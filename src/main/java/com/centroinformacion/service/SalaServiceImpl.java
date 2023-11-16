package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Sala;
import com.centroinformacion.repository.SalaRepository;

@Service
public class SalaServiceImpl implements SalaService{
	
	@Autowired
	private SalaRepository repository;

	@Override
	public Sala insertaSala(Sala obj) {
		return repository.save(obj);
		
	}

	@Override
	public List<Sala> listaPorNumero(String numero) {
		return repository.findByNumero(numero);
	}

	@Override
	public List<Sala> listaPorNumeroLike(String filtro) {
		
		return repository.listaPorNumeroLike(filtro);
	}

	@Override
	public Sala actualizarSala(Sala obj) {
		return repository.save(obj);
	}

	@Override
	public Optional<Sala> buscaSala(int idSala) {
		
		return repository.findById(idSala);
	}

	@Override
	public List<Sala> buscaIdNumero(String numero) {
		// TODO Auto-generated method stub
		return repository.buscaIdNumero(numero);
	}

	@Override
	public List<Sala> listaConsultaSala(int idSala,String numero, int piso, int numAlumnos,String recursos, int estado,int idTipoSala, int idSede ) {
		return repository.listaConsultaSala(estado, idSala, numero, piso, numAlumnos, recursos, idTipoSala, idSede);
	}

	

	
}
