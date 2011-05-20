<g:if test="${standingsInstanceList.size() > 0}">
	<div class="break"></div>
	<h2>${fieldValue(bean: standingsInstanceList.first(), field: "code")} /
	${fieldValue(bean: standingsInstanceList.first(), field: "division")} / 
	${fieldValue(bean: standingsInstanceList.first(), field: "group")}</h2>
	<div class="list">
    	<table>
            <tr>
	            <th class="colstrank">Rank</th>
	            <th class="colstrace"></th>
	            <th class="colstandingid">Player</th>
				<th class="colstat">Matches Played</th>
				<th class="colstat">Matches Won</th>
				<th class="colstat">Matches Lost</th>
	            <th class="colstat">Game Diff.</th>
            </tr>
            <g:each in="${standingsInstanceList}" status="i" var="registrationInstance">
            	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                <td class="right">${i+1}</td>
	                <td class="right"><img class="icons" src="${resource(dir:'images/icons', file:registrationInstance.race.concat('.png'))}" 
						alt="${registrationInstance.race}" /></td>
					<td><g:link controller="navigation" action="profile" id="${registrationInstance.user.id}">${fieldValue(bean: registrationInstance, field: "bnetId")}</g:link></td>
	                <td class="right">${fieldValue(bean: registrationInstance, field: "matchesPlayed")}</td>
	                <td class="right">${fieldValue(bean: registrationInstance, field: "matchesWon")}</td>
	                <td class="right">${fieldValue(bean: registrationInstance, field: "matchesLost")}</td>
	                <td class="right">${fieldValue(bean: registrationInstance, field: "gameDiff")}</td>
                </tr>
        	</g:each>
        </table>
    </div>
    <div class="break"></div>
    <div class="break"></div>
    <h2>Group Matches</h2>
    <div class="list">
	    <table>
	       	<tr>
				<th class="colmatch">Match</th>
	       		<th class="colbnetidl">Player</th>
	       		<th class="colrace"></th>
	       		<th class="colvs">vs</th>
	       		<th class="colrace"></th>
	       		<th class="colbentidr">Player</th>
	       		<th class="colmappack"></th>
	       	</tr>
	       	<g:each in="${matchesInstanceList}" status="i" var="matchesInstance">
	        	<tr class="${(matchesInstance.matchNumber % 2) == 0 ? 'odd' : 'even'}">
	            	<td class="right">${fieldValue(bean: matchesInstance, field: "matchNumber")}</td>
	            	<g:if test="${matchesInstance.played == false}">
						<td class="right">
					</g:if>
					<g:else>
						<g:if test="${matchesInstance.entries.toArray().getAt(0).id == matchesInstance.winner.id}">
							<td class="winnerl">
						</g:if>
						<g:else>
							<td class="right">
						</g:else>
					</g:else>
								<g:link controller="navigation" action="profile" id="${matchesInstance.entries.toArray().getAt(0).user.id}">
									${fieldValue(bean: matchesInstance.entries.toArray().getAt(0), field: "bnetId")}
								</g:link>
							</td>
					<td class="right"><img class="icons" src="${resource(dir:'images/icons', file:matchesInstance.entries.toArray().getAt(0).race.concat('.png'))}" 
						alt="${matchesInstance.entries.toArray().getAt(0).race}" /></td>
					<g:if test="${matchesInstance.played == false}">
						<td class="center">vs</td>
					</g:if>
					<g:else>
						<g:if test="${matchesInstance.entries.toArray().getAt(0).id == matchesInstance.winner.id}">
							<td class="matchscore">${(Integer)matchesInstance.bestOf/2+1}-${matchesInstance.loserScore}</td>
						</g:if>
						<g:else>
							<td class="matchscore">${matchesInstance.loserScore}-${(Integer)matchesInstance.bestOf/2+1}</td>
						</g:else>
					</g:else>
	                <td class="left"><img class="icons" src="${resource(dir:'images/icons', file:matchesInstance.entries.toArray().getAt(1).race.concat('.png'))}" 
						alt="${matchesInstance.entries.toArray().getAt(1).race}" /></td>
	                <g:if test="${matchesInstance.played == false}">
						<td class="left">
					</g:if>
					<g:else>
						<g:if test="${matchesInstance.entries.toArray().getAt(1).id == matchesInstance.winner.id}">
							<td class="winnerr">
						</g:if>
						<g:else>
							<td class="left">
						</g:else>
					</g:else>
								<g:link controller="navigation" action="profile" id="${matchesInstance.entries.toArray().getAt(1).user.id}">
									${fieldValue(bean: matchesInstance.entries.toArray().getAt(1), field: "bnetId")}
								</g:link>
							</td>
	                <td class="right"><g:link controller="navigation" action="mapPack" id="${matchesInstance.mapPack.id}">${matchesInstance.mapPack}</g:link></td>
	            </tr>
			</g:each>
		</table>
	</div>
</g:if>
