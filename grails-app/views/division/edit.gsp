

<%@ page import="spl.Division" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'division.label', default: 'Division')}" />
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
            <g:hasErrors bean="${divisionInstance}">
            <div class="errors">
                <g:renderErrors bean="${divisionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${divisionInstance?.id}" />
                <g:hiddenField name="version" value="${divisionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="division.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: divisionInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${divisionInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="code"><g:message code="division.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: divisionInstance, field: 'code', 'errors')}">
                                    <g:select name="code.id" from="${spl.Code.list()}" optionKey="id" value="${divisionInstance?.code?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="entries"><g:message code="division.entries.label" default="Entries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: divisionInstance, field: 'entries', 'errors')}">
                                    <g:select name="entries" from="${spl.Registration.list()}" multiple="yes" optionKey="id" size="5" value="${divisionInstance?.entries*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="groups"><g:message code="division.groups.label" default="Groups" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: divisionInstance, field: 'groups', 'errors')}">
                                    
<ul>
<g:each in="${divisionInstance?.groups?}" var="g">
    <li><g:link controller="group" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="group" action="create" params="['division.id': divisionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'group.label', default: 'Group')])}</g:link>

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
