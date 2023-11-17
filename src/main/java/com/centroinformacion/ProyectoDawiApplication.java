package com.centroinformacion;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ProyectoDawiApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProyectoDawiApplication.class, args); //El atributo .class nos entrega el nombre completo de la clase
																	//incluyendo el package
	}

}
