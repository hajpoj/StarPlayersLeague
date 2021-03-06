<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>${fieldValue(bean: threadInstance, field: "subject")}</title>
        <g:javascript library="prototype" />
    </head>
    
    <body>
    	<h1>${fieldValue(bean: threadInstance, field: "subject")}</h1>
    	<div class="break"></div>
    	<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageInstance}">
            <div class="errors">
                <g:renderErrors bean="${messageInstance}" as="list" />
            </div>
        </g:hasErrors>
	    <g:each in="${messageInstanceList}" status="i" var="messageInstance">
		   	<div class="mcontent">
		       	<p class="messageperson">${fieldValue(bean: messageInstance, field: "fromUser")} (${messageInstance.fromUser.bnetId}.${messageInstance.fromUser.bnetCharCode})</p>
		       	<br />
		       	<p>${fieldValue(bean: messageInstance, field: "text")}</p>
		       	<br />
		       	<p class="note">Sent on ${messageInstance.dateCreated.format('MM-dd-yyyy, HH:mm z')}</p>
		    </div>
		    <div class="innerlinebreak"></div>
	    </g:each>
        <div id="replyBox"></div>
        <p><g:remoteLink action="addMessageToThread" params="[id:threadInstance.id]" update="replyBox">Reply</g:remoteLink></p>
<%--        <p><g:link action="addMessageToThread" params="[id:threadInstance.id]">Reply</g:link></p>--%>
        <div class="break"></div>
        <p><g:link action="listThreads"><< Back to threads</g:link></p>
    </body>
    
</html>