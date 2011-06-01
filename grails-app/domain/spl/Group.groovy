package spl

class Group {
	String name
	//Boolean playoffs
	static belongsTo = [division:Division]
	static hasMany = [matches:Match, entries:Registration]
	static mapping = {
		table "`group`"
	}
	static constraints = {
		name(nullable:false, blank:false)
	}
	
	String toString() {
		return "Group ${name}"
	}
}
