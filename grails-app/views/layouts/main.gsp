<!DOCTYPE html PUBLIC  "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="spl.User" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <title><g:layoutTitle default="StarPlayers League" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <!-- Google Analytics -->
	    <script type="text/javascript">
	
		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-23141936-1']);
		  _gaq.push(['_trackPageview']);
		
		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
	
		</script>
		<!-- End Google Analytics -->
    </head>
    <body>
        <div id="wrapper">
        <div id="loginheader">
        	<g:loginHeader/>
        </div>
        	<div id="splogo">
				<g:link controller="navigation" action="welcome"><img src="${resource(dir:'images',file:'splogo.png')}" alt="StarPlayers Logo" /></g:link>
			</div>
        	<div id="splbanner"><g:link controller="navigation" action="welcome"><img src="${resource(dir:'images',file:'splbanner.png')}" alt="StarPlayers League" /></g:link></div>
        	<div id="navigationbar">
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
			<div class="break"></div>
			<div id="container">
        		<g:layoutBody />
        	</div>
        	<div class="break"></div>
        	<div id="push"></div>
       	</div>
        	<!-- footer -->
	        <div id="footer">
	        	<div id="footerwrap">
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
							<li><g:link controller="navigation" action="contact">Contact Us</g:link></li>
							<li><a href="http://twitter.com/#!/StarPlayersSC">Twitter</a></li>
						</ul>
					</div>
					<div class="donate">
						<h4>Please help keep our servers running!</h4>
						<h4>We do not have enough minerals!</h4>
						<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
							<p><input type="hidden" name="cmd" value="_s-xclick" /></p>
							<p><input type="hidden" name="hosted_button_id" value="GDXYTK2B98MEQ" /></p>
							<p><input type="image" src="${resource(dir:'images',file:'paypalbutton.png')}" name="submit" alt="PayPal" style="background: transparent; border: 0; padding: 0; margin: 10px 0;"/></p>
						</form>
					</div>
	        	</div>
			</div>
    </body>
</html>