<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>${userInstance.username}</title>
    </head>
    
    <body>
    	<h1>${userInstance.username}</h1>
    	<div class="break"></div>
    	<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${registrationInstance}">
            <div class="errors">
                <g:renderErrors bean="${registrationInstance}" as="list" />
            </div>
        </g:hasErrors>
    	<div class="mcontent">
    		<h2>General Information</h2><br/>
    		<div class="infoleft">
    			<p>Battle.net ID:</p>
    			<p>Primary Race:</p>
    		</div>
    		<div class="inforight">
    			<p>${userInstance.bnetId}</p>
    			<p>${userInstance.primaryRace}</p>
    		</div>
    	</div>
    	<g:each in="${registrationInstanceList}" status="i" var="registrationInstance">
    	<div class="break"></div>
    	<div class="mcontent">
    		<h2>${fieldValue(bean: registrationInstance.group.division.code.season, field: "league")} (${fieldValue(bean: registrationInstance, field: "server")}) Information</h2><br/>
    		<div class="infoleft">
    			<p>Code:</p>
    			<p>Division:</p>
    			<p>Group:</p>
    		</div>
    		<div class="inforight">
    			<p>Code ${fieldValue(bean: registrationInstance, field: "code")}</p>
    			<p>Division ${fieldValue(bean: registrationInstance, field: "division")}</p>
    			<p>Group ${fieldValue(bean: registrationInstance, field: "group")}</p>
    		</div>
    	</div>
    	</g:each>
    </body>
</html>    