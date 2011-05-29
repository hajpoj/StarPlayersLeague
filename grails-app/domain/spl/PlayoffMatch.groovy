package spl

class PlayoffMatch extends Match {
	String name
	Playoffs playoffs
	static belongsTo = Registration
	static hasMany = [games:Game, entries:Registration]
	
    static constraints = {
		name(nullable:false, blank:false)
    }
	
}
