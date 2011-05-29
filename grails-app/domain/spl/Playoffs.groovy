package spl

class Playoffs {
	String name
	
	static belongsTo = [division:Division]
	static hasMany = [matches:Match, entries:Registration]
	
    static constraints = {
		name(nullable:false, blank:false)
    }
	
	String toString() {
		return "Playoffs for ${division.code.name} ${division.name}"
	}
	
}
