<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>${fieldValue(bean: matchInstance.entries.toArray().getAt(0), field: "bnetId")} vs ${fieldValue(bean: matchInstance.entries.toArray().getAt(1), field: "bnetId")}</title>
        <g:javascript library="prototype" />
    </head>
    <body>
        <h1>${fieldValue(bean: matchInstance.entries.toArray().getAt(0), field: "bnetId")} vs ${fieldValue(bean: matchInstance.entries.toArray().getAt(1), field: "bnetId")}</h1>
       	<div class="break"></div>
        <g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
        <h2>Match Details</h2>
        <div class="break"></div>
        <div class="list">
	   		<table>
		       	<tr>
					<th class="colmatch">Match</th>
		       		<th class="colbnetidl">Player</th>
		       		<th class="colrace"></th>
	       			<th class="colvs">vs</th>
	       			<th class="colrace"></th>
	       			<th class="colbentidr">Player</th>
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
	            </tr>
   			</table>
		</div>
        <g:if test="${matchInstance.forfeit}">
        	<p class="note">*match winner by forfeit</p>
        </g:if>
        <div class="break"></div>
        <div class="break"></div>
        <div class="list">
        	<table>
		   		<tr> 
		   			<th class="colmatch">Game</th>
		   			<th class="colmappack">Map</th>
		   			<th class="colrace"></th>
			   		<th>Winner</th>
			   		<th class="colmappack">Replay</th>
			   		<th class="colmappack">VOD</th>
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
		 <div class="break"></div>
		<div class="innerlinebreak"></div>
		<h2>Map Details</h2>
		<div class="break"></div>
      	<p class="note">Search for the maps in Battle.net using "+Listed Name" in Battle.net. Make sure the author of the map is correct to ensure map integrity.</p>
        <div class="break"></div>
        <div class="list">
			<table>
       			<tr>
       				<th>Game</th>
       				<th>Map Name</th>
       				<th>Listed Name in Battle.net</th>
       				<th>Author</th>
       			</tr>
	       		<g:each in="${matchInstance.mapPack.maps}" status="i" var="mapPackInstance">
	            	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	            		<td>${i+1}</td>
	            		<td>${fieldValue(bean: mapPackInstance, field: "name")}</td>
						<td>${fieldValue(bean: mapPackInstance, field: "listedName")}</td>
						<td>${fieldValue(bean: mapPackInstance, field: "author")}</td>
	                </tr>
	        	</g:each>
        	</table>
   		</div>
   		<div class='break'></div>
   		<div class="mcontent">
   		<div class='break'></div>
   			<g:each in="${matchInstance.mapPack.maps}" status="i" var="mapPackInstance">
   				<div style="text-align: center">
   					<h2>${fieldValue(bean: mapPackInstance, field: "name")}</h2>
   					<div class='break'></div>
   					<img src="${resource(dir:'images/maps', file:mapPackInstance.mapImageFileName)}" alt="${mapPackInstance.name}" />
				</div>
				<div class='break'></div>
				<div class='break'></div>
			</g:each>
   		</div>
    </body>
</html>