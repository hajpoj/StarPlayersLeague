

<%@ page import="spl.Season" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'season.label', default: 'Season')}" />
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
            <g:hasErrors bean="${seasonInstance}">
            <div class="errors">
                <g:renderErrors bean="${seasonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${seasonInstance?.id}" />
                <g:hiddenField name="version" value="${seasonInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="season.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: seasonInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${seasonInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codes"><g:message code="season.codes.label" default="Codes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: seasonInstance, field: 'codes', 'errors')}">
                                    
<ul>
<g:each in="${seasonInstance?.codes?}" var="c">
    <li><g:link controller="code" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="code" action="create" params="['season.id': seasonInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'code.label', default: 'Code')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="entries"><g:message code="season.entries.label" default="Entries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: seasonInstance, field: 'entries', 'errors')}">
                                    <g:select name="entries" from="${spl.Registration.list()}" multiple="yes" optionKey="id" size="5" value="${seasonInstance?.entries*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="league"><g:message code="season.league.label" default="League" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: seasonInstance, field: 'league', 'errors')}">
                                    <g:select name="league.id" from="${spl.League.list()}" optionKey="id" value="${seasonInstance?.league?.id}"  />
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
