
<%@ page import="spl.Playoffs" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'playoffs.label', default: 'Playoffs')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'playoffs.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'playoffs.name.label', default: 'Name')}" />
                        
                            <th><g:message code="playoffs.division.label" default="Division" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${playoffsInstanceList}" status="i" var="playoffsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${playoffsInstance.id}">${fieldValue(bean: playoffsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: playoffsInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: playoffsInstance, field: "division")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${playoffsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
