
<%@ page import="spl.Notice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'notice.label', default: 'Notice')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'notice.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'notice.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'notice.text.label', default: 'Text')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'notice.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'notice.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${noticeInstanceList}" status="i" var="noticeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${noticeInstance.id}">${fieldValue(bean: noticeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: noticeInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: noticeInstance, field: "text")}</td>
                        
                            <td><g:formatDate date="${noticeInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${noticeInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${noticeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
