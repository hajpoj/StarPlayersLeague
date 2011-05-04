<%@ page import="spl.Notice" %>
<html>
	<head>
		<title>StarPlayers League</title>
		<meta name="layout" content="main" />
	</head>
	<body>
		<div id="sc2banner"></div>
		<div class="break"></div>
		<h1>Code SP Standings</h1>
		<p class="date">The Most Prestigious Code in the StarPlayers League</p>
		<div class="list">
	    	<table>
	        	<col width="5%" />
	            <col width="20%" />
	            <col width="15%" />
	            <col width="15%" />
	            <col width="15%" />
	            <col width="15%" />
	            <col width="15%" />
	          	<thead>
	              	<tr>
	                   	<th class="right">Rank</th>
	                    <th>Battle.net ID</th>
	                    <th>Race</th>
						<th class="right">Matches Played</th>
						<th class="right">Matches Won</th>
						<th class="right">Matches Lost</th>
	                    <th class="right">Game Diff.</th>
	                </tr>
	            </thead>
	            <tbody>
	             	<g:each in="${standingsInstanceList}" status="i" var="registrationInstance">
	                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                      	<td class="right">${i+1}</td>
	<%--                    <td><g:link action="show" id="${registrationInstance.id}">${fieldValue(bean: registrationInstance, field: "bnetId")}</g:link></td>--%>
							<td>${fieldValue(bean: registrationInstance, field: "bnetId")}</td>
	                        <td>${fieldValue(bean: registrationInstance, field: "race")}</td>
	                        <td class="right">${fieldValue(bean: registrationInstance, field: "matchesPlayed")}</td>
	                        <td class="right">${fieldValue(bean: registrationInstance, field: "matchesWon")}</td>
	                        <td class="right">${fieldValue(bean: registrationInstance, field: "matchesLost")}</td>
	                     	<td class="right">${fieldValue(bean: registrationInstance, field: "gameDiff")}</td>
	                    </tr>
	                </g:each>
	            </tbody>
	        </table>
    	</div>
    	<div class="break"></div>
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