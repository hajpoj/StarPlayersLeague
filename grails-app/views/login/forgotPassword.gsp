<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Reset Password</title>
    </head>
    
    <body>
    	<h1>Reset Password</h1>
	    <div class="break"></div>
	    <g:if test="${flash.message}">
       	   	<div class="message">${flash.message}</div>
       	</g:if>
       	<g:form method="POST">
            <div class="mcontent">
            	<p>Please submit your username. We will email your reset password to you.</p>
            	<br />
            	<div class="infoleft">
            		<p><label for='username'>Username:</label></p>
            	</div>
            	<div class="inforight">
            		<p><input type='text' class='text_' name='username' /></p>
            	</div>
            </div>
			<g:actionSubmit class="submitButton" controller="login" action="resetPassword" value="Reset Password" />
		</g:form>
    </body>
</html>