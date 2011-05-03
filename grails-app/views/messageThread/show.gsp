
<%@ page import="spl.MessageThread" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'messageThread.label', default: 'MessageThread')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageThreadInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.subject.label" default="Subject" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageThreadInstance, field: "subject")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.toUser.label" default="To User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${messageThreadInstance?.toUser?.id}">${messageThreadInstance?.toUser?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.lastSentMessage.label" default="Last Sent Message" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${messageThreadInstance?.lastSentMessage}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${messageThreadInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.fromUser.label" default="From User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${messageThreadInstance?.fromUser?.id}">${messageThreadInstance?.fromUser?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${messageThreadInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.messages.label" default="Messages" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${messageThreadInstance.messages}" var="m">
                                    <li><g:link controller="message" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.unreadFrom.label" default="Unread From" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${messageThreadInstance?.unreadFrom}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageThread.unreadTo.label" default="Unread To" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${messageThreadInstance?.unreadTo}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${messageThreadInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
