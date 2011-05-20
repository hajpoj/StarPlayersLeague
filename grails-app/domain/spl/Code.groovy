package spl

class Code {
	String name
	Integer priority
	static belongsTo = [season:Season]
	static hasMany = [divisions:Division, entries:Registration]
	
    static constraints = {
		name(nullable:false, blank:false)
		priority(nullable:false, min:0)
    }
	
	String toString() {
		return "Code ${name}"
	}
}
