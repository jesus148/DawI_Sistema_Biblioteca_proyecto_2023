package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.centroinformacion.entity.Autor;


public interface AutorRepository  extends JpaRepository<Autor, Integer>{
	
	
	
	

	
	//public abstract List<Proveedor> findByNombreIgnoreCase(String nombre);	
	
	
	//Metodo busca en el nombre de provvedor y no se repita 
	
	//explicacion  findByFirstnameIgnoreCase (este el metodo de guia)
	//nombre es atribtuo o campo que usare para buscar en la tabla de la bd ,en la tabla y en la clase esta en minuscula , pero en el metodo
	//findByNombreIgnoreCase , ahi lo ponemos en mayuscula (Nombre)  y lo relaciona el metodo guia de spring para buscar 
	//este metodo findByNombreIgnoreCase: 
	//ademas distinguen entre mayúsculas y minúsculas. En otras palabras, las comparaciones de valores de campo distinguen entre mayúsculas y minúsculas.
	//  la palabra clave IgnoreCase garantiza que las coincidencias de la consulta no distingan entre mayúsculas y minúsculas.
	//ademas recordar q este metodo retorna los datos encontrados en 1 lista
	
	
//	ojo : tambien (String nombres) en el parametro se debe poner el atributo tal como esta en la clase guia
	
	public abstract List<Autor> findByNombresIgnoreCase(String nombres);	

}
