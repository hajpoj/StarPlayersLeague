<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="StarPlayers League" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="wrapper">
        <div id="loginheader">
        	<sec:ifNotLoggedIn>
        		<g:link controller="login">Log In</g:link>
        	</sec:ifNotLoggedIn>
        	<sec:ifLoggedIn>
        		Welcome <sec:username/>! <g:link controller="profile" action="profile">Profile</g:link> | <g:link controller="profile" action="matches">Matches</g:link> | <g:link controller="profile" action="listThreads">Messages</g:link> | <g:link controller="logout">Log Out</g:link>
        	</sec:ifLoggedIn>
        </div>
        	<div id="splogo">
				<a href="http://www.starplayersleague.com"><img src="${resource(dir:'images',file:'splogo.png')}" alt="StarPlayers Logo" border="0" /></a>
			</div>
        	<div id="splbanner"><a href="http://www.starplayersleague.com"><img src="${resource(dir:'images',file:'splbanner.png')}" alt="StarPlayers League" border="0" /></a></div>
        	<div id="menubar">
				<ul class="menuitems">
				    <li class="controller"><g:link controller="navigation" action="welcome">Home</g:link></li>
					<li>|</li>
					<li class="controller"><g:link controller="navigation" action="info">League Info</g:link></li>
					<li>|</li>
					<li class="controller"><g:link controller="navigation" action="mapPool">Map Pool</g:link></li>
					<li>|</li>
					<li class="controller"><g:link controller="navigation" action="standings">Standings</g:link></li>
					<li>|</li>
					<li class="controller"><g:link controller="navigation" action="register">Registration</g:link></li>
					<li>|</li>
					<li class="controller"><g:link controller="navigation" action="faq">FAQ</g:link></li>
					<li>|</li>
					<li class="controller"><g:link controller="navigation" action="contact">Contact Us</g:link></li>
				</ul>
			</div>
			
			<!-- content -->
			
			<div id="container">
        		<g:layoutBody />
        	</div>
        	
        	<!-- footer -->
        	
        	<div class="linebreak"></div>
        	
	        <div id="footer">
				<div class="flinks">
					<h4>SC2 Resources</h4>
					<ul class="flinks">
						<li><a href="http://www.battle.net/sc2">Battle.net</a></li>
						<li><a href="http://www.teamliquid.net">Team Liquid</a></li>
						<li><a href="http://screddit.com">SCReddit</a></li>
						<li><a href="http://wiki.teamliquid.net/starcraft2">Liquipedia</a></li>
						<li><a href="http://www.wellplayed.org">Well-Played</a></li>
						<li><a href="http://www.reddit.com/r/starcraft">r/StarCraft</a></li>
					</ul>
				</div>
				<div class="flinks">
					<h4>Professional SC2</h4>
					<ul class="flinks">
						<li><a href="http://www.gomtv.net">Global SC2 League</a></li>
						<li><a href="http://www.ign.com/ipl">IGN Pro League</a></li>
						<li><a href="http://www.majorleaguegaming.com">Major League Gaming</a></li>
						<li><a href="http://nasl.tv">N.A. Star League</a></li>
						<li><a href="http://www.pokerstrategytsl3.com">TL Star League</a></li>
						<li><a href="http://screddit.com">SCReddit Open</a></li>
					</ul>
				</div>
			</div>
		</div>
    </body>
</html>