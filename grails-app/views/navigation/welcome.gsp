<%@ page import="spl.Notice" %>
<html>
	<head>
		<title>StarPlayers League</title>
		<meta name="layout" content="main" />
	</head>
	<body>
		<div id="sc2banner"></div>
		<div class="majorlinebreak"><span class="accent"></span></div>
		<h1>What is the StarPlayers League?</h1>
		<div class="break"></div>
		<div class="mcontent">
			<p>
				The StarPlayers League allows StarCraft2 players of all skill levels to engage in a friendly competition against others. 
				Our goal is to provide players with a more intimate league compared to the Battle.net ladder. In our league, you may find 
				worthy opponents, develop rivalries, and even be able to scout your opponent's play-style before your match. Most importantly, 
				we want to expand StarCraft2 e-sports to anyone who wants to play.
			</p>
		</div>
		<div class="majorlinebreak"><span class="accent"></span></div>
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
					<p class="note">Posted on ${noticeInstance.lastUpdated.format('MM-dd-yyyy, HH:mm z')}</p>
			</g:each>
		</div>
		<div class="paginateLinks">
			<g:paginate next="Next" prev="Previous" action="welcome" total="${noticeInstanceTotal}" />
		</div>
	</body>

</html>