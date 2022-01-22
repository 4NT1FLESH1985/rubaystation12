/datum/map/bolt_saferooms()
	for(var/atype in typesof(/area/crew_quarters/safe_room))
		var/area/A = locate(atype)
		if(istype(A))
			for(var/obj/machinery/door/airlock/vault/bolted/V in A.contents)
				if(!V.locked)
					V.lock()

/datum/map/unbolt_saferooms()
	for(var/atype in typesof(/area/crew_quarters/safe_room))
		var/area/A = locate(atype)
		if(istype(A))
			for(var/obj/machinery/door/airlock/vault/bolted/V in A.contents)
				if(V.locked)
					V.unlock()

/datum/map/make_maint_all_access(var/radstorm = 0)
	maint_all_access = 1
	if(radstorm)
		priority_announcement.Announce("The maintenance access requirement has been revoked on all maintenance airlocks, and saferooms have been unbolted.", "Attention!")
		GLOB.using_map.unbolt_saferooms()
	else
		priority_announcement.Announce("The maintenance access requirement has been revoked on all maintenance airlocks.", "Attention!")

/datum/map/revoke_maint_all_access(var/radstorm = 0)
	maint_all_access = 0
	if(radstorm)
		priority_announcement.Announce("The maintenance access requirement has been readded on all maintenance airlocks, and saferooms have been bolted.", "Attention!")
		GLOB.using_map.bolt_saferooms()
	else
		priority_announcement.Announce("The maintenance access requirement has been readded on all maintenance airlocks.", "Attention!")

/datum/map/torch/roundend_player_status()
	for(var/mob/Player in GLOB.player_list)
		if(Player.mind && !isnewplayer(Player))
			if(Player.stat != DEAD)
				var/turf/playerTurf = get_turf(Player)
				if(evacuation_controller.round_over() && evacuation_controller.emergency_evacuation)
					if(isStationLevel(playerTurf.z))
						to_chat(Player, "<span class='info'><b>Ты выжил, но остался на [station_name()] под именем [Player.real_name]...</b></span>")
					else if (isEscapeLevel(playerTurf.z))
						to_chat(Player, "<font color='green'><b>Тебе удалось пережить события на [station_name()] за [Player.real_name].</b></font>")
					else
						to_chat(Player, "<span class='info'><b>Ты выжил, но остался где-то в секторе за [Player.real_name]...</b></span>")
				else if(issilicon(Player))
					to_chat(Player, "<font color='green'><b>Ты остался в рабочем состоянии на [station_name()] за [Player.real_name].</b></font>")
				else if (isNotStationLevel(playerTurf.z))
					to_chat(Player, "<span class='info'><b>Ты выжил, но оказался где-то в секторе за [Player.real_name]...</b></span>")
				else
					to_chat(Player, "<span class='info'><b>Ты закончил смену на [station_name()] за [Player.real_name].</b></span>")
			else
				if(isghost(Player))
					var/mob/observer/ghost/O = Player
					if(!O.started_as_observer)
						to_chat(Player, "<font color='red'><b>Тебе не удалось пережить события на [station_name()]...</b></font>")
				else
					to_chat(Player, "<font color='red'><b>Тебе не удалось пережить события на [station_name()]...</b></font>")

/datum/map/torch/roundend_summary(list/data)
	var/desc
	var/survivors = data["surviving_total"]
	var/escaped_total = data["escaped_total"]
	var/marooned_total = data["left_behind_total"]
	var/ghosts = data["ghosts"]
	var/offship_players = data["offship_players"]

	if(survivors > 0)
		desc += "Всего [survivors > 1 ? "<b>[survivors] выживших</b>" : "<b>один выживший</b>"]"
		desc += " (<b>[escaped_total > 0 ? escaped_total : "none"] эвакуировалось, [marooned_total] осталось</b>),"
		data += "А так-же [offship_players > 1 ? "<b>[offship_players] играло на не экипаже</b>" : "<b>один играл на не экипаже</b>"]"
		data += " Всего <b>[ghosts] призраков</b>.<br>"
	else
		desc += "<b>Никто не выжил</b>, <b>[offship_players] играли на не экипаже</b>, (<b>[ghosts] призраков</b>)."

	return desc
