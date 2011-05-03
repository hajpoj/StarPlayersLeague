<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Reply to ${fieldValue(bean: threadInstance, field: "subject")}</title>
    </head>
    
    <body>
    	<g:form method="POST">
	    	<h1>Reply to ${fieldValue(bean: threadInstance, field: "subject")}</h1>
	    	<div class="break"></div>
	    	<g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
	            </g:if>
	            <g:hasErrors bean="${messageInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${messageInstance}" as="list" />
	            </div>
	        </g:hasErrors>
	   		<div class="mcontent">
	   			<g:hiddenField name="id" value="${threadInstance?.id}" />
	   			<g:hiddenField name="toUser" value="${messageInstance?.toUser.id}" />
	   			<g:hiddenField name="fromUser" value="${messageInstance?.fromUser.id}" />
	   			<p><span class="messagelabel">To: </span>${fieldValue(bean: messageInstance, field: "toUser")} <g:if test="${messageInstance.toUser.bnetIds.size() > 0}">${messageInstance.toUser.bnetIds}</g:if></p>
        		<p><span class="messagelabel">From: </span>${fieldValue(bean: messageInstance, field: "fromUser")} <g:if test="${messageInstance.fromUser.bnetIds.size() > 0}">${messageInstance.fromUser.bnetIds}</g:if></p><br/>
	   			<p><span class="messagelabel">Subject: </span>${fieldValue(bean: threadInstance, field: "subject")}</p><br/>
	   			<p><span class="messagelabel">Body: </span><textarea class="message_" name='replyMessage'></textarea>
	       	</div>
	        <p><g:actionSubmit class="submitButton" action="updateThread" value="Send" /></p>
	        </g:form>
	 </body>
    
</html>