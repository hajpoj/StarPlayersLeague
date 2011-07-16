<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Matches</title>
    </head>
    <body>
        <h1>Matches</h1>
        <div class="break"></div>
       	<g:if test="${matchesInstanceList.size() == 0}">
       		<g:if test="${flash.message}">
	        	<div class="message">${flash.message}</div>
	   		</g:if>
       		<h2>No matches to show!</h2>
       	</g:if>
       	<g:else>
	   		<h2>${fieldValue(bean: entryInstance, field: "code")} / 
	   			${fieldValue(bean: entryInstance, field: "division")} / 
	   			${fieldValue(bean: entryInstance, field: "group")}
	   		</h2>
	   		<div class="break"></div>
	   		<g:if test="${flash.message}">
	        	<div class="message">${flash.message}</div>
	        </g:if>
	        <div class="list">
		       	<table>
		       		<tr> 
		       			<th class="colmatch">Match</th>
		       			<th class="colbnetidl">Player</th>
		       			<th class="colvs">vs</th>
		       			<th class="colbnetidr2">Player</th>
		       			<th class="colviewdetails"></th>
		       			<th class="colreportscore"></th>
		       			<th class="colviewdetails"></th>
		       		</tr>
		       		<g:each in="${matchesInstanceList}" status="i" var="matchesInstance">
		           		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		           			<td class="right">${fieldValue(bean: matchesInstance, field: "matchNumber")}</td>
							
							<%--	Winner Designation (left side)	           			--%>
		           			<g:if test="${matchesInstance.played == false}">
								<td class="right">
							</g:if>
							<g:else>
								<g:if test="${entryInstance.id == matchesInstance.winner.id}">
									<td class="winnerl">
								</g:if>
								<g:else>
									<td class="right">
								</g:else>
							</g:else>
										${fieldValue(bean: entryInstance, field: "bnetId")}
										<img class="icons" src="${resource(dir:'images/icons', file:entryInstance.race.concat('.png'))}" 
											alt="${entryInstance.race}" /></td>
							<g:if test="${matchesInstance.played == false}">
								<td class="center">vs</td>
							</g:if>
							<g:else>
								<g:if test="${entryInstance.id == matchesInstance.winner.id}">
									<td class="matchscore">
										${(Integer)matchesInstance.bestOf/2+1}-${matchesInstance.loserScore}
									</td>
								</g:if>
								<g:else>
									<td class="matchscore">
										${matchesInstance.loserScore}-${(Integer)matchesInstance.bestOf/2+1}
									</td>
								</g:else>
							</g:else>
							<g:each in="${matchesInstance.entries}" status="j" var="entry">
		               			<g:if test="${entry.id != entryInstance.id}">
								<%--		Winner Designation (right side)							--%>
									<g:if test="${matchesInstance.played == false}">
										<td class="left">
									</g:if>
									<g:else>
										<g:if test="${entry.id == matchesInstance.winner.id}">
											<td class="winnerr">
										</g:if>
										<g:else>
											<td class="left">
										</g:else>
									</g:else>
												<img class="icons" src="${resource(dir:'images/icons', file:entry.race.concat('.png'))}" 
													alt="${entry.race}" />
												<g:link controller="navigation" action="profile" id="${entry.user.id}">${fieldValue(bean: entry, field: "bnetId")}.${fieldValue(bean: entry, field: "bnetCharCode")}</g:link>
											</td>
											<td>
		               							<g:link action="newThread" id="${entry.user.id}">Send Message</g:link>
		               						</td>
									
		               			</g:if>
		               		</g:each>
		               		<g:if test="${matchesInstance.played == false}">
		               			<td class="right"><g:link controller="profile" action="reportScore" id="${matchesInstance.id}">Report Score</g:link></td>
		               		</g:if>
		               		<g:else>
		               			<td class="right"><g:link controller="profile" action="disputeScore" id="${matchesInstance.id}">Dispute Score</g:link></td>
		               		</g:else>
		               		<td class="right"><g:link controller="navigation" action="matchDetails" id="${matchesInstance.id}">View Details</g:link></td>
		           		</tr>
		        	</g:each>
		        </table>
	        </div>
        </g:else>
    </body>
</html>