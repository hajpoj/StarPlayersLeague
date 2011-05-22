<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Match Details</title>
        <g:javascript library="prototype" />
    </head>
    <body>
        <h1>Match Details</h1>        
        <div class="list">
        <div class="break"></div>
        <g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
        <div class="break"></div>
        <h3>Match Result</h3>
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
       			<tr>
	       			<td class="right">${fieldValue(bean: matchInstance, field: "matchNumber")}</td>
	            	<g:if test="${matchInstance.played == false}">
						<td class="right">
					</g:if>
					<g:else>
						<g:if test="${matchInstance.entries.toArray().getAt(0).id == matchInstance.winner.id}">
							<td class="winnerl">
						</g:if>
						<g:else>
							<td class="right">
						</g:else>
					</g:else>
								<g:link controller="navigation" action="profile" id="${matchInstance.entries.toArray().getAt(0).user.id}">
									${fieldValue(bean: matchInstance.entries.toArray().getAt(0), field: "bnetId")}
								</g:link>
							</td>
					<td class="right"><img class="icons" src="${resource(dir:'images/icons', file:matchInstance.entries.toArray().getAt(0).race.concat('.png'))}" 
						alt="${matchInstance.entries.toArray().getAt(0).race}" /></td>
					<g:if test="${matchInstance.played == false}">
						<td class="center">vs</td>
					</g:if>
					<g:else>
						<g:if test="${matchInstance.entries.toArray().getAt(0).id == matchInstance.winner.id}">
							<td class="matchscore">${(Integer)matchInstance.bestOf/2+1}-${matchInstance.loserScore}</td>
						</g:if>
						<g:else>
							<td class="matchscore">${matchInstance.loserScore}-${(Integer)matchInstance.bestOf/2+1}</td>
						</g:else>
					</g:else>
	                <td class="left"><img class="icons" src="${resource(dir:'images/icons', file:matchInstance.entries.toArray().getAt(1).race.concat('.png'))}" 
						alt="${matchInstance.entries.toArray().getAt(1).race}" /></td>
	                <g:if test="${matchInstance.played == false}">
						<td class="left">
					</g:if>
					<g:else>
						<g:if test="${matchInstance.entries.toArray().getAt(1).id == matchInstance.winner.id}">
							<td class="winnerr">
						</g:if>
						<g:else>
							<td class="left">
						</g:else>
					</g:else>
								<g:link controller="navigation" action="profile" id="${matchInstance.entries.toArray().getAt(1).user.id}">
									${fieldValue(bean: matchInstance.entries.toArray().getAt(1), field: "bnetId")}
								</g:link>
							</td>
	                <td class="right"><g:link controller="navigation" action="mapPack" id="${matchInstance.mapPack.id}">${matchInstance.mapPack}</g:link></td>
	            </tr>
   			</table>
		</div>
		
        <g:if test="${matchInstance.forfeit}">
        	<p class="note">*Note: match winner by forfeit</p>
        </g:if>
        <div class="list">
        	<div class="break"></div>
        	<div class="break"></div>
       		<h3>Game Results</h3>
        	<table>
		   		<tr> 
		   			<th class="colmatch">Game</th>
		   			<th style="width: 150px;">Map</th>
		   			<th class="race"></th>
			   		<th>Winner</th>
			   		<th>Replay</th>
			   		<th>Link To VOD</th>
		   		</tr>
        	
        		<g:each in="${matchInstance.games}" status="i" var="game">
        			<tr>
        				<td class="right">${i+1}</td>
        				<td>${game.map}</td>
        				<td class="right">
        					<g:if test="${!game.winner}"></g:if>
        					<g:else><img class="icons" src="${resource(dir:'images/icons', file:game.winner.race.concat('.png'))}" 
								alt="${game.winner.race}" /></g:else>
        					
						</td>
        				<td>
        					<g:if test="${!game.winner}">-</g:if>
        					<g:else>${game.winner}</g:else>
        				</td>
        				<td>
        					<g:if test="${!game.pathToReplay}">-</g:if>
        					<g:else>
        						<a href="<g:resource dir="${groupDirInstance}" file="${game.pathToReplay}" absolute="true" />">Download</a>
        					</g:else>
        				</td>
        				<td>
        					<g:if test="${!game.linkToVod}">
        						-
        					</g:if>
        					<g:else>
        						<a href="http://${game.linkToVod}">View</a>
        					</g:else>
        				</td>
        			</tr>
        		</g:each>
			</table>
		</div>
    </body>
</html>