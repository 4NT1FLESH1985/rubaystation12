/datum/extension/interactive/multitool/circuitboards/stationalert/get_interact_window(var/obj/item/device/multitool/M, var/mob/user)
	var/obj/item/stock_parts/circuitboard/stationalert/SA = holder
	. += "<meta charset='utf-8'><b>Alarm Sources</b><br>"
	. += "<meta charset='utf-8'><table>"
	for(var/datum/alarm_handler/AH as anything in SSalarm.handlers)
		. += "<meta charset='utf-8'><tr>"
		. += "<meta charset='utf-8'><td>[AH.category]</td>"
		if(AH in SA.alarm_handlers)
			. += "<meta charset='utf-8'><td><span class='good'>&#9724</span>Active</td><td><a href='?src=\ref[src];remove=\ref[AH]'>Inactivate</a></td>"
		else
			. += "<meta charset='utf-8'><td><span class='bad'>&#9724</span>Inactive</td><td><a href='?src=\ref[src];add=\ref[AH]'>Activate</a></td>"
		. += "<meta charset='utf-8'></tr>"
	. += "<meta charset='utf-8'></table>"

/datum/extension/interactive/multitool/circuitboards/stationalert/on_topic(href, href_list, user)
	var/obj/item/stock_parts/circuitboard/stationalert/SA = holder
	if(href_list["add"])
		var/datum/alarm_handler/AH = locate(href_list["add"]) in SSalarm.handlers
		if(AH)
			SA.alarm_handlers |= AH
			return MT_REFRESH

	if(href_list["remove"])
		var/datum/alarm_handler/AH = locate(href_list["remove"]) in SSalarm.handlers
		if(AH)
			SA.alarm_handlers -= AH
			return MT_REFRESH

	return ..()
