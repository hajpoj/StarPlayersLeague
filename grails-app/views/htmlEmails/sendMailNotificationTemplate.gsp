<%@ page contentType="text/html"%>
<body>
	<div>
		<h1><img src="<g:resource dir="images" file="splbanner.png" absolute="true" />" alt="StarPlayers League" /></h1>
	</div>
	<br />
	<div>
		<h4>You have a message from ${fieldValue(bean: messageInstance, field: "fromUser")} (${messageInstance.fromUser.bnetId}.${messageInstance.fromUser.bnetCharCode}):</h4>
		<p>"${fieldValue(bean: messageInstance, field: "text")}"</p>
		<p>Sent on ${messageInstance.dateCreated.format('MM-dd-yyyy, HH:mm z')}</p>
	</div>
	<div>
		<p>
			Do not reply to this email. Click <g:link absolute="true" controller="profile" action="listMessages" params="[id:messageInstance.thread.id]">here</g:link> to respond to this message. 
			To turn off email notifications, log onto <a href="http://www.starplayersleague.com">www.starplayersleague.com</a>, view your profile, click on the edit profile link, 
			and uncheck the email notifications box for receiving new messages.
		</p>
	</div>
	<br />
	<div>
		<p>-----</p>
		<p>StarPlayers Team</p>
	</div>
</body>
