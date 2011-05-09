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
	
	Integer unreadMessageCount() {
		def unreadCount = 0
		def threads = []
		threads += this.threadsToMe
		threads += this.threadsFromMe
		for (_thread in threads) {
			if (   _thread.toUser.id == this.id 
				&& _thread.unreadTo == true
				|| _thread.fromUser.id == this.id
				&& _thread.unreadFrom == true) {
				unreadCount++
			}
		}
		return unreadCount
	}
}
