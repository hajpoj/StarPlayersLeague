<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Create Account</title>
    </head>
    
    <body>
    
    <div class="body">
            <h1>Create Account</h1>
            <g:form action="saveAccount" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="user.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${userInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="user.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${userInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="user.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${userInstance?.email}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bnetId"><g:message code="user.bnetId.label" default="Bnet Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'bnetId', 'errors')}">
                                    <g:textField name="bnetId" value="${userInstance?.bnetId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bnetCharCode"><g:message code="user.bnetCharCode.label" default="Bnet Char Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'bnetCharCode', 'errors')}">
                                    <g:textField name="bnetCharCode" value="${userInstance?.bnetCharCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="primaryRace"><g:message code="user.primaryRace.label" default="Primary Race" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'primaryRace', 'errors')}">
                                    <g:select name="primaryRace" from="${userInstance.constraints.primaryRace.inList}" value="${userInstance?.primaryRace}" valueMessagePrefix="user.primaryRace"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="primarySkillLevel"><g:message code="user.primarySkillLevel.label" default="Primary Skill Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'primarySkillLevel', 'errors')}">
                                    <g:select name="primarySkillLevel" from="${userInstance.constraints.primarySkillLevel.inList}" value="${userInstance?.primarySkillLevel}" valueMessagePrefix="user.primarySkillLevel"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="saveAccount" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    
    <%---- 
	   	<g:form action="create" method="post">
	    	<h1>Create Account</h1>
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
	    			<p>Username:</p>
	    			<p>Email Address:</p>
	    			<p>Battle.net ID:</p>
	    			<p>Battle.net Character Code:</p>
	    			<p>Battle.net Profile URL:</p>
	    			<p>Primary Race:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><input type='text' class='text_' /></p>
	    			<p><input type='text' class='text_' /></p>
	    			<p><input type='text' class='text_' /></p>
	    			<p><input type='text' class='text_' /></p>
	    			<p><input type='text' class='text_'/></p>
	    			<p><g:select name="primaryRace" /></p>
	    		</div>
	    	</div>
	    	<div class="innerlinebreak"></div>
	    	<div class="mcontent">
	    		<h2>Create Password</h2><br/>
	    		<div class="infoleftgrey">
	    			<p>Password:</p>
	    			<p>Confirm Password:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><input type='password' class='text_' /></p>
	    			<p><input type='password' class='text_' /></p>
	    		</div>
	    	</div>
	    	<div class="break"></div>
	    	<p>
			<g:actionSubmit value="Create Account" action="createAccount" /> 
	    	</p>
	    </g:form>  --%>
    </body>
</html>