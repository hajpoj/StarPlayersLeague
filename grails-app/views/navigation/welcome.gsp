<%@ page import="spl.Notice" %>
<html>
	<head>
		<title>StarPlayers League</title>
		<meta name="layout" content="main" />
	</head>
	<body>
		<div id="sc2banner"></div>
		<div class="break"></div>
		<h1>Latest News</h1>
		<div class="break"></div>
		<div class="mcontent">
			<g:each in="${noticeInstanceList}" status="i" var="noticeInstance">
				<g:if test="${i > 0}">
					<div class="innerlinebreak"></div>
					</g:if>
					<h2>${fieldValue(bean: noticeInstance, field: "title")}</h2>
					<br/>
					<p>${fieldValue(bean: noticeInstance, field: "text")}</p>
					<br/>
					<p class="date">Posted on ${noticeInstance.lastUpdated.format('MM-dd-yyyy, HH:mm z')}</p>
					<div class="break"></div>
			</g:each>
			<div class="paginateButtons">
				<div class="innerlinebreak"></div>
				<g:paginate next="Next" prev="Previous" maxsteps="0" action="welcome" total="${noticeInstanceTotal}" />
			</div>
		</div>
	</body>

</html>