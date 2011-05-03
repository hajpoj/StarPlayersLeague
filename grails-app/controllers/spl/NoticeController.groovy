package spl
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class NoticeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [noticeInstanceList: Notice.list(params), noticeInstanceTotal: Notice.count()]
    }

    def create = {
        def noticeInstance = new Notice()
        noticeInstance.properties = params
        return [noticeInstance: noticeInstance]
    }

    def save = {
        def noticeInstance = new Notice(params)
        if (noticeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'notice.label', default: 'Notice'), noticeInstance.id])}"
            redirect(action: "show", id: noticeInstance.id)
        }
        else {
            render(view: "create", model: [noticeInstance: noticeInstance])
        }
    }

    def show = {
        def noticeInstance = Notice.get(params.id)
        if (!noticeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notice.label', default: 'Notice'), params.id])}"
            redirect(action: "list")
        }
        else {
            [noticeInstance: noticeInstance]
        }
    }

    def edit = {
        def noticeInstance = Notice.get(params.id)
        if (!noticeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notice.label', default: 'Notice'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [noticeInstance: noticeInstance]
        }
    }

    def update = {
        def noticeInstance = Notice.get(params.id)
        if (noticeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (noticeInstance.version > version) {
                    
                    noticeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'notice.label', default: 'Notice')] as Object[], "Another user has updated this Notice while you were editing")
                    render(view: "edit", model: [noticeInstance: noticeInstance])
                    return
                }
            }
            noticeInstance.properties = params
            if (!noticeInstance.hasErrors() && noticeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'notice.label', default: 'Notice'), noticeInstance.id])}"
                redirect(action: "show", id: noticeInstance.id)
            }
            else {
                render(view: "edit", model: [noticeInstance: noticeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notice.label', default: 'Notice'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def noticeInstance = Notice.get(params.id)
        if (noticeInstance) {
            try {
                noticeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'notice.label', default: 'Notice'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'notice.label', default: 'Notice'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notice.label', default: 'Notice'), params.id])}"
            redirect(action: "list")
        }
    }
}
