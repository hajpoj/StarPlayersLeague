
<%@ page import="spl.Match" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'match.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="matchNumber" title="${message(code: 'match.matchNumber.label', default: 'Match Number')}" />
                        
                            <th><g:message code="match.mapPack.label" default="Map Pack" /></th>
                        
                            <g:sortableColumn property="bestOf" title="${message(code: 'match.bestOf.label', default: 'Best Of')}" />
                        
                            <th><g:message code="match.winner.label" default="Winner" /></th>
                        
                            <g:sortableColumn property="loserScore" title="${message(code: 'match.loserScore.label', default: 'Loser Score')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${matchInstanceList}" status="i" var="matchInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${matchInstance.id}">${fieldValue(bean: matchInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: matchInstance, field: "matchNumber")}</td>
                        
                            <td>${fieldValue(bean: matchInstance, field: "mapPack")}</td>
                        
                            <td>${fieldValue(bean: matchInstance, field: "bestOf")}</td>
                        
                            <td>${fieldValue(bean: matchInstance, field: "winner")}</td>
                        
                            <td>${fieldValue(bean: matchInstance, field: "loserScore")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${matchInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
