<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Reset Password</title>
      	<style type='text/css' media='screen'>
        input.text_ {
			width: 150px;
		}
		input.submitButton {
			margin: 10px 0 0 0;
		}
		</style>
    </head>
    
    <body>
    	<g:form method="POST">
	   		<h1>Reset Password</h1>
		    <div class="break"></div>
		    <g:if test="${flash.message}">
        	   	<div class="message">${flash.message}</div>
        	</g:if>
            
        	<p>
				<label for='username'>Login ID</label>
				<input type='text' class='text_' name='username'/>
			</p>
			<p><g:actionSubmit class="submitButton" controller="login" action="resetPassword" value="Reset Password" /></p>
		</g:form>
    </body>
</html>