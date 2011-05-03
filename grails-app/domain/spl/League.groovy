package spl

class League {
	String name
	static belongsTo = [server:Server]
	static hasMany = [seasons:Season, entries:Registration]
	
	static constraints = {
		name(nullable:false, blank:false)
	}
	
	String toString() {
		return "${name}"
	}
}
