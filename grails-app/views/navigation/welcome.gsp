<%@ page import="spl.Notice" %>
<html>
	<head>
		<title>StarPlayers League</title>
		<meta name="layout" content="main" />
	</head>
	<body>
		<div id="sc2banner"></div>
		<div id="sidebar">
			<p>
				<a href="http://twitter.com/#!/StarPlayersSC"><img src="${resource(dir:'images/icons',file:'twitter.png')}" alt="Twitter" /></a>
				<a href="http://starplayersleague.tumblr.com/rss"><img src="${resource(dir:'images/icons',file:'rss.png')}" alt="RSS Feed" /></a>
			</p>
			<div class="break"></div>
			<p>Help us spread the word!</p>
			<div class="innerlinebreak"></div>
			<h3>
				${fieldValue(bean: standingsInstanceList.first(), field: "code")} Rankings
			</h3>
			<div class="break"></div>
			<p class="note">The most prestigious code in the StarPlayers League.</p>
			<div class="break"></div>
			<div class="list">
	    		<table>
		            <tr>
			            <th class="colstrank">Rank</th>
			            <th class="colgap"></th>
			            <th class="colstandingid">Player</th>
		            </tr>
		            <g:each in="${standingsInstanceList}" status="i" var="registrationInstance">
		            	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			                <td class="right">${i+1}</td>
			                <td></td>
							<td><img class="icons" src="${resource(dir:'images/icons', file:registrationInstance.race.concat('.png'))}" 
								alt="${registrationInstance.race}" />
								<g:link controller="navigation" action="profile" id="${registrationInstance.user.id}">${fieldValue(bean: registrationInstance, field: "bnetId")}</g:link></td>
		                </tr>
		        	</g:each>
	        	</table>
   			</div>
		</div>
		<div class="mcontainer">
			<div class="majorlinebreak"><span class="accent"></span></div>
			<h1>What is the StarPlayers League?</h1>
			<div class="break"></div>
			<div class="content">
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
			<div class="content">
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
		</div>
	</body>

</html>