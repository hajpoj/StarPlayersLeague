
<%@ page import="spl.Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'message.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'message.text.label', default: 'Text')}" />
                        
                            <th><g:message code="message.toUser.label" default="To User" /></th>
                        
                            <th><g:message code="message.fromUser.label" default="From User" /></th>
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'message.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'message.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${messageInstanceList}" status="i" var="messageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${messageInstance.id}">${fieldValue(bean: messageInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "text")}</td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "toUser")}</td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "fromUser")}</td>
                        
                            <td><g:formatDate date="${messageInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${messageInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${messageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
