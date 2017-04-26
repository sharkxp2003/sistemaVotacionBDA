package org.mx.itesm.usuario

import static org.springframework.http.HttpStatus.*

class VotanteController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	static scaffold = Votante

    def index() {
    	respond Votante.list(params), model:[VotanteCount: Votante.count()]
    }

    def show (Votante votante) {
    	respond votante
    }

    def create() {
    	respond new Votante(params)
    }

    def save(Votante votante) {
    	if (votante == null) {
    		render status: HttpStatus.NOT_FOUND
    		return
    	}

    	if (votante.hasErrors()) {
    		respond votante.errors, view: 'create'
    		return
    	}

    	votante.save flush:true

    	request.withFormat {
    		form multipartForm {redirect votante}
    		'*' {respond votante, status: HttpStatus.CREATED}
    	}
    }

    def edit(Votante votante) {
    	respond votante
    }

    def update(Votante votante) {

    	if (votante == null) {
    		render status: HttpStatus.NOT_FOUND
    		return
    	}

    	if (votante.hasErrors()) {
    		respond votante.errors, view: 'edit'
    		return
    	}

    	votante.save flush:true

    	request.withFormat {
    		form multipartForm {redirect votante}
    		'*' {respond votante, status: HttpStatus.OK}
    	}

    }

}
