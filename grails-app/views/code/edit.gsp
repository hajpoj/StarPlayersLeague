

<%@ page import="spl.Code" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'code.label', default: 'Code')}" />
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
            <g:hasErrors bean="${codeInstance}">
            <div class="errors">
                <g:renderErrors bean="${codeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${codeInstance?.id}" />
                <g:hiddenField name="version" value="${codeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="code.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${codeInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="priority"><g:message code="code.priority.label" default="Priority" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeInstance, field: 'priority', 'errors')}">
                                    <g:textField name="priority" value="${fieldValue(bean: codeInstance, field: 'priority')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="divisions"><g:message code="code.divisions.label" default="Divisions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeInstance, field: 'divisions', 'errors')}">
                                    
<ul>
<g:each in="${codeInstance?.divisions?}" var="d">
    <li><g:link controller="division" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="division" action="create" params="['code.id': codeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'division.label', default: 'Division')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="entries"><g:message code="code.entries.label" default="Entries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeInstance, field: 'entries', 'errors')}">
                                    <g:select name="entries" from="${spl.Registration.list()}" multiple="yes" optionKey="id" size="5" value="${codeInstance?.entries*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="season"><g:message code="code.season.label" default="Season" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: codeInstance, field: 'season', 'errors')}">
                                    <g:select name="season.id" from="${spl.Season.list()}" optionKey="id" value="${codeInstance?.season?.id}"  />
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
