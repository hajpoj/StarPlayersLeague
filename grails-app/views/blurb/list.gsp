

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Blurb List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Blurb</g:link></span>
        </div>
        <div class="body">
            <h1>Blurb List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="content" title="Content" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${blurbInstanceList}" status="i" var="blurbInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${blurbInstance.id}">${fieldValue(bean:blurbInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:blurbInstance, field:'name')}</td>
                        
                            <td>${blurbInstance.content}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${blurbInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
