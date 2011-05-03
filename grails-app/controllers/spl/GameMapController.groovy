package spl

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class GameMapController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [gameMapInstanceList: GameMap.list(params), gameMapInstanceTotal: GameMap.count()]
    }

    def create = {
        def gameMapInstance = new GameMap()
        gameMapInstance.properties = params
        return [gameMapInstance: gameMapInstance]
    }

    def save = {
        def gameMapInstance = new GameMap(params)
        if (gameMapInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'gameMap.label', default: 'GameMap'), gameMapInstance.id])}"
            redirect(action: "show", id: gameMapInstance.id)
        }
        else {
            render(view: "create", model: [gameMapInstance: gameMapInstance])
        }
    }

    def show = {
        def gameMapInstance = GameMap.get(params.id)
        if (!gameMapInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gameMap.label', default: 'GameMap'), params.id])}"
            redirect(action: "list")
        }
        else {
            [gameMapInstance: gameMapInstance]
        }
    }

    def edit = {
        def gameMapInstance = GameMap.get(params.id)
        if (!gameMapInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gameMap.label', default: 'GameMap'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [gameMapInstance: gameMapInstance]
        }
    }

    def update = {
        def gameMapInstance = GameMap.get(params.id)
        if (gameMapInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (gameMapInstance.version > version) {
                    
                    gameMapInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'gameMap.label', default: 'GameMap')] as Object[], "Another user has updated this GameMap while you were editing")
                    render(view: "edit", model: [gameMapInstance: gameMapInstance])
                    return
                }
            }
            gameMapInstance.properties = params
            if (!gameMapInstance.hasErrors() && gameMapInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'gameMap.label', default: 'GameMap'), gameMapInstance.id])}"
                redirect(action: "show", id: gameMapInstance.id)
            }
            else {
                render(view: "edit", model: [gameMapInstance: gameMapInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gameMap.label', default: 'GameMap'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def gameMapInstance = GameMap.get(params.id)
        if (gameMapInstance) {
            try {
                gameMapInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'gameMap.label', default: 'GameMap'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'gameMap.label', default: 'GameMap'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gameMap.label', default: 'GameMap'), params.id])}"
            redirect(action: "list")
        }
    }
}
