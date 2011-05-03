package spl

class Server {
	String name
	static hasMany = [leagues:League, entries:Registration]
    
	static constraints = {
		name(nullable:false, blank:false)
    }
	
	String toString() {
		return "${name}"
	}
}
