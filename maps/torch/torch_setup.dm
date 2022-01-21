/datum/map/torch/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/torch/get_map_info()
	. = list()
	. +=  "<meta charset='utf-8'>Перед вами " + replacetext("<b>[station_name]</b>", "\improper", "") + ", корабль Экспедиционного Корпуса. Его основная миссия - поиск неоткрытых разумных инопланетных видов и общие исследования в данном секторе."
	. +=  "Судно укомплектовано как государственным персоналом SCG, так и наемными подрядчиками."
	. +=  "Эта область космоса неизведана, и находится вдали от территории SCG. Вы можете столкнуться с удаленными аванпостами или дрейфующими скитальцами, но ни одно официально ни одно правительство не претендует на этот сектор."
	return jointext(., "<br>")

/datum/map/torch/send_welcome()
	var/obj/effect/overmap/visitable/ship/torch = SSshuttle.ship_by_type(/obj/effect/overmap/visitable/ship/torch)

	var/welcome_text = "<meta charset='utf-8'><center><img src = sollogo.png /><br /><font size = 3><b>SEV Torch</b> Показания Сенсоров:</font><br>"
	welcome_text += "Отчёт сгенерирован [stationdate2text()] at [stationtime2text()]</center><br /><br />"
	welcome_text += "<hr>Текущая система:<br /><b>[torch ? system_name : "Неизвестно"]</b><br /><br>"

	if (torch) //If the overmap is disabled, it's possible for there to be no torch.
		var/list/space_things = list()
		welcome_text += "<meta charset='utf-8'>Current Coordinates:<br /><b>[torch.x]:[torch.y]</b><br /><br>"
		welcome_text += "Next system targeted for jump:<br /><b>[generate_system_name()]</b><br /><br>"
		welcome_text += "Travel time to Sol:<br /><b>[rand(15,45)] days</b><br /><br>"
		welcome_text += "Time since last port visit:<br /><b>[rand(60,180)] days</b><br /><hr>"
		welcome_text += "Scan results show the following points of interest:<br />"

		for(var/zlevel in map_sectors)
			var/obj/effect/overmap/visitable/O = map_sectors[zlevel]
			if(O.name == torch.name)
				continue
			if(istype(O, /obj/effect/overmap/visitable/ship/landable)) //Don't show shuttles
				continue
			if (O.hide_from_reports)
				continue
			space_things |= O

		for(var/obj/effect/overmap/visitable/O in space_things)
			var/location_desc = " at present co-ordinates."
			if(O.loc != torch.loc)
				var/bearing = round(90 - Atan2(O.x - torch.x, O.y - torch.y),5) //fucking triangles how do they work
				if(bearing < 0)
					bearing += 360
				location_desc = ", bearing [bearing]."
			welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

		welcome_text += "<hr>"

	post_comm_message("SEV Torch Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
