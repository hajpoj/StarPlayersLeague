<%@ page import="spl.User" %>
<html>
	<head>
		<title>Administration</title>
		<meta name="layout" content="main" />
	</head>
	<body>
		<g:javascript library="prototype" />
		<h1>Administration</h1>
		<div class="break"></div>
		<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
		<g:form>
			<div class="infoleft">
				<p>Modify result of match ID: </p>
			</div>
			<div class="inforight">
	    		<p>
	    			<input type='text' class='text_' name='modifyMatchId'/>
	    			<g:actionSubmit class="submitButton" action="modifyMatchResult" value="Modify" />
	    		</p>
	    	</div>
	    </g:form>
	    <g:form>
			<div class="infoleft">
				<p>Reset result of match ID: </p>
			</div>
			<div class="inforight">
	    		<p>
	    			<input type='text' class='text_' name='resetMatchId'/>
	    			<g:actionSubmit class="submitButton" action="resetMatchResult" value="Reset" />
	    		</p>
	    	</div>
	    </g:form>
	    <g:form>
	    	<div class="infoleft">
				<p>Message User: </p>
			</div>
			<div class="inforight">
	    		<g:select name="userId"
	    				  from="${User.list()}"
       		           	  optionKey="id"
            	          noSelection="${['null': 'Select one...']}" />
              	<g:actionSubmit class="submitButton" action="messageUser" value="Send Message" />
			</div>
		</g:form>
	</body>
</html>