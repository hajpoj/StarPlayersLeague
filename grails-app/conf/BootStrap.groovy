import org.codehaus.groovy.grails.commons.ApplicationHolder
import spl.*
import org.apache.commons.collections.map.LazyMap
import org.apache.commons.collections.Transformer
import grails.util.GrailsUtil

class BootStrap {
	def springSecurityService
	
	def init = { servletContext ->
		println "Starting bootstrap..."

		switch(GrailsUtil.environment) {
			case "development":
				// create some initial posts to front page
				def post
				post = new Notice(title: "Welcome to the new site!!", text: "Hey, this is the first post! Look at the time stamp.").save()
				post = new Notice(title: "Check out our cool new features!", text: "Hey, this is the second post!. Look at the time stamp.").save()
		
				for (_i in 1..25) {
					post = new Notice(title: "Post #${_i}", text: "blah blah blah").save()
				}
			
				// create user/admin roles and admin login
				createRoles()
			
				// import maps/map pack from CSV
				importMaps()
				
				// import league
				importLeague()
				
				// simulate matches
				simulateMatches()
								
				// simulate messages
				simulateMessages()
				break
			case "test":				
						
				break
			case "production":
				
				break
		}
		
		println "Finished bootstraping..."
	}
	
	def destroy = {
	}
	
	private void createRoles() {
		// create roles
		def userRole = AuthRole.findByAuthority("ROLE_USER") ?: new AuthRole(authority: "ROLE_USER").save()
		def adminRole = AuthRole.findByAuthority("ROLE_ADMIN") ?: new AuthRole(authority: "ROLE_ADMIN").save()
	}
	
	private void importMaps() {
		if (GameMap.list() && MapPack.list()) return
		// import Maps
		def filePath = "resources/Map Pool.csv"
		def text = ApplicationHolder.application.parentContext.getResource("classpath:$filePath").inputStream.text
		text.eachLine {
			def line = it.split(",")
			def name = line[1]
			def listedName = line[2]
			def author = line[3]
			def mapImageFileName = line[4]
			GameMap map = new GameMap(name:name,
									  listedName:listedName,
									  author:author,
									  mapImageFileName:mapImageFileName)
			map.save()
			if (map.hasErrors()) {
				map.errors.each {
					println it
				}
			}
		}
		
		// import Map Packs
		filePath = "resources/Map Packs BO3.csv"
		text = ApplicationHolder.application.parentContext.getResource("classpath:$filePath").inputStream.text
		text.eachLine {
			def line = it.split(",")
			def map1 = line[1]
			def map2 = line[2]
			def map3 = line[3]
			MapPack mapPack = new MapPack()
			mapPack.addToMaps(GameMap.get(map1))
			mapPack.addToMaps(GameMap.get(map2))
			mapPack.addToMaps(GameMap.get(map3))
			mapPack.save()
			if (mapPack.hasErrors()) {
				mapPack.errors.each {
					print it
				}
			}
		}
	}
	
