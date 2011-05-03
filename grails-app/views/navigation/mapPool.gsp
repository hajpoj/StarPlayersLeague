<%@ page import="spl.GameMap" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Map Pool</title>
    </head>
    <body>
    	<h1>Map Pool</h1>
    	<div class="break"></div>
    	<p class="date">NOTE: Search for the maps in Battle.net using the Listed Name. Make sure the author of the map is correct to ensure map integrity.</p>
    	<div class="break"></div>
        <h2>1v1 StarPlayers League Maps</h2>
			<div class="list">
			<table>
       			<tr>
       				<th>Map Name</th>
       				<th>Listed Name in Battle.net</th>
       				<th>Author</th>
       			</tr>
	       		<g:each in="${gameMapInstanceList}" status="i" var="gameMapInstance">
	            	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	            		<td>${fieldValue(bean: gameMapInstance, field: "name")}</td>
						<td>${fieldValue(bean: gameMapInstance, field: "listedName")}</td>
						<td>${fieldValue(bean: gameMapInstance, field: "author")}</td>
	                </tr>
	        	</g:each>
        	</table>
   		</div>
   		<div class='break'></div>
   		<div class="mcontent">
   		<div class='break'></div>
   			<g:each in="${gameMapInstanceList}" status="i" var="gameMapInstance">
   				<div style="text-align: center">
   					<h2>${fieldValue(bean: gameMapInstance, field: "name")}</h2>
   					<div class='break'></div>
   					<img src="${resource(dir:'images/maps', file:gameMapInstance.mapImageFileName)}" alt="${gameMapInstance.name}" border="1px" border-color="#888888"/>
				</div>
				<div class='break'></div>
				<div class='break'></div>
			</g:each>
		</div>
    </body>
</html>