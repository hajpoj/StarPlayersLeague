package spl

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class LeagueController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [leagueInstanceList: League.list(params), leagueInstanceTotal: League.count()]
    }

    def create = {
        def leagueInstance = new League()
        leagueInstance.properties = params
        return [leagueInstance: leagueInstance]
    }

    def save = {
        def leagueInstance = new League(params)
        if (leagueInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'league.label', default: 'League'), leagueInstance.id])}"
            redirect(action: "show", id: leagueInstance.id)
        }
        else {
            render(view: "create", model: [leagueInstance: leagueInstance])
        }
    }

    def show = {
        def leagueInstance = League.get(params.id)
        if (!leagueInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'league.label', default: 'League'), params.id])}"
            redirect(action: "list")
        }
        else {
            [leagueInstance: leagueInstance]
        }
    }

    def edit = {
        def leagueInstance = League.get(params.id)
        if (!leagueInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'league.label', default: 'League'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [leagueInstance: leagueInstance]
        }
    }

    def update = {
        def leagueInstance = League.get(params.id)
        if (leagueInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (leagueInstance.version > version) {
                    
                    leagueInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'league.label', default: 'League')] as Object[], "Another user has updated this League while you were editing")
                    render(view: "edit", model: [leagueInstance: leagueInstance])
                    return
                }
            }
            leagueInstance.properties = params
            if (!leagueInstance.hasErrors() && leagueInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'league.label', default: 'League'), leagueInstance.id])}"
                redirect(action: "show", id: leagueInstance.id)
            }
            else {
                render(view: "edit", model: [leagueInstance: leagueInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'league.label', default: 'League'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def leagueInstance = League.get(params.id)
        if (leagueInstance) {
            try {
                leagueInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'league.label', default: 'League'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'league.label', default: 'League'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'league.label', default: 'League'), params.id])}"
            redirect(action: "list")
        }
    }
}
