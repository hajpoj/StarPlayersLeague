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
        	<g:javascript library="prototype" />
        	<g:form method="post" >
                <div class="dialog">
                    <table>
						<tr class="prop">
                    	    <td valign="top" class="name">
                        		<label for="code">Code: </label><br/>
                            	<g:select id="codeDropdown" 
                                          name="codeDropdown" 
                                          from="${codeInstanceList}" 
                                          optionKey="id"
                                          noSelection="${['null': 'Select one...']}" 
                                          onchange="${remoteFunction(action:'newCode',
                                         						     update:'divisionDropdown', 
                                         						   	 params:'\'code=\' + this.value')}"/>	
                            </td>
                    		<td valign="top" class="name">
                    			<label for="division">Division: </label>
                    			<div id="divisionDropdown">
                    			
                    			</div>
                    		</td>
                    		<td valign="top" class="name">
                    			<label for="group">Group: </label>
                    			<div id="groupDropdown">
                    			
                    			</div>
                    		</td>
                    		<td>
                    		</td>
                    		<td>
                    		</td>
                    	</tr>
                    </table>
            	</div>
            </g:form>
            <g:if test="${flash.message}">
           		<div class="message">${flash.message}</div>
            </g:if>
            <div class="break"></div>
            <div id="standingsTable">
            	<g:render template="table_template" bean="${standingsInstanceList}" var= "standingsInstanceList"/> 
            </div>
        </div>
    </body>
</html>
