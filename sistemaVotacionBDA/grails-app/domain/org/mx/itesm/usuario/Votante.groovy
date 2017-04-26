package org.mx.itesm.usuario

class Votante {

	String id_CURP
	String nombre
	String apellido1
	String apellido2
	String f_nac
	String calle
	String delegacion
	String ciudad
	String codigoPostal

    static constraints = {
    	
    	id_CURP blank:false, unique:true
    	nombre blank:false
    	apellido1 blank:false
    	apellido2 blank:false
    	f_nac blank:false
    	calle blank:false
    	delegacion blank:false
    	ciudad blank:false
    	codigoPostal blank:false
    }
}
