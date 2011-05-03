

<%@ page import="spl.League" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'league.label', default: 'League')}" />
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
            <g:hasErrors bean="${leagueInstance}">
            <div class="errors">
                <g:renderErrors bean="${leagueInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${leagueInstance?.id}" />
                <g:hiddenField name="version" value="${leagueInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="league.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: leagueInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${leagueInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="entries"><g:message code="league.entries.label" default="Entries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: leagueInstance, field: 'entries', 'errors')}">
                                    <g:select name="entries" from="${spl.Registration.list()}" multiple="yes" optionKey="id" size="5" value="${leagueInstance?.entries*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="seasons"><g:message code="league.seasons.label" default="Seasons" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: leagueInstance, field: 'seasons', 'errors')}">
                                    
<ul>
<g:each in="${leagueInstance?.seasons?}" var="s">
    <li><g:link controller="season" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="season" action="create" params="['league.id': leagueInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'season.label', default: 'Season')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="server"><g:message code="league.server.label" default="Server" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: leagueInstance, field: 'server', 'errors')}">
                                    <g:select name="server.id" from="${spl.Server.list()}" optionKey="id" value="${leagueInstance?.server?.id}"  />
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
