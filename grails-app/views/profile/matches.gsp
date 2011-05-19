<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Matches</title>
    </head>
    <body>
        <h1>Matches</h1>
       	<div class="list">
	       	<g:if test="${matchesInstanceList.size() == 0}">
	       		<p>No matches to show!</p>
	       	</g:if>
	       	<g:else>
		   		<h2>Code ${fieldValue(bean: entryInstance, field: "code")} 
		   			- Division ${fieldValue(bean: entryInstance, field: "division")} 
		   			- Group ${fieldValue(bean: entryInstance, field: "group")}
		   		</h2>
		   		<g:if test="${flash.message}">
		        	<div class="message">${flash.message}</div>
		        </g:if>
		       	<table>
		       		<tr> 
		       			<th class="colmatch">Match</th>
		       			<th class="colbnetidl">Player</th>
		       			<th class="colracel"></th>
		       			<th class="colvs">vs</th>
		       			<th class="colracer"></th>
		       			<th class="colbnetidr2">Player</th>
		       			<th class="colmappack"></th>
		       			<th class="colreportscore"></th>
		       		</tr>
		       		<g:each in="${matchesInstanceList}" status="i" var="matchesInstance">
		           		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		           			<td class="right">${fieldValue(bean: matchesInstance, field: "matchNumber")}</td>
							
							<%--	Winner Designation (left side)	           			--%>
		           			<g:if test="${matchesInstance.played == false}">
								<td class="right">${fieldValue(bean: entryInstance, field: "bnetId")}</td>
							</g:if>
							<g:else>
								<g:if test="${entryInstance.id == matchesInstance.winner.id}">
									<td class="winnerl">${fieldValue(bean: entryInstance, field: "bnetId")}</td>
								</g:if>
								<g:else>
									<td class="right">${fieldValue(bean: entryInstance, field: "bnetId")}</td>
								</g:else>
							</g:else>
							
							<td class="right"><img class="icons" src="${resource(dir:'images/icons', file:entryInstance.race.concat('.png'))}" 
								alt="${entryInstance.race}" /></td>
							<g:if test="${matchesInstance.played == false}">
								<td class="center">vs</td>
							</g:if>
							<g:else>
								<g:if test="${entryInstance.id == matchesInstance.winner.id}">
									<td class="matchscore">${(Integer)matchesInstance.bestOf/2+1}-${matchesInstance.loserScore}</td>
								</g:if>
								<g:else>
									<td class="matchscore">${matchesInstance.loserScore}-${(Integer)matchesInstance.bestOf/2+1}</td>
								</g:else>
							</g:else>
							<g:each in="${matchesInstance.entries}" status="j" var="entry">
		               			<g:if test="${entry.id != entryInstance.id}">
		               				<td class="left"><img class="icons" src="${resource(dir:'images/icons', file:entry.race.concat('.png'))}" 
										alt="${entry.race}" /></td>
										
								<%--		Winner Designation (right side)							--%>
									<g:if test="${matchesInstance.played == false}">
										<td class="left"><g:link action="newThread" id="${entry.user.id}">${fieldValue(bean: entry, field: "bnetId")}</g:link></td>
									</g:if>
									<g:else>
										<g:if test="${entry.id == matchesInstance.winner.id}">
											<td class="winnerr"><g:link action="newThread" id="${entry.user.id}">${fieldValue(bean: entry, field: "bnetId")}</g:link></td>
										</g:if>
										<g:else>
											<td class="left"><g:link action="newThread" id="${entry.user.id}">${fieldValue(bean: entry, field: "bnetId")}</g:link></td>
										</g:else>
									</g:else>
									
		               			</g:if>
		               		</g:each>
		               		<td class="right"><g:link controller="navigation" action="mapPack" id="${matchesInstance.mapPack.id}">${matchesInstance.mapPack}</g:link></td>
		               		<g:if test="${matchesInstance.played == false}">
		               			<td class="right"><g:link controller="profile" action="reportScore" id="${matchesInstance.id}">Report Score</g:link></td>
		               		</g:if>
		               		<g:else>
		               			<td class="right"><g:link controller="profile" action="disputeScore" id="${matchesInstance.id}">Match Details</g:link></td>
		               		</g:else>
		           		</tr>
		        	</g:each>
		        </table>
	        </g:else>
        </div>
    </body>
</html>