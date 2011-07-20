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
    	<p class="note">Search for the maps using "+Listed +Name" in Battle.net. Check the author of the map to ensure map integrity.</p>
    	<div class="break"></div>
        <h2>1v1 League Maps</h2>
        <div class="break"></div>
		<div class="list">
			<table>
       			<tr>
       				<th>Map Name</th>
       				<th>Listed Name in Battle.net</th>
       				<th>Author</th>
       			</tr>
	       		<g:each in="${gameMapInstanceList}" status="i" var="gameMapInstance">
	       			<g:if test="${i > 9}">
		            	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		            		<td>${fieldValue(bean: gameMapInstance, field: "name")}</td>
							<td>${fieldValue(bean: gameMapInstance, field: "listedName")}</td>
							<td>${fieldValue(bean: gameMapInstance, field: "author")}</td>
		                </tr>
		            </g:if>
	        	</g:each>
        	</table>
   		</div>
   		<div class='break'></div>
   		<div class="mcontent">
   		<div class='break'></div>
   			<g:each in="${gameMapInstanceList}" status="i" var="gameMapInstance">
   				<g:if test="${i > 9}">
	   				<div style="text-align: center">
	   					<h2>${fieldValue(bean: gameMapInstance, field: "name")}</h2>
	   					<div class='break'></div>
	   					<img src="${resource(dir:'images/maps', file:gameMapInstance.mapImageFileName)}" alt="${gameMapInstance.name}" />
					</div>
					<div class='break'></div>
					<div class='break'></div>
				</g:if>
			</g:each>
		</div>
    </body>
</html>