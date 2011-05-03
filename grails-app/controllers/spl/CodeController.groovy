package spl

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class CodeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [codeInstanceList: Code.list(params), codeInstanceTotal: Code.count()]
    }

    def create = {
        def codeInstance = new Code()
        codeInstance.properties = params
        return [codeInstance: codeInstance]
    }

    def save = {
        def codeInstance = new Code(params)
        if (codeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'code.label', default: 'Code'), codeInstance.id])}"
            redirect(action: "show", id: codeInstance.id)
        }
        else {
            render(view: "create", model: [codeInstance: codeInstance])
        }
    }

    def show = {
        def codeInstance = Code.get(params.id)
        if (!codeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'code.label', default: 'Code'), params.id])}"
            redirect(action: "list")
        }
        else {
            [codeInstance: codeInstance]
        }
    }

    def edit = {
        def codeInstance = Code.get(params.id)
        if (!codeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'code.label', default: 'Code'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [codeInstance: codeInstance]
        }
    }

    def update = {
        def codeInstance = Code.get(params.id)
        if (codeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (codeInstance.version > version) {
                    
                    codeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'code.label', default: 'Code')] as Object[], "Another user has updated this Code while you were editing")
                    render(view: "edit", model: [codeInstance: codeInstance])
                    return
                }
            }
            codeInstance.properties = params
            if (!codeInstance.hasErrors() && codeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'code.label', default: 'Code'), codeInstance.id])}"
                redirect(action: "show", id: codeInstance.id)
            }
            else {
                render(view: "edit", model: [codeInstance: codeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'code.label', default: 'Code'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def codeInstance = Code.get(params.id)
        if (codeInstance) {
            try {
                codeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'code.label', default: 'Code'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'code.label', default: 'Code'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'code.label', default: 'Code'), params.id])}"
            redirect(action: "list")
        }
    }
}
