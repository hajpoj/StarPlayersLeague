<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Dispute Score</title>
    </head>
    <body>
        <h1>Dispute Score</h1>
        <div class="break"></div>
        <g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
        <div class="mcontent">
	        <p>Please send an email to <a href="mailto:contact@starplayersleague.com">contact@starplayersleague.com</a> if the score reported is incorrect. Please attach the replay file and include the following match number in the subject: ${matchInstance.id}</p>
	        <br/>
	        <p>Thanks,</p>
	        <p>StarPlayers Team</p>
        </div>
    </body>
</html>