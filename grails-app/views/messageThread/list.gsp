
<%@ page import="spl.MessageThread" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'messageThread.label', default: 'MessageThread')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'messageThread.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="subject" title="${message(code: 'messageThread.subject.label', default: 'Subject')}" />
                        
                            <th><g:message code="messageThread.toUser.label" default="To User" /></th>
                        
                            <g:sortableColumn property="lastSentMessage" title="${message(code: 'messageThread.lastSentMessage.label', default: 'Last Sent Message')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'messageThread.dateCreated.label', default: 'Date Created')}" />
                        
                            <th><g:message code="messageThread.fromUser.label" default="From User" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${messageThreadInstanceList}" status="i" var="messageThreadInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${messageThreadInstance.id}">${fieldValue(bean: messageThreadInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: messageThreadInstance, field: "subject")}</td>
                        
                            <td>${fieldValue(bean: messageThreadInstance, field: "toUser")}</td>
                        
                            <td><g:formatDate date="${messageThreadInstance.lastSentMessage}" /></td>
                        
                            <td><g:formatDate date="${messageThreadInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: messageThreadInstance, field: "fromUser")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${messageThreadInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
