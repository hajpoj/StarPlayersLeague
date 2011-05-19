
<%@ page import="spl.Match" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
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
                            <td valign="top" class="name"><g:message code="match.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: matchInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.matchNumber.label" default="Match Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: matchInstance, field: "matchNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.mapPack.label" default="Map Pack" /></td>
                            
                            <td valign="top" class="value"><g:link controller="mapPack" action="show" id="${matchInstance?.mapPack?.id}">${matchInstance?.mapPack?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.bestOf.label" default="Best Of" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: matchInstance, field: "bestOf")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.winner.label" default="Winner" /></td>
                            
                            <td valign="top" class="value"><g:link controller="registration" action="show" id="${matchInstance?.winner?.id}">${matchInstance?.winner?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.loserScore.label" default="Loser Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: matchInstance, field: "loserScore")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.forfeit.label" default="Forfeit" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${matchInstance?.forfeit}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.entries.label" default="Entries" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${matchInstance.entries}" var="e">
                                    <li><g:link controller="registration" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.games.label" default="Games" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${matchInstance.games}" var="g">
                                    <li><g:link controller="game" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.leagueGroup.label" default="League Group" /></td>
                            
                            <td valign="top" class="value"><g:link controller="group" action="show" id="${matchInstance?.leagueGroup?.id}">${matchInstance?.leagueGroup?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="match.played.label" default="Played" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${matchInstance?.played}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${matchInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
