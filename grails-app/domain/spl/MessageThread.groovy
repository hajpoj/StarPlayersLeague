package spl

class MessageThread {
	String subject
	Boolean unreadFrom = true
	Boolean unreadTo = true
	User toUser
	Date dateCreated
	Date lastUpdated
	Date lastSentMessage
	static belongsTo = [fromUser:User]
	static hasMany = [messages:Message]
	
    static constraints = {
		subject(nullable:false, blank:false)
		toUser(nullable:false)
		lastSentMessage(nullable:true)
    }
	
	public boolean accessAllowed(User user) {
		if (   user.id == this.toUser.id
			|| user.id == this.fromUser.id) {
			return true
		}
		return false
	}
	
}
