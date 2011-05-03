

<%@ page import="spl.MessageThread" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'messageThread.label', default: 'MessageThread')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageThreadInstance}">
            <div class="errors">
                <g:renderErrors bean="${messageThreadInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="subject"><g:message code="messageThread.subject.label" default="Subject" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageThreadInstance, field: 'subject', 'errors')}">
                                    <g:textField name="subject" value="${messageThreadInstance?.subject}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="toUser"><g:message code="messageThread.toUser.label" default="To User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageThreadInstance, field: 'toUser', 'errors')}">
                                    <g:select name="toUser.id" from="${spl.User.list()}" optionKey="id" value="${messageThreadInstance?.toUser?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastSentMessage"><g:message code="messageThread.lastSentMessage.label" default="Last Sent Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageThreadInstance, field: 'lastSentMessage', 'errors')}">
                                    <g:datePicker name="lastSentMessage" precision="day" value="${messageThreadInstance?.lastSentMessage}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromUser"><g:message code="messageThread.fromUser.label" default="From User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageThreadInstance, field: 'fromUser', 'errors')}">
                                    <g:select name="fromUser.id" from="${spl.User.list()}" optionKey="id" value="${messageThreadInstance?.fromUser?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unreadFrom"><g:message code="messageThread.unreadFrom.label" default="Unread From" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageThreadInstance, field: 'unreadFrom', 'errors')}">
                                    <g:checkBox name="unreadFrom" value="${messageThreadInstance?.unreadFrom}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unreadTo"><g:message code="messageThread.unreadTo.label" default="Unread To" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageThreadInstance, field: 'unreadTo', 'errors')}">
                                    <g:checkBox name="unreadTo" value="${messageThreadInstance?.unreadTo}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
