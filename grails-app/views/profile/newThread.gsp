<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>New message to ${fieldValue(bean: threadInstance, field: "toUser")}</title>
    </head>
    
    <body>
    	<g:form method="post">
	    	<h1>New message to ${fieldValue(bean: threadInstance, field: "toUser")}</h1>
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
	   			<g:hiddenField name="toUser" value="${threadInstance?.toUser.id}" />
	   			<g:hiddenField name="fromUser" value="${threadInstance?.fromUser.id}" />
	   			<p><span class="messagelabel">To: </span>${fieldValue(bean: messageInstance, field: "toUser")} (${messageInstance.toUser.bnetId}.${messageInstance.toUser.bnetCharCode})</p>
        		<p><span class="messagelabel">From: </span>${fieldValue(bean: messageInstance, field: "fromUser")} (${messageInstance.fromUser.bnetId}.${messageInstance.fromUser.bnetCharCode})</p><br/>
	   			<p><span class="messagelabel">Subject: </span><g:textField class="subject_" name='subject'></g:textField></p><br/>
	   			<p><span class="messagelabel">Body: </span><textarea class="message_" name='body'></textarea>
	       	</div>
	       	<div class="break"></div>
	        <p><g:actionSubmit class="submitButton" action="saveThread" value="Send" /></p>
	        </g:form>
    </body>
    
</html>