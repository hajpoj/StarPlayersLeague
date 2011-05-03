package spl

class User extends AuthUser {
	String email
	String primaryRace
	String primarySkillLevel
	List<String> bnetIds = []
	static hasMany = [registrations:Registration, threadsToMe:MessageThread, threadsFromMe:MessageThread, bnetIds:String]
	static mappedBy = [threadsToMe:"toUser", threadsFromMe:"fromUser"] 
	
	static constraints = {
		email(email:true)
		primaryRace(inList:["Random", "Zerg", "Protoss", "Terran"])
		primarySkillLevel(inList:["Master", "Diamond", "Platinum", "Gold", "Silver", "Bronze"])
	}

	String toString() {
		return "${username}"
	}
}
