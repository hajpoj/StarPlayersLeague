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
        						<a href="${game.pathToReplay}">Replay</a>
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