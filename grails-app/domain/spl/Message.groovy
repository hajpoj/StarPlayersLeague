package spl

class Message {
	String text
	Boolean unreadTo = true
	Boolean unreadFrom = true
	User toUser
	User fromUser
	Date dateCreated
	Date lastUpdated
	static belongsTo = [thread:MessageThread]
		
    static constraints = {
		text(nullable:false, blank:false)
		toUser(nullable:false)
		fromUser(nullable:false)
    }
	
	static mapping = {
		text(type: 'text')
	}
	
	def afterInsert = {
		thread.lastSentMessage = dateCreated
		thread.unreadTo = true
		thread.unreadFrom = true
		thread.save()
	}
	
}
