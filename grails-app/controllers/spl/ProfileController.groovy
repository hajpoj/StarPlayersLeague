package spl

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class ProfileController {
	def springSecurityService
	
	private currentUser() {
		if (springSecurityService.loggedIn) {
			return User.get(springSecurityService.principal.id)
		} else {
			return null
		}
	}
	def index = {
		redirect(action: "profile")
	}
	
	// VIEW PROFILE
	def profile = {
		def user = currentUser()
		def registrationList = user.registrations
		[userInstance: user, registrationInstanceList: registrationList]
	}
	
	// EDIT PROFILE
	def edit = {
		def user = currentUser()
		[userInstance: user]
	}
	
	// UPDATE PROFILE
	def update = {
		def user = currentUser()
		def registrationList = user.registrations
		user.username = params.username
		user.email = params.email
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
		def user = currentUser()
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
		def user = currentUser()
		def match = Match.get(params.id)
		if (!match.accessAllowed(user)) {
			flash.message = "You are unauthorized to view this match"
			redirect(action: "matches")
		} else if (match.played) {
			flash.message = "The score for this match has already been reported"
			redirect(action: "matches")
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
		// verify that the games are consistent
		def players = match.entries.toArray()
		def player1Wins = 0
		def player2Wins = 0
		for (_game in 1..match.bestOf) {
			if (params."game${_game}" != 'null') { 
				if (players[0].id == Registration.get(params."game${_game}").id) {
					player1Wins++
				} else {
					player2Wins++
				}
				match.games[_game-1].winner = Registration.get(params."game${_game}")
			}
		}
		if (   player1Wins != (((Integer)match.bestOf/2)+1) 
			&& player2Wins != (((Integer)match.bestOf/2)+1)) {
			flash.message = "Scores are inconsistent"
			redirect(action: "reportScore", id: match.id)
		} else {
			match.played = true
			match.updateResult()
			if (match.hasErrors() || !match.save(flush: true)) {
				flash.message = "Unable to save match results, please contact admin"
				redirect(action: "reportScore", id: match.id)
			} else {
				for (_entry in match.entries) {
					_entry.updateMatchGameStats()
					if (_entry.hasErrors() || !_entry.save(flush: true)) {
						flash.message = "Unale to update player stats after results reported, please contact admin"
					} else {
						flash.message = "Successfully reported match result"
					}
				}
				redirect(action: "matches")
			}
		}
	}
	
	// INTERNAL MESSAGING 
	def listThreads = {
		def user = currentUser()
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
		def user = currentUser()
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
		def user = currentUser()
		def thread = MessageThread.get(params.id)
		def other_user = (thread.toUser.id == user.id) ? thread.fromUser : thread.toUser
		if (!thread.accessAllowed(user)) {
			flash.message = "You are unauthorized to reply to this thread."
			redirect(action: "listThreads")
		}
		
		def message = new Message(fromUser:user, toUser:other_user)
		[threadInstance: thread, messageInstance: message]
	}
	
	def newThread = {
		def fromUser = currentUser()
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
		if (!thread.hasErrors() && thread.save(flush: true)) {
			flash.message = "Successfully sent message!"
			redirect(action: "listMessages", id: thread.id)
		} else {
			flash.message = "Subject/Body cannot be blank!"
			redirect(action: "newThread", id: toUser.id)
		}
	}
	
	def updateThread = {
		def user = currentUser()
		def thread = MessageThread.get(params.id)
		def toUser = User.get(params.toUser)
		def fromUser = User.get(params.fromUser)
		def message = new Message(fromUser: fromUser, toUser: toUser, text:params.replyMessage, thread:thread)
		thread.addToMessages(message)
		if (!thread.hasErrors() && thread.save(flush: true)) {
			flash.message = "Successfully sent message!"
			redirect(action: "listMessages", id: thread.id)
		} else {
			redirect(action: "addMessageToThread", id: thread.id)
		}
	}

}