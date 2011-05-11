<head>
<meta name='layout' content='main' />
<title>Login</title>
<style type='text/css' media='screen'>
#login {
	margin: 0;
	padding: 0;
}
#login .inner {
	text-align:left;
	padding: 0;
}
#login .inner .cssform p {
	clear: left;
	margin: 0;
	padding: 0;
}
#login .inner .cssform input[type='text'] {
	width: 150px;
}
#login .inner .cssform label {
	font-weight: bold;
	float: left;
	width: 120px;
	padding: 4px 0 0 0;
}
#login .login_message {color:#444;}
#login .inner .text_ {width:150px;}
#login .inner .chk {height:12px; margin: 6px 0 0 0}
</style>
</head>

<body>
	<h1>Please Login</h1>
	<div class="break"></div>
	<g:if test='${flash.message}'>
			<div class='message'>${flash.message}</div>
	</g:if>
	<div id="login">
		<div class='inner'>
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<div class="mcontent">
					<p>
						<label for='username'>Login ID</label>
						<input type='text' class='text_' name='j_username' id='username' />
					</p>
					<br/>
					<p>
						<label for='password'>Password</label>
						<input type='password' class='text_' name='j_password' id='password' />
<%--						<g:link controller='login' action='forgotPassword'>Forgot your password?</g:link>--%>
					</p>
					<br/>
					<p>
						<label for='remember_me'>Remember me</label>
						<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
						<g:if test='${hasCookie}'>checked='checked'</g:if> />
					</p>
				</div>
				<div class="break"></div>
				<p>
					<input type='submit' value='Login' />
				</p>
			</form>
		</div>
	</div>
<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
</body>
