package spl

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class MessageThreadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [messageThreadInstanceList: MessageThread.list(params), messageThreadInstanceTotal: MessageThread.count()]
    }

    def create = {
        def messageThreadInstance = new MessageThread()
        messageThreadInstance.properties = params
        return [messageThreadInstance: messageThreadInstance]
    }

    def save = {
        def messageThreadInstance = new MessageThread(params)
        if (messageThreadInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'messageThread.label', default: 'MessageThread'), messageThreadInstance.id])}"
            redirect(action: "show", id: messageThreadInstance.id)
        }
        else {
            render(view: "create", model: [messageThreadInstance: messageThreadInstance])
        }
    }

    def show = {
        def messageThreadInstance = MessageThread.get(params.id)
        if (!messageThreadInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageThread.label', default: 'MessageThread'), params.id])}"
            redirect(action: "list")
        }
        else {
            [messageThreadInstance: messageThreadInstance]
        }
    }

    def edit = {
        def messageThreadInstance = MessageThread.get(params.id)
        if (!messageThreadInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageThread.label', default: 'MessageThread'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [messageThreadInstance: messageThreadInstance]
        }
    }

    def update = {
        def messageThreadInstance = MessageThread.get(params.id)
        if (messageThreadInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (messageThreadInstance.version > version) {
                    
                    messageThreadInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'messageThread.label', default: 'MessageThread')] as Object[], "Another user has updated this MessageThread while you were editing")
                    render(view: "edit", model: [messageThreadInstance: messageThreadInstance])
                    return
                }
            }
            messageThreadInstance.properties = params
            if (!messageThreadInstance.hasErrors() && messageThreadInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'messageThread.label', default: 'MessageThread'), messageThreadInstance.id])}"
                redirect(action: "show", id: messageThreadInstance.id)
            }
            else {
                render(view: "edit", model: [messageThreadInstance: messageThreadInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageThread.label', default: 'MessageThread'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def messageThreadInstance = MessageThread.get(params.id)
        if (messageThreadInstance) {
            try {
                messageThreadInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'messageThread.label', default: 'MessageThread'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'messageThread.label', default: 'MessageThread'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageThread.label', default: 'MessageThread'), params.id])}"
            redirect(action: "list")
        }
    }
}
