package spl

class Division {
	String name
	static belongsTo = [code:Code]
	static hasMany = [groups:Group, entries:Registration]
	
    static constraints = {
		name(nullable:false, blank:false)
    }
	
	String toString() {
		return "${name}"
	}
}
