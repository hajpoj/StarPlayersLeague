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
				<a href="http://www.youtube.com/user/starplayersleague"><img src="${resource(dir:'images/icons',file:'youtube.png')}" alt="YouTube" /></a>
			</p>
			<div class="break"></div>
			<p>
				Welcome to the StarPlayers League!
			</p>
			<div class="innerlinebreak"></div>
			<h3>General Information</h3>
			<div class="break"></div>
			<ul class="normal">
				<li>
					<g:link controller="navigation" action="info">League Information</g:link>
				</li>
				<li>
					<g:link controller="navigation" action="faq">Frequently Asked Questions</g:link>
				</li>
			</ul>
			<div class="innerlinebreak"></div>
			<h3>StarPlayers League Blog</h3>
			<div class="break"></div>
			<p>
				Keep up, and interact with the StarPlayers development team! In the <a href="http://blog.starplayersleague.com">StarPlayers League Blog</a>, the development team discusses 
				issues, new features, and future plans in addition to giving insight on many different aspects of the league itself.
			</p>
			<div class="innerlinebreak"></div>
			<h3>Check us out on Reddit!</h3>
			<div class="break"></div>
			<p>
				Subscribe to the SPL subreddit over at <a href="http://forum.starplayersleague.com">r/starplayersleague</a>, and participate in key discussions related to the league.
			</p>
			<div class="innerlinebreak"></div>
			<h3>Mailing List</h3>
			<div class="break"></div>
			<p>
				Join our <a href="http://eepurl.com/dCOs6">mailing list</a> to receive updates when new league season registrations open!
			</p>
			<div class="innerlinebreak"></div>
			<h3>Questions? Comments?</h3>
			<div class="break"></div>
			<p>
				If you have any questions, comments, or any other feedback about the StarPlayers League, 
				please email us at <a href="mailto:contact@starplayersleague.com">contact@starplayersleague.com</a>. 
				We are always looking for ways to improve our website and player experience.
			</p>
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
			<h1>Notices</h1>
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