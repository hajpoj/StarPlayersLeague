<div class="break"></div>
<h2>${groupInstance.division.code} / ${groupInstance.division} / Playoffs</h2>
<div class="bracket">
	<div class="r0801">
		<p>
			<g:if test="${quarterFinalsInstanceList.getAt(0).played == true}">
				<g:if test="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id == quarterFinalsInstanceList.getAt(0).winner.id}">
					<span style="font-weight: bold;">
						<span class="bracketscore">
							<g:if test="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id == quarterFinalsInstanceList.getAt(0).winner.id}">
								${(Integer)quarterFinalsInstanceList.getAt(0).bestOf/2+1}
							</g:if>
						</span>
				</g:if>
				<g:else>
						<span class="bracketscore">
							${quarterFinalsInstanceList.getAt(0).loserScore}
						</span>
				</g:else>
			</g:if>
			<g:else>
						<span class="bracketscore">
							0
						</span>
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0), field: "bnetId")}
						</g:link>
					</span>
			</g:else>
		</p>
	</div>
	<div class="r0802">
		<p>
			<g:if test="${quarterFinalsInstanceList.getAt(0).played == true}">
				<g:if test="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id == quarterFinalsInstanceList.getAt(0).winner.id}">
					<span style="font-weight: bold;">
						<span class="bracketscore">
							<g:if test="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id == quarterFinalsInstanceList.getAt(1).winner.id}">
								${(Integer)quarterFinalsInstanceList.getAt(0).bestOf/2+1}
							</g:if>
						</span>
				</g:if>
				<g:else>
						<span class="bracketscore">
							${quarterFinalsInstanceList.getAt(0).loserScore}
						</span>
				</g:else>
			</g:if>
			<g:else>
						<span class="bracketscore">
							0
						</span>
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1), field: "bnetId")}
						</g:link>
					</span>
			</g:else>
		</p>
	</div>
	<div class="r0803">
		<p>
			<g:if test="${quarterFinalsInstanceList.getAt(1).played == true}">
				<g:if test="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id == quarterFinalsInstanceList.getAt(1).winner.id}">
					<span style="font-weight: bold;">
						<span class="bracketscore">
							<g:if test="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id == quarterFinalsInstanceList.getAt(1).winner.id}">
								${(Integer)quarterFinalsInstanceList.getAt(1).bestOf/2+1}
							</g:if>
						</span>
				</g:if>
				<g:else>
						<span class="bracketscore">
							${quarterFinalsInstanceList.getAt(1).loserScore}
						</span>
				</g:else>
			</g:if>
			<g:else>
						<span class="bracketscore">
							0
						</span>
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(0), field: "bnetId")}
						</g:link>
					</span>
			</g:else>
		</p>
	</div>
	<div class="r0804">
		<p>
			<g:if test="${quarterFinalsInstanceList.getAt(1).played == true}">
				<g:if test="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id == quarterFinalsInstanceList.getAt(1).winner.id}">
					<span style="font-weight: bold;">
						<span class="bracketscore">
							<g:if test="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id == quarterFinalsInstanceList.getAt(1).winner.id}">
								${(Integer)quarterFinalsInstanceList.getAt(1).bestOf/2+1}
							</g:if>
						</span>
				</g:if>
				<g:else>
						<span class="bracketscore">
							${quarterFinalsInstanceList.getAt(1).loserScore}
						</span>
				</g:else>
			</g:if>
			<g:else>
						<span class="bracketscore">
							0
						</span>
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1), field: "bnetId")}
						</g:link>
					</span>
			</g:else>
		</p>
	</div>
	<div class="r0805">
		<p>
			<g:if test="${quarterFinalsInstanceList.getAt(2).played == true}">
				<g:if test="${quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(0).id == quarterFinalsInstanceList.getAt(2).winner.id}">
					<span style="font-weight: bold;">
						<span class="bracketscore">
							<g:if test="${quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(0).id == quarterFinalsInstanceList.getAt(2).winner.id}">
								${(Integer)quarterFinalsInstanceList.getAt(2).bestOf/2+1}
							</g:if>
						</span>
				</g:if>
				<g:else>
						<span class="bracketscore">
							${quarterFinalsInstanceList.getAt(2).loserScore}
						</span>
				</g:else>
			</g:if>
			<g:else>
						<span class="bracketscore">
							0
						</span>
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(0).race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(0).race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(0), field: "bnetId")}
						</g:link>
					</span>
			</g:else>
		</p>
	</div>
	<div class="r0806">
		<p>
			<g:if test="${quarterFinalsInstanceList.getAt(2).played == true}">
				<g:if test="${quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(1).id == quarterFinalsInstanceList.getAt(2).winner.id}">
					<span style="font-weight: bold;">
						<span class="bracketscore">
							<g:if test="${quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(1).id == quarterFinalsInstanceList.getAt(2).winner.id}">
								${(Integer)quarterFinalsInstanceList.getAt(2).bestOf/2+1}
							</g:if>
						</span>
				</g:if>
				<g:else>
						<span class="bracketscore">
							${quarterFinalsInstanceList.getAt(2).loserScore}
						</span>
				</g:else>
			</g:if>
			<g:else>
						<span class="bracketscore">
							0
						</span>
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(1).race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(1).race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(1), field: "bnetId")}
						</g:link>
					</span>
			</g:else>
		</p>
	</div>
	<div class="r0807">
		<p>
			<g:if test="${quarterFinalsInstanceList.getAt(3).played == true}">
				<g:if test="${quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(0).id == quarterFinalsInstanceList.getAt(3).winner.id}">
					<span style="font-weight: bold;">
						<span class="bracketscore">
							<g:if test="${quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(0).id == quarterFinalsInstanceList.getAt(3).winner.id}">
								${(Integer)quarterFinalsInstanceList.getAt(3).bestOf/2+1}
							</g:if>
						</span>
				</g:if>
				<g:else>
						<span class="bracketscore">
							${quarterFinalsInstanceList.getAt(3).loserScore}
						</span>
				</g:else>
			</g:if>
			<g:else>
						<span class="bracketscore">
							0
						</span>
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(0).race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(0).race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(0), field: "bnetId")}
						</g:link>
					</span>
			</g:else>
		</p>
	</div>
	<div class="r0808">
		<p>
			<g:if test="${quarterFinalsInstanceList.getAt(3).played == true}">
				<g:if test="${quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1).id == quarterFinalsInstanceList.getAt(3).winner.id}">
					<span style="font-weight: bold;">
						<span class="bracketscore">
							<g:if test="${quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1).id == quarterFinalsInstanceList.getAt(3).winner.id}">
								${(Integer)quarterFinalsInstanceList.getAt(3).bestOf/2+1}
							</g:if>
						</span>
				</g:if>
				<g:else>
						<span class="bracketscore">
							${quarterFinalsInstanceList.getAt(3).loserScore}
						</span>
				</g:else>
			</g:if>
			<g:else>
						<span class="bracketscore">
							0
						</span>
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1).race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1).race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1), field: "bnetId")}
						</g:link>
					</span>
			</g:else>
		</p>
	</div>
	<div class="r0401"><p>RO4-01</p></div>
	<div class="r0402"><p>RO4-02</p></div>
	<div class="r0403"><p>RO4-03</p></div>
	<div class="r0404"><p>RO4-04</p></div>
	<div class="r0201"><p>RO2-01</p></div>
	<div class="r0202"><p>RO2-02</p></div>
	<div class="r0203"><p>RO2-03</p></div>
	<div class="r0204"><p>RO2-04</p></div>
	<div class="r0101"><p>Champion</p></div>
	<div class="r0102"><p>2nd Place</p></div>
	<div class="r0103"><p>3rd Place</p></div>
