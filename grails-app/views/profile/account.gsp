<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>My Account</title>
    </head>
    
    <body>
    	<div id="editaccount">
    		<p>(<g:link action="edit">Edit Account</g:link>)</p>
    	</div>
    	<h1>My Account</h1>
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
    		<h2>Account Information</h2>
			<div class="break"></div>
    		<div class="infoleftgrey">
    			<p>Username:</p>
    			<p>Email Address:</p>
    			<p>Battle.net ID:</p>
    			<p>Battle.net Char Code:</p>
    			<p>Primary Race:</p>
    			<p>Skill Level:</p>
    			<p>Division Rank:</p>
    		</div>
    		<div class="inforight">
    			<p>${userInstance.username}</p>
    			<p>${userInstance.email}</p>
    			<p>${userInstance.bnetId}</p>
    			<p>${userInstance.bnetCharCode}</p>
    			<p>${userInstance.primaryRace}</p>
    			<p>${userInstance.primarySkillLevel}</p>
    			<p>${userInstance.bnetDivisionRank}</p>
    		</div>
    	</div>
    	<div class="innerlinebreak"></div>
    	<div class="mcontent">
    		<h2>Email Notifications</h2>
			<div class="break"></div>
    		<div class="infoleftgrey">
    			<p>When I receive new messages:</p>
    		</div>
    		<div class="inforight">
    			<g:if test="${userInstance.messageNotification}">
    				<p>Yes</p>
 				</g:if>
 				<g:else>
 					<p>No</p>
 				</g:else>
    		</div>
    	</div>
    </body>
</html>    