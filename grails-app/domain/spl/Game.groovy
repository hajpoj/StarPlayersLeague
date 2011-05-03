package spl

class Game {
	Integer gameNumber
	Registration winner
	GameMap map
	static belongsTo = [match:Match]
	static hasMany = [entries:Registration]
	
    static constraints = {
		gameNumber(nullable:false, blank:false, min:1)
		winner (nullable:true)
		map(nullable:false)
    }
	
	String toString() {
		return "Game ${gameNumber}"
	}
}
