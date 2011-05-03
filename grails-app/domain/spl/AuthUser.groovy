package spl

class AuthUser {

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<AuthRole> getAuthorities() {
		AuthUserAuthRole.findAllByAuthUser(this).collect { it.authRole } as Set
	}
}
