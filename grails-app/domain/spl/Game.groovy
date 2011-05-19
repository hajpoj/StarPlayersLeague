package spl

class Game {
	Integer gameNumber
	Registration winner
	GameMap map
	//Byte[] replay
	String linkToVod
	static belongsTo = [match:Match]
	static hasMany = [entries:Registration]
	
    static constraints = {
		gameNumber(nullable:false, blank:false, min:1)
		winner (nullable:true)
		map(nullable:false)
		linkToVod(nullable:true)
		//replay(nullable:true)
    }
	
	String toString() {
		return "Game ${gameNumber}"
	}
}
