<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Report Score</title>
        <g:javascript library="prototype" />
    </head>
    <body>
        <h1>Report Score</h1>
        <div class="break"></div>
        <g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
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
		<div class="break"></div>
		<div class="break"></div>
        <g:uploadForm method="post">
        	<g:hiddenField name="id" value="${matchInstance?.id}" />
        	<div class="list">
        		<table>
        			<tr>
        				<th class="colmatch">Game</th>
        				<th style="width: 150px;">Map</th>
        				<th>Winner</th>
        				<th>Upload Replay</th>
        			</tr>
        			
        			<g:each in="${matchInstance.games}" status="i" var="game">
        				<tr>
        					<td class="right">${i+1}</td>
        					<td>${game.map}</td>
        					<td>
        						<g:select class="gamewinner"
       		 						      name="game${i+1}"
        						      	  from="${matchInstance.entries}"
        					  		  	  optionKey="id"
        					  		   	  value="${game?.winner?.id}"
        					  		      noSelection="${['null': 'none']}"/>
        					</td>
        					<td>
        						<input type="file" name="replay${i+1}" />
        					</td>
        				</tr>
        			</g:each>
        		</table>
        	</div>
        	<div class="break"></div>
        	<div class="mcontent">
        	    <div class="infoleft">
	        		<p>Was this match a forfeit?</p>
	        		<p>Winner of the forfeited match:</p> 
        		</div>
        		<div class="inforight">
	        		<p><g:checkBox name="forfeit" value="${matchInstance?.forfeit}" /></p>
	        		<p><g:select id="forfeitWinner"
       		 				 name="forfeitWinner"
        					 from="${matchInstance.entries}"
        					 optionKey="id"
        					 noSelection="${['null': 'N/A']}"/></p>
        		</div>
        	</div>
        	<div class="break"></div>
        	<p><g:actionSubmit class="submitButton" action="submitScore" value="Submit" /></p>
        </g:uploadForm>
    </body>
</html>