<html>
	<head>
		<title>Verify Email Address</title>
		<meta name="layout" content="main" />
	</head>
	
	<body>
		<div class="mcontent">
			<h1>Account Verification</h1>
			<div class="break"></div>
			<g:if test="${previouslyEnabled}">
				<h2>You already verified your account!</h2>
			</g:if>
			<g:else>
				<h2>Thank you for verifying your account!</h2>
			</g:else>
			<div class="break"></div>
			<p>Now that you have an account, you can register for a league 
			<g:link action="register">here</g:link>.</p>
		</div>
	</body>
	
</html>