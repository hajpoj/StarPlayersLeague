<div class="break"></div>
<g:form method="post">
	<div class="mcontent">
		<g:hiddenField name="id" value="${threadInstance?.id}" />
		<g:hiddenField name="toUser" value="${messageInstance?.toUser.id}" />
		<g:hiddenField name="fromUser" value="${messageInstance?.fromUser.id}" />
		<p><span class="messagelabel">To: </span>${fieldValue(bean: messageInstance, field: "toUser")} (${messageInstance.toUser.bnetId}.${messageInstance.toUser.bnetCharCode})</p>
		<div class="break"></div>
		<p><span class="messagelabel">From: </span>${fieldValue(bean: messageInstance, field: "fromUser")} (${messageInstance.fromUser.bnetId}.${messageInstance.fromUser.bnetCharCode})</p>
		<div class="break"></div>
		<p><span class="messagelabel">Subject: </span>${fieldValue(bean: threadInstance, field: "subject")}</p>
		<div class="break"></div>
		<p><span class="messagelabel">Body: </span><textarea class="message_" name='replyMessage'></textarea></p>
		<div class="break"></div>
		<p><span class="messagelabel"></span><g:actionSubmit class="submitButton" action="updateThread" value="Send" /></p>
	</div>
	<div class="break"></div>	
</g:form>