<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Message Threads</title>
    </head>
    <body>
       	<h1>Message Threads</h1>
       	<div class="break"></div>
       	<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${threadInstance}">
            <div class="errors">
                <g:renderErrors bean="${threadInstance}" as="list" />
            </div>
        </g:hasErrors>
        <div class="list">
			<table>
       			<tr>
       				<th class="colconvowith">Conversation With</th>
       				<th class="colsubject">Subject</th>
       				<th class="collastmessage">Last Message Sent</th>
       			</tr>
	       		<g:each in="${threadInstanceList}" status="i" var="threadInstance">
	            	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	            		<td>
	            			<g:if test="${userInstance.id == threadInstance.fromUser.id}">
			        		${fieldValue(bean: threadInstance, field: "toUser")} (${threadInstance.toUser.bnetId}.${threadInstance.toUser.bnetCharCode})</g:if>
			        		<g:if test="${userInstance.id == threadInstance.toUser.id}">
			        		${fieldValue(bean: threadInstance, field: "fromUser")} (${threadInstance.fromUser.bnetId}.${threadInstance.fromUser.bnetCharCode})
			        		</g:if>
			        	</td>
						<td>
							<g:if test="${(currentUser.id == threadInstance.toUser.id) ? (threadInstance.unreadTo == true) : (threadInstance.unreadFrom == true)}">New!</g:if>
       						<g:link action="listMessages" params="[id:threadInstance.id]">${fieldValue(bean: threadInstance, field: "subject")}</g:link>
       					</td>
						<td>${threadInstance.lastSentMessage.format('MM-dd-yyyy, HH:mm z')}</td>
	                </tr>
	        	</g:each>
        	</table>
   		</div>
       	<div class="paginateButtons">
       		<g:paginate next="Next" prev="Previous" maxsteps="0" action="listThreads" total="${threadInstanceTotal}" />
        </div>
    </body>
</html>