

<%@ page import="spl.Group" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
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
            <g:hasErrors bean="${groupInstance}">
            <div class="errors">
                <g:renderErrors bean="${groupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="group.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groupInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${groupInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="division"><g:message code="group.division.label" default="Division" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groupInstance, field: 'division', 'errors')}">
                                    <g:select name="division.id" from="${spl.Division.list()}" optionKey="id" value="${groupInstance?.division?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="playoffs"><g:message code="group.playoffs.label" default="Playoffs" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groupInstance, field: 'playoffs', 'errors')}">
                                    <g:checkBox name="playoffs" value="${groupInstance?.playoffs}" />
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
