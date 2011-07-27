package spl

import grails.plugins.springsecurity.Secured
import org.apache.commons.collections.map.LazyMap
import org.apache.commons.collections.Transformer

@Secured(['ROLE_ADMIN'])
class UserController {
	def springSecurityService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = params.max ? params.int('max') : 500
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def save = {
        def userInstance = new User(params)
        if (userInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
            redirect(action: "show", id: userInstance.id)
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userInstance: userInstance]
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
			userInstance.password = springSecurityService.encodePassword(params.password)
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
			
			def updateGroups = []
			def userAuth = AuthUserAuthRole.findByAuthUser(userInstance)
			if (userAuth) userAuth.delete(flush: true)
			def tempCollection = []
			def tempCollection2 = []
			
			for (_registration in userInstance.registrations) {
				updateGroups << _registration.group.id
				tempCollection = []
				tempCollection += _registration.matches
				for (_match in tempCollection) {
					tempCollection2 = []
					tempCollection2 += _match.entries
					for (_entry in tempCollection2) {
						_entry.removeFromMatches(_match)
					}
					_match.delete(flush: true)
				}
			}
			tempCollection = []
			tempCollection += userInstance.threadsToMe
			for (_message in tempCollection) {
				userInstance.removeFromThreadsToMe(_message)
				_message.delete(flush: true)
			}
			tempCollection = []
			tempCollection += userInstance.threadsFromMe
			for (_message in tempCollection) {
				userInstance.removeFromThreadsFromMe(_message)
				_message.delete(flush: true)
			}

            try {
				userInstance.delete(flush: true)
				
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
			
			for (_group in updateGroups) { 
				for (_entry in Group.get(_group).entries) {
					_entry.updateMatchGameStats()
					_entry.save(flush: true)
				}
			}
			
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def registerUsers = {
		//def CODES = 6 hardcoded
		//def DIVISIONS = 1 BOZO not using
		def SERVER_NAME = "NA"
		def GROUP_SIZE = 6
		def SEASON = 1
		def CREATE = (params.createLeague == "true") ? true : false
		 
		def transformer
		transformer = {LazyMap.decorate(new LinkedHashMap(), transformer)} as Transformer
		def usersByCode = transformer.transform(null)
		transformer = {LazyMap.decorate(new LinkedHashMap(), transformer)} as Transformer
		def users = transformer.transform(null)
		
		def registeredUsers = User.findAllByRegistrationValueIsNotNull()
		
		for (_user in registeredUsers) {
			def code
			if (_user.primarySkillLevel == new String("Master")) {
				code = new String("S")
			} else if (_user.primarySkillLevel == new String("Diamond")) {
				 code = new String("A")
			} else if (_user.primarySkillLevel == new String("Platinum")) {
				 code = new String("B")
			} else if (_user.primarySkillLevel == new String("Gold")) {
				 code = new String("C")
			} else if (_user.primarySkillLevel == new String("Silver")) {
				 code = new String("D")
			} else if (_user.primarySkillLevel == new String("Bronze")) {
				 code = new String("E")
			}
			
			usersByCode[_user.registrationValue][code]["${_user.username}"] = _user
		}
		
		for (_league in usersByCode) {
			render("<br/><br/>${_league.key}<br/>")
			for (_code in _league.value) {
				render("<br/>Code ${_code.key}<br/>")
				def groupName = "A"
				def groupUsers = []
				for (_user in _code.value.sort{it.value.registrationDate}) {
					if (groupUsers.size() == 0) {
						render("<br/>Group ${groupName}<br/>")
					}
					groupUsers.push(_user.value)
					users[_league.key][_code.key]["1"][groupName][_user.value.username] = _user.value
					render("${_user.value.username} ${_user.value.registrationDate}")
					render("<br/>")
					
					if (groupUsers.size() >= GROUP_SIZE) {
						groupName++
						groupUsers = []
					}
				}
				if (   groupUsers.size() < GROUP_SIZE
					&& groupUsers.size() > 0) {
					render("People on waiting list for ${_league.key} Code ${_code.key}: ${groupUsers.size()}")
					render("<br/>")
				}
			}
		}
		
		def waitlistedUsers = []
		if (!CREATE) {
			render("Test only. NOT creating league.<br/>")
		} else {
			render("<br/><br/>Creating league!!<br/>")
			def server = Server.findByName(SERVER_NAME)
			for (_league in users) {
				def league = new League(name:_league.key)
				server.addToLeagues(league)
				def season = new Season(name:"${SEASON}")
				league.addToSeasons(season)
				
				for (_code in _league.value) {
					def priority
					if (_code.key == new String("S")) {
						priority = 3
					} else {
						priority = 1
					}
					def code = new Code(name:_code.key, priority:priority)
					season.addToCodes(code)
					
					for (_division in _code.value) {
						def division = new Division(name:_division.key)
						code.addToDivisions(division)
			
						for (_group in _division.value) {
							def group
							def matchRegistrations = []
							if (_group.value.size() == GROUP_SIZE) {
								group = new Group(name:_group.key)
								division.addToGroups(group)
							}
							
							for (_user in _group.value) {
								if (_group.value.size() != GROUP_SIZE) {
									waitlistedUsers.push(_user.value)
									_user.value.waitingList = true
								} else {
									def registration = new Registration(bnetId:_user.value.bnetId,
																		bnetCharCode:_user.value.bnetCharCode,
																		race:_user.value.primaryRace,
																		skillLevel:_user.value.primarySkillLevel)
									_user.value.addToRegistrations(registration)
									_user.value.waitingList = false
									_user.value.save()
									if (_user.value.hasErrors()) {
										_user.value.errors.each {
											println it
										}
									}
									
									group.addToEntries(registration)
									division.addToEntries(registration)
									code.addToEntries(registration)
									season.addToEntries(registration)
									league.addToEntries(registration)
									server.addToEntries(registration)
									
									matchRegistrations.push(registration)
								}
							}
							
							server.save()
							if (server.hasErrors()) {
								server.errors.each {
									println it
								}
							}
						}			
					}
				}
			}			
		}
		render("Done")
	}
	
	def createMatches = {
		
		def leagues = League.list()
		
		for (_league in leagues) {
			for (_season in _league.seasons) {
				for (_code in _season.codes) {
					for (_division in _code.divisions) {
						for (_group in _division.groups) {
							if (_group.matches.size() == 0) {
								def matchRegistrations = []
								
								for (_registrations in _group.entries) {
									matchRegistrations.push(_registrations)
								}
								
								Integer lastPlayer
								Integer numMatches
								Integer numRounds
								//println "${_group.division.code} ${_group.division} ${_group}"
								if ((matchRegistrations.size() % 2) == 0) {
									lastPlayer = matchRegistrations.size() - 1
									numRounds = matchRegistrations.size() - 1
									numMatches = matchRegistrations.size()/2
								} else {
									lastPlayer = matchRegistrations.size() - 2
									numRounds = matchRegistrations.size()
									numMatches = matchRegistrations.size()/2
								}
								for (Integer _round = 0; _round < numRounds; _round++) {
									for (Integer _match = 0; _match < numMatches; _match++) {
						
										Match match = new Match(matchNumber:(_round+1),
																played: false,
																mapPack:MapPack.get((_round % 9)+1),
																bestOf:3,
																leagueGroup:_group)
										matchRegistrations[_match].addToMatches(match)
										matchRegistrations[lastPlayer-_match].addToMatches(match)
										match.createGames()
										_group.addToMatches(match)
										match.save()
										if (match.hasErrors()) {
											match.errors.each {
												println it
											}
										}
									}
									if ((matchRegistrations.size() % 2) == 0) {
										def last = matchRegistrations.pop()
										matchRegistrations[1..<1] = last
									} else {
										def last = matchRegistrations.pop()
										matchRegistrations[0..<0] = last
									}
								}
							}
						}
					}
				}
			}
		}
		render("Done")
	}
}
