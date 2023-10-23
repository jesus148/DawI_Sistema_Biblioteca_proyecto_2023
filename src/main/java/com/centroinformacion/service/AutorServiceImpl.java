package com.centroinformacion.service;



import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.repository.AutorRepository;


import org.springframework.beans.factory.annotation.Autowired;

@Service
public class AutorServiceImpl implements AutorService {

	
	
	 //CONEXION AL REPOSITORIO
	//nuevo
	@Autowired
	private AutorRepository repository;
	//METODOS DE LA INTERFACE
	
	
	//metodo para insertar y del repo elige el metodo y retorna 1 objeto 
	@Override
	public Autor insertaAutor(Autor obj) {
		
		return repository.save(obj);
	}
	
	
	
	
	//metodo para buscar y no repetir proveedor
//	ojo : tambien buscarPorNombre(String nombres) en el parametro se debe poner el atributo tal como esta en la clase guia osea nombres
	@Override
	public List<Autor> buscarPorNombre(String nombres) {
		
		
		return repository.findByNombresIgnoreCase(nombres);
	}



	//metodo para buscar y no repetir proveedor
	//metodo para buscar manera personalizda EN EL SPRING
    //ES LO MSIMO DE ARRIBA
	@Override
	public List<Autor> buscaPorNombreSegundo(String nombre) {
	
		return repository.buscaPorNombre(nombre);
	}



	
	
	
	//METODO PARA NO PERMITIR REGISTRAR AUTOR Q TENGAN EL MISMO NOMBRE O APELLIDO
	@Override
	public List<Autor> listaPorNombreApellidoIgual(String nombres, String apellidos) {
		return repository.listaEmpleadoPorNombreApellidoIgual(nombres, apellidos);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//METODOS PARA EL CRUD

	//METODO ACTUALIZAR PARECIDO A INSERTAR
	@Override
	public Autor actualizaAutor(Autor obj) {
		return repository.save(obj);
	}



	//METODO PARA LISTAR ALL EN LA TABLA
	@Override
	public List<Autor> listaPorNombreLike(String nombres) {
		return repository.listaPorNombreLike(nombres);
	}



	
	//OTRA FORMA DE LISTAR
	//METODO PARA LISTAR ALL EN LA TABLA
	@Override
	public List<Autor> listaPorNombresLike(String nombres) {
		return repository.findByNombresLike(nombres);
	}
	
	

	//METODO PARA BUSCAR MODALIDAD SEGUN EL ID
	@Override
	public Optional<Autor> buscaAutor(int idAutor) {
		return repository.findById(idAutor);
	}
	
	
	
	
	
	
	
	
	//METODO BUSCA POR DNI Y NOMBRE
	//METODO NO PERMITE REGISTRAR EMPLEADOS CON EL MISMO TELEFONO
	//public abstract List<Autor> listaEmpleadoPorNombreTelefonoIgual(String nombres, String telefono);
	@Override
	public List<Autor> listaEmpleadoPorNombreTelefonoIgual(String nombres, String telefono) {
		return repository.listaEmpleadoPorNombreTelefonoIgual(nombres , telefono);
	}
	
	
	
	
	
	
	
	
	
	

}
