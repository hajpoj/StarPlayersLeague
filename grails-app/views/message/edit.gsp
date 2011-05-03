

<%@ page import="spl.Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageInstance}">
            <div class="errors">
                <g:renderErrors bean="${messageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${messageInstance?.id}" />
                <g:hiddenField name="version" value="${messageInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="text"><g:message code="message.text.label" default="Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'text', 'errors')}">
                                    <g:textField name="text" value="${messageInstance?.text}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="toUser"><g:message code="message.toUser.label" default="To User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'toUser', 'errors')}">
                                    <g:select name="toUser.id" from="${spl.User.list()}" optionKey="id" value="${messageInstance?.toUser?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fromUser"><g:message code="message.fromUser.label" default="From User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'fromUser', 'errors')}">
                                    <g:select name="fromUser.id" from="${spl.User.list()}" optionKey="id" value="${messageInstance?.fromUser?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="thread"><g:message code="message.thread.label" default="Thread" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'thread', 'errors')}">
                                    <g:select name="thread.id" from="${spl.MessageThread.list()}" optionKey="id" value="${messageInstance?.thread?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unreadFrom"><g:message code="message.unreadFrom.label" default="Unread From" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'unreadFrom', 'errors')}">
                                    <g:checkBox name="unreadFrom" value="${messageInstance?.unreadFrom}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unreadTo"><g:message code="message.unreadTo.label" default="Unread To" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageInstance, field: 'unreadTo', 'errors')}">
                                    <g:checkBox name="unreadTo" value="${messageInstance?.unreadTo}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
