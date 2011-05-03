package spl

class Notice {
	String title
	String text
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		title(nullable:false, blank:false)
		text(nullable:false, blank:false)
    }
	static mapping = {
		text (type: 'text')
	}
}
