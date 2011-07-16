package spl

import grails.plugins.springsecurity.Secured

class NavigationController {
	def springSecurityService
	
    def index = { redirect(action: "welcome") }
	
	// HOME VIEW
	def welcome = {
		def notices = Blurb.list().toArray()
		def total = notices.size()
		def range
		
		def group
		def standingsList
		def matchesList
		def codeList = Code.list().toArray().toList().sort{[-it.priority, it.name]}

		// WHY THE FUCK DO I NEED TO DO THIS:
		def codeSP = codeList.pop()
		codeList = codeList.reverse()
		codeList.push(codeSP)
		codeList = codeList.reverse()
		// END BS

		def user = springSecurityService.currentUser
		def code = Code.findByName("SP")
		def division = Division.findByNameAndCode("1", code)
		group = Group.findByNameAndDivision("A", division)
		
		standingsList = group.entries.toArray().sort{[-it.matchesWon, it.matchesLost, -it.gameDiff]}
		matchesList = group.matches.toArray().toList().sort{[it.matchNumber]}
		[codeInstanceList: codeList, standingsInstanceList: standingsList, matchesInstanceList: matchesList]
		
		if (!params.max) params.max = 5
		if (!params.offset) params.offset = 0
		if (total > 0) {
			if (params.offset.toInteger()+params.max.toInteger() > total) {
				range = [params.offset.toInteger()..total-1]
			} else {
				range = [params.offset.toInteger()..(params.offset.toInteger()+params.max.toInteger()-1)]
			}
			notices = notices.sort{it.id}.reverse().getAt(range)
		}
		[noticeInstanceList: notices, noticeInstanceTotal: total, standingsInstanceList: standingsList]
	}
	
	// MAP PACK VIEW
	def mapPack = {
		def mapPackInstance = MapPack.get(params.id)
		if (!mapPackInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapPack.label', default: 'MapPack'), params.id])}"
			redirect(action: "list")
		}
		else {
			[mapPackInstance: mapPackInstance]
		}
	}
	
	//MAP POOL VIEW
	def mapPool = {
		def gameMapInstance = GameMap.list()
		def mapPackInstance = MapPack.get(params.id)
		
		[mapPackInstance: mapPackInstance, gameMapInstanceList: gameMapInstance]
	}
	
	// STANDINGS VIEW
	def newCode = {
		if (params.code == 'null') {
			render g.select(noSelection:[null:"Select one..."])
		} else {
			def codeInstance = Code.get(params.code)
			def newDivisionList = Division.findAllByCode(codeInstance)
			render g.select(optionKey:"id",
							optionValue:"name",
							from: newDivisionList,
							id: "divisionDropdown",
							name: "divisionDropdown",
							noSelection:[null:"Select one..."],
							onchange: remoteFunction(action:"newDivision",
													 update:"groupDropdown",
													 params:"\"division=\" + this.value"))
		}
	}
	
	def newDivision = {
		if (params.division == 'null') {
			render g.select(noSelection:[null:"Select one..."])
		} else {
			def divisionInstance = Division.get(params.division)
			def newGroupList = Group.findAllByDivision(divisionInstance).toArray().sort{it.name}
			render g.select(optionKey:"id",
							optionValue:"name",
							from: newGroupList,
							id: "groupDropdown",
							name: "groupDropdown",
							noSelection:[null:"Select one..."],
							onchange: remoteFunction(action:"newGroup",
													 update:"standingsTable",
													 params:"\"group=\" + this.value"))
		}
	}
	
	def newGroup = {
		def group
		def standingsList
		def matchesList
		def quarterFinals
		def semiFinals
		def finals
		if (params.group == 'null') {
			render g.select(noSelection:[null:"Select one..."])
		} else {
			group = Group.get(params.group)
			standingsList = group.entries.toArray().sort{[-it.matchesWon, it.matchesLost, -it.gameDiff]}
			matchesList = group.matches.toArray().sort{[it.matchNumber]}
//			if (group.playoffs) {
//				matchesList = group.matches.toArray().sort{[it.id]}
//				quarterFinals = matchesList.getAt(0..3)
//				semiFinals = matchesList.getAt(4..5)
//				finals = matchesList.getAt(6..7)
//				render(template: "playoffsTemplate", model:[matchesInstanceList: matchesList, groupInstance: group, quarterFinalsInstanceList: quarterFinals, semiFinalsInstanceList: semiFinals, finalsInstanceList: finals])
//			}
//			else {
			render(template: "tableTemplate", model:[standingsInstanceList: standingsList, matchesInstanceList: matchesList, groupInstance: group])
//			}
		}
	}
	
