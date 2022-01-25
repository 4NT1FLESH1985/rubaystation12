/obj/item/stack/cable_coil/New()
	set_extension(src, /datum/extension/interactive/multitool/items/cable)
	..()

/datum/extension/interactive/multitool/items/cable/get_interact_window(var/obj/item/device/multitool/M, var/mob/user)
	var/obj/item/stack/cable_coil/cable_coil = holder
	. += "<meta charset='utf-8'><b>Available Colors</b><br>"
	. += "<meta charset='utf-8'><table>"
	for(var/cable_color in GLOB.possible_cable_colours)
		. += "<meta charset='utf-8'><tr>"
		. += "<meta charset='utf-8'><td>[cable_color]</td>"
		if(cable_coil.color == GLOB.possible_cable_colours[cable_color])
			. += "<meta charset='utf-8'><td>Selected</td>"
		else
			. += "<meta charset='utf-8'><td><a href='?src=\ref[src];select_color=[cable_color]'>Select</a></td>"
		. += "<meta charset='utf-8'></tr>"
	. += "<meta charset='utf-8'></table>"

/datum/extension/interactive/multitool/items/cable/on_topic(href, href_list, user)
	var/obj/item/stack/cable_coil/cable_coil = holder
	if(href_list["select_color"] && (href_list["select_color"] in GLOB.possible_cable_colours))
		cable_coil.set_cable_color(href_list["select_color"], user)
		return MT_REFRESH

	return ..()
