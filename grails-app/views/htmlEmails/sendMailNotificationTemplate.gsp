<%@ page contentType="text/html"%>
<head>
	<link rel="stylesheet" href="<g:resource dir="css" file="email.css" absolute="true" />" />
</head>
<body>
	<div id="wrapper">
		<div id="splbanner">
			<a href="http://www.starplayersleague.com"><img src="<g:resource dir="images" file="splbanner.png" absolute="true" />" alt="StarPlayers League" /></a>
		</div>
		<div id="container">
			<h1>${messageInstance.thread.subject}</h1>
			<div class="break"></div>
	    	<div class="mcontent">
				<p class="messageperson">${fieldValue(bean: messageInstance, field: "fromUser")} (${messageInstance.fromUser.bnetId}.${messageInstance.fromUser.bnetCharCode})</p>
				<br />
				<p>${fieldValue(bean: messageInstance, field: "text")}</p>
				<br />
				<p class="date">Sent on ${messageInstance.dateCreated.format('MM-dd-yyyy, HH:mm z')}</p>
			</div>
			<div class="break"></div>
			<p><g:link absolute="true" controller="profile" action="listMessages" params="[id:messageInstance.thread.id]">Reply</g:link></p>
		</div>
		
		<!-- footer -->
		
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
			<div class="flinks">
				<h4>SPL Community</h4>
				<ul class="flinks">
					<li><a href="https://www.facebook.com/pages/StarPlayers-League/214953398529055">Facebook</a></li>
					<li><a href="http://twitter.com/#!/StarPlayersSC">Twitter</a></li>
				</ul>
			</div>
			<div class="donate">
				<h4>Please help keep our servers running!</h4>
				<h4>We do not have enough minerals!</h4>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
					<p><input type="hidden" name="cmd" value="_s-xclick" /></p>
					<p><input type="hidden" name="hosted_button_id" value="GDXYTK2B98MEQ" /></p>
					<p><input type="image" src="<g:resource dir="images" file="paypalbutton.png" absolute="true" />" name="submit" alt="PayPal" style="background: transparent; border: 0; padding: 0; margin: 10px 0;"/></p>
				</form>
			</div>
		</div>
	</div>
</body>
