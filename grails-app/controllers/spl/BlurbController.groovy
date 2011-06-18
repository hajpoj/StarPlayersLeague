package spl
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class BlurbController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [blurbInstanceList: Blurb.list(params), blurbInstanceTotal: Blurb.count()]
    }

    def create = {
        def blurbInstance = new Blurb()
        blurbInstance.properties = params
        return [blurbInstance: blurbInstance]
    }

    def save = {
        def blurbInstance = new Blurb(params)
        if (blurbInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'blurb.label', default: 'Blurb'), blurbInstance.id])}"
            redirect(action: "show", id: blurbInstance.id)
        }
        else {
            render(view: "create", model: [blurbInstance: blurbInstance])
        }
    }

    def show = {
        def blurbInstance = Blurb.get(params.id)
        if (!blurbInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'blurb.label', default: 'Blurb'), params.id])}"
            redirect(action: "list")
        }
        else {
            [blurbInstance: blurbInstance]
        }
    }

    def edit = {
        def blurbInstance = Blurb.get(params.id)
        if (!blurbInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'blurb.label', default: 'Blurb'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [blurbInstance: blurbInstance]
        }
    }

    def update = {
        def blurbInstance = Blurb.get(params.id)
        if (blurbInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (blurbInstance.version > version) {
                    
                    blurbInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'blurb.label', default: 'Blurb')] as Object[], "Another user has updated this Blurb while you were editing")
                    render(view: "edit", model: [blurbInstance: blurbInstance])
                    return
                }
            }
            blurbInstance.properties = params
            if (!blurbInstance.hasErrors() && blurbInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'blurb.label', default: 'Blurb'), blurbInstance.id])}"
                redirect(action: "show", id: blurbInstance.id)
            }
            else {
                render(view: "edit", model: [blurbInstance: blurbInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'blurb.label', default: 'Blurb'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def blurbInstance = Blurb.get(params.id)
        if (blurbInstance) {
            try {
                blurbInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'blurb.label', default: 'Blurb'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'blurb.label', default: 'Blurb'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'blurb.label', default: 'Blurb'), params.id])}"
            redirect(action: "list")
        }
    }
}
