

<%@ page import="spl.Registration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
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
            <g:hasErrors bean="${registrationInstance}">
            <div class="errors">
                <g:renderErrors bean="${registrationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bnetId"><g:message code="registration.bnetId.label" default="Bnet Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'bnetId', 'errors')}">
                                    <g:textField name="bnetId" value="${registrationInstance?.bnetId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bnetCharCode"><g:message code="registration.bnetCharCode.label" default="Bnet Char Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'bnetCharCode', 'errors')}">
                                    <g:textField name="bnetCharCode" value="${registrationInstance?.bnetCharCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="race"><g:message code="registration.race.label" default="Race" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'race', 'errors')}">
                                    <g:select name="race" from="${registrationInstance.constraints.race.inList}" value="${registrationInstance?.race}" valueMessagePrefix="registration.race"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="skillLevel"><g:message code="registration.skillLevel.label" default="Skill Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'skillLevel', 'errors')}">
                                    <g:select name="skillLevel" from="${registrationInstance.constraints.skillLevel.inList}" value="${registrationInstance?.skillLevel}" valueMessagePrefix="registration.skillLevel"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="server"><g:message code="registration.server.label" default="Server" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'server', 'errors')}">
                                    <g:select name="server.id" from="${spl.Server.list()}" optionKey="id" value="${registrationInstance?.server?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="league"><g:message code="registration.league.label" default="League" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'league', 'errors')}">
                                    <g:select name="league.id" from="${spl.League.list()}" optionKey="id" value="${registrationInstance?.league?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="season"><g:message code="registration.season.label" default="Season" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'season', 'errors')}">
                                    <g:select name="season.id" from="${spl.Season.list()}" optionKey="id" value="${registrationInstance?.season?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="registration.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'code', 'errors')}">
                                    <g:select name="code.id" from="${spl.Code.list()}" optionKey="id" value="${registrationInstance?.code?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="division"><g:message code="registration.division.label" default="Division" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'division', 'errors')}">
                                    <g:select name="division.id" from="${spl.Division.list()}" optionKey="id" value="${registrationInstance?.division?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="group"><g:message code="registration.group.label" default="Group" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'group', 'errors')}">
                                    <g:select name="group.id" from="${spl.Group.list()}" optionKey="id" value="${registrationInstance?.group?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gameDiff"><g:message code="registration.gameDiff.label" default="Game Diff" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'gameDiff', 'errors')}">
                                    <g:textField name="gameDiff" value="${fieldValue(bean: registrationInstance, field: 'gameDiff')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gamesLost"><g:message code="registration.gamesLost.label" default="Games Lost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'gamesLost', 'errors')}">
                                    <g:textField name="gamesLost" value="${fieldValue(bean: registrationInstance, field: 'gamesLost')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gamesWon"><g:message code="registration.gamesWon.label" default="Games Won" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'gamesWon', 'errors')}">
                                    <g:textField name="gamesWon" value="${fieldValue(bean: registrationInstance, field: 'gamesWon')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="matchesLost"><g:message code="registration.matchesLost.label" default="Matches Lost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'matchesLost', 'errors')}">
                                    <g:textField name="matchesLost" value="${fieldValue(bean: registrationInstance, field: 'matchesLost')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="matchesPlayed"><g:message code="registration.matchesPlayed.label" default="Matches Played" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'matchesPlayed', 'errors')}">
                                    <g:textField name="matchesPlayed" value="${fieldValue(bean: registrationInstance, field: 'matchesPlayed')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="matchesWon"><g:message code="registration.matchesWon.label" default="Matches Won" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'matchesWon', 'errors')}">
                                    <g:textField name="matchesWon" value="${fieldValue(bean: registrationInstance, field: 'matchesWon')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="registration.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${spl.User.list()}" optionKey="id" value="${registrationInstance?.user?.id}"  />
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
