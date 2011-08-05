package spl

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class AdministrationController {
	def springSecurityService
	
    def index = {
		
	}
	
	def modifyMatchResult = {
		if (params.modifyMatchId) {
			redirect(controller: 'profile', action: 'reportScore', id: params.modifyMatchId)
		} else {
			flash.message = "Please specify a match ID to modify."
			redirect(action: 'index')
		}
	}
	
	def resetMatchResult = {
		def match = Match.get(params.resetMatchId)
		if (match) {
			match.reset()
			match.save(flush: true)
		
			for (_entry in match.entries) {
				_entry.updateMatchGameStats()
				_entry.save(flush: true)
			}
			flash.message = "You successfully reset the result of match ID ${params.resetMatchId}."
			redirect(action: 'index')
		} else {
			flash.message = "Please specify match ID to reset."
			redirect(action: 'index')
		}
	}
	
	def messageUser = {
		if (params.userId != 'null') {
			redirect(controller: 'profile', action: 'newThread', id: params.userId)	
		} else {
			flash.message = "Please select someone to message."
			redirect(action: 'index')
		}
	}
	
	def stats = {
		
		def seasonOneStats = getStats("1v1 StarPlayers League")
		def eastLeagueStats = getStats("North American East")
		def westLeagueStats = getStats("North American West")
		[eastLeagueStats: eastLeagueStats,
			westLeagueStats: westLeagueStats,
			seasonOneStats: seasonOneStats]
	}
	
	private def getStats(def leagueName) {
		def league = League.findByName(leagueName)
		def numWeeks = getNumWeeksInLeague(league.name)
		
		def totalArray = new ArrayList()
		def reportedArray = new ArrayList()
		def playedArray = new ArrayList()
		def forfeitedArray = new ArrayList()
		def participationArray = new ArrayList()
		
		for (int i = 1; i <= numWeeks; i ++) {
			def total = getTotalMatches(i, league)
			totalArray.add(total.size)
			def reported = getTotalReported(i, league)
			reportedArray.add(reported.size)
			def played = getTotalPlayedOrForfeited(i, league, false)
			playedArray.add(played.size)
			def forfeited = getTotalPlayedOrForfeited(i, league, true)
			forfeitedArray.add(forfeited.size)
			def participation = (played.size * 2 + forfeited.size)/ (total.size* 2)
			participationArray.add(participation)
		}
		
		def retArray = new ArrayList()
		retArray.add(totalArray)
		retArray.add(reportedArray)
		retArray.add(playedArray)
		retArray.add(forfeitedArray)
		retArray.add(participationArray)
		
		return retArray
	}
	
	private def getTotalMatches(int week, League league) {
		def m = Match.createCriteria()
		def total = m {
			eq('matchNumber', week)
			entries {
				eq('league',league)
			}
			projections {
				distinct('id')
			}
		}
		return total
	}
	
	private def getTotalReported(int week, League league) {
		def m = Match.createCriteria()
		def ret = m {
			eq('matchNumber', week)
			isNotNull('winner')
			entries {
				eq('league',league)
			}
			projections {
				distinct('id')
			}
		}
		return ret
	}
	
	private def getTotalPlayedOrForfeited(int week, League league, boolean forfeit) {
		def m = Match.createCriteria()
		def ret = m {
			eq('matchNumber', week)
			isNotNull('winner')
			eq('forfeit',forfeit)
			entries {
				eq('league',league)
			}
			projections {
				distinct('id')
			}
		}
		return ret
	}
	
	private def getNumWeeksInLeague(def leagueName){
		def league = League.findByName(leagueName)
		
		def m = Match.createCriteria()
		def total = m {
			maxResults(1)
			eq('matchNumber', 1)
			entries {
				eq('league',league)
			}
			projections {
				distinct('id')
			}
		}
		
		def matchId = total.get(0)
		def match = Match.findById(matchId)
		def group = match.leagueGroup
		
		def maxNum = 0
		for(ma in group.matches) {
			maxNum = Math.max(maxNum, ma.matchNumber)
		}
		
		return maxNum
	}
	
}