	private void importLeague() {
		if (League.findByName("1v1 StarPlayers League")) return
		// league structure, players
		def server = new Server(name:"NA")
		def league = new League(name:"1v1 StarPlayers League")
		server.addToLeagues(league)
		def season = new Season(name:"1")
		league.addToSeasons(season)
		
		def transformer
		transformer = {LazyMap.decorate(new LinkedHashMap(), transformer)} as Transformer
		
		def all_players = transformer.transform(null)

		def filePath = "resources/league.csv"
		def text = ApplicationHolder.application.parentContext.getResource("classpath:$filePath").inputStream.text
		text.eachLine {
			//println it
			def line = it.split(",")
			def email = line[0]
			def bnetIdAndCC = line[1].split("[.]")
			def bnetId = bnetIdAndCC[0]
			def bnetCC = bnetIdAndCC[1]
			def race = line[2]
			def skill = line[3]
			def code = line[4]
			def division = line[5]
			def group = line[6]
			Registration player = new Registration(bnetId:bnetId,
												   bnetCharCode:bnetCC,
												   race:race,
												   skillLevel:skill)
			def username = email.split("@")
			def user = new User(username:username[0],
								email:email,
								password:springSecurityService.encodePassword("${bnetId}${bnetCC}"),
								primaryRace:race,
								primarySkillLevel:skill,
								enabled:true)
			user.addToBnetIds("${bnetId}")
			user.addToRegistrations(player)
			user.save()
			if (user.hasErrors()) {
				user.errors.each {
					println it
				}
			}
			def userRole = AuthRole.findByAuthority("ROLE_USER")
			AuthUserAuthRole.create(user, userRole)
			//println "${code} ${division} ${group} ${player.bnetId}"
			all_players[code][division][group]["${player.bnetId}${player.bnetCharCode}"] = player
		}
		
		for (_code in all_players) {
			def priority
			if (_code.key == new String("SP")) {
				priority = 3
			} else if (_code.key == new String("S")) {
				priority = 2
			} else {
				priority = 1
			}
			def code = new Code(name:_code.key, priority:priority)
			season.addToCodes(code)
			
			for (_division in all_players[_code.key]) {
			
				def division = new Division(name:_division.key)
				code.addToDivisions(division)
				
				for (_group in all_players[_code.key][_division.key]) {
					def group = new Group(name:_group.key)
					division.addToGroups(group)
					def groupPlayers = []
					for (_player in all_players[_code.key][_division.key][_group.key]) {
						//_player.value.league = league
						//println "${_code.key} ${_division.key} ${_group.key} ${_player.value.bnetId}"
						group.addToEntries(_player.value)
						//division.addToEntries(_player.value)
						//code.addToEntries(_player.value)
						//season.addToEntries(_player.value)
						//league.addToEntries(_player.value)
						//server.addToEntries(_player.value)
						groupPlayers.push(_player.value)
					}
					
					Integer lastPlayer
					Integer numMatches
					Integer numRounds
					if ((groupPlayers.size() % 2) == 0) {
						lastPlayer = groupPlayers.size() - 1
						numRounds = groupPlayers.size() - 1
						numMatches = groupPlayers.size()/2
					} else {
						lastPlayer = groupPlayers.size() - 2
						numRounds = groupPlayers.size()
						numMatches = groupPlayers.size()/2
					}
					for (Integer _round = 0; _round < numRounds; _round++) {
						for (Integer _match = 0; _match < numMatches; _match++) {
							
							Match match = new Match(roundNumber:(_round+1),
													matchNumber:(_match+1),
													played: false,
													mapPack:MapPack.get((_round % 9)+1),
													bestOf:3,
													leagueGroup:group)
							groupPlayers[_match].addToMatches(match)
							groupPlayers[lastPlayer-_match].addToMatches(match)
							match.createGames()
							group.addToMatches(match)
						}
						if ((groupPlayers.size() % 2) == 0) {
							def last = groupPlayers.pop()
							groupPlayers[1..<1] = last
						} else {
							def last = groupPlayers.pop()
							groupPlayers[0..<0] = last
						}
					}
					
					
				}
			}
		}
		
		server.save()
		if (server.hasErrors()) {
			server.errors.each {
				println it
			}
		}
		
		// link players to divisions, etc
		def all_registrations = Registration.list()
		for (_all_reg in all_registrations) {
			def user = User.findByPassword(springSecurityService.encodePassword("${_all_reg.bnetId}${_all_reg.bnetCharCode}"))
			user.addToRegistrations(_all_reg)
			user.save()
			if (user.hasErrors()) {
				user.errors.each {
					println it
				}
			}
			//println _all_reg
			//println _all_reg.group
			def division = _all_reg.group.division
			division.addToEntries(_all_reg)
			division.save()
			if (division.hasErrors()) {
				division.errors.each {
					println it
				}
			}
			def code = _all_reg.group.division.code
			code.addToEntries(_all_reg)
			code.save()
			if (code.hasErrors()) {
				code.errors.each {
					println it
				}
			}
			season = _all_reg.group.division.code.season
			season.addToEntries(_all_reg)
			season.save()
			if (season.hasErrors()) {
				season.errors.each {
					println it
				}
			}
			league = _all_reg.group.division.code.season.league
			league.addToEntries(_all_reg)
			league.save()
			if (league.hasErrors()) {
				league.errors.each {
					println it
				}
			}
			server = _all_reg.group.division.code.season.league.server
			server.addToEntries(_all_reg)
			server.save()
			if (server.hasErrors()) {
				server.errors.each {
					println it
				}
			}
		}
	}
	
	private void simulateMatches() {
		// simulate some matches
		def codeSP = Code.findByName("SP")
		def division = Division.findByNameAndCode("1", codeSP)
		def group = Group.findByNameAndDivision("A", division)
		for (_match in group.matches) {
			_match.played = true
			def entries = _match.entries.toArray()
			def rand = new Random()
			for (_game in _match.games) {
				_game.winner = entries[rand.nextInt(1+1)]
				_match.updateResult()
				for (_player in _match.entries) {
					_player.updateMatchGameStats()
				}
			}
		}
	}
	
	private void simulateMessages() {
		// create some messages
		def will = User.findByEmail("will.r.goto@gmail.com")
		def ric = User.findByEmail("d_jaffry@hotmail.com")
		
		def thread
		def message
		
		for (_i in 1..25) {
			thread = new MessageThread(subject:"message #${_i}", fromUser:will, toUser:ric)
			message = new Message(text:"hey ", fromUser:will, toUser:ric)
			thread.addToMessages(message)
			message = new Message(text:"reply back", toUser:will, fromUser:ric)
			thread.addToMessages(message)
			thread.save()
		}
		if (message.hasErrors()) {
			message.errors.each {
				println it
			}
		}
	}
	

}
