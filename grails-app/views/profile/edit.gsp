<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Edit Account</title>
    </head>
    
    <body>
	   	<g:form method="POST">
	    	<h1>Edit Account</h1>
	    	<div class="break"></div>
	    	<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
	    	<div class="mcontent">
	    		<h2>Account Information</h2><br/>
	    		<div class="infoleftgrey">
		    		<p><label for="email"><g:message code="user.email.label" default="Email Address" /></label>:</p>
		    		<p><label for="bnetId"><g:message code="user.bnetId.label" default="Battle.net ID" /></label>:</p>
		    		<p><label for="bnetCharCode"><g:message code="user.bnetCharCode.label" default="Battle.net Char Code" /></label>:</p>
		    		<p><label for="primaryRace"><g:message code="user.primaryRace.label" default="Primary Race" /></label>:</p>
		    		<p><label for="primarySkillLevel"><g:message code="user.primarySkillLevel.label" default="Skill Level" /></label>:</p>
		    		<p><label for="bnetDivisionRank"><g:message code="user.bnetDivisionRank.label" default="Division Rank" /></label>:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><g:textField name="email" value="${userInstance?.email}" /></p>
	    			<p><g:textField name="bnetId" value="${userInstance?.bnetId}" /></p>
	    			<p><g:textField name="bnetCharCode" value="${userInstance?.bnetCharCode}" /></p>
	    			<p><g:select name="primaryRace" from="${userInstance.constraints.primaryRace.inList}" value="${userInstance?.primaryRace}" valueMessagePrefix="user.primaryRace"  /></p>
	    			<p><g:select name="primarySkillLevel" from="${userInstance.constraints.primarySkillLevel.inList}" value="${userInstance?.primarySkillLevel}" valueMessagePrefix="user.primarySkillLevel"  /></p>
	    			<p><g:select name="bnetDivisionRank" from="${userInstance.constraints.bnetDivisionRank.inList}" value="${userInstance?.bnetDivisionRank}" valueMessagePrefix="user.bnetDivisionRank"  /></p>
	    		</div>
	    	</div>
	    	<div class="innerlinebreak"></div>
	    	<div class="mcontent">
	    		<h2>Email Notifications</h2><br/>
	    		<div class="infoleftgrey">
	    			<p>When I receive new messages:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><g:checkBox name="messageNotification" value="${userInstance?.messageNotification}" /></p>
	    		</div>
	    	</div>
	    	<div class="innerlinebreak"></div>
	    	<div class="mcontent">
	    		<h2>Change Password</h2><br/>
	    		<div class="infoleftgrey">
	    			<p>Old Password:</p>
	    			<p>New Password:</p>
	    			<p>Confirm New Password:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><input type='password' class='text_' name='oldPassword' /></p>
	    			<p><input type='password' class='text_' name='newPassword' /></p>
	    			<p><input type='password' class='text_' name='confirmNewPassword' /></p>
	    		</div>
	    	</div>
	    	<div class="break"></div>
	    		<p><g:actionSubmit class="submitButton" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></p>
	    </g:form>
    </body>
</html>