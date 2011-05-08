package spl

class Match {
	Integer matchNumber
	MapPack mapPack
	Integer bestOf
	Registration winner
	Integer loserScore
	Boolean played = false
	Group leagueGroup
	List<Game> games
	static belongsTo = Registration
	static hasMany = [games:Game, entries:Registration]
	static mapping = {
		table "`match`"
	}
	
    static constraints = {
		matchNumber(nullable:false, blank:false, min:1)
		mapPack(nullable:false)
		bestOf(nullable:false, blank:false, min:1)
		winner(nullable:true)
		loserScore(nullable:true, blank:true, min:0)
    }
		
	public void createGames() {
		for (Integer i = 0; i < bestOf; i++) {
			Game game = new Game(gameNumber:(i+1), map:mapPack.maps[i])
			entries.each {
				game.addToEntries(it)
			}
			this.addToGames(game)
		}
	}
	
	public void updateResult() {
		def players = entries.toArray() 
		def player0Wins = 0
		def player1Wins = 0
		for (_game in games) {
			if (_game.winner != null) {
				if (_game.winner.id == players[0].id) {
					player0Wins++
				} else if (_game.winner.id == players[1].id) {
					player1Wins++
				}
				if (   player0Wins == (bestOf/2+1)
					|| player1Wins == (bestOf/2+1)) {
					break
				}
			}
		}
		if (player0Wins > player1Wins) {
			winner = players[0]
			loserScore = player1Wins
		} else if (player1Wins > player0Wins){
			winner = players[1]
			loserScore = player0Wins
		}
	}
	
	public boolean accessAllowed(User user) {
		for (_entry in this.entries) {
			if (user.id == _entry.user.id) {
				return true
			}
		}
		return false
	}
	
	String toString() {
		return "${this.id}"
	}
	
}
