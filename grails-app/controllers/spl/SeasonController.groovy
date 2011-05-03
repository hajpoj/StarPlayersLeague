package spl

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class SeasonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [seasonInstanceList: Season.list(params), seasonInstanceTotal: Season.count()]
    }

    def create = {
        def seasonInstance = new Season()
        seasonInstance.properties = params
        return [seasonInstance: seasonInstance]
    }

    def save = {
        def seasonInstance = new Season(params)
        if (seasonInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'season.label', default: 'Season'), seasonInstance.id])}"
            redirect(action: "show", id: seasonInstance.id)
        }
        else {
            render(view: "create", model: [seasonInstance: seasonInstance])
        }
    }

    def show = {
        def seasonInstance = Season.get(params.id)
        if (!seasonInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'season.label', default: 'Season'), params.id])}"
            redirect(action: "list")
        }
        else {
            [seasonInstance: seasonInstance]
        }
    }

    def edit = {
        def seasonInstance = Season.get(params.id)
        if (!seasonInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'season.label', default: 'Season'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [seasonInstance: seasonInstance]
        }
    }

    def update = {
        def seasonInstance = Season.get(params.id)
        if (seasonInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (seasonInstance.version > version) {
                    
                    seasonInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'season.label', default: 'Season')] as Object[], "Another user has updated this Season while you were editing")
                    render(view: "edit", model: [seasonInstance: seasonInstance])
                    return
                }
            }
            seasonInstance.properties = params
            if (!seasonInstance.hasErrors() && seasonInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'season.label', default: 'Season'), seasonInstance.id])}"
                redirect(action: "show", id: seasonInstance.id)
            }
            else {
                render(view: "edit", model: [seasonInstance: seasonInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'season.label', default: 'Season'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def seasonInstance = Season.get(params.id)
        if (seasonInstance) {
            try {
                seasonInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'season.label', default: 'Season'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'season.label', default: 'Season'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'season.label', default: 'Season'), params.id])}"
            redirect(action: "list")
        }
    }
}
