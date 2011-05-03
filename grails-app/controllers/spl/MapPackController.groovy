package spl

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class MapPackController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [mapPackInstanceList: MapPack.list(params), mapPackInstanceTotal: MapPack.count()]
    }

    def create = {
        def mapPackInstance = new MapPack()
        mapPackInstance.properties = params
        return [mapPackInstance: mapPackInstance]
    }

    def save = {
        def mapPackInstance = new MapPack(params)
        if (mapPackInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'mapPack.label', default: 'MapPack'), mapPackInstance.id])}"
            redirect(action: "show", id: mapPackInstance.id)
        }
        else {
            render(view: "create", model: [mapPackInstance: mapPackInstance])
        }
    }

    def show = {
        def mapPackInstance = MapPack.get(params.id)
        if (!mapPackInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapPack.label', default: 'MapPack'), params.id])}"
            redirect(action: "list")
        }
        else {
            [mapPackInstance: mapPackInstance]
        }
    }

    def edit = {
        def mapPackInstance = MapPack.get(params.id)
        if (!mapPackInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapPack.label', default: 'MapPack'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [mapPackInstance: mapPackInstance]
        }
    }

    def update = {
        def mapPackInstance = MapPack.get(params.id)
        if (mapPackInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (mapPackInstance.version > version) {
                    
                    mapPackInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'mapPack.label', default: 'MapPack')] as Object[], "Another user has updated this MapPack while you were editing")
                    render(view: "edit", model: [mapPackInstance: mapPackInstance])
                    return
                }
            }
            mapPackInstance.properties = params
            if (!mapPackInstance.hasErrors() && mapPackInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'mapPack.label', default: 'MapPack'), mapPackInstance.id])}"
                redirect(action: "show", id: mapPackInstance.id)
            }
            else {
                render(view: "edit", model: [mapPackInstance: mapPackInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapPack.label', default: 'MapPack'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def mapPackInstance = MapPack.get(params.id)
        if (mapPackInstance) {
            try {
                mapPackInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'mapPack.label', default: 'MapPack'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'mapPack.label', default: 'MapPack'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapPack.label', default: 'MapPack'), params.id])}"
            redirect(action: "list")
        }
    }
}
