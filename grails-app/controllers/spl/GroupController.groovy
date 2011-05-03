package spl

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class GroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [groupInstanceList: Group.list(params), groupInstanceTotal: Group.count()]
    }

    def create = {
        def groupInstance = new Group()
        groupInstance.properties = params
        return [groupInstance: groupInstance]
    }

    def save = {
        def groupInstance = new Group(params)
        if (groupInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'group.label', default: 'Group'), groupInstance.id])}"
            redirect(action: "show", id: groupInstance.id)
        }
        else {
            render(view: "create", model: [groupInstance: groupInstance])
        }
    }

    def show = {
        def groupInstance = Group.get(params.id)
        if (!groupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'group.label', default: 'Group'), params.id])}"
            redirect(action: "list")
        }
        else {
            [groupInstance: groupInstance]
        }
    }

    def edit = {
        def groupInstance = Group.get(params.id)
        if (!groupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'group.label', default: 'Group'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [groupInstance: groupInstance]
        }
    }

    def update = {
        def groupInstance = Group.get(params.id)
        if (groupInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (groupInstance.version > version) {
                    
                    groupInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'group.label', default: 'Group')] as Object[], "Another user has updated this Group while you were editing")
                    render(view: "edit", model: [groupInstance: groupInstance])
                    return
                }
            }
            groupInstance.properties = params
            if (!groupInstance.hasErrors() && groupInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'group.label', default: 'Group'), groupInstance.id])}"
                redirect(action: "show", id: groupInstance.id)
            }
            else {
                render(view: "edit", model: [groupInstance: groupInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'group.label', default: 'Group'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def groupInstance = Group.get(params.id)
        if (groupInstance) {
            try {
                groupInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'group.label', default: 'Group'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'group.label', default: 'Group'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'group.label', default: 'Group'), params.id])}"
            redirect(action: "list")
        }
    }
}
