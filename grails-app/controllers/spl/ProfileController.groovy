package spl

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class ProfileController {
	def springSecurityService
	
	def index = {
		redirect(action: "profile")
	}
	
	// VIEW PROFILE
	def profile = {
		def user = springSecurityService.currentUser
		def registrationList = user.registrations
		[userInstance: user, registrationInstanceList: registrationList]
	}
	
	// EDIT PROFILE
	def edit = {
		def user = springSecurityService.currentUser
		[userInstance: user]
	}
	
	// UPDATE PROFILE
	def update = {
		def user = springSecurityService.currentUser
		def registrationList = user.registrations
		user.username = params.username
		user.email = params.email
		user.messageNotification = params.messageNotification
		if (   params.oldPassword != "" 
			|| params.newPassword != "" 
			|| params.confirmNewPassword != "") {
			
			if (springSecurityService.encodePassword(
				params.oldPassword) == user.password && 
				params.newPassword == params.confirmNewPassword &&
				!user.hasErrors() && user.save(flush: true)) {
					user.password = springSecurityService.encodePassword(params.newPassword)
					flash.message = "Your profile information has been updated."
					redirect(action: "profile")
			} else {
				flash.message = "Either your old password is incorrect, or your new password is invalid."
				redirect(action: "edit")
			}
		} else if (!user.hasErrors() && user.save(flush: true)) {
			flash.message = "Your profile information has been updated."
			redirect(action: "profile")
		}
	}
	
	// USER'S MATCHES
	def matches = {
		def user = springSecurityService.currentUser
		def entry
		def matchesList = []
		if ((user != null) && (user.registrations.toArray().size() != 0)) {
			entry = user.registrations.toArray().first()
			matchesList = entry.matches.toArray().sort{[it.matchNumber]}
		}
		[matchesInstanceList: matchesList, entryInstance: entry]
	}
	
	// REPORT SCORE
	def reportScore = {
		def user = springSecurityService.currentUser
		def match = Match.get(params.id)
		if (!SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
			if (!match.accessAllowed(user)) {
				flash.message = "You are unauthorized to view this match"
				redirect(action: "matches")
			} else if (match.played) {
				flash.message = "The score for this match has already been reported"
				redirect(action: "matches")
			}
		}
		[matchInstance: match]
	}
	
	// DISPUTE SCORE
	def disputeScore = {
		def match = Match.get(params.id)
		[matchInstance: match]
	}
	
	def submitScore = {
		def match = Match.get(params.id)
		def players = match.entries.toArray()
		def gameWinnerId = new String[match.bestOf] 
		def expectNull = false
		def foundScoreError = false
		def forfeitWinner = null
		Integer winThreshold = (match.bestOf/2) + 1
		Integer[] playerWins
		playerWins = new Integer[players.size()]
		for (_i in 0..players.size()-1) {
			playerWins[_i] = 0
		}
		if (params.forfeit) {
			for (_game in 1..match.bestOf) {
				if (params."game${_game}" != 'null') {
					flash.message = "If your opponent forfeited, please change all winner columns to \'Not Played\'"
					foundScoreError = true
				}
			}	
			if (params.forfeitWinner == 'null') {
				flash.message = "Please specify a winner of the forfeited match"
				foundScoreError = true
			}
		} else {
			for (_game in 1..match.bestOf) {
				if (!foundScoreError
					&& (    expectNull && (params."game${_game}" != 'null')
					    || !expectNull && (params."game${_game}" == 'null'))) {
					flash.message = "Please fix the result for game ${_game}"
					foundScoreError = true
				}
				if (!foundScoreError) {
					if (params."game${_game}" != 'null') {
						for (_i in 0..players.size()-1) {
							if (players[_i].id == Registration.get(params."game${_game}").id) {
								playerWins[_i]++
							}
							if (playerWins[_i] >= winThreshold) {
								expectNull = true
							}
						}
						gameWinnerId[_game-1] = params."game${_game}" 
					}
				}
			}
		}
		if (foundScoreError) {
			redirect(action: "reportScore", id: match.id)
		} else {
			for (_i in 0..match.bestOf-1) {
				match.games[_i].winner = Registration.get(gameWinnerId[_i])
				match.games[_i].linkToVod = params."linkToVod${_i+1}"
			}
			match.forfeit = params.forfeit
			match.played = true
			if (params.forfeit) {
				match.winner = Registration.get(params.forfeitWinner)
				match.loserScore = 0
			} else {
				match.updateResult()
			}
			if (match.hasErrors() || !match.save(flush: true)) {
				flash.message = "Unable to save match results, please contact admin"
				redirect(action: "reportScore", id: match.id)
			} else {
				for (_entry in match.entries) {
					_entry.updateMatchGameStats()
					if (_entry.hasErrors() || !_entry.save(flush: true)) {
						flash.message = "Unable to update player stats after results reported, please contact admin"
					} else {
						flash.message = "Successfully reported match result"
					}
				}
				redirect(controller: "navigation", action: "matchDetails", id: params.id)
			}
		}
	}
	
	// INTERNAL MESSAGING 
	def listThreads = {
		def user = springSecurityService.currentUser
		def threadList = MessageThread.findAllByToUserOrFromUser(user, user)
		def total = threadList.toArray().size()
		def range
		if (!params.max) params.max = 10
		if (!params.offset) params.offset = 0
		if (total > 0) {
			if (params.offset.toInteger()+params.max.toInteger() > total) {
				range = [params.offset.toInteger()..total-1]
			} else {
				range = [params.offset.toInteger()..(params.offset.toInteger()+params.max.toInteger()-1)]
			}
			threadList = threadList.toArray().sort{it.lastSentMessage}.reverse().getAt(range)
		}
		[userInstance: user, threadInstanceList: threadList, threadInstanceTotal: total, currentUser:user]
	}
	
	def listMessages = {
		def user = springSecurityService.currentUser
		def thread = MessageThread.get(params.id)
		if (!thread.accessAllowed(user)) {
			flash.message = "You are unauthorized to see this thread."
			redirect(action: "listThreads")
		}
		
		def messageList = thread.messages
		messageList.toArray()
		for (_message in messageList) {
			_message.unreadTo = (user.id == _message.toUser.id) ? false : _message.unreadTo
			_message.unreadFrom = (user.id == _message.fromUser.id) ? false : _message.unreadFrom
		}
		thread.unreadTo = (user.id == thread.toUser.id) ? false : thread.unreadTo
		thread.unreadFrom = (user.id == thread.fromUser.id) ? false : thread.unreadFrom
		thread.save(flush:true)
		[messageInstanceList: messageList.sort{it.dateCreated}, threadInstance: thread, userInstance:user]
	}
	
	def addMessageToThread = {
		def user = springSecurityService.currentUser
		def thread = MessageThread.get(params.id)
		def other_user = (thread.toUser.id == user.id) ? thread.fromUser : thread.toUser
		if (!thread.accessAllowed(user)) {
			flash.message = "You are unauthorized to reply to this thread."
			redirect(action: "listThreads")
		}
		
		def message = new Message(fromUser:user, toUser:other_user)
		render(template: "replyToThread", model: [threadInstance: thread, messageInstance: message])
	}
	
	def newThread = {
		def fromUser = springSecurityService.currentUser
		def toUser = User.get(params.id)
		def message = new Message(fromUser: fromUser, toUser: toUser)
		def thread = new MessageThread(fromUser: fromUser, toUser: toUser)
		[threadInstance: thread, messageInstance: message]
	}
	
	def saveThread = {
		def toUser = User.get(params.toUser)
		def fromUser = User.get(params.fromUser)
		def thread = new MessageThread(fromUser: fromUser, toUser: toUser, subject: params.subject)
		def message = new Message(fromUser: fromUser, toUser: toUser, text: params.body)
		thread.addToMessages(message)
		//BOZO: should add collision protection
		if (!thread.hasErrors() && thread.save(flush: true)) {
			if (toUser.messageNotification) sendMailNotification(message)
			flash.message = "Successfully sent message!"
			redirect(action: "listMessages", id: thread.id)
		} else {
			flash.message = "Subject/Body cannot be blank!"
			redirect(action: "newThread", id: toUser.id)
		}
	}
	
	def updateThread = {
		def user = springSecurityService.currentUser
		def thread = MessageThread.get(params.id)
		def toUser = User.get(params.toUser)
		def fromUser = User.get(params.fromUser)
		def message = new Message(fromUser: fromUser, toUser: toUser, text:params.replyMessage, thread:thread)
		thread.addToMessages(message)
		//BOZO: should add collision protection
		if (!thread.hasErrors() && thread.save(flush: true)) {
			if (toUser.messageNotification) sendMailNotification(message)
			flash.message = "Successfully sent message!"
			redirect(action: "listMessages", id: thread.id)
		} else {
			flash.message = "Body cannot be blank!"
			redirect(action: "listMessages", id: thread.id)
		}
	}
	
	private void sendMailNotification(Message message) {
		sendMail {
			to "${message.toUser.email}"
			from "No-Reply <no-reply@starplayersleague.com>"
			subject "StarPlayers League: You have a message from ${message.fromUser.username}"
			html( view:"/htmlEmails/sendMailNotificationTemplate",
				model:[messageInstance: message])
		}
	}
}