package spl

class GameMap {
	String name
	String listedName
	String author
	String mapImageFileName
	
	static constraints = {
		name(nullable:false, blank:false)
		listedName(nullable:false, blank:false)
		author(nullable:false, blank:false)
	}
	
	String toString() {
		return "${name}"
	}
}