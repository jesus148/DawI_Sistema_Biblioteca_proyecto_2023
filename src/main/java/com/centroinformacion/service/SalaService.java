package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Sala;

public interface SalaService {
	
	public abstract Sala insertaSala(Sala obj);
	
	public abstract List<Sala>listaPorNumero(String numero);
	public abstract List<Sala> listaPorNumeroLike(String filtro);
	
	public abstract List<Sala> buscaIdNumero(String numero);

	
	public abstract Sala actualizarSala(Sala obj);
	public abstract Optional<Sala> buscaSala (int idSala);
	

}
