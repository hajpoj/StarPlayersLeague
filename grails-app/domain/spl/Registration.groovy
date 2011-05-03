package spl

class Registration {
	String bnetId
	String bnetCharCode 
	String race
	String skillLevel
	Integer matchesPlayed = 0
	Integer matchesWon = 0
	Integer matchesLost = 0
	Integer gamesWon = 0
	Integer gamesLost = 0
	Integer gameDiff = 0
	Server server
	League league
	Season season
	Code code
	Division division
	Group group
	static belongsTo = [user:User]
	static hasMany = [matches:Match]
	
    static constraints = {
		bnetId(nullable:false, blank:false)
		bnetCharCode(nullable:false, blank:false)
		race(inList:["Random", "Zerg", "Protoss", "Terran"])
		skillLevel(inList:["Master", "Diamond", "Platinum", "Gold", "Silver", "Bronze"])
		server(nullable:true, blank:true)
		league(nullable:true, blank:true)
		season(nullable:true, blank:true)
		code(nullable:true, blank:true)
		division(nullable:true, blank:true)
		group(nullable:true, blank:true)		
    }
	
	String toString() {
		return "${bnetId}"
	}
	
	void updateMatchGameStats() {
		matchesPlayed = 0
		matchesWon = 0
		matchesLost = 0
		gamesWon = 0
		gamesLost = 0
		gameDiff = 0
		for (_match in matches) {
			if (_match.played) {
				if (this.id == _match.winner.id) {
					matchesWon++
					gamesWon+=_match.bestOf/2+1
					gamesLost+=_match.loserScore
				} else {
					matchesLost++
					gamesWon+=_match.loserScore
					gamesLost+=_match.bestOf/2+1
				}
				matchesPlayed++
			}
		}
		gameDiff = gamesWon - gamesLost
	}
}
