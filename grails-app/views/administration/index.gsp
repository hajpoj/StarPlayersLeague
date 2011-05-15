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
	        <div class="mcontent">
		        <div class="infoleft">
					<p><label>Modify result of match ID:</label></p>
					<p><label>Reset result of match ID:</label></p>
					<p><label>Message User:</label></p>
				</div>
				<div class="inforight">
		    		<p>
		    			<input type='text' class='text_' name='modifyMatchId'/>
		    			<g:actionSubmit class="submitButton" action="modifyMatchResult" value="Modify" />
		    		</p>
		    		<p>
		    			<input type='text' class='text_' name='resetMatchId'/>
		    			<g:actionSubmit class="submitButton" action="resetMatchResult" value="Reset" />
		    		</p>
		    		<p>
			    		<g:select name="userId"
			    				  from="${User.list()}"
		       		           	  optionKey="id"
		            	          noSelection="${['null': 'Select one...']}" />
		              	<g:actionSubmit class="submitButton" action="messageUser" value="Send Message" />
	              	</p>
		    	</div>
	        </div>
	    </g:form>
	</body>
</html>