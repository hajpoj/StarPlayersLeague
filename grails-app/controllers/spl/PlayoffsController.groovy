package spl

import grails.plugins.springsecurity.Secured
@Secured(['ROLE_ADMIN'])
class PlayoffsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [playoffsInstanceList: Playoffs.list(params), playoffsInstanceTotal: Playoffs.count()]
    }

    def create = {
        def playoffsInstance = new Playoffs()
        playoffsInstance.properties = params
        return [playoffsInstance: playoffsInstance]
    }

    def save = {
        def playoffsInstance = new Playoffs(params)
        if (playoffsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'playoffs.label', default: 'Playoffs'), playoffsInstance.id])}"
            redirect(action: "show", id: playoffsInstance.id)
        }
        else {
            render(view: "create", model: [playoffsInstance: playoffsInstance])
        }
    }

    def show = {
        def playoffsInstance = Playoffs.get(params.id)
        if (!playoffsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playoffs.label', default: 'Playoffs'), params.id])}"
            redirect(action: "list")
        }
        else {
            [playoffsInstance: playoffsInstance]
        }
    }

    def edit = {
        def playoffsInstance = Playoffs.get(params.id)
        if (!playoffsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playoffs.label', default: 'Playoffs'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [playoffsInstance: playoffsInstance]
        }
    }

    def update = {
        def playoffsInstance = Playoffs.get(params.id)
        if (playoffsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (playoffsInstance.version > version) {
                    
                    playoffsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'playoffs.label', default: 'Playoffs')] as Object[], "Another user has updated this Playoffs while you were editing")
                    render(view: "edit", model: [playoffsInstance: playoffsInstance])
                    return
                }
            }
            playoffsInstance.properties = params
            if (!playoffsInstance.hasErrors() && playoffsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'playoffs.label', default: 'Playoffs'), playoffsInstance.id])}"
                redirect(action: "show", id: playoffsInstance.id)
            }
            else {
                render(view: "edit", model: [playoffsInstance: playoffsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playoffs.label', default: 'Playoffs'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def playoffsInstance = Playoffs.get(params.id)
        if (playoffsInstance) {
            try {
                playoffsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'playoffs.label', default: 'Playoffs'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'playoffs.label', default: 'Playoffs'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playoffs.label', default: 'Playoffs'), params.id])}"
            redirect(action: "list")
        }
    }
}
