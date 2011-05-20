<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Match Details</title>
        <g:javascript library="prototype" />
    </head>
    <body>
        <h1>Match Details</h1>
        <h2>
        	<g:each in="${matchInstance.entries}" status="i" var="entry">
       			<g:if test="${i > 0}">vs.</g:if> 
       			${fieldValue(bean: entry, field:"bnetId")}
        	</g:each>
        </h2>
        <div class="break"></div>
        <g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
<%--        <div class="list">--%>
<%--	   		<table>--%>
<%--		       	<tr>--%>
<%--					<th class="colmatch">Match</th>--%>
<%--		       		<th class="colbnetidl">Player</th>--%>
<%--		       		<th class="colracel"></th>--%>
<%--	       			<th class="colvs">vs</th>--%>
<%--	       			<th class="colracer"></th>--%>
<%--	       			<th class="colbentidr">Player</th>--%>
<%--	       			<th class="colmappack"></th>--%>
<%--       			</tr>--%>
<%--       			<tr>--%>
<%--	       			<td class="right">${fieldValue(bean: matchesInstance, field: "matchNumber")}</td>--%>
<%--	            	<g:if test="${matchesInstance.played == false}">--%>
<%--						<td class="right">--%>
<%--					</g:if>--%>
<%--					<g:else>--%>
<%--						<g:if test="${matchesInstance.entries.toArray().getAt(0).id == matchesInstance.winner.id}">--%>
<%--							<td class="winnerl">--%>
<%--						</g:if>--%>
<%--						<g:else>--%>
<%--							<td class="right">--%>
<%--						</g:else>--%>
<%--					</g:else>--%>
<%--								<g:link controller="navigation" action="profile" id="${matchesInstance.entries.toArray().getAt(0).user.id}">--%>
<%--									${fieldValue(bean: matchesInstance.entries.toArray().getAt(0), field: "bnetId")}--%>
<%--								</g:link>--%>
<%--							</td>--%>
<%--					<td class="right"><img class="icons" src="${resource(dir:'images/icons', file:matchesInstance.entries.toArray().getAt(0).race.concat('.png'))}" --%>
<%--						alt="${matchesInstance.entries.toArray().getAt(0).race}" /></td>--%>
<%--					<g:if test="${matchesInstance.played == false}">--%>
<%--						<td class="center">vs</td>--%>
<%--					</g:if>--%>
<%--					<g:else>--%>
<%--						<g:if test="${matchesInstance.entries.toArray().getAt(0).id == matchesInstance.winner.id}">--%>
<%--							<td class="matchscore">${(Integer)matchesInstance.bestOf/2+1}-${matchesInstance.loserScore}</td>--%>
<%--						</g:if>--%>
<%--						<g:else>--%>
<%--							<td class="matchscore">${matchesInstance.loserScore}-${(Integer)matchesInstance.bestOf/2+1}</td>--%>
<%--						</g:else>--%>
<%--					</g:else>--%>
<%--	                <td class="left"><img class="icons" src="${resource(dir:'images/icons', file:matchesInstance.entries.toArray().getAt(1).race.concat('.png'))}" --%>
<%--						alt="${matchesInstance.entries.toArray().getAt(1).race}" /></td>--%>
<%--	                <g:if test="${matchesInstance.played == false}">--%>
<%--						<td class="left">--%>
<%--					</g:if>--%>
<%--					<g:else>--%>
<%--						<g:if test="${matchesInstance.entries.toArray().getAt(1).id == matchesInstance.winner.id}">--%>
<%--							<td class="winnerr">--%>
<%--						</g:if>--%>
<%--						<g:else>--%>
<%--							<td class="left">--%>
<%--						</g:else>--%>
<%--					</g:else>--%>
<%--								<g:link controller="navigation" action="profile" id="${matchesInstance.entries.toArray().getAt(1).user.id}">--%>
<%--									${fieldValue(bean: matchesInstance.entries.toArray().getAt(1), field: "bnetId")}--%>
<%--								</g:link>--%>
<%--							</td>--%>
<%--	                <td class="right"><g:link controller="navigation" action="mapPack" id="${matchesInstance.mapPack.id}">${matchesInstance.mapPack}</g:link></td>--%>
<%--	            </tr>--%>
<%--   			</table>--%>
		
        <g:if test="${matchInstance.forfeit}">
        	<p>** Match winner by forfeit: ${matchInstance.winner} **</p>
        </g:if>
        <div class="list">
        	<table>
		   		<tr> 
		   			<th>Game</th>
			   		<th>Winner</th>
			   		<th>Map</th>
			   		<th>Replay</th>
			   		<th>Link To VOD</th>
		   		</tr>
        	
        		<g:each in="${matchInstance.games}" status="i" var="game">
        			<tr>
        				<td>${i+1}</td>
        				<td>
        					<g:if test="${!game.winner}">Not Played</g:if>
        					<g:else>${game.winner}</g:else>
        				</td>
        				<td>${game.map}</td>
        				<td>
        					<g:if test="${!game.pathToReplay}">Not available</g:if>
        					<g:else>
        						<a href="<g:resource dir="${groupDirInstance}" file="${game.pathToReplay}" absolute="true" />">Replay</a>
        					</g:else>
        				</td>
        				<td>
        					<g:if test="${!game.linkToVod}">
        						Not available
        					</g:if>
        					<g:else>
        						<a href="http://${game.linkToVod}">VOD Link</a>
        					</g:else>
        				</td>
        			</tr>
        		</g:each>
			</table>
		</div>
        <div class="break"></div>
    </body>
</html>