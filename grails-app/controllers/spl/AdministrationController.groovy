package spl

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class AdministrationController {
	def springSecurityService
	
    def index = {
		
	}
	
	def modifyMatchResult = {
		if (params.modifyMatchId) {
			redirect(controller: 'profile', action: 'reportScore', id: params.modifyMatchId)
		} else {
			flash.message = "Please specify a match ID to modify."
			redirect(action: 'index')
		}
	}
	
	def resetMatchResult = {
		def match = Match.get(params.resetMatchId)
		if (match) {
			match.reset()
			match.save(flush: true)
		
			for (_entry in match.entries) {
				_entry.updateMatchGameStats()
				_entry.save(flush: true)
			}
			flash.message = "You successfully reset the result of match ID ${params.resetMatchId}."
			redirect(action: 'index')
		} else {
			flash.message = "Please specify match ID to reset."
			redirect(action: 'index')
		}
	}
	
	def messageUser = {
		if (params.userId != 'null') {
			redirect(controller: 'profile', action: 'newThread', id: params.userId)	
		} else {
			flash.message = "Please select someone to message."
			redirect(action: 'index')
		}
	}
	
}
