<%@ page import="spl.Registration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Standings</title>
    </head>
    <body>
        <div class="body">
        	<h1>Standings</h1>
        	<div class="break"></div>
        	<g:javascript library="prototype" />
        	<g:form method="post" >
            	<div class="mcontent">
            		<p>View standings for a specific Code/Division/Group.</p>
            		<br />
            		<div class="infoleft">
            			<p><label for="code">Code:</label></p>
            			<p><label for="division">Division:</label></p>
            			<p><label for="group">Group:</label></p>
            		</div>
            		<div style="line-height: 200%; height: 75px;">
            			<p>
            				<g:select id="codeDropdown" 
                                          name="codeDropdown" 
                                          from="${codeInstanceList}" 
                                          optionKey="id"
                                          noSelection="${['null': 'Select one...']}" 
                                          onchange="${remoteFunction(action:'newCode',
                                         						     update:'divisionDropdown', 
                                         						   	 params:'\'code=\' + this.value')}"/>
                    	</p>
            			<div id="divisionDropdown"></div>
            			<div id="groupDropdown"></div>
            		</div>
            	</div>
            </g:form>
            <g:if test="${flash.message}">
           		<div class="message">${flash.message}</div>
            </g:if>
            <div class="break"></div>
            <div id="standingsTable">
            	<g:render template="tableTemplate" bean="${standingsInstanceList}" var= "standingsInstanceList"/> 
            </div>
        </div>
    </body>
</html>
