

<%@ page import="spl.Game" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
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
            <g:hasErrors bean="${gameInstance}">
            <div class="errors">
                <g:renderErrors bean="${gameInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${gameInstance?.id}" />
                <g:hiddenField name="version" value="${gameInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gameNumber"><g:message code="game.gameNumber.label" default="Game Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'gameNumber', 'errors')}">
                                    <g:textField name="gameNumber" value="${fieldValue(bean: gameInstance, field: 'gameNumber')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="winner"><g:message code="game.winner.label" default="Winner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'winner', 'errors')}">
                                    <g:select name="winner.id" from="${spl.Registration.list()}" optionKey="id" value="${gameInstance?.winner?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="map"><g:message code="game.map.label" default="Map" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'map', 'errors')}">
                                    <g:select name="map.id" from="${spl.GameMap.list()}" optionKey="id" value="${gameInstance?.map?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="linkToVod"><g:message code="game.linkToVod.label" default="Link To Vod" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'linkToVod', 'errors')}">
                                    <g:textField name="linkToVod" value="${gameInstance?.linkToVod}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="entries"><g:message code="game.entries.label" default="Entries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'entries', 'errors')}">
                                    <g:select name="entries" from="${spl.Registration.list()}" multiple="yes" optionKey="id" size="5" value="${gameInstance?.entries*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="match"><g:message code="game.match.label" default="Match" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'match', 'errors')}">
                                    <g:select name="match.id" from="${spl.Match.list()}" optionKey="id" value="${gameInstance?.match?.id}"  />
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
