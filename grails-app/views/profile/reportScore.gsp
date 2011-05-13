<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Report Score</title>
        <g:javascript library="prototype" />
    </head>
    <body>
        <h1>Report Score</h1>
        <h2>Match ${fieldValue(bean: matchInstance, field:"matchNumber")}</h2>
        <div class="break"></div>
        <g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
        <g:form method="POST">
        	<g:hiddenField name="id" value="${matchInstance?.id}" />
        	<div class="mcontent">
        		<div class="infoleft">
        			<p>Match Up:</p>
        			<g:each in="${1..matchInstance.bestOf}">
        				<p>Game ${it} Winner: </p>
        			</g:each>
        		</div>
        		<div class="inforight">
        			<p><g:each in="${matchInstance.entries}" status="i" var="entry">
       					<g:if test="${i > 0}">vs.</g:if> 
       					${fieldValue(bean: entry, field:"bnetId")}
        			</g:each></p>
        			<g:each in="${matchInstance.games}" status="i" var="game">
        				<p><g:select id="game${i+1}"
       		 						 name="game${i+1}"
        						     from="${matchInstance.entries}"
        					  		 optionKey="id"
        					  		 value="${game?.winner?.id}"
        					  		 noSelection="${['null': 'Not Played']}"/></p>
        			</g:each>
        		</div>
        	</div>
        <p><g:actionSubmit class="submitButton" action="submitScore" value="Submit" /></p>
        </g:form>
    </body>
</html>