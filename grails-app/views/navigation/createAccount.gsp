<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Create Account</title>
    </head>
    
    <body>
	   	<g:form method="post">
	    	<h1>Create Account</h1>
	    	<div class="break"></div>
	    	<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
	    	<div class="mcontent">
	    		<h2>Account Information</h2><br/>
	    		<div class="infoleftgrey">
	    			<p>Username:</p>
	    			<p>Email Address:</p>
	    			<p>Battle.net ID:</p>
	    			<p>Battle.net Character Code:</p>
	    			<p>Battle.net Profile URL:</p>
	    			<p>Primary Race:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><input type='text' class='text_' /></p>
	    			<p><input type='text' class='text_' /></p>
	    			<p><input type='text' class='text_' /></p>
	    			<p><input type='text' class='text_' /></p>
	    			<p><input type='text' class='text_'/></p>
	    			<p><g:select name="primaryRace" /></p>
	    		</div>
	    	</div>
	    	<div class="innerlinebreak"></div>
	    	<div class="mcontent">
	    		<h2>Create Password</h2><br/>
	    		<div class="infoleftgrey">
	    			<p>Password:</p>
	    			<p>Confirm Password:</p>
	    		</div>
	    		<div class="inforight">
	    			<p><input type='password' class='text_' /></p>
	    			<p><input type='password' class='text_' /></p>
	    		</div>
	    	</div>
	    	<div class="break"></div>
	    	<p>
<%--	    		<g:actionSubmit> --%>
	    	</p>
	    </g:form>
    </body>
</html>