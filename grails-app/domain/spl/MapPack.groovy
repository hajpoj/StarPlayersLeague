package spl

class MapPack {
	List<GameMap> maps = []
	static hasMany = [maps:GameMap] 
	
    static constraints = {
    }
	
	String toString() {
		return "Map Pack #${this.id}"
	}
}
