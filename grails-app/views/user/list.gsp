
<%@ page import="spl.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        
        
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <g:form action="list">
            <div class="mcontent">
		    		<div class="infoleftgrey">
		    			<p><label for="league">League</label>:</p>
		    			<p><label for="waitingList">Waiting List</label></p> 

		    		</div>
		    		<div class="inforight">
		    			<p><g:select name="league" 
	    							 noSelection="['':'']" 
	    							 from="${['North American West', 'North American East'] }" 
	    							 value="${league ?: ''}"></g:select></p>
		    			<p><g:select name="waitingList" 
		    						 noSelection="['':'']" 
		    						 from="${[true, false]}"
		    						 value="${waitingList ?: ''}"></g:select></p>
		    		</div>
		    	</div>
		    	<div class="break"></div>
		    	<p>
					<g:submitButton name="submit" class="submitButton" value="Submit" /> 
		    	</p>
		    </g:form>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'user.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="bnetId" title="${message(code: 'user.bnetId.label', default: 'Bnet Id')}" />
                        
                            <g:sortableColumn property="bnetCharCode" title="${message(code: 'user.bnetCharCode.label', default: 'Bnet Char Code')}" />
                            
                            <g:sortableColumn property="registrationValue" title="${message(code: 'user.registrationValue.label', default: 'Registration Value')}" />
                            
                            <g:sortableColumn property="waitingList" title="${message(code: 'user.waitingList.label', default: 'Waiting List')}" />
                                                    	
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: userInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "bnetId")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "bnetCharCode")}</td>
                            
                            <td>${fieldValue(bean: userInstance, field: "registrationValue") }</td>
                            
                            <td>${fieldValue(bean: userInstance, field: "waitingList") }</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <%--<div class="paginateButtons">
                <g:paginate total="${userInstanceTotal}"/>
            </div> --%>
        </div>
    </body>
</html>
