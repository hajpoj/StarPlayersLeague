
<%@ page import="spl.Registration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
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
                            <td valign="top" class="name"><g:message code="registration.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.bnetId.label" default="Bnet Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "bnetId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.bnetCharCode.label" default="Bnet Char Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "bnetCharCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.race.label" default="Race" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "race")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.skillLevel.label" default="Skill Level" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "skillLevel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.server.label" default="Server" /></td>
                            
                            <td valign="top" class="value"><g:link controller="server" action="show" id="${registrationInstance?.server?.id}">${registrationInstance?.server?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.league.label" default="League" /></td>
                            
                            <td valign="top" class="value"><g:link controller="league" action="show" id="${registrationInstance?.league?.id}">${registrationInstance?.league?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.season.label" default="Season" /></td>
                            
                            <td valign="top" class="value"><g:link controller="season" action="show" id="${registrationInstance?.season?.id}">${registrationInstance?.season?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.code.label" default="Code" /></td>
                            
                            <td valign="top" class="value"><g:link controller="code" action="show" id="${registrationInstance?.code?.id}">${registrationInstance?.code?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.division.label" default="Division" /></td>
                            
                            <td valign="top" class="value"><g:link controller="division" action="show" id="${registrationInstance?.division?.id}">${registrationInstance?.division?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.group.label" default="Group" /></td>
                            
                            <td valign="top" class="value"><g:link controller="group" action="show" id="${registrationInstance?.group?.id}">${registrationInstance?.group?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.gameDiff.label" default="Game Diff" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "gameDiff")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.gamesLost.label" default="Games Lost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "gamesLost")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.gamesWon.label" default="Games Won" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "gamesWon")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.matches.label" default="Matches" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${registrationInstance.matches}" var="m">
                                    <li><g:link controller="match" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.matchesLost.label" default="Matches Lost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "matchesLost")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.matchesPlayed.label" default="Matches Played" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "matchesPlayed")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.matchesWon.label" default="Matches Won" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: registrationInstance, field: "matchesWon")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="registration.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${registrationInstance?.user?.id}">${registrationInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${registrationInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