</div>
<div class="break"></div>
<h2>Quarter Finals</h2>
    <div class="break"></div>
    <div class="list">
	    <table>
	       	<tr>
				<th class="colmatch">Match</th>
	       		<th class="colbnetidl">Player</th>
	       		<th class="colvs">vs</th>
	       		<th class="colbentidr">Player</th>
	       		<th class="viewdetails"></th>
	       	</tr>
	       	<g:each in="${quarterFinalsInstanceList}" status="i" var="matchesInstance">
	        	<tr class="${(matchesInstance.matchNumber % 2) == 0 ? 'odd' : 'even'}">
	            	<td class="right">${fieldValue(bean: matchesInstance, field: "matchNumber")}</td>
	            	<g:if test="${matchesInstance.played == false}">
						<td class="right">
					</g:if>
					<g:else>
						<g:if test="${matchesInstance.entries.toArray().getAt(0).id == matchesInstance.winner.id}">
							<td class="winnerl">
						</g:if>
						<g:else>
							<td class="right">
						</g:else>
					</g:else>
								<g:link controller="navigation" action="profile" id="${matchesInstance.entries.toArray().getAt(0).user.id}">
									${fieldValue(bean: matchesInstance.entries.toArray().getAt(0), field: "bnetId")}
								</g:link>
								<img class="icons" src="${resource(dir:'images/icons', file:matchesInstance.entries.toArray().getAt(0).race.concat('.png'))}" 
								alt="${matchesInstance.entries.toArray().getAt(0).race}" />
							</td>
					<g:if test="${matchesInstance.played == false}">
						<td class="center">vs</td>
					</g:if>
					<g:else>
						<g:if test="${matchesInstance.entries.toArray().getAt(0).id == matchesInstance.winner.id}">
							<td class="matchscore">
								${(Integer)matchesInstance.bestOf/2+1}-${matchesInstance.loserScore}
							</td>
						</g:if>
						<g:else>
							<td class="matchscore">
								${matchesInstance.loserScore}-${(Integer)matchesInstance.bestOf/2+1}
							</td>
						</g:else>
					</g:else>
	                <g:if test="${matchesInstance.played == false}">
						<td class="left">
					</g:if>
					<g:else>
						<g:if test="${matchesInstance.entries.toArray().getAt(1).id == matchesInstance.winner.id}">
							<td class="winnerr">
						</g:if>
						<g:else>
							<td class="left">
						</g:else>
					</g:else>
								<img class="icons" src="${resource(dir:'images/icons', file:matchesInstance.entries.toArray().getAt(1).race.concat('.png'))}" 
									alt="${matchesInstance.entries.toArray().getAt(1).race}" />
								<g:link controller="navigation" action="profile" id="${matchesInstance.entries.toArray().getAt(1).user.id}">
									${fieldValue(bean: matchesInstance.entries.toArray().getAt(1), field: "bnetId")}
								</g:link>
							</td>
	                <td class="right"><g:link controller="navigation" action="matchDetails" id="${matchesInstance.id}">View Details</g:link></td>
	            </tr>
			</g:each>
		</table>
	</div>