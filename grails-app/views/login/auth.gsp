<html>
	<head>
		<meta name='layout' content='main' />
		<title>Log In</title>
	</head>
	
	<body>
		<h1>Please Log In</h1>
		<div class="break"></div>
		<g:if test='${flash.message}'>
				<div class='message'>${flash.message}</div>
		</g:if>
		<form action='${postUrl}' method='post' id='loginForm' class='cssform'>
			<div class="mcontent">
				<div class='infoleft'>
					<p><label for='username'>Username:</label></p>
					<p><label for='password'>Password:</label></p>
					<br />
					<p><label for='remember_me'>Remember me:</label></p>
				</div>
				<div class='inforight'>
					<p><input type='text' class='text_' name='j_username' id='username'/></p>
					<p>
						<input type='password' class='text_' name='j_password' id='password'/> 
						<g:link controller='login' action='forgotPassword'>Forget your password?</g:link>
					</p>
					<br />
					<p>
						<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
						<g:if test='${hasCookie}'>checked='checked'</g:if> />
					</p>
				</div>
			</div>
		<g:actionSubmit class="submitButton" value="Login" />
		</form>
		<script type='text/javascript'>
			(function(){
				document.forms['loginForm'].elements['j_username'].focus();
			})();
		</script>
	</body>
</html>