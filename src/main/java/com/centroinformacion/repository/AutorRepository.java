package com.centroinformacion.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

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
	//CONSULTA DE SPRING
	public abstract List<Autor> findByNombresIgnoreCase(String nombres);	
	
	
	
	
	
	
	
	
	//esto es lo mismo de arriba pero personalizdados
	
	//estas consulta son para las clases en java es como mysql pero para las clases
	//poner igual a ala clases guias
	@Query("select x from Autor x where x.nombres=?1")
	public List<Autor>  buscaPorNombre(String nombre);
	
	
	
	
	
	
	
	
	

	
	
	//CRUD 

	
	//METODO PARA LISTAR ALL EN LA TABLA , CONSULTA PERSONALIZADA
	//lista , 1 se refiere al primer parametro (osea los q ingresan)
	@Query("select x from Autor x where x.nombres like ?1")    
	public List<Autor> listaPorNombreLike(String nombres);
	
	
	
	//OTRA FORMA DE LISTAR
	public List<Autor> findByNombresLike(String nombres);
	
	
	
	//METODO PARA NO PERMITIR REGISTRAR AUTOR Q TENGAN EL MISMO NOMBRE O APELLIDO
	@Query("select e from Autor e where e.nombres = ?1 and e.apellidos = ?2 ")
	public List<Autor> listaEmpleadoPorNombreApellidoIgual(String nombres, String apellidos);
	
	
	
	
	//METODO BUSCA POR DNI Y NOMBRE
	//METODO NO PERMITE REGISTRAR EMPLEADOS CON EL MISMO TELEFONO
	@Query("select e from Autor e where e.nombres = ?1 and e.telefono = ?2 ")
	public List<Autor> listaEmpleadoPorNombreTelefonoIgual(String nombres, String telefono);
	

	
	
	
	
	
	
	
	
	
	
	
	
	
    //CONSULTA PERSONALIZADA COMPLEJA 
	//CONSULTA COMPLEJA AUTOR SEMANA 12
	//Consulta
	@Query("select e from Autor e where "
			+ "( e.estado = ?1)  and "
			+ "( ?2 = -1  or e.pais.idPais = ?2 ) and "
			+ "( ?3 = -1 or e.grado.idDataCatalogo = ?3) and "
			+ "( e.nombres like ?4 or e.apellidos like ?4 ) and"
			+ "( e.fechaNacimiento >= ?5 ) and"
			+ "( e.fechaNacimiento <= ?6 )") 
	public abstract List<Autor> listaConsultaAutorCompleja(int estado, int idPais,int idGrado, String nomApe, Date fecDesde, Date fecHasta);
	
	
	
	

}
