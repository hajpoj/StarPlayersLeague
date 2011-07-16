<%@ page contentType="text/html"%>
<body>
	<div>
		<h1><img src="<g:resource dir="images" file="splbanner.png" absolute="true" />" alt="StarPlayers League" /></h1>
	</div>
	<br />
	<div>
		<p>Great! You got our email. Verify your account 
		<g:link controller="navigation" action="verifyEmail" absolute="true" params="[id:id]">here</g:link>.
		</p>
	</div>

	<br />
	<div>
		<p>-----</p>
		<p>StarPlayers Team</p>
	</div>
</body>