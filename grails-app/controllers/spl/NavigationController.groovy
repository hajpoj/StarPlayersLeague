package spl

import grails.plugins.springsecurity.Secured

class NavigationController {
	def springSecurityService
	
    def index = { redirect(action: "welcome") }
	
	// HOME VIEW
	def welcome = {
		def notices = Notice.list().toArray()
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
		
		if (!params.max) params.max = 10
		if (!params.offset) params.offset = 0
		if (total > 0) {
			if (params.offset.toInteger()+params.max.toInteger() > total) {
				range = [params.offset.toInteger()..total-1]
			} else {
				range = [params.offset.toInteger()..(params.offset.toInteger()+params.max.toInteger()-1)]
			}
			notices = notices.sort{it.lastUpdated}.reverse().getAt(range)
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
		if (params.group == 'null') {
			render g.select(noSelection:[null:"Select one..."])
		} else {
			group = Group.get(params.group)
			standingsList = group.entries.toArray().sort{[-it.matchesWon, it.matchesLost, -it.gameDiff]}
			matchesList = group.matches.toArray().sort{[it.matchNumber]}
			render(template: "table_template", model:[standingsInstanceList: standingsList, matchesInstanceList: matchesList])
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
		[codeInstanceList: codeList, standingsInstanceList: standingsList, matchesInstanceList: matchesList]
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
}
