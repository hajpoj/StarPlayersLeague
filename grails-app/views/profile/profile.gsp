<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Profile</title>
    </head>
    
    <body>
    	<span style="float: right; margin: 13px 0 0 0; width: 625px; text-align: left;">(<g:link action="edit">Edit Profile</g:link>)</span>
    	<h1>Profile</h1>
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
    		<h2>Account Information</h2><br/>
    		<div class="infoleft">
    			<p>Username:</p>
    			<p>Email Address:</p>
    			<p>Email me when I receive a message:</p>
    		</div>
    		<div class="inforight">
    			<p>${userInstance.username}</p>
    			<p>${userInstance.email}</p>
    			<p></p>
    			<g:if test="${userInstance.messageNotification}">
    				<p>Yes</p>
 				</g:if>
 				<g:else>
 					<p>No</p>
 				</g:else>
    		</div>
    	</div>
    	<g:each in="${registrationInstanceList}" status="i" var="registrationInstance">
    	<div class="break"></div>
    	<div class="mcontent">
    		<h2>${fieldValue(bean: registrationInstance.group.division.code.season, field: "league")} (${fieldValue(bean: registrationInstance, field: "server")}) Information</h2><br/>
    		<div class="infoleft">
    			<p>Battle.net ID:</p>
    			<p>Battle.net Char Code:</p>
    			<p>Code:</p>
    			<p>Division:</p>
    			<p>Group:</p>
    		</div>
    		<div class="inforight">
    			<p>${fieldValue(bean: registrationInstance, field: "bnetId")}</p>
    			<p>${fieldValue(bean: registrationInstance, field: "bnetCharCode")}</p>
    			<p>Code ${fieldValue(bean: registrationInstance, field: "code")}</p>
    			<p>Division ${fieldValue(bean: registrationInstance, field: "division")}</p>
    			<p>Group ${fieldValue(bean: registrationInstance, field: "group")}</p>
    		</div>
    	</div>
    	</g:each>
    </body>
</html>    