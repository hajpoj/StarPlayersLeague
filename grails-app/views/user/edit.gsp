

<%@ page import="spl.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <g:hiddenField name="version" value="${userInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="user.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${userInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="user.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${userInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="user.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${userInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bnetId"><g:message code="user.bnetId.label" default="Bnet Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'bnetId', 'errors')}">
                                    <g:textField name="bnetId" value="${userInstance?.bnetId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bnetCharCode"><g:message code="user.bnetCharCode.label" default="Bnet Char Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'bnetCharCode', 'errors')}">
                                    <g:textField name="bnetCharCode" value="${userInstance?.bnetCharCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="primaryRace"><g:message code="user.primaryRace.label" default="Primary Race" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'primaryRace', 'errors')}">
                                    <g:select name="primaryRace" from="${userInstance.constraints.primaryRace.inList}" value="${userInstance?.primaryRace}" valueMessagePrefix="user.primaryRace"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="primarySkillLevel"><g:message code="user.primarySkillLevel.label" default="Primary Skill Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'primarySkillLevel', 'errors')}">
                                    <g:select name="primarySkillLevel" from="${userInstance.constraints.primarySkillLevel.inList}" value="${userInstance?.primarySkillLevel}" valueMessagePrefix="user.primarySkillLevel"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastLogin"><g:message code="user.lastLogin.label" default="Last Login" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'lastLogin', 'errors')}">
                                    <g:datePicker name="lastLogin" precision="day" value="${userInstance?.lastLogin}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="accountExpired"><g:message code="user.accountExpired.label" default="Account Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'accountExpired', 'errors')}">
                                    <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="accountLocked"><g:message code="user.accountLocked.label" default="Account Locked" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'accountLocked', 'errors')}">
                                    <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="enabled"><g:message code="user.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${userInstance?.enabled}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="messageNotification"><g:message code="user.messageNotification.label" default="Message Notification" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'messageNotification', 'errors')}">
                                    <g:checkBox name="messageNotification" value="${userInstance?.messageNotification}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="passwordExpired"><g:message code="user.passwordExpired.label" default="Password Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'passwordExpired', 'errors')}">
                                    <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="registrations"><g:message code="user.registrations.label" default="Registrations" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'registrations', 'errors')}">
                                    
<ul>
<g:each in="${userInstance?.registrations?}" var="r">
    <li><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="registration" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'registration.label', default: 'Registration')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="threadsFromMe"><g:message code="user.threadsFromMe.label" default="Threads From Me" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'threadsFromMe', 'errors')}">
                                    
<ul>
<g:each in="${userInstance?.threadsFromMe?}" var="t">
    <li><g:link controller="messageThread" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="messageThread" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'messageThread.label', default: 'MessageThread')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="threadsToMe"><g:message code="user.threadsToMe.label" default="Threads To Me" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'threadsToMe', 'errors')}">
                                    
<ul>
<g:each in="${userInstance?.threadsToMe?}" var="t">
    <li><g:link controller="messageThread" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="messageThread" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'messageThread.label', default: 'MessageThread')])}</g:link>

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
