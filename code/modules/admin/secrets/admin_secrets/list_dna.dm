/datum/admin_secret_item/admin_secret/list_dna
	name = "List DNA (Blood)"

/datum/admin_secret_item/admin_secret/list_dna/execute(var/mob/user)
	. = ..()
	if(!.)
		return
	var/dat = "<B>Showing DNA from blood.</B><HR>"
	dat += "<meta charset='utf-8'><table cellspacing=5><tr><th>Name</th><th>DNA</th><th>Blood Type</th></tr>"
	for(var/mob/living/carbon/human/H in SSmobs.mob_list)
		if(H.dna && H.ckey)
			dat += "<meta charset='utf-8'><tr><td>[H]</td><td>[H.dna.unique_enzymes]</td><td>[H.b_type]</td></tr>"
	dat += "<meta charset='utf-8'></table>"
	show_browser(user, dat, "window=DNA;size=440x410")
