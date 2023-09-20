package com.centroinformacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Tesis;
import com.centroinformacion.repository.TesisRepository;

@Service
public class TesisServiceImpl implements TesisService{

	@Autowired
	private TesisRepository repository;
	
	@Override
	public Tesis insertaTesis(Tesis obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

}
