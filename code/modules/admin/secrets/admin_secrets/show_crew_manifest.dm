/datum/admin_secret_item/admin_secret/show_crew_manifest
	name = "Show Crew Manifest"

/datum/admin_secret_item/admin_secret/show_crew_manifest/execute(var/mob/user)
	. = ..()
	if(!.)
		return
	var/dat
	dat += "<meta charset='utf-8'><h4>Список Экипажа</h4>"
	dat += html_crew_manifest()

	show_browser(user, dat, "window=manifest;size=370x420;can_close=1")
