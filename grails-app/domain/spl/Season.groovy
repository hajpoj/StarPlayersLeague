package spl

class Season {
	String name
	static belongsTo = [league:League]
	static hasMany = [codes:Code, entries:Registration]
	
    static constraints = {
		name(nullable:false, blank:false)
    }
	
	String toString() {
		return "${name}"
	}
}
