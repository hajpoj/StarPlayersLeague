package spl

import org.apache.commons.lang.builder.HashCodeBuilder

class AuthUserAuthRole implements Serializable {

	AuthUser authUser
	AuthRole authRole

	boolean equals(other) {
		if (!(other instanceof AuthUserAuthRole)) {
			return false
		}

		other.authUser?.id == authUser?.id &&
			other.authRole?.id == authRole?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (authUser) builder.append(authUser.id)
		if (authRole) builder.append(authRole.id)
		builder.toHashCode()
	}

	static AuthUserAuthRole get(long authUserId, long authRoleId) {
		find 'from AuthUserAuthRole where authUser.id=:authUserId and authRole.id=:authRoleId',
			[authUserId: authUserId, authRoleId: authRoleId]
	}

	static AuthUserAuthRole create(AuthUser authUser, AuthRole authRole, boolean flush = false) {
		new AuthUserAuthRole(authUser: authUser, authRole: authRole).save(flush: flush, insert: true)
	}

	static boolean remove(AuthUser authUser, AuthRole authRole, boolean flush = false) {
		AuthUserAuthRole instance = AuthUserAuthRole.findByAuthUserAndAuthRole(authUser, authRole)
		instance ? instance.delete(flush: flush) : false
	}

	static void removeAll(AuthUser authUser) {
		executeUpdate 'DELETE FROM AuthUserAuthRole WHERE authUser=:authUser', [authUser: authUser]
	}

	static void removeAll(AuthRole authRole) {
		executeUpdate 'DELETE FROM AuthUserAuthRole WHERE authRole=:authRole', [authRole: authRole]
	}

	static mapping = {
		id composite: ['authRole', 'authUser']
		version false
	}
}
