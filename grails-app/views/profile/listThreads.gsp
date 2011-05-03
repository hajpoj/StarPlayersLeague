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
       	<g:each in="${threadInstanceList}" status="i" var="threadInstance">
       		<g:if test="${i > 0}"><div class="break"></div></g:if>
       		<div class="mcontent">
       			<h2>
       				<g:if test="${(currentUser.id == threadInstance.toUser.id) ? (threadInstance.unreadTo == true) : (threadInstance.unreadFrom == true)}">New!</g:if>
       				<g:link action="listMessages" params="[id:threadInstance.id]">${fieldValue(bean: threadInstance, field: "subject")}</g:link>
       			</h2>
       			<br/>
        		<g:if test="${userInstance.id == threadInstance.fromUser.id}">
        			<p class="date"><span class="threadlabel">Conversation with:</span>
        				${fieldValue(bean: threadInstance, field: "toUser")}
        				<g:if test="${threadInstance.toUser.bnetIds.size() > 0}">
        					${threadInstance.toUser.bnetIds}
        				</g:if>
        			</p>
        		</g:if>
        		<g:if test="${userInstance.id == threadInstance.toUser.id}">
        			<p class="date"><span class="threadlabel">Conversation with:</span> 
        				${fieldValue(bean: threadInstance, field: "fromUser")}
        				<g:if test="${threadInstance.fromUser.bnetIds.size() > 0}">
        					${threadInstance.fromUser.bnetIds}
        				</g:if>
        			</p>
        		</g:if>
        		<p class="date"><span class="threadlabel">Last message sent:</span> ${threadInstance.lastSentMessage.format('MM-dd-yyyy, HH:mm z')}</p>
       		</div>
       	</g:each>
       	<div class="break"></div>
       	<div class="paginateButtons">
       		<g:paginate next="Next" prev="Previous"
            		maxsteps="0" action="listThreads" total="${threadInstanceTotal}" />
        </div>
    </body>
</html>