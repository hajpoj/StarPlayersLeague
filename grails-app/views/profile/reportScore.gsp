<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Report Score</title>
        <g:javascript library="prototype" />
    </head>
    <body>
        <h1>Report Score</h1>
        
        <h2>Match ${fieldValue(bean: matchInstance, field:"matchNumber")}: <g:each in="${matchInstance.entries}" status="i" var="entry">
       			<g:if test="${i > 0}">vs</g:if> 
       			${fieldValue(bean: entry, field:"bnetId")}
        	</g:each></h2>
        <g:if test="${flash.message}">
        	<div class="break"></div>
        	<div class="message">${flash.message}</div>
        </g:if>
        <g:uploadForm method="post">
        	<g:hiddenField name="id" value="${matchInstance?.id}" />
        	<div class="list">
        		<table>
        			<tr>
        				<th>Game</th>
        				<th>Winner</th>
        				<th>Map</th>
        				<th>Upload Replay</th>
        			</tr>
        			
        			<g:each in="${matchInstance.games}" status="i" var="game">
        				<tr>
        					<td>${i+1}</td>
        					<td>
        						<g:select id="game${i+1}"
       		 						      name="game${i+1}"
        						      	  from="${matchInstance.entries}"
        					  		  	  optionKey="id"
        					  		   	  value="${game?.winner?.id}"
        					  		      noSelection="${['null': 'none']}"/>
        					</td>
        					<td>${game.map}</td>
        					<td>
        						<input type="file" id="replay${i+1}" name="replay${i+1}" />
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