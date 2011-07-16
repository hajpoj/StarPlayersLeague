<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Create Account</title>
    </head>
    
    <body>
    
    	<div class="body">
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
            <%--<g:form action="saveAccount" >
                <div class="dialog">
                    <table>
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
                                    <label for="password">Password</label>
                                </td>
                                <td valign="top">
                                	<input type='password' class='text_' name='password' />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Confirm Password</label>
                                </td>
                                <td valign="top">
                                	<input type='password' class='text_' name='confirmPassword' />
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
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bnetDivisionRank"><g:message code="user.bnetDivisionRank.label" default="Bnet Division Rank" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'bnetDivisionRank', 'errors')}">
                                    <g:select name="bnetDivisionRank" from="${userInstance.constraints.bnetDivisionRank.inList}" value="${userInstance?.bnetDivisionRank}" valueMessagePrefix="user.bnetDivisionRank"  />
                                </td>
                            </tr>
                    </table>
                </div>
                <div class="break">
                </div>
                <div>
                	<p><g:submitButton name="create" class="submitButton" value="${message(code: 'default.button.create.label', default: 'Create')}" /></p>
                </div>
            </g:form>
        </div>
    --%>

		   	<g:form action="saveAccount">
		    	<div class="mcontent">
		    		<h2>Account Information</h2><br/>
		    		<div class="infoleftgrey">
		    			<p><label for="username"><g:message code="user.username.label" default="Username" /></label>:</p>
		    			<p><label for="email"><g:message code="user.email.label" default="Email Address" /></label>:</p>
		    			<p><label for="bnetId"><g:message code="user.bnetId.label" default="Battle.net ID" /></label>:</p>
		    			<p><label for="bnetCharCode"><g:message code="user.bnetCharCode.label" default="Battle.net Char Code" /></label>:</p>
		    			<p><label for="primaryRace"><g:message code="user.primaryRace.label" default="Primary Race" /></label>:</p>
		    			<p><label for="primarySkillLevel"><g:message code="user.primarySkillLevel.label" default="Skill Level" /></label>:</p>
		    			<p><label for="bnetDivisionRank"><g:message code="user.bnetDivisionRank.label" default="Division Rank" /></label>:</p>
		    		</div>
		    		<div class="inforight">
		    			<p><g:textField name="username" value="${userInstance?.username}" /></p>
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
		    		<h2>Create Password</h2><br/>
		    		<div class="infoleftgrey">
		    			<p><label for="password">Password</label>:</p>
		    			<p><label for="password">Confirm Password</label>:</p>
		    		</div>
		    		<div class="inforight">
		    			<p><input type='password' class='text_' name='password' /></p>
		    			<p><input type='password' class='text_' name='confirmPassword' /></p>
		    		</div>
		    	</div>
		    	<div class="break"></div>
		    	<p>
					<g:submitButton name="create" class="submitButton" value="${message(code: 'default.button.create.label', default: 'Create')}" /> 
		    	</p>
		    </g:form>
		</div>
    </body>
</html>