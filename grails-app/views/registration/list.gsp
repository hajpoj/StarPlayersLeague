
<%@ page import="spl.Registration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'registration.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="bnetId" title="${message(code: 'registration.bnetId.label', default: 'Bnet Id')}" />
                        
                            <g:sortableColumn property="bnetCharCode" title="${message(code: 'registration.bnetCharCode.label', default: 'Bnet Char Code')}" />
                        
                            <g:sortableColumn property="race" title="${message(code: 'registration.race.label', default: 'Race')}" />
                        
                            <g:sortableColumn property="skillLevel" title="${message(code: 'registration.skillLevel.label', default: 'Skill Level')}" />
                        
                            <th><g:message code="registration.server.label" default="Server" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${registrationInstanceList}" status="i" var="registrationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${registrationInstance.id}">${fieldValue(bean: registrationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: registrationInstance, field: "bnetId")}</td>
                        
                            <td>${fieldValue(bean: registrationInstance, field: "bnetCharCode")}</td>
                        
                            <td>${fieldValue(bean: registrationInstance, field: "race")}</td>
                        
                            <td>${fieldValue(bean: registrationInstance, field: "skillLevel")}</td>
                        
                            <td>${fieldValue(bean: registrationInstance, field: "server")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${registrationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
