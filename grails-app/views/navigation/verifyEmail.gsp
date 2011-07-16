<html>
	<head>
		<title>Verify Email Address</title>
		<meta name="layout" content="main" />
	</head>
	
	<body>
		<div class="mcontent">
			<h1>great success!</h1>
			<div class="break"></div>
			<g:if test="${previouslyEnabled}">
				<h2>Your email was previously verified.</h2>
			</g:if>
			<g:else>
				<h2>Your email has been verified!</h2>
			</g:else>
			<div class="break"></div>
			<h3>Register for a league 
			<g:link action="register">here</g:link></h3>
		</div>
	</body>
	
</html>