	def standings = {
		def group
		def standingsList
		def matchesList
		def codeList = Code.list().toArray().toList().sort{[-it.priority, it.name]}

		// WHY THE FUCK DO I NEED TO DO THIS:
		def codeSP = codeList.pop()
		codeList = codeList.reverse()
		codeList.push(codeSP)
		codeList = codeList.reverse()
		// END BS

		def user = springSecurityService.currentUser
		if (params.group) { 
			group = Group.get(params.group)
		} else if ((user == null) || (user.registrations.toArray().size() == 0)) {
			def code = Code.findByName("SP")
			def division = Division.findByNameAndCode("1", code)
			group = Group.findByNameAndDivision("A", division)
		} else {
			//BOZO: this code only displays the first registration's matches
			def registration = user.registrations.toArray().first()
			group = registration.group
		}
		standingsList = group.entries.toArray().sort{[-it.matchesWon, it.matchesLost, -it.gameDiff]}
		matchesList = group.matches.toArray().toList().sort{[it.matchNumber]}
		[codeInstanceList: codeList, standingsInstanceList: standingsList, matchesInstanceList: matchesList, groupInstance: group]
	}
	
	def matchDetails = {
		def match = Match.get(params.id)
		def group = match.leagueGroup
		def division = group.division
		def code = division.code
		def season = code.season
		def league = season.league
		def server = league.server
		def groupDir = "spl_replays/${server}/${league}/${season}/${code}/${division}/${group}"
		def mapPackInstance = match.mapPack
		[matchInstance: match, groupDirInstance: groupDir]
	}
	
	// REGISTRATION VIEW
	def register = {
		
	}
	
	// LEAGUE INFO VIEW
	def info = {
	}
	
	// CONTACT US VIEW
	def contact = {
	}
	
	// FAQ VIEW
	def faq = {
	}
	
	// CHECK EMAIL VIEW
	def checkEmail = {
	}
	
	//VERIFY EMAIL ADDRESS VIEW
	def verifyEmail = {
		def user = User.get(params.id)
		def previouslyEnabled = user.enabled
		
		if(!user.enabled) {
			user.enabled = true
			if (!user.save(flush: true)){
				user.errors.each {
					println it
				}
			}
		}
		model: [previouslyEnabled  : previouslyEnabled ]
	}
	
	// CREATE ACCOUNT
	def createAccount = {
		def userInstance = new User()
		userInstance.properties = params
		return [userInstance: userInstance]
	}
	
	// SAVE ACCOUNT
	def saveAccount = {
		def userInstance = new User(params)
		
		if(User.findByUsername(params.username) != null) {
			flash.message = "User name already exists. Please try again"
			redirect(action: "createAccount", params:[email:userInstance.email,
				bnetId:userInstance.bnetId,
				bnetCharCode:userInstance.bnetCharCode,
				primaryRace:userInstance.primaryRace,
				primarySkillLevel:userInstance.primarySkillLevel])
			return
		}
		
		if (params.password != "" || params.confirmPassword != "") {
			if (params.password == params.confirmPassword) {
				
				userInstance.password = springSecurityService.encodePassword(params.password) 
				
			} else {
				flash.message = "Your passwords did not match. Please try again"
				redirect(action: "createAccount", params:[username:userInstance.username,
						email:userInstance.email,
						bnetId:userInstance.bnetId,
						bnetCharCode:userInstance.bnetCharCode,
						primaryRace:userInstance.primaryRace,
						primarySkillLevel:userInstance.primarySkillLevel])
				return 
			}
		} else {
			flash.message = "Invalid password. Please try again."
			redirect(action: "createAccount", params:[username:userInstance.username,
						email:userInstance.email,
						bnetId:userInstance.bnetId,
						bnetCharCode:userInstance.bnetCharCode,
						primaryRace:userInstance.primaryRace,
						primarySkillLevel:userInstance.primarySkillLevel])
			return
		}
		
		if (userInstance.save(flush: true)) {
			
			def userRole = AuthRole.findByAuthority("ROLE_USER")
			AuthUserAuthRole.create(userInstance, userRole)
			
			//not exact sure what this does.... just copied from user/create
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
		
			sendVerificationMail(userInstance)
				
			redirect(action: "checkEmail")
		}
		else {
			flash.message = "An error has occurred. Please try again."
			redirect(action: "createAccount")
		}
	}
	
	// PROFILE VIEW
	def profile = {
		def user = User.get(params.id)
		def registrationList = user.registrations
		[userInstance: user, registrationInstanceList: registrationList]
	}
	
	def myProfile = {
		redirect(action: "profile", id:springSecurityService.currentUser.id)
	}
	
	private void sendVerificationMail(User user) {
		
		sendMail {
			to "${user.email}"
			from "No-Reply <no-reply@starplayersleague.com>"
			subject "StarPlayers League: Verify your email address"
			html( view:"/htmlEmails/sendVerificationMail",
				model:[id: user.id])
		}
	}
}
