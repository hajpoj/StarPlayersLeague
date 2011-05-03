
<%@ page import="spl.GameMap" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'gameMap.label', default: 'GameMap')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'gameMap.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'gameMap.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="listedName" title="${message(code: 'gameMap.listedName.label', default: 'Listed Name')}" />
                        
                            <g:sortableColumn property="author" title="${message(code: 'gameMap.author.label', default: 'Author')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${gameMapInstanceList}" status="i" var="gameMapInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${gameMapInstance.id}">${fieldValue(bean: gameMapInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: gameMapInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: gameMapInstance, field: "listedName")}</td>
                        
                            <td>${fieldValue(bean: gameMapInstance, field: "author")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${gameMapInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
