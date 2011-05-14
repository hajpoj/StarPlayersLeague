<g:if test="${standingsInstanceList.size() > 0}">
	<div class="break"></div>
	<h2>Code ${fieldValue(bean: standingsInstanceList.first(), field: "code")} - 
    	Division ${fieldValue(bean: standingsInstanceList.first(), field: "division")} - 
		Group ${fieldValue(bean: standingsInstanceList.first(), field: "group")}</h2>
	<div class="list">
    	<table>
            <tr>
	            <th class="colstrank">Rank</th>
	            <th class="colstandingid">Battle.net ID</th>
            	<th class="colstrace">Race</th>
				<th class="colstat">Matches Played</th>
				<th class="colstat">Matches Won</th>
				<th class="colstat">Matches Lost</th>
	            <th class="colstat">Game Diff.</th>
            </tr>
            <g:each in="${standingsInstanceList}" status="i" var="registrationInstance">
            	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                <td class="right">${i+1}</td>
					<td>${fieldValue(bean: registrationInstance, field: "bnetId")}</td>
	                <td>${fieldValue(bean: registrationInstance, field: "race")}</td>
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
	       		<th class="colbnetidl">Battle.net ID</th>
	       		<th class="colracel">Race</th>
	       		<th class="colvs">vs</th>
	       		<th class="colracer">Race</th>
	       		<th class="colbentidr">Battle.net ID</th>
	       		<th class="colmappack"></th>
	       	</tr>
	       	<g:each in="${matchesInstanceList}" status="i" var="matchesInstance">
	        	<tr class="${(matchesInstance.matchNumber % 2) == 0 ? 'odd' : 'even'}">
	            	<td class="right">${fieldValue(bean: matchesInstance, field: "matchNumber")}</td>
					<td class="right">${fieldValue(bean: matchesInstance.entries.toArray().getAt(0), field: "bnetId")}</td>
					<td class="right">${fieldValue(bean: matchesInstance.entries.toArray().getAt(0), field: "race")}</td>
					<g:if test="${matchesInstance.played == false}">
						<td class="center">vs</td>
					</g:if>
					<g:else>
						<g:if test="${matchesInstance.entries.toArray().getAt(0).id == matchesInstance.winner.id}">
							<td class="center">${(Integer)matchesInstance.bestOf/2+1}-${matchesInstance.loserScore}</td>
						</g:if>
						<g:else>
							<td class="center">${matchesInstance.loserScore}-${(Integer)matchesInstance.bestOf/2+1}</td>
						</g:else>
					</g:else>
	                <td class="left">${fieldValue(bean: matchesInstance.entries.toArray().getAt(1), field: "race")}</td>
	                <td class="left">${fieldValue(bean: matchesInstance.entries.toArray().getAt(1), field: "bnetId")}</td>
	                <td class="right"><g:link controller="navigation" action="mapPack" id="${matchesInstance.mapPack.id}">${matchesInstance.mapPack}</g:link></td>
	            </tr>
			</g:each>
		</table>
	</div>
</g:if>
