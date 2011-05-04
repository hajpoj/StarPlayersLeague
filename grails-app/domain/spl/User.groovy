package spl

class User extends AuthUser {
	String email
	String bnetId
	String bnetCharCode
	String primaryRace
	String primarySkillLevel
	static hasMany = [registrations:Registration, threadsToMe:MessageThread, threadsFromMe:MessageThread]
	static mappedBy = [threadsToMe:"toUser", threadsFromMe:"fromUser"] 
	
	static constraints = {
		email(email:true)
		bnetId(nullable:false, blank:true)
		bnetCharCode(nullable:false, blank:true)
		primaryRace(inList:["Random", "Zerg", "Protoss", "Terran"])
		primarySkillLevel(inList:["Master", "Diamond", "Platinum", "Gold", "Silver", "Bronze"])
	}

	String toString() {
		return "${username}"
	}
}
