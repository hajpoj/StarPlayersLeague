<html>
	<head>
		<title>Administration</title>
		<meta name="layout" content="main" />
	</head>
	<body>
		<h1>Stats Page</h1>
		<div class="list">
				<br/><br/>
				<h3>1v1 StarPlayers League (season 1)</h3>
                <table>
                	<thread>
                		<tr>
                			<g:sortableColumn property="matchCount" title="Match List"></g:sortableColumn>
                			<g:sortableColumn property="reportedCount" title="Reported"></g:sortableColumn>
                			<g:sortableColumn property="playedCount" title="Played"></g:sortableColumn>
                			<g:sortableColumn property="forfeitedCount" title="Forfeited"></g:sortableColumn>
                			<g:sortableColumn property="participationScore" title="Participation Score"></g:sortableColumn>
                		</tr>
                	</thread>
                	<tbody>
                	<%for(int row = 0; row < seasonOneStats.get(0).size; row++) { %>
	                	<tr>
	                	<% for( int col = 0; col < 5; col++) { %>
		                	<td>${seasonOneStats.get(col).get(row)}</td>
		                <% } %>
	                	</tr>
	                <% } %>
                	</tbody>
                </table>
                <br/><br />
                <h3>North American East (season 2)</h3>
                <table>
                	<thread>
                		<tr>
                			<g:sortableColumn property="matchCount" title="Match List"></g:sortableColumn>
                			<g:sortableColumn property="reportedCount" title="Reported"></g:sortableColumn>
                			<g:sortableColumn property="playedCount" title="Played"></g:sortableColumn>
                			<g:sortableColumn property="forfeitedCount" title="Forfeited"></g:sortableColumn>
                			<g:sortableColumn property="participationScore" title="Participation Score"></g:sortableColumn>
                		</tr>
                	</thread>
                	<tbody>
                	<%for(int row = 0; row < eastLeagueStats.get(0).size; row++) { %>
	                	<tr>
	                	<% for( int col = 0; col < 5; col++) { %>
		                	<td>${eastLeagueStats.get(col).get(row)}</td>
		                <% } %>
	                	</tr>
	                <% } %>
                	</tbody>
                </table>
                <br/><br/>
                <h3>North American West (season 2)</h3>
                <table>
                	<thread>
                		<tr>
                			<g:sortableColumn property="matchCount" title="Match List"></g:sortableColumn>
                			<g:sortableColumn property="reportedCount" title="Reported"></g:sortableColumn>
                			<g:sortableColumn property="playedCount" title="Played"></g:sortableColumn>
                			<g:sortableColumn property="forfeitedCount" title="Forfeited"></g:sortableColumn>
                			<g:sortableColumn property="participationScore" title="Participation Score"></g:sortableColumn>
                		</tr>
                	</thread>
                	<tbody>
                	<%for(int row = 0; row < westLeagueStats.get(0).size; row++) { %>
	                	<tr>
	                	<% for( int col = 0; col < 5; col++) { %>
		                	<td>${westLeagueStats.get(col).get(row)}</td>
		                <% } %>
	                	</tr>
	                <% } %>
                	</tbody>
                </table>
            </div>
	</body>
</html>