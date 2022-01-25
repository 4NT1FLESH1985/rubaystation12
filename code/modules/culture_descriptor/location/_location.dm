/decl/cultural_info/location
	desc_type = "Home System"
	category = TAG_HOMEWORLD
	var/distance = 0
	var/ruling_body = FACTION_SOL_CENTRAL
	var/capital

/decl/cultural_info/location/get_text_details()
	. = list()
	if(!isnull(capital))
		. += "<meta charset='utf-8'><b>Capital:</b> [capital]."
	if(!isnull(ruling_body))
		. += "<meta charset='utf-8'><b>Territory:</b> [ruling_body]."
	if(!isnull(distance))
		. += "<meta charset='utf-8'><b>Distance from Sol:</b> [distance]."
	. += ..()
