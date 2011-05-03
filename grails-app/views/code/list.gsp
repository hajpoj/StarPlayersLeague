
<%@ page import="spl.Code" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'code.label', default: 'Code')}" />
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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'code.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'code.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="priority" title="${message(code: 'code.priority.label', default: 'Priority')}" />
                        
                            <th><g:message code="code.season.label" default="Season" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${codeInstanceList}" status="i" var="codeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${codeInstance.id}">${fieldValue(bean: codeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: codeInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: codeInstance, field: "priority")}</td>
                        
                            <td>${fieldValue(bean: codeInstance, field: "season")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${codeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
