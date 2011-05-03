<%@ page import="spl.MapPack" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mapPack.label', default: 'MapPack')}" />
        <title>Map Pack #${mapPackInstance.id}</title>
    </head>
    <body>
    	<h1>Map Pack #${mapPackInstance.id}</h1>
    	<div class="break"></div>
        <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
			<table>
			<p class="date">NOTE: Search for the maps in Battle.net using the Listed Name. Make sure the author of the map is correct to ensure map integrity.</p>
       			<tr>
       				<th>Game</th>
       				<th>Map Name</th>
       				<th>Listed Name in Battle.net</th>
       				<th>Author</th>
       			</tr>
	       		<g:each in="${mapPackInstance.maps}" status="i" var="mapPackInstance">
	            	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	            		<td>Game ${i+1}</td>
	            		<td>${fieldValue(bean: mapPackInstance, field: "name")}</td>
						<td>${fieldValue(bean: mapPackInstance, field: "listedName")}</td>
						<td>${fieldValue(bean: mapPackInstance, field: "author")}</td>
	                </tr>
	        	</g:each>
        	</table>
   		</div>
   		<div class='break'></div>
   		<div class="mcontent">
   		<div class='break'></div>
   			<g:each in="${mapPackInstance.maps}" status="i" var="mapPackInstance">
   				<div style="text-align: center">
   					<h2>${fieldValue(bean: mapPackInstance, field: "name")}</h2>
   					<div class='break'></div>
   					<img src="${resource(dir:'images/maps', file:mapPackInstance.mapImageFileName)}" alt="${mapPackInstance.name}" border="1px" border-color="#888888" align="middle" />
				</div>
				<div class='break'></div>
				<div class='break'></div>
			</g:each>
   		</div>
    </body>
</html>