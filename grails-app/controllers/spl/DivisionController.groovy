package spl

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class DivisionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [divisionInstanceList: Division.list(params), divisionInstanceTotal: Division.count()]
    }

    def create = {
        def divisionInstance = new Division()
        divisionInstance.properties = params
        return [divisionInstance: divisionInstance]
    }

    def save = {
        def divisionInstance = new Division(params)
        if (divisionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'division.label', default: 'Division'), divisionInstance.id])}"
            redirect(action: "show", id: divisionInstance.id)
        }
        else {
            render(view: "create", model: [divisionInstance: divisionInstance])
        }
    }

    def show = {
        def divisionInstance = Division.get(params.id)
        if (!divisionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'division.label', default: 'Division'), params.id])}"
            redirect(action: "list")
        }
        else {
            [divisionInstance: divisionInstance]
        }
    }

    def edit = {
        def divisionInstance = Division.get(params.id)
        if (!divisionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'division.label', default: 'Division'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [divisionInstance: divisionInstance]
        }
    }

    def update = {
        def divisionInstance = Division.get(params.id)
        if (divisionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (divisionInstance.version > version) {
                    
                    divisionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'division.label', default: 'Division')] as Object[], "Another user has updated this Division while you were editing")
                    render(view: "edit", model: [divisionInstance: divisionInstance])
                    return
                }
            }
            divisionInstance.properties = params
            if (!divisionInstance.hasErrors() && divisionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'division.label', default: 'Division'), divisionInstance.id])}"
                redirect(action: "show", id: divisionInstance.id)
            }
            else {
                render(view: "edit", model: [divisionInstance: divisionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'division.label', default: 'Division'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def divisionInstance = Division.get(params.id)
        if (divisionInstance) {
            try {
                divisionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'division.label', default: 'Division'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'division.label', default: 'Division'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'division.label', default: 'Division'), params.id])}"
            redirect(action: "list")
        }
    }
}
