<g:if test="${quarterFinalsInstanceList != null}">
	<div class="break"></div>
	<h2>${groupInstance.division.code} / ${groupInstance.division} / Playoffs</h2>
	<div class="bracket">
		<%--QUARTERFINAL MATCHES --%>
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
						<span>
							<span class="bracketscore">
								${quarterFinalsInstanceList.getAt(0).loserScore}
							</span>
					</g:else>
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race.concat('.png'))}" 
								alt="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race}" />
							<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
								${fieldValue(bean: quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0), field: "bnetId")}
							</g:link>
						</span>
				</g:if>
				<g:else>
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
								<g:if test="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id == quarterFinalsInstanceList.getAt(0).winner.id}">
									${(Integer)quarterFinalsInstanceList.getAt(0).bestOf/2+1}
								</g:if>
							</span>
					</g:if>
					<g:else>
						<span>
							<span class="bracketscore">
								${quarterFinalsInstanceList.getAt(0).loserScore}
							</span>
					</g:else>
							<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race.concat('.png'))}" 
								alt="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race}" />
							<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id}">
								${fieldValue(bean: quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1), field: "bnetId")}
							</g:link>
						</span>
				</g:if>
				<g:else>
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
						<span>
							<span class="bracketscore">
								${quarterFinalsInstanceList.getAt(1).loserScore}
							</span>
					</g:else>
							<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race.concat('.png'))}" 
								alt="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race}" />
							<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
								${fieldValue(bean: quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(0), field: "bnetId")}
							</g:link>
						</span>
				</g:if>
				<g:else>
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
						<span>
							<span class="bracketscore">
								${quarterFinalsInstanceList.getAt(1).loserScore}
							</span>
					</g:else>
							<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race.concat('.png'))}" 
								alt="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race}" />
							<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id}">
								${fieldValue(bean: quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1), field: "bnetId")}
							</g:link>
						</span>
				</g:if>
				<g:else>
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
						<span>
							<span class="bracketscore">
								${quarterFinalsInstanceList.getAt(2).loserScore}
							</span>
					</g:else>
							<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(0).race.concat('.png'))}" 
								alt="${quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(0).race}" />
							<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
								${fieldValue(bean: quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(0), field: "bnetId")}
							</g:link>
						</span>
				</g:if>
				<g:else>
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
						<span>
							<span class="bracketscore">
								${quarterFinalsInstanceList.getAt(2).loserScore}
							</span>
					</g:else>
							<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(1).race.concat('.png'))}" 
								alt="${quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(1).race}" />
							<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id}">
								${fieldValue(bean: quarterFinalsInstanceList.getAt(2).entries.toArray().getAt(1), field: "bnetId")}
							</g:link>
						</span>
				</g:if>
				<g:else>
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
						<span>
							<span class="bracketscore">
								${quarterFinalsInstanceList.getAt(3).loserScore}
							</span>
					</g:else>
							<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(0).race.concat('.png'))}" 
								alt="${quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(0).race}" />
							<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
								${fieldValue(bean: quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(0), field: "bnetId")}
							</g:link>
						</span>
				</g:if>
				<g:else>
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
						<span>
							<span class="bracketscore">
								${quarterFinalsInstanceList.getAt(3).loserScore}
							</span>
					</g:else>
							<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1).race.concat('.png'))}" 
								alt="${quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1).race}" />
							<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id}">
								${fieldValue(bean: quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1), field: "bnetId")}
							</g:link>
						</span>
				</g:if>
				<g:else>
							<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1).race.concat('.png'))}" 
								alt="${quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1).race}" />
							<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id}">
								${fieldValue(bean: quarterFinalsInstanceList.getAt(3).entries.toArray().getAt(1), field: "bnetId")}
							</g:link>
						</span>
				</g:else>
			</p>
		</div>
		<%--SEMIFINAL MATCHES --%>
		<div class="r0401">
			<p>
				<g:if test="${semiFinalsInstanceList == null}">
					<g:if test="${quarterFinalsInstanceList.getAt(0).played == true}">
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(0).winner.race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(0).winner.race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).winner.id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(0).winner, field: "bnetId")}
						</g:link>
					</g:if>
					<g:else>
						Winner of QF Match 1
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${quarterFinalsInstanceList.getAt(0).played == true}">
						<g:if test="${semiFinalsInstanceList.getAt(0).played == true}">
							<g:if test="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id == semiFinalsInstanceList.getAt(0).winner.id}">
								<span style="font-weight: bold;">
									<span class="bracketscore">
										<g:if test="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id == semiFinalsInstanceList.getAt(0).winner.id}">
											${(Integer)semiFinalsInstanceList.getAt(0).bestOf/2+1}
										</g:if>
									</span>
							</g:if>
							<g:else>
								<span>
									<span class="bracketscore">
										${semiFinalsInstanceList.getAt(0).loserScore}
									</span>
							</g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(0).winner.race.concat('.png'))}" 
										alt="${quarterFinalsInstanceList.getAt(0).winner.race}" />
									<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).winner.id}">
										${fieldValue(bean: quarterFinalsInstanceList.getAt(0).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:if>
						<g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(0).winner.race.concat('.png'))}" 
										alt="${quarterFinalsInstanceList.getAt(0).winner.race}" />
									<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(0).winner.id}">
										${fieldValue(bean: quarterFinalsInstanceList.getAt(0).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:else>
					</g:if>
					<g:else>
						Winner of QF Match 1
					</g:else>
				</g:else>
			</p>
		</div>
		<div class="r0402">
			<p>
				<g:if test="${semiFinalsInstanceList == null}">
					<g:if test="${quarterFinalsInstanceList.getAt(1).played == true}">
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(1).winner.race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(1).winner.race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(1).winner.id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(1).winner, field: "bnetId")}
						</g:link>
					</g:if>
					<g:else>
						Winner of QF Match 2
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${quarterFinalsInstanceList.getAt(1).played == true}">
						<g:if test="${semiFinalsInstanceList.getAt(0).played == true}">
							<g:if test="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id == semiFinalsInstanceList.getAt(0).winner.id}">
								<span style="font-weight: bold;">
									<span class="bracketscore">
										<g:if test="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id == semiFinalsInstanceList.getAt(0).winner.id}">
											${(Integer)semiFinalsInstanceList.getAt(0).bestOf/2+1}
										</g:if>
									</span>
							</g:if>
							<g:else>
									<span class="bracketscore">
										${semiFinalsInstanceList.getAt(0).loserScore}
									</span>
							</g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(1).winner.race.concat('.png'))}" 
										alt="${quarterFinalsInstanceList.getAt(1).winner.race}" />
									<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(1).winner.id}">
										${fieldValue(bean: quarterFinalsInstanceList.getAt(1).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:if>
						<g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(1).winner.race.concat('.png'))}" 
										alt="${quarterFinalsInstanceList.getAt(1).winner.race}" />
									<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(1).winner.id}">
										${fieldValue(bean: quarterFinalsInstanceList.getAt(1).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:else>
					</g:if>
					<g:else>
						Winner of QF Match 2
					</g:else>
				</g:else>
			</p>
		</div>
		<div class="r0403">
			<p>
				<g:if test="${semiFinalsInstanceList == null}">
					<g:if test="${quarterFinalsInstanceList.getAt(2).played == true}">
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(2).winner.race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(2).winner.race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(2).winner.id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(2).winner, field: "bnetId")}
						</g:link>
					</g:if>
					<g:else>
						Winner of QF Match 3
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${quarterFinalsInstanceList.getAt(2).played == true}">
						<g:if test="${semiFinalsInstanceList.getAt(1).played == true}">
							<g:if test="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id == semiFinalsInstanceList.getAt(1).winner.id}">
								<span style="font-weight: bold;">
									<span class="bracketscore">
										<g:if test="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id == semiFinalsInstanceList.getAt(1).winner.id}">
											${(Integer)semiFinalsInstanceList.getAt(1).bestOf/2+1}
										</g:if>
									</span>
							</g:if>
							<g:else>
								<span>
									<span class="bracketscore">
										${semiFinalsInstanceList.getAt(1).loserScore}
									</span>
							</g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(2).winner.race.concat('.png'))}" 
										alt="${quarterFinalsInstanceList.getAt(2).winner.race}" />
									<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(2).winner.id}">
										${fieldValue(bean: quarterFinalsInstanceList.getAt(2).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:if>
						<g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(2).winner.race.concat('.png'))}" 
										alt="${quarterFinalsInstanceList.getAt(2).winner.race}" />
									<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(2).winner.id}">
										${fieldValue(bean: quarterFinalsInstanceList.getAt(2).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:else>
					</g:if>
					<g:else>
						Winner of QF Match 3
					</g:else>
				</g:else>
			</p>
		</div>
		<div class="r0404">
			<p>
				<g:if test="${semiFinalsInstanceList == null}">
					<g:if test="${quarterFinalsInstanceList.getAt(3).played == true}">
						<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(3).winner.race.concat('.png'))}" 
							alt="${quarterFinalsInstanceList.getAt(3).winner.race}" />
						<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(3).winner.id}">
							${fieldValue(bean: quarterFinalsInstanceList.getAt(3).winner, field: "bnetId")}
						</g:link>
					</g:if>
					<g:else>
						Winner of QF Match 4
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${quarterFinalsInstanceList.getAt(3).played == true}">
						<g:if test="${semiFinalsInstanceList.getAt(1).played == true}">
							<g:if test="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id == semiFinalsInstanceList.getAt(1).winner.id}">
								<span style="font-weight: bold;">
									<span class="bracketscore">
										<g:if test="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id == semiFinalsInstanceList.getAt(1).winner.id}">
											${(Integer)semiFinalsInstanceList.getAt(1).bestOf/2+1}
										</g:if>
									</span>
							</g:if>
							<g:else>
								<span>
									<span class="bracketscore">
										${semiFinalsInstanceList.getAt(1).loserScore}
									</span>
							</g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(3).winner.race.concat('.png'))}" 
										alt="${quarterFinalsInstanceList.getAt(3).winner.race}" />
									<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(3).winner.id}">
										${fieldValue(bean: quarterFinalsInstanceList.getAt(3).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:if>
						<g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:quarterFinalsInstanceList.getAt(3).winner.race.concat('.png'))}" 
										alt="${quarterFinalsInstanceList.getAt(3).winner.race}" />
									<g:link controller="navigation" action="profile" id="${quarterFinalsInstanceList.getAt(3).winner.id}">
										${fieldValue(bean: quarterFinalsInstanceList.getAt(3).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:else>
					</g:if>
					<g:else>
						Winner of QF Match 4
					</g:else>
				</g:else>
			</p>
		</div>
		<%--FINAL MATCHES	--%>
		<div class="r0201">
			<p>
				<g:if test="${finalsInstanceList == null}">
					<g:if test="${semiFinalsInstanceList != null }">
						<g:if test="${semiFinalsInstanceList.getAt(2).played == true}">
							<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(2).winner.race.concat('.png'))}" 
								alt="${semiFinalsInstanceList.getAt(2).winner.race}" />
							<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(2).winner.id}">
								${fieldValue(bean: semiFinalsInstanceList.getAt(2).winner, field: "bnetId")}
							</g:link>
						</g:if>
					</g:if>
					<g:else>
						Winner of SF Match 1
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${semiFinalsInstanceList.getAt(2).played == true}">
						<g:if test="${finalsInstanceList.getAt(0).played == true}">
							<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(0).id == finalsInstanceList.getAt(0).winner.id}">
								<span style="font-weight: bold;">
									<span class="bracketscore">
										<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(0).id == finalsInstanceList.getAt(0).winner.id}">
											${(Integer)finalsInstanceList.getAt(0).bestOf/2+1}
										</g:if>
									</span>
							</g:if>
							<g:else>
								<span>
									<span class="bracketscore">
										${finalsInstanceList.getAt(0).loserScore}
									</span>
							</g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(2).winner.race.concat('.png'))}" 
										alt="${semiFinalsInstanceList.getAt(2).winner.race}" />
									<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(2).winner.id}">
										${fieldValue(bean: semiFinalsInstanceList.getAt(2).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:if>
						<g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(2).winner.race.concat('.png'))}" 
										alt="${semiFinalsInstanceList.getAt(2).winner.race}" />
									<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(2).winner.id}">
										${fieldValue(bean: semiFinalsInstanceList.getAt(2).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:else>
					</g:if>
					<g:else>
						Winner of SF Match 1
					</g:else>
				</g:else>
			</p>
		</div>
		<div class="r0202">
			<p>
				<g:if test="${finalsInstanceList == null}">
					<g:if test="${semiFinalsInstanceList != null }">
						<g:if test="${semiFinalsInstanceList.getAt(3).played == true}">
							<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(3).winner.race.concat('.png'))}" 
								alt="${semiFinalsInstanceList.getAt(3).winner.race}" />
							<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(3).winner.id}">
								${fieldValue(bean: semiFinalsInstanceList.getAt(3).winner, field: "bnetId")}
							</g:link>
						</g:if>
					</g:if>
					<g:else>
						Winner of SF Match 2
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${semiFinalsInstanceList.getAt(3).played == true}">
						<g:if test="${finalsInstanceList.getAt(0).played == true}">
							<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(1).id == finalsInstanceList.getAt(0).winner.id}">
								<span style="font-weight: bold;">
									<span class="bracketscore">
										<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(1).id == finalsInstanceList.getAt(0).winner.id}">
											${(Integer)finalsInstanceList.getAt(0).bestOf/2+1}
										</g:if>
									</span>
							</g:if>
							<g:else>
								<span>
									<span class="bracketscore">
										${finalsInstanceList.getAt(0).loserScore}
									</span>
							</g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(3).winner.race.concat('.png'))}" 
										alt="${semiFinalsInstanceList.getAt(3).winner.race}" />
									<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(3).winner.id}">
										${fieldValue(bean: semiFinalsInstanceList.getAt(3).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:if>
						<g:else>
									<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(3).winner.race.concat('.png'))}" 
										alt="${semiFinalsInstanceList.getAt(3).winner.race}" />
									<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(3).winner.id}">
										${fieldValue(bean: semiFinalsInstanceList.getAt(3).winner, field: "bnetId")}
									</g:link>
								</span>
						</g:else>
					</g:if>
					<g:else>
						Winner of SF Match 2
					</g:else>
				</g:else>
			</p>
		</div>
		<div class="r0203">
			<p>
				<g:if test="${finalsInstanceList == null}">
					<g:if test="${semiFinalsInstanceList != null }">
						<g:if test="${semiFinalsInstanceList.getAt(0).played == true}">
							<g:if test="${semiFinalsInstanceList.getAt(0).winner.id != semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id }">
								<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race.concat('.png'))}" 
									alt="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race}" />
								<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
									${fieldValue(bean: semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0), field: "bnetId")}
								</g:link>
							</g:if>
							<g:else>
								<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race.concat('.png'))}" 
									alt="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race}" />
								<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id}">
									${fieldValue(bean: semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1), field: "bnetId")}
								</g:link>
							</g:else>
						</g:if>
					</g:if>
					<g:else>
						Loser of SF Match 1
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${semiFinalsInstanceList.getAt(0).played == true}">
						<g:if test="${finalsInstanceList.getAt(0).played == true}">
							<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(0).id == finalsInstanceList.getAt(0).winner.id}">
								<span style="font-weight: bold;">
									<span class="bracketscore">
										<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(0).id == finalsInstanceList.getAt(0).winner.id}">
											${(Integer)finalsInstanceList.getAt(0).bestOf/2+1}
										</g:if>
									</span>
							</g:if>
							<g:else>
								<span>
									<span class="bracketscore">
										${finalsInstanceList.getAt(0).loserScore}
									</span>
							</g:else>
									<g:if test="${semiFinalsInstanceList.getAt(0).winner.id != semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id }">
										<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race.concat('.png'))}" 
											alt="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race}" />
										<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
											${fieldValue(bean: semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0), field: "bnetId")}
										</g:link>
									</g:if>
									<g:else>
										<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race.concat('.png'))}" 
											alt="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race}" />
										<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id}">
											${fieldValue(bean: semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1), field: "bnetId")}
										</g:link>
									</g:else>
								</span>
						</g:if>
						<g:else>
									<g:if test="${semiFinalsInstanceList.getAt(0).winner.id != semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id }">
										<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race.concat('.png'))}" 
											alt="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).race}" />
										<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0).id}">
											${fieldValue(bean: semiFinalsInstanceList.getAt(0).entries.toArray().getAt(0), field: "bnetId")}
									</g:link>
									</g:if>
									<g:else>
										<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race.concat('.png'))}" 
											alt="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).race}" />
										<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1).id}">
											${fieldValue(bean: semiFinalsInstanceList.getAt(0).entries.toArray().getAt(1), field: "bnetId")}
										</g:link>
									</g:else>
								</span>
						</g:else>
					</g:if>
					<g:else>
						Loser of SF Match 1
					</g:else>
				</g:else>
			</p>
		</div>
		<div class="r0204">
			<p>
				<g:if test="${finalsInstanceList == null}">
					<g:if test="${semiFinalsInstanceList != null }">
						<g:if test="${semiFinalsInstanceList.getAt(1).played == true}">
							<g:if test="${semiFinalsInstanceList.getAt(1).winner.id != semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id }">
								<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race.concat('.png'))}" 
									alt="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race}" />
								<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id}">
									${fieldValue(bean: semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0), field: "bnetId")}
								</g:link>
							</g:if>
							<g:else>
								<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race.concat('.png'))}" 
									alt="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race}" />
								<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id}">
									${fieldValue(bean: semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1), field: "bnetId")}
								</g:link>
							</g:else>
						</g:if>
					</g:if>
					<g:else>
						Loser of SF Match 2
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${semiFinalsInstanceList.getAt(1).played == true}">
						<g:if test="${finalsInstanceList.getAt(0).played == true}">
							<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(1).id == finalsInstanceList.getAt(0).winner.id}">
								<span style="font-weight: bold;">
									<span class="bracketscore">
										<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(1).id == finalsInstanceList.getAt(0).winner.id}">
											${(Integer)finalsInstanceList.getAt(0).bestOf/2+1}
										</g:if>
									</span>
							</g:if>
							<g:else>
								<span>
									<span class="bracketscore">
										${finalsInstanceList.getAt(0).loserScore}
									</span>
							</g:else>
									<g:if test="${semiFinalsInstanceList.getAt(1).winner.id != semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id }">
										<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race.concat('.png'))}" 
											alt="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race}" />
										<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id}">
											${fieldValue(bean: semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0), field: "bnetId")}
										</g:link>
									</g:if>
									<g:else>
										<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race.concat('.png'))}" 
											alt="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race}" />
										<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id}">
											${fieldValue(bean: semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1), field: "bnetId")}
										</g:link>
									</g:else>
								</span>
						</g:if>
						<g:else>
									<g:if test="${semiFinalsInstanceList.getAt(1).winner.id != semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id }">
										<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race.concat('.png'))}" 
											alt="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).race}" />
										<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0).id}">
											${fieldValue(bean: semiFinalsInstanceList.getAt(1).entries.toArray().getAt(0), field: "bnetId")}
										</g:link>
									</g:if>
									<g:else>
										<img class="icons" src="${resource(dir:'images/icons', file:semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race.concat('.png'))}" 
											alt="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).race}" />
										<g:link controller="navigation" action="profile" id="${semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1).id}">
											${fieldValue(bean: semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1), field: "bnetId")}
										</g:link>
									</g:else>
								</span>
						</g:else>
					</g:if>
					<g:else>
						Loser of SF Match 2
					</g:else>
				</g:else>
			</p>
		</div>
		<div class="r0101">
			<p>
				<g:if test="${finalsInstanceList != null }">
					<span style="font-weight: bold;">
						<g:if test="${finalsInstanceList.getAt(1).played == true}">
							<img class="icons" src="${resource(dir:'images/icons', file:finalsInstanceList.getAt(1).winner.race.concat('.png'))}" 
								alt="${finalsInstanceList.getAt(1).winner.race}" />
							<g:link controller="navigation" action="profile" id="${finalsInstanceList.getAt(1).winner.id}">
								${fieldValue(bean: finalsInstanceList.getAt(1).winner, field: "bnetId")}
							</g:link>
						</g:if>
					</span>
				</g:if>
				<g:else>
					Champion
				</g:else>
			</p>
		</div>
		<div class="r0102">
			<p>
				<g:if test="${finalsInstanceList != null }">
					<g:if test="${finalsInstanceList.getAt(1).played == true}">
						<span style="font-weight: bold;">
							<g:if test="${finalsInstanceList.getAt(1).winner.id != finalsInstanceList.getAt(1).entries.toArray().getAt(0).id }">
								<img class="icons" src="${resource(dir:'images/icons', file:finalsInstanceList.getAt(1).entries.toArray().getAt(0).race.concat('.png'))}" 
									alt="${finalsInstanceList.getAt(1).entries.toArray().getAt(0).race}" />
								<g:link controller="navigation" action="profile" id="${finalsInstanceList.getAt(1).entries.toArray().getAt(0).id}">
									${fieldValue(bean: finalsInstanceList.getAt(1).entries.toArray().getAt(0), field: "bnetId")}
								</g:link>
							</g:if>
							<g:else>
								<img class="icons" src="${resource(dir:'images/icons', file:finalsInstanceList.getAt(1).entries.toArray().getAt(1).race.concat('.png'))}" 
									alt="${finalsInstanceList.getAt(1).entries.toArray().getAt(1).race}" />
								<g:link controller="navigation" action="profile" id="${finalsInstanceList.getAt(1).entries.toArray().getAt(1).id}">
									${fieldValue(bean: semiFinalsInstanceList.getAt(1).entries.toArray().getAt(1), field: "bnetId")}
								</g:link>
							</g:else>
						</span>
					</g:if>
				</g:if>
				<g:else>
					2nd Place
				</g:else>
			</p>
		</div>
		<div class="r0103">
			<p>
				<g:if test="${finalsInstanceList != null }">
					<span style="font-weight: bold;">
						<g:if test="${finalsInstanceList.getAt(0).played == true}">
							<img class="icons" src="${resource(dir:'images/icons', file:finalsInstanceList.getAt(0).winner.race.concat('.png'))}" 
								alt="${finalsInstanceList.getAt(0).winner.race}" />
							<g:link controller="navigation" action="profile" id="${finalsInstanceList.getAt(0).winner.id}">
								${fieldValue(bean: finalsInstanceList.getAt(0).winner, field: "bnetId")}
							</g:link>
						</g:if>
					</span>
				</g:if>
				<g:else>
					3rd Place
				</g:else>
			</p>
		</div>
	</div>
	<div class="break"></div>
	<%--MATCH TABLES	--%>
	<div>
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
		            	<td class="right">${i+1}</td>
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
		<g:if test="${semiFinalsInstanceList != null}">
			<div class="break"></div>
			<div class="break"></div>
			<h2>Semi Finals</h2>
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
			       	<g:each in="${semiFinalsInstanceList}" status="i" var="matchesInstance">
			        	<tr class="${(matchesInstance.matchNumber % 2) == 0 ? 'odd' : 'even'}">
			            	<td class="right">${i+1}</td>
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
		</g:if>
		<g:if test="${finalsInstanceList != null}">
			<div class="break"></div>
			<div class="break"></div>
			<h2>Third Place Match</h2>
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
			        	<tr class="odd">
			            	<td class="right">1</td>
			            	<g:if test="${finalsInstanceList.getAt(0).played == false}">
								<td class="right">
							</g:if>
							<g:else>
								<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(0).id == finalsInstanceList.getAt(0).winner.id}">
									<td class="winnerl">
								</g:if>
								<g:else>
									<td class="right">
								</g:else>
							</g:else>
										<g:link controller="navigation" action="profile" id="${finalsInstanceList.getAt(0).entries.toArray().getAt(0).user.id}">
											${fieldValue(bean: finalsInstanceList.getAt(0).entries.toArray().getAt(0), field: "bnetId")}
										</g:link>
										<img class="icons" src="${resource(dir:'images/icons', file:finalsInstanceList.getAt(0).entries.toArray().getAt(0).race.concat('.png'))}" 
										alt="${finalsInstanceList.getAt(0).entries.toArray().getAt(0).race}" />
									</td>
							<g:if test="${finalsInstanceList.getAt(0).played == false}">
								<td class="center">vs</td>
							</g:if>
							<g:else>
								<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(0).id == finalsInstanceList.getAt(0).winner.id}">
									<td class="matchscore">
										${(Integer)finalsInstanceList.getAt(0).bestOf/2+1}-${finalsInstanceList.getAt(0).loserScore}
									</td>
								</g:if>
								<g:else>
									<td class="matchscore">
										${finalsInstanceList.getAt(0).loserScore}-${(Integer)finalsInstanceList.getAt(0).bestOf/2+1}
									</td>
								</g:else>
							</g:else>
			                <g:if test="${finalsInstanceList.getAt(0).played == false}">
								<td class="left">
							</g:if>
							<g:else>
								<g:if test="${finalsInstanceList.getAt(0).entries.toArray().getAt(1).id == finalsInstanceList.getAt(0).winner.id}">
									<td class="winnerr">
								</g:if>
								<g:else>
									<td class="left">
								</g:else>
							</g:else>
										<img class="icons" src="${resource(dir:'images/icons', file:finalsInstanceList.getAt(0).entries.toArray().getAt(1).race.concat('.png'))}" 
											alt="${finalsInstanceList.getAt(0).entries.toArray().getAt(1).race}" />
										<g:link controller="navigation" action="profile" id="${finalsInstanceList.getAt(0).entries.toArray().getAt(1).user.id}">
											${fieldValue(bean: finalsInstanceList.getAt(0).entries.toArray().getAt(1), field: "bnetId")}
										</g:link>
									</td>
			                <td class="right"><g:link controller="navigation" action="matchDetails" id="${finalsInstanceList.getAt(0).id}">View Details</g:link></td>
			            </tr>
				</table>
			</div>
			<div class="break"></div>
			<div class="break"></div>
			<h2>Finals</h2>
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
			        	<tr class="odd">
			            	<td class="right">1</td>
			            	<g:if test="${finalsInstanceList.getAt(1).played == false}">
								<td class="right">
							</g:if>
							<g:else>
								<g:if test="${finalsInstanceList.getAt(1).entries.toArray().getAt(0).id == finalsInstanceList.getAt(1).winner.id}">
									<td class="winnerl">
								</g:if>
								<g:else>
									<td class="right">
								</g:else>
							</g:else>
										<g:link controller="navigation" action="profile" id="${finalsInstanceList.getAt(1).entries.toArray().getAt(0).user.id}">
											${fieldValue(bean: finalsInstanceList.getAt(1).entries.toArray().getAt(0), field: "bnetId")}
										</g:link>
										<img class="icons" src="${resource(dir:'images/icons', file:finalsInstanceList.getAt(1).entries.toArray().getAt(0).race.concat('.png'))}" 
										alt="${finalsInstanceList.getAt(1).entries.toArray().getAt(0).race}" />
									</td>
							<g:if test="${finalsInstanceList.getAt(1).played == false}">
								<td class="center">vs</td>
							</g:if>
							<g:else>
								<g:if test="${finalsInstanceList.getAt(1).entries.toArray().getAt(0).id == finalsInstanceList.getAt(1).winner.id}">
									<td class="matchscore">
										${(Integer)finalsInstanceList.getAt(1).bestOf/2+1}-${finalsInstanceList.getAt(1).loserScore}
									</td>
								</g:if>
								<g:else>
									<td class="matchscore">
										${finalsInstanceList.getAt(1).loserScore}-${(Integer)finalsInstanceList.getAt(1).bestOf/2+1}
									</td>
								</g:else>
							</g:else>
			                <g:if test="${finalsInstanceList.getAt(1).played == false}">
								<td class="left">
							</g:if>
							<g:else>
								<g:if test="${finalsInstanceList.getAt(1).entries.toArray().getAt(1).id == finalsInstanceList.getAt(1).winner.id}">
									<td class="winnerr">
								</g:if>
								<g:else>
									<td class="left">
								</g:else>
							</g:else>
										<img class="icons" src="${resource(dir:'images/icons', file:finalsInstanceList.getAt(1).entries.toArray().getAt(1).race.concat('.png'))}" 
											alt="${finalsInstanceList.getAt(1).entries.toArray().getAt(1).race}" />
										<g:link controller="navigation" action="profile" id="${finalsInstanceList.getAt(1).entries.toArray().getAt(1).user.id}">
											${fieldValue(bean: finalsInstanceList.getAt(1).entries.toArray().getAt(1), field: "bnetId")}
										</g:link>
									</td>
			                <td class="right"><g:link controller="navigation" action="matchDetails" id="${finalsInstanceList.getAt(1).id}">View Details</g:link></td>
			            </tr>
				</table>
			</div>
		</g:if>
	</div>
</g:if>