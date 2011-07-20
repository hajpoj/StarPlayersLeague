

<%@ page import="spl.GameMap" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'gameMap.label', default: 'GameMap')}" />
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
            <g:hasErrors bean="${gameMapInstance}">
            <div class="errors">
                <g:renderErrors bean="${gameMapInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="gameMap.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameMapInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${gameMapInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="listedName"><g:message code="gameMap.listedName.label" default="Listed Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameMapInstance, field: 'listedName', 'errors')}">
                                    <g:textField name="listedName" value="${gameMapInstance?.listedName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author"><g:message code="gameMap.author.label" default="Author" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameMapInstance, field: 'author', 'errors')}">
                                    <g:textField name="author" value="${gameMapInstance?.author}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mapImageFileName"><g:message code="gameMap.mapImageFileName.label" default="Map Image File Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameMapInstance, field: 'mapImageFileName', 'errors')}">
                                    <g:textField name="mapImageFileName" value="${gameMapInstance?.mapImageFileName}" />
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
