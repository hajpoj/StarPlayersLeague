<g:if test="${standingsInstanceList.size() > 0}">
	<div class="break"></div>
	<h2>Code ${fieldValue(bean: standingsInstanceList.first(), field: "code")} - 
    	Division ${fieldValue(bean: standingsInstanceList.first(), field: "division")} - 
		Group ${fieldValue(bean: standingsInstanceList.first(), field: "group")}</h2>
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
<%--    <div class="paginateButtons">--%>
<%--    	<g:paginate total="${standingsInstanceList.count()}" />--%>
<%--    </div>--%>
    <div class="break"></div>
    <div class="break"></div>
    <h2>Group Matches</h2>
    <div class="list">
	    <table>
			<col width="5%">
	       	<col width="16%">
	       	<col width="8%">
	       	<col width="5%">
	       	<col width="8%">
	       	<col width="46%">
	       	<col width="12%">
	       	<tr>
				<th class="right">Match</th>
	       		<th class="right">Battle.net ID</th>
	       		<th class="right">Race</th>
	       		<th class="center">vs</th>
	       		<th>Race</th>
	       		<th>Battle.net ID</th>
	       		<th></th>
	       	</tr>
	       	<g:each in="${matchesInstanceList}" status="i" var="matchesInstance">
	        	<tr class="${(matchesInstance.matchNumber % 2) == 0 ? 'odd' : 'even'}">
	            	<td class="right">${fieldValue(bean: matchesInstance, field: "matchNumber")}</td>
					<td class="right">${fieldValue(bean: matchesInstance.entries.toArray().getAt(0), field: "bnetId")}</td><td class="right">${fieldValue(bean: matchesInstance.entries.toArray().getAt(0), field: "race")}</td>
					<g:if test="${matchesInstance.played == false}">
						<td class="center">vs</td>
					</g:if>
					<g:else>
						<g:if test="${matchesInstance.entries.toArray().getAt(0).id == matchesInstance.winner.id}">
							<td class="center">${(Integer)matchesInstance.bestOf/2+1}-${matchesInstance.loserScore}</td>
						</g:if>
						<g:else>
						<td class="center">${matchesInstance.loserScore}-${(Integer)matchesInstance.bestOf/2+1}</td>
						</g:else>
					</g:else>
	                <td class="left">${fieldValue(bean: matchesInstance.entries.toArray().getAt(1), field: "race")}</td><td class="left">${fieldValue(bean: matchesInstance.entries.toArray().getAt(1), field: "bnetId")}</td>
	                <td class="right"><g:link controller="navigation" action="mapPack" id="${matchesInstance.mapPack.id}">${matchesInstance.mapPack}</g:link></td>
	            </tr>
			</g:each>
		</table>
	</div>
</g:if>